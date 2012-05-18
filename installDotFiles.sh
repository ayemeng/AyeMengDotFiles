#! /bin/sh
##
# The script installs the dotfiles for the user and vim plugins
## 

# bufexplorer (see http://www.vim.org/scripts/script.php?script_id=42)
pluginsVIM[0]=http://www.vim.org/scripts/download_script.php\?src_id\=14208
# color sample pack (see http://www.vim.org/scripts/script.php?script_id=625)
pluginsVIM[1]=http://www.vim.org/scripts/download_script.php?src_id=12179 
# taglist (see http://vim.sourceforge.net/scripts/script.php?script_id=273)
pluginsVIM[2]=http://vim.sourceforge.net/scripts/download_script.php?src_id=7701

# NERDcommenter (see https://github.com/scrooloose/nerdcommenter)
pluginsGIT[0]=https://github.com/scrooloose/nerdcommenter.git
# NERDTree (see https://github.com/scrooloose/nerdtree)
pluginsGIT[1]=https://github.com/scrooloose/nerdtree.git
# supertab (see https://github.com/ervandew/supertab)
pluginsGIT[2]=https://github.com/ervandew/supertab.git
# wombat256 (see https://github.com/shannonmoeller/wombat256)
pluginsGIT[3]=https://github.com/vim-scripts/wombat256.vim.git

# Install oh-my-zsh (see https://github.com/robbyrussell/oh-my-zsh)
rm -rf ~/.oh-my-zsh
curl -sL https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Install pathogen (see https://github.com/tpope/vim-pathogen)
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -so ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Install VIM plugins from vim.org
for plugin in ${pluginsVIM[@]} 
do
	TMP='tmp.zip'
	curl -o $TMP $plugin
	unzip -f $TMP -d ~/.vim/bundle
	rm -f $TMP
done

# Install VIM plugins from github.com
pushd ~/.vim/bundle
rm -rf *
for plugin in ${pluginsGIT[@]} 
do
	git clone $plugin
done
popd

# Copy over zshrc config files
ln -fs `pwd`/.zshrc ~/.zshrc
ln -fs `pwd`/.zshrc.ayemeng ~/.zshrc.ayemeng
ln -fs `pwd`/.zshrc.alexmeng ~/.zshrc.alexmeng

# Copy over vimrc
ln -fs `pwd`/.vimrc ~/.vimrc
