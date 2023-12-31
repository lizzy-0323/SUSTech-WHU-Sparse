
#include"../hnswlib/hnswlib.h"
#include"../hnswlib/sparse_storage.h"
#include"../hnswlib/utils.h"
#undef max

#include <pybind11/pybind11.h>
#include <pybind11/numpy.h>
namespace py = pybind11;
using namespace py::literals;

class HnswSparse{
public:
    HnswSparse(const char* index_fn,const char* dataset_fn): alg_hnsw(nullptr), dataset(read_csr(dataset_fn)) {
        alg_hnsw = new hnswlib::HierarchicalNSW<float>(index_fn);
    }
    py::array_t<unsigned> search(unsigned nrow, py::array_t<size_t> indptr_, py::array_t<unsigned> indices_, py::array_t<float> data_, unsigned ef,unsigned k) {
        py::buffer_info buf_info_indptr = indptr_.request();
        size_t* indptr = (size_t*)buf_info_indptr.ptr;
        py::buffer_info buf_info_indices = indices_.request();
        unsigned* indices = (unsigned*)buf_info_indices.ptr;
        py::buffer_info buf_info_data = data_.request();
        float* data = (float*)buf_info_data.ptr;
        SparseStorage queries = SparseStorage(indptr, indices, data, nrow);
        alg_hnsw->queries = &queries;
        alg_hnsw->dataset = &this->dataset;
        alg_hnsw->setEf(ef);
        auto py_I = py::array_t<unsigned>(nrow * k);
        py::buffer_info buf = py_I.request();
        unsigned* I = (unsigned*)buf.ptr;

        // 大顶堆
        std::priority_queue<std::pair<float, size_t>> tmp;
        for (size_t i = 0; i < nrow; i++) { 
            tmp = alg_hnsw->searchKnn(i, k); 
            for (size_t j = 0; j <k; j++) {
                I[i * k + j] = tmp.top().second;
                if (tmp.empty())break;
                tmp.pop(); 
            }
        }
        py_I.resize({nrow, k});
        return py_I;

    }
    ~HnswSparse() {
        delete alg_hnsw; // Clean up alg_hnsw in the destructor
        // delete dataset; // Clean up dataset in the destructor
    }
private:
    hnswlib::HierarchicalNSW<float>* alg_hnsw;
    SparseStorage dataset;
};

void build_index(const char* index_fn, const char *dataset_fn, unsigned M, unsigned ef){
    SparseStorage dataset = read_csr(dataset_fn);
    size_t nd =dataset.nrow;
    hnswlib::HierarchicalNSW<float>* alg_hnsw = new hnswlib::HierarchicalNSW<float>(nd, M, ef);
    alg_hnsw->dataset = &dataset;
    // unsigned nz_count = getNzCount(alg_hnsw->dataset);
    // alg_hnsw->getNzGtCount();
    alg_hnsw->build();
    std::cout<<"Build done"<<std::endl;
    alg_hnsw->saveIndex(index_fn);
    std::cout<<"Save index success"<<std::endl;
    delete alg_hnsw;
}

PYBIND11_MODULE(hnswsparse, m) {
    m.def("build_index", &build_index, "Build the index");
    py::class_<HnswSparse>(m, "HnswSparse")
        .def(py::init<const char*,const char*>())
        .def("search", &HnswSparse::search, "perform hnsw search");
}
