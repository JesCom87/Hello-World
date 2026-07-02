cmake_minimum_required(VERSION 3.16)

project(HelloWorldMaster NONE)

message(STATUS "=== HelloWorld Master Build ===")

# -------------------------
# C (Make)
# -------------------------
add_custom_target(c_build ALL
    COMMAND make
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/c
)

add_custom_target(c_run ALL
    COMMAND ${CMAKE_SOURCE_DIR}/c/hello
    DEPENDS c_build
)

# -------------------------
# C++ (CMake subproject)
# -------------------------
add_custom_target(cpp_configure
    COMMAND ${CMAKE_COMMAND} -S ${CMAKE_SOURCE_DIR}/cpp -B ${CMAKE_SOURCE_DIR}/cpp/build
)

add_custom_target(cpp_build
    COMMAND ${CMAKE_COMMAND} --build ${CMAKE_SOURCE_DIR}/cpp/build
    DEPENDS cpp_configure
)

add_custom_target(cpp_run ALL
    COMMAND ${CMAKE_SOURCE_DIR}/cpp/build/hello
    DEPENDS cpp_build
)

# -------------------------
# Python
# -------------------------
add_custom_target(py_run ALL
    COMMAND python3 ${CMAKE_SOURCE_DIR}/py/hello.py
)

# -------------------------
# Java (Maven)
# -------------------------
add_custom_target(java_build
    COMMAND mvn -q package
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/java
)

add_custom_target(java_run ALL
    COMMAND java -cp target/hello-java-1.0.0.jar com.example.Main
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/java
    DEPENDS java_build
)

# -------------------------
# MASTER TARGET
# -------------------------
add_custom_target(all_everything
    DEPENDS c_run cpp_run py_run java_run
)
