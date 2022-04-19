# Triton Windows LLVM Build
 > A brief repository focused on successfully building the Triton dynamic binary analysis library with LLVM 13.0 on Windows

## Disclaimer
Triton is not my project, these are just build scripts for Windows. To find the original project, go [here](https://github.com/JonathanSalwan/Triton).

## Introduction
I've been messing around with Triton for a little while now and I absolutely love it, especially with the [new LLVM features](https://github.com/JonathanSalwan/Triton/issues/1078). It is a very versatile tool that has a ton of useful features, but unfortunately, the entire build process for both Triton and LLVM is a bit finnicky & undocumented on Windows. This is a shame as the [official Windows builds for Triton](https://ci.appveyor.com/project/JonathanSalwan/triton/history) don't currently include LLVM, meaning you have to build everything from scratch if you want to try any of the new features. This guide should hopefully help out with that process.

## Usage
There are two ways you can use this repository. 
<br><br>
Before you go try either, you need to install [Python 3.7.0](https://www.python.org/downloads/release/python-370/) for Windows x64. Triton builds specifically for this version and doesn't work too well with higher versions.
<br><br>
The first option for getting up-and-running is just downloading my [pre-made build](https://github.com/mzakocs/TritonWindowsLLVMBuild/releases/tag/Release) on the Releases page. 
<br><br>
Second option is building everything yourself:
1. Clone the most recent [Triton version](https://github.com/JonathanSalwan/Triton)
2. Download the files in **this** repository and drag them into the base directory of the Triton repository
3. Download [this](https://github.com/LLVMParty/LLVMCMakeTemplate/blob/master/cmake/LLVM.cmake) great file from [mrexodia](https://github.com/mrexodia)'s LLVM cmake repository and throw it in the `CMakeModules` folder in the Triton base directory
4. Go into the `dependencies` folder and extract these specific x64 Windows releases of [Capstone](https://github.com/aquynh/capstone/releases/download/4.0.2/capstone-4.0.2-win64.zip), [Z3](https://github.com/Z3Prover/z3/releases/download/z3-4.8.9/z3-4.8.9-x64-win.zip), and [Boost](https://boostorg.jfrog.io/artifactory/main/release/1.73.0/source/boost_1_73_0.zip) into their own folders. Also, get the [source code of LLVM](https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-13.0.1.zip) as we're going to have to build it manually
5. Head into the `llvm-project-llvmorg-13.0.1` folder and run `LLVMbuild.bat`. This will build LLVM 13 along with clang. As expected, this will take a very long time
6. Once LLVM is done building, head back to the Triton base directory and open up `buildTriton.bat` in a text editor. I recommend Notepad++ with text wrapping on (View->Word wrap) as some of the commands are fairly lengthy. Edit all of the paths to their respective dependency folder on your system. You also need to edit the Python folder paths to their locations in `AppData`. I left the full paths from my system so you can get enough context for what you need to put in these path variables
7. After all of the paths have fixed, go ahead and run the `buildTriton.bat` script. After this, open up `triton.sln` in the build folder and build all solutions as Release. Head into the x64 Release build output folder to find all your files

Now that you have all four of the build files, drag them into `\AppData\Local\Programs\Python\Python37\Lib\site-packages`. You can now type `from triton import *` in a Python file and get to work. Auto-complete for the library does not seem to work in VSCode for whatever reason, but the [Python docs for Triton](https://triton.quarkslab.com/documentation/doxygen/py_triton_page.html) are great, so just use that.
<br><br>
Hope this helps. Enjoy using Triton!
