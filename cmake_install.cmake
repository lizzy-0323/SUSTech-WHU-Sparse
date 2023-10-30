<<<<<<< HEAD
# Install script for directory: /home/userdata/lzy/code/nips23/sparse/SUSTech-WHU-Sparse
=======
# Install script for directory: /Users/liziyi/Code/pythondev/SUSTech-WHU-Sparse
>>>>>>> 083ce9a6268e7997bb76716af545fab027b020be

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
<<<<<<< HEAD
  include("/home/userdata/lzy/code/nips23/sparse/SUSTech-WHU-Sparse/pybind11/cmake_install.cmake")
=======
  include("/Users/liziyi/Code/pythondev/SUSTech-WHU-Sparse/pybind11/cmake_install.cmake")
>>>>>>> 083ce9a6268e7997bb76716af545fab027b020be

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
<<<<<<< HEAD
file(WRITE "/home/userdata/lzy/code/nips23/sparse/SUSTech-WHU-Sparse/${CMAKE_INSTALL_MANIFEST}"
=======
file(WRITE "/Users/liziyi/Code/pythondev/SUSTech-WHU-Sparse/${CMAKE_INSTALL_MANIFEST}"
>>>>>>> 083ce9a6268e7997bb76716af545fab027b020be
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
