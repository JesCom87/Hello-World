cmake_minimum_required(VERSION 3.16)

project(HelloCPP LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)

add_executable(hello
    src/main.cpp
    src/hello.cpp
)

target_include_directories(hello PRIVATE src)
