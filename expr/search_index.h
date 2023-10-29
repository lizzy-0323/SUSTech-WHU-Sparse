#include "../hnswlib/hnswlib.h"
#include "../hnswlib/utils.h"

class SearchIndexThread
{
public:
    static void search_index(int ef_construction)
    {
        SparseStorage dataset = read_csr("../../data/base_full.csr");
        SparseStorage queries = read_csr("../../data/queries.dev.csr");
        unsigned *gt = read_gt("../../data/base_full.dev.gt");
        size_t nd = dataset.nrow;
        size_t nq = queries.nrow;

        std::string filename = "M" + std::to_string(ef_construction) + "_ef1200.hnsw";
        hnswlib::HierarchicalNSW<float> *alg_hnsw = new hnswlib::HierarchicalNSW<float>(filename);
        alg_hnsw->dataset = &dataset;
        alg_hnsw->queries = &queries;

        Timer timer;
        timer.tick();
        std::vector<std::priority_queue<std::pair<float, size_t>>> knn(nq);
        alg_hnsw->setEf(30);
        for (size_t i = 0; i < nq; i++)
        {
            knn[i] = alg_hnsw->searchKnn(i, 10);
        }
        timer.tuck("Search done");

        float recall = 0;
        for (size_t i = 0; i < nq; i++)
        {
            auto tmp = knn[i];
            float num = 0;
            while (!tmp.empty())
            {
                for (size_t j = 0; j < 10; j++)
                {
                    if (gt[i * 10 + j] == tmp.top().second)
                    {
                        num++;
                        break;
                    }
                }
                tmp.pop();
            }
            recall += num / 10;
        }
        std::cout << recall / nq << "\n";
    }
};
