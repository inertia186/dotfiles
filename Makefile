all: install
install:
	git submodule init
	git submodule update
	ln -fs $(PWD)/vim ~/.vim
