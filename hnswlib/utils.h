#pragma once

#include <chrono>
#include <string>
#include <iostream>
#include <fstream>
#include <vector>
#include "hnswlib.h"
#include "sparse_storage.h"

struct Timer {
    std::chrono::_V2::system_clock::time_point s;
    std::chrono::_V2::system_clock::time_point e;

    void tick() {
        s = std::chrono::high_resolution_clock::now();
    }

    void tuck(std::string message) {
        e = std::chrono::high_resolution_clock::now();
        std::chrono::duration<double> diff = e - s;
        std::cout << "[" << diff.count() << " s] " << message << std::endl;
    }
};

SparseStorage read_csr(const char* filename) {
    size_t nrow, ncol, nnz;
    std::ifstream in(filename, std::ios::binary);
    in.read((char*)&nrow, sizeof(size_t));
    in.read((char*)&ncol, sizeof(size_t));
    in.read((char*)&nnz, sizeof(size_t));
    size_t* indptr = new size_t[nrow + 1];
    unsigned* indices = new unsigned[nnz];
    float* data = new float[nnz];
    in.read((char*)indptr, (nrow + 1) * sizeof(size_t));
    in.read((char*)indices, nnz * sizeof(unsigned));
    in.read((char*)data, nnz * sizeof(float));
    in.close();
    return SparseStorage(indptr, indices, data, nrow);
}

unsigned* read_gt(const char* filename) {
    unsigned n, d;
    std::ifstream in(filename, std::ios::binary);
    in.read((char*)&n, 4);
    in.read((char*)&d, 4);
    unsigned* gt = new unsigned[n * d];
    in.read((char*)gt, n * d * 4);
    in.close();
    return gt;
}


void saveData(std::unordered_map<size_t,int>data,char* filename) {
    std::ofstream out(filename, std::ios::binary);
    for(auto it=data.begin(); it!=data.end(); ++it) {
        out << it->first << " " << it->second << std::endl; 
    }
    out.close();
}