#include "../hnswlib/hnswlib.h"
#include "../hnswlib/utils.h"

class BuildIndexThread
{
public:
    static void build_index(int ef_construction)
    {
        SparseStorage dataset = read_csr("../../data/base_small.csr");
        size_t nd = dataset.nrow;
        hnswlib::HierarchicalNSW<float> *alg_hnsw = new hnswlib::HierarchicalNSW<float>(nd, ef_construction, 1200);
        alg_hnsw->dataset = &dataset;
        Timer timer;
        timer.tick();
        alg_hnsw->build();
        timer.tuck("Build done");
        std::string filename = "M" + std::to_string(ef_construction) + "_ef1200.hnsw";
        alg_hnsw->saveIndex(filename);
        delete alg_hnsw;
    }

    static void seq_build_index()
    {
        int ef_constructions[] = {5, 10, 30};
        for (int i = 0; i < 3; i++)
        {
            BuildIndexThread::build_index(ef_constructions[i]);
        }
    }
};

int main() {
    BuildIndexThread::seq_build_index();
}