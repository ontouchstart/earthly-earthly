all: 	set env earthly hello-world
	./earthly/earthly -v
	cp src/Earthfile earthly
	cd earthly && ./earthly +for-linux
	./earthly/build/linux/amd64/earthly -v 
	./earthly/build/linux/amd64/earthly github.com/earthly/hello-world+hello
	cp ./earthly/build/linux/amd64/earthly bin
	bin/earthly --no-cache github.com/earthly/hello-world+hello # remote
	bin/earthly --no-cache ./hello-world+hello # local


earthly:
	git clone https://github.com/earthly/earthly.git

hello-world:
	git clone https://github.com/earthly/hello-world.git

set:
	echo "local shell variables"
	set | cut -f1 -d= |cat -n
env:
	echo "env variables"
	env | cut -f1 -d= |cat -n

clean:
	rm -rf earthly
