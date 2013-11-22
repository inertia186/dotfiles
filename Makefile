all: install
install:
	git submodule init
	git submodule update
	ln -fhs $(PWD)/vim ~/.vim
