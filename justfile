debug_bin := "binary/Debug64/main"
release_bin := "binary/Release64/main"
distro_bin := "binary/Distro64/main"
BLDDIR := "./build"

alias c := clean
alias b := build

cmake:
  premake5 cmake
  mkdir build binary 2> /dev/null || true

build CONFIG:
  cmake -B {{BLDDIR}} -S . -DCMAKE_BUILD_TYPE={{CONFIG}}
  cmake --build {{BLDDIR}}

clean:
  rm -r ./build
  rm -r ./binary

  find . -type f -name '*.*make' -delete
  # rm ./Makefile
  rm ./CMakeLists.txt
