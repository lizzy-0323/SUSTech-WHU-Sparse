#pragma once

#include <iostream>

struct SparseStorage {
    size_t nrow;
    size_t* indptr;
    unsigned* indices;
    float* data;

    SparseStorage(
        size_t* indptr, 
        unsigned* indices, 
        float* data, 
        size_t nrow)
        : nrow(nrow),
          indptr(indptr),
          indices(indices),
          data(data) {}
    
    // ~SparseStorage() {
    //     delete[] indptr;
    //     delete[] indices;
    //     delete[] data;
    // }
};
// 行指针指的是每一行的第一个元素的起始位置
float inner_prod(SparseStorage* ss1, size_t id1, SparseStorage* ss2, size_t id2) {
    float sum = 0;
    for (unsigned i = ss1->indptr[id1], j = ss2->indptr[id2]; i < ss1->indptr[id1 + 1] && j < ss2->indptr[id2 + 1];) {
        if (ss1->indices[i] == ss2->indices[j]) {
            sum += ss1->data[i] * ss2->data[j];
            i++;
            j++;
        } else if (ss1->indices[i] < ss2->indices[j]) {
            i++;
        } else {
            j++;
        }
    }
    return -sum;
}

//  获取每一行的非零元素个数
size_t* getNzCount(SparseStorage* ss) {
    size_t *nzCount = new size_t[ss->nrow+1];
    for (size_t i = 0; i < ss->nrow; i++) {
        nzCount[i] = ss->indptr[i + 1] - ss->indptr[i];
    }
    return nzCount;
}