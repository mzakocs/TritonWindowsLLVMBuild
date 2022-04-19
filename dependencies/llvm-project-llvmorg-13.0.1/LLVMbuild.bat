rmdir /s build
mkdir build
cmake -S llvm -B build -DLLVM_ENABLE_PROJECTS=clang -Thost=x64 -DCMAKE_BUILD_TYPE=Release
cmake --build .
PAUSE
