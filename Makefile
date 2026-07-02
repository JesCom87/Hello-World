.PHONY: all c cpp py java clean

all: c cpp py java

c:
	$(MAKE) -C c
	./c/hello

cpp:
	cmake -S cpp -B cpp/build
	cmake --build cpp/build
	./cpp/build/hello

py:
	python3 py/hello.py

java:
	cd java && mvn -q package
	java -cp java/target/hello-java-1.0.0.jar com.example.Main

clean:
	$(MAKE) -C c clean
	rm -rf cpp/build
	cd java && mvn clean
