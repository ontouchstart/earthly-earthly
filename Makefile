all: 	set earthly
	earthly/earthly -v
	cp Earthfile earthly
	cd earthly && ./earthly +for-linux
	./earthly/build/linux/amd64/earthly -v 
	./earthly/build/linux/amd64/earthly github.com/earthly/hello-world+hello
	cp ./earthly/build/linux/amd64/earthly bin
	bin/earthly --no-cache github.com/earthly/hello-world+hello



earthly:
	git clone https://github.com/earthly/earthly.git

set:
	echo "local shell variables"
	set | cut -f1 -d= |cat -n
