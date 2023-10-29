#include "../hnswlib/hnswlib.h"
#include "../hnswlib/utils.h"

int main() {
    SparseStorage dataset = read_csr("../../data/base_full.csr");
    size_t nd = dataset.nrow;
    hnswlib::HierarchicalNSW<float>* alg_hnsw = new hnswlib::HierarchicalNSW<float>(nd, 19, 1100);
    alg_hnsw->dataset = &dataset;
    Timer timer;
    timer.tick();
    alg_hnsw->build();
    timer.tuck("Build done");
    alg_hnsw->saveIndex("M19_ef1200.hnsw");
}