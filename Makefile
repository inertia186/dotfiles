all: install
install:
	git submodule init
	git submodule update
	ln -fs $(PWD)/vim ~/.vim
	mkdir -p ~/.config/zed
	ln -fs $(PWD)/zed/settings.json ~/.config/zed/settings.json
