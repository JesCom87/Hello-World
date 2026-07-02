import subprocess
import sys
from SCons.Script import DefaultEnvironment, AlwaysBuild

env = DefaultEnvironment()

def run(cmd, cwd=None):
    print(f"\n>>> Running: {' '.join(cmd)} (in {cwd or '.'})")
    subprocess.run(cmd, cwd=cwd, check=True)

# -----------------------
# C
# -----------------------
def build_c(target, source, env):
    run(["make"], cwd="c")
    run(["./hello"], cwd="c")

c = env.Command("c_run", [], build_c)
AlwaysBuild(c)

# -----------------------
# C++
# -----------------------
def build_cpp(target, source, env):
    run(["cmake", "-S", ".", "-B", "build"], cwd="cpp")
    run(["cmake", "--build", "build"], cwd="cpp")
    run(["./build/hello"], cwd="cpp")

cpp = env.Command("cpp_run", [], build_cpp)
AlwaysBuild(cpp)

# -----------------------
# Python
# -----------------------
def run_py(target, source, env):
    run([sys.executable, "hello.py"], cwd="py")

py = env.Command("py_run", [], run_py)
AlwaysBuild(py)

# -----------------------
# Java
# -----------------------
def run_java(target, source, env):
    run(["mvn", "-q", "package"], cwd="java")
    run([
        "java",
        "-cp",
        "target/hello-java-1.0.0.jar",
        "com.example.Main"
    ], cwd="java")

java = env.Command("java_run", [], run_java)
AlwaysBuild(java)

# -----------------------
# Master target
# -----------------------
env.Alias("all", [c, cpp, py, java])
Default("all")
