all: 	earthly
	cd earthly && ./earthly +for-linux
	./earthly/build/linux/amd64/earthly github.com/earthly/hello-world+hello

earthly:
	git clone https://github.com/earthly/earthly.git

