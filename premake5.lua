require "premake-plugins.cmake.cmake"
workspace "vzl-lib"
filename "vzl-lib"
location "./"
configurations { "Debug32", "Debug64", "Release32", "Release64", "Distro32", "Distro64" }
platforms { "Win", "Unix", "BSD", "Mac" }

language "C"

project "Tests"
kind "ConsoleApp"
targetname "run_tests"
targetdir "%{wks.location}/binary/%{cfg.buildcfg}"
objdir "%{wks.location}/build/%{cfg.buildcfg}"
location "%{wks.location}/test/"
libdirs { "%{wks.location}/library/**" }
links { "array", "list" }
files {
  "%{wks.location}/test/**.c"
}

project "array"
kind "StaticLib"
targetname "list"
targetdir "%{wks.location}/binary/%{cfg.buildcfg}"
objdir "%{wks.location}/build/%{cfg.buildcfg}"
location "%{wks.location}/source/array"
libdirs { "%{wks.location}/library/production/**" }
-- links { "%{wks.location}/external/**" }
links {
  "%{wks.location}/source/array/**"
}
libdirs {
  "%{wks.location}/source/array/**"
}
includedirs {
  "%{wks.location}/source/array/**.h"
}
files {
  "%{wks.location}/source/array/**.c",
}

project "list"
kind "StaticLib"
targetname "list"
targetdir "%{wks.location}/binary/%{cfg.buildcfg}"
objdir "%{wks.location}/build/%{cfg.buildcfg}"
location "%{wks.location}/source/list"
libdirs { "%{wks.location}/library/production/**" }
-- links { "%{wks.location}/external/**" }
links {
  "%{wks.location}/source/list/**"
}
libdirs {
  "%{wks.location}/source/list/**"
}
includedirs {
  "%{wks.location}/source/list/**.h"
}
files {
  "%{wks.location}/source/list/**.c",
}

filter "configurations:Debug"
buildoptions {
  "-g3",
  "-ggdb3",
  "-Og",
  "-Wall",
  "-Wextra",
  "-Wshadow",
  "-Wdouble-promotion",
  "-Wformat=2",
  "-Wformat-truncation",
  "-Wformat-overflow",
  "-Wundef",
  "-Werror=return-type",
  "-Wno-unused-parameter",
  "-Wno-reorder",
  "-fno-common",
  "-fstack-usage",
  "-Wstack-usage=256",
  "-Wconversion",
  "-ffunction-sections",
  "-fdata-sections",
  "-Wpadded",
  "-fvar-tracking",
  "-fno-eliminate-unused-debug-symbols",
  "-fvar-tracking-assignments",
  "-ggnu-pubnames",
  "-ginline-points",
  "-fno-eliminate-unused-debug-types",
  "-Q",
  "-p",
  "-pg",
  "-ftime-report",
  "-fmem-report",
  "-fprofile-arcs",
  "-ftest-coverage",
  "-time",
  "-pedantic",
  "-pedantic-errors",
  "-Wdeprecated",
  "-Werror=missing-declarations",
  "-Werror=redundant-decls",
  "-fsanitize=address,undefined",
  "-fno-omit-frame-pointer",
  "-fvisibility=hidden",
  "-fno-optimize-sibling-calls",
  "-fno-strict-aliasing",
  "-fwrapv",
  "-Wfloat-equal",
  "-Wpointer-arith",
  "-Wcast-align",
  "-Wstric-prototypes",
  "-Wmissing-prototypes",
  "-Wstric-overflow=5",
  "-Wwrite-strings",
  "-Waggregate-return",
  "-Wcast-equal",
  "-Wswitch-default",
  "-Wswitch-enum",
  "-Wunreachable-code",
  "-fverbose-asm",
  "--coverage",
  "-finstrument-functions",
  "-Winit-self",
  "-Wuninitialized",
  "--save-temps",
  "-fmudflap",
  "-Werror-implicit-function-declaration",
  "-std=C23",
}
defines { "DEBUG", "_DEBUG", "CLOX_DEBUG" }
symbols "Full"
optimize "Off"
filter "configurations:Release"
buildoptions {
  "-g",
  "-ggdb",
  "-O3",
  "-Wall",
  "-Werror",
  "-Wextra",
  "-Wshadow",
  "-Wdouble-promotion",
  "-Wformat=2",
  "-Wformat-truncation",
  "-Wformat-overflow",
  "-Wundef",
  "-Werror=return-type",
  "-Wno-unused-parameter",
  "-Wno-reorder",
  "-fno-common",
  "-fstack-usage",
  "-Wstack-usage=256",
  "-Wconversion",
  "-ffunction-sections",
  "-fdata-sections",
  "-Wpadded",
  "-fvar-tracking",
  "-fno-eliminate-unused-debug-symbols",
  "-fvar-tracking-assignments",
  "-ggnu-pubnames",
  "-ginline-points",
  "-fno-eliminate-unused-debug-types",
  "-pedantic",
  "-pedantic-errors",
  "-Wdeprecated",
  "-Werror=missing-declarations",
  "-Werror=redundant-decls",
  "-fsanitize=address,undefined",
  "-fno-omit-frame-pointer",
  "-fvisibility=hidden",
  "-fno-optimize-sibling-calls",
  "-fno-strict-aliasing",
  "-fwrapv",
  "-Wfloat-equal",
  "-Wpointer-arith",
  "-Wcast-align",
  "-Wstric-prototypes",
  "-Wmissing-prototypes",
  "-Wstric-overflow=5",
  "-Wwrite-strings",
  "-Waggregate-return",
  "-Wcast-equal",
  "-Wswitch-default",
  "-Wswitch-enum",
  "-Wunreachable-code",
  "-fverbose-asm",
  "-finstrument-functions",
  "-Winit-self",
  "-Wuninitialized",
  "-fmudflap",
  "-Werror-implicit-function-declaration",
  "-std=C23",
}
defines { "DEBUG", "_DEBUG", "CLOX_RELEASE" }
symbols "On"
optimize "Debug"
filter "configurations:Distro"
buildoptions {
  "-O3",
  "-Wall",
  "-Werror",
  "-Wextra",
  "-Wshadow",
  "-Wdouble-promotion",
  "-Wformat=2",
  "-Wformat-truncation",
  "-Wformat-overflow",
  "-Wundef",
  "-Werror=return-type",
  "-Wno-unused-parameter",
  "-Wno-reorder",
  "-fno-common",
  "-fstack-usage",
  "-Wstack-usage=256",
  "-Wconversion",
  "-ffunction-sections",
  "-fdata-sections",
  "-Wpadded",
  "-fvar-tracking",
  "-fno-eliminate-unused-debug-symbols",
  "-fvar-tracking-assignments",
  "-ggnu-pubnames",
  "-ginline-points",
  "-fno-eliminate-unused-debug-types",
  "-pedantic",
  "-pedantic-errors",
  "-Wdeprecated",
  "-Werror=missing-declarations",
  "-Werror=redundant-decls",
  "-fsanitize=address,undefined",
  "-fno-omit-frame-pointer",
  "-fvisibility=hidden",
  "-fno-optimize-sibling-calls",
  "-fno-strict-aliasing",
  "-fwrapv",
  "-Wfloat-equal",
  "-Wpointer-arith",
  "-Wcast-align",
  "-Wstric-prototypes",
  "-Wmissing-prototypes",
  "-Wstric-overflow=5",
  "-Wwrite-strings",
  "-Waggregate-return",
  "-Wcast-equal",
  "-Wswitch-default",
  "-Wswitch-enum",
  "-Wunreachable-code",
  "-Winit-self",
  "-Wuninitialized",
  "-fmudflap",
  "-Werror-implicit-function-declaration",
  "-std=C23",
}
defines { "NDEBUG", "_NDEBUG", "CLOX_DISTRO" }
symbols "Off"
optimize "Full"
filter {}

filter "configurations:x32"
architecture "x86"
filter "configurations:x64"
architecture "x86_64"
filter {}

filter "platforms:Win"
system "windows"
filter "platforms:Unix"
system "linux"
filter "platforms:BSD"
system "bsd"
filter "platforms:Mac"
system "macosx"
architecture "universal"
filter {}
