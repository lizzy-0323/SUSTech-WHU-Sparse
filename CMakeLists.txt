cmake_minimum_required(VERSION 2.6)
project(hnsw_lib
  LANGUAGES CXX)

# add_library(hnswlib INTERFACE)
# target_include_directories(hnswlib INTERFACE .)

if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
  set(CMAKE_CXX_STANDARD 11)

  if(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    SET(CMAKE_CXX_FLAGS "-Ofast -DNDEBUG -std=c++11 -DHAVE_CXX0X -openmp -march=native -fpic -ftree-vectorize")
  elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    SET(CMAKE_CXX_FLAGS "-Ofast -lrt -DNDEBUG -std=c++11 -DHAVE_CXX0X -march=native -fpic -w -fopenmp -ftree-vectorize -ftree-vectorizer-verbose=0")
  elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    SET(CMAKE_CXX_FLAGS "-Ofast -lrt -DNDEBUG -std=c++11 -DHAVE_CXX0X -openmp -march=native -fpic -w -fopenmp -ftree-vectorize")
  endif()

  add_executable(search expr/search.cpp)
  # target_link_libraries(search hnswlib)

  add_executable(build expr/build.cpp)
  # target_link_libraries(build_test hnswlib)

  add_subdirectory(pybind11)
  pybind11_add_module(hnswsparse python/hnswsparse.cpp)
  # target_link_libraries(hnswsparse hnswlib)
endif()
