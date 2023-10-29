#include "../hnswlib/hnswlib.h"
#include "../hnswlib/utils.h"

int main() {
    SparseStorage dataset = read_csr("../../data/base_full.csr");
    SparseStorage queries = read_csr("../../data/queries.dev.csr");
    unsigned* gt = read_gt("../../data/base_full.dev.gt");
    size_t nd = dataset.nrow;
    size_t nq = queries.nrow;
    hnswlib::HierarchicalNSW<float>* alg_hnsw = new hnswlib::HierarchicalNSW<float>("M20_ef1200.hnsw");
    alg_hnsw->dataset = &dataset;
    alg_hnsw->queries = &queries;
    alg_hnsw->nz_count = getNzCount(alg_hnsw->dataset);
    Timer timer;
    std::ifstream in("probility.txt");
    alg_hnsw->preFetching(in);
    timer.tick();
    std::vector<std::priority_queue<std::pair<float, size_t>>> knn(nq);
    alg_hnsw->setEf(32);

    for (size_t i = 0; i < nq; i++) {
        knn[i] = alg_hnsw->searchKnn(i, 10);
    }
    timer.tuck("Search done");
    
    std::cout<<alg_hnsw->metric_distance_computations<<"\n";
    // std::cout<< alg_hnsw->metric_distance_computations/nq << " " << alg_hnsw->metric_hops/nq << "\n";
    // std::ofstream out("M19_ef1100_avg_disc_hops.txt", std::ios::app);
    // out << alg_hnsw->metric_distance_computations/nq << " " << alg_hnsw->metric_hops/nq << "\n";
    // out.close();
    // 计算入度
    // alg_hnsw->getIndegree();
    // 计算出度
    // alg_hnsw->getOutdegree();
    // 计算nonzero和入度的分布
    // alg_hnsw->getNzDegreeCount();
    // 计算距离non-zero和距离计算次数的分布
    // alg_hnsw->getNzDistCount();
    // 计算non-zero和该点在ground truth中出现的次数的分布
    // alg_hnsw->getNzGtCount(gt,nq);
    // 计算recall
    float recall = 0;
    for (size_t i = 0; i < nq; i++) {
        auto tmp = knn[i];
        float num = 0;
        while (!tmp.empty()) {
            for (size_t j = 0; j < 10; j++) {
                if (gt[i * 10 + j] == tmp.top().second) {
                    num++;
                    break;
                }
            }
            tmp.pop();
        }
        recall += num / 10;
    }
    std::cout <<"recall: " << recall / nq << "\n";
    delete [] gt;
}