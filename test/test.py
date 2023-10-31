from __future__ import absolute_import
import os
import time
import numpy as np
import sys
from scipy.sparse import csr_matrix
import numpy as np
import struct

sys.path.append("/home/userdata/lzy/code/nips23/sparse/SUSTech-WHU-Sparse/build")
sys.path.append("/home/userdata/lzy/code/nips23/big-ann-benchmarks")

import hnswsparse
from benchmark.datasets import DATASETS


def read_sparse_matrix_fields(fname):
    """read the fields of a CSR matrix without instantiating it"""
    with open(fname, "rb") as f:
        sizes = np.fromfile(f, dtype="int64", count=3)
        nrow, ncol, nnz = sizes
        indptr = np.fromfile(f, dtype="int64", count=nrow + 1)
        assert nnz == indptr[-1]
        indices = np.fromfile(f, dtype="int32", count=nnz)
        assert np.all(indices >= 0) and np.all(indices < ncol)
        data = np.fromfile(f, dtype="float32", count=nnz)
        return data, indices, indptr, ncol


class Test(object):
    def __init__(self) -> None:
        self.M = 16
        self.ef = 200

    def fit(self, dataset):  # e.g. dataset = "sparse-small"
        """
        Build the index for the data points given in dataset name.
        """
        if self.load_index(dataset):
            return
        self.ds = DATASETS[dataset]()
        assert self.ds.data_type() == "sparse"
        self.ds.basedir = (
            "/home/userdata/lzy/code/nips23/big-ann-benchmarks/data/sparse"
        )
        dataset_fn = self.ds.get_dataset_fn()
        index_n = f"{dataset}_M{self.M}_ef{self.ef}.hnsw"
        print("index name: " + index_n)
        hnswsparse.build_index(index_n, dataset_fn, self.M, self.ef)
        self.index = hnswsparse.HnswSparse(index_n,dataset_fn)
        print("Index status: " + str(self.index))

    def search(self, X, k):

        with open('/home/userdata/lzy/code/nips23/sparse/data/base_small.dev.gt', 'rb') as f:
            n = struct.unpack('i', f.read(4))[0] # query number
            d = struct.unpack('i', f.read(4))[0] # nearest d
            gt = struct.unpack('I' * (n * d), f.read(n * d * 4))
            
        indptr = X.indptr
        indices = X.indices
        data = X.data
        nrow = X.shape[0]
        
        assert(n == nrow)
        assert(len(gt) == n * d)
        print('before search')
        self.ds = DATASETS["sparse-small"]()
        self.ds.basedir = (
            "/home/userdata/lzy/code/nips23/big-ann-benchmarks/data/sparse"
        )
        dataset_fn = self.ds.get_dataset_fn()
        res = self.index.search(nrow, indptr, indices, data, self.ef, k)
        print('after search')
        # calculate recall
        
        recall = 0.0
        for i in range(nrow):
            tmp = res[i]
            num = 0.0
            while len(tmp) > 0:
                for j in range(k):
                    if gt[i * 10 + j] == tmp[0]:
                        num += 1.0
                        break
                tmp = tmp[1:]
            recall += num / float(k)
        
        print('recall: ', recall / nrow)
        
    def load_index(self, dataset):
        """
        Load the index for dataset. Returns False if index
        is not available, True otherwise.

        Checking the index usually involves the dataset name
        and the index build paramters passed during construction.
        """
        m = self.M
        ef = self.ef
        self.ds = DATASETS[dataset]()
        self.ds.basedir = (
            "/home/userdata/lzy/code/nips23/big-ann-benchmarks/data/sparse"
        )
        index_fn = f"{dataset}_M{m}_ef{ef}.hnsw"
        dataset_fn = self.ds.get_dataset_fn()
        if not os.path.exists(index_fn):
            return False
        print("loading index")
        self.index = hnswsparse.HnswSparse(index_fn,dataset_fn)
        print("loading index success")
        return True

if __name__ == "__main__":
    test = Test()
    test.fit("sparse-small")
    data, indices, indptr, ncol = read_sparse_matrix_fields('/home/userdata/lzy/code/nips23/sparse/data/queries_small.dev.csr')
    queries = csr_matrix((data, indices, indptr), shape=(len(indptr) - 1, ncol))
    test.search(queries, 10)
