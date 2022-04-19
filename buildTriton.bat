rmdir /s build
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DBOOST_ROOT="C:/Users/mzakocs/Documents/GitHub/Triton/dependencies/boost_1_73_0/" -DPYTHON_VERSION=3.7 -DPYTHON_INCLUDE_DIRS="C:/Users/mzakocs/AppData/Local/Programs/Python/Python37/include" -DPYTHON_LIBRARIES="C:/Users/mzakocs/AppData/Local/Programs/Python/Python37/libs/python37.lib" -DZ3_INCLUDE_DIRS="C:/Users/mzakocs/Documents/GitHub/Triton/dependencies/z3-4.8.14-x64-win/include" -DZ3_LIBRARIES="C:/Users/mzakocs/Documents/GitHub/Triton/dependencies/z3-4.8.14-x64-win/bin/libz3.lib" -DCAPSTONE_INCLUDE_DIRS="C:/Users/mzakocs/Documents/GitHub/Triton/dependencies/capstone-4.0.2-win64/include" -DCAPSTONE_LIBRARIES="C:/Users/mzakocs/Documents/GitHub/Triton/dependencies/capstone-4.0.2-win64/capstone.lib" -DLLVM_INTERFACE=ON -DCMAKE_PREFIX_PATH="C:/Users/mzakocs/Documents/GitHub/Triton/dependencies/llvm-project-llvmorg-13.0.1/build/cmake/modules/CMakeFiles" -DLLVM_INCLUDE_DIRS="C:/Users/mzakocs/Documents/GitHub/Triton/dependencies/llvm-project-llvmorg-13.0.1/build/include" ..
cmake --build .
PAUSE
