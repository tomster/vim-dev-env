all: ${HOME}/.bash_git ${HOME}/.bashrc ${HOME}/.vimrc ${HOME}/.gitconfig ${HOME}/.vim/bundle ${HOME}/.vim/bundle.installed


install_vimrc: ${HOME}/.vimrc vundle_install
make_bundle: ${HOME}/.vim/bundle
vundle_install: 
	vim +PluginInstall +qall

vundle_update:
	vim +PluginUpdate +qall

dot_bash_git:
	curl -L https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > dot_bash_git

${HOME}/.bash_git: dot_bash_git
	install -m 644 dot_bash_git ${HOME}/.bash_git

${HOME}/.bashrc:
	install -m 644 dot_bashrc ${HOME}/.bashrc

${HOME}/.vimrc:
	install -m 644 dot_vimrc ${HOME}/.vimrc

${HOME}/.gitconfig:
	install -m 644 dot_gitconfig ${HOME}/.gitconfig

${HOME}/.vim/bundle:
	mkdir -p ${HOME}/.vim/bundle

${HOME}/.vim/bundle/Vundle.vim: 
	git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim

${HOME}/.vim/bundle.installed: ${HOME}/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
	touch ${HOME}/.vim/bundle.installed
