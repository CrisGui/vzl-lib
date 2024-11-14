debug_bin := "binary/Debug64/main"
release_bin := "binary/Release64/main"
distro_bin := "binary/Distro64/main"

alias c := clean
alias r := run
alias b := build
alias m := make

run: build
  clear
  @echo -e "=== Executing program ===\n\n"
  ./{{debug_bin}}
  @echo -e "\n\n=== Program executed ==="

build: make
  #fd -t f -e c -e h | entr -cs 'make config=debug64_unix all'
  make config=debug64_unix all
  make config=release64_unix all
  make config=distro64_unix all

make:
  premake5 gmake2

clean:
  fd -t f -e make | xargs rm
  rm ./Makefile
  rm -r ./build
  rm -r ./binary
