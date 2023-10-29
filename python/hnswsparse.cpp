
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
    HnswSparse(unsigned d,unsigned n,const char* index_fn):d(d){
        hnswlib::HierarchicalNSW<float>* alg_hnsw = new hnswlib::HierarchicalNSW<float>(index_fn);
    }
    py::array_t<unsigned> search(unsigned nq, py::array_t<float> query_, unsigned k, unsigned ef) {
        // omp_set_num_threads(8);
        // TODO:搜索函数
    }
private:
    unsigned d;
};

void build_index(const char* dataset_fn,const char* hnsw_fn,const char* index_fn,unsigned M,unsigned ef){
    SparseStorage dataset = read_csr(dataset_fn);
    unsigned n =dataset.nrow;
    hnswlib::HierarchicalNSW<float>* alg_hnsw = new hnswlib::HierarchicalNSW<float>(n, M, ef);
    alg_hnsw->dataset = &dataset;
    Timer timer;
    timer.tick();
    alg_hnsw->build();
    timer.tuck("Build done");
    alg_hnsw->saveIndex(index_fn);
}

PYBIND11_MODULE(hnswsparse, m) {
    m.def("build_index", &build_index, "Build the index");
    py::class_<HnswSparse>(m, "HnswSparse")
        .def(py::init<unsigned, unsigned, const char*>())
        .def("search", &HnswSparse::search, "search");
}
