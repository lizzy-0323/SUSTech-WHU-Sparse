from __future__ import absolute_import
import os
import time
import numpy as np
import sys
from scipy.sparse import csr_matrix
import numpy as np

sys.path.append("/home/userdata/lzy/code/nips23/sparse/SUSTech-WHU-Sparse")
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
        self.ds = DATASETS[dataset]()
        assert self.ds.data_type() == "sparse"
        self.ds.basedir = (
            "/home/userdata/lzy/code/nips23/big-ann-benchmarks/data/sparse"
        )
        dataset_fn = self.ds.get_dataset_fn()
        index_n = f"M{self.M}_ef{self.ef}.hnsw"
        print("index name: " + index_n)
        hnswsparse.build_index(index_n, dataset_fn, self.M, self.ef)
        self.index = hnswsparse.HnswSparse(index_n)
        print("Index status: " + str(self.index))

    def search(self, X, k):
        
    def load_index(self,index_n):
        pass

if __name__ == "__main__":
    test = Test()
    test.fit("sparse-small")
