#! /bin/zsh
##
# The script installs the dotfiles for the user and vim plugins
## 

# List of vim plugins to install from vim.org
plugins_vim=()
# bufexplorer (see http://www.vim.org/scripts/script.php?script_id=42)
plugins_vim+="http://www.vim.org/scripts/download_script.php?src_id=19481"
# Ctrlp (see http://www.vim.org/scripts/script.php?script_id=3736)
plugins_vim+="http://www.vim.org/scripts/download_script.php?src_id=17830"

# List of vim plugins to install from GIT
plugins_git=()
# NERDcommenter (see https://github.com/scrooloose/nerdcommenter)
plugins_git+="https://github.com/scrooloose/nerdcommenter.git"
# NERDTree (see https://github.com/scrooloose/nerdtree)
plugins_git+="https://github.com/scrooloose/nerdtree.git"
# supertab (see https://github.com/ervandew/supertab)
plugins_git+="https://github.com/ervandew/supertab.git"
# wombat256 (see https://github.com/shannonmoeller/wombat256)
plugins_git+="https://github.com/vim-scripts/wombat256.vim.git"

# Install oh-my-zsh (see https://github.com/robbyrussell/oh-my-zsh)
rm -rf ~/.oh-my-zsh
curl -sL https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Install pathogen (see https://github.com/tpope/vim-pathogen)
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -so ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Remove old vim bundles
if [[ -d ~/.vim/bundle ]]
then
	echo "Removing old vim bundle directory"
	rm -rf ~/.vim/bundle
	mkdir -p ~/.vim/bundle
fi

# Install VIM plugins from github.com
pushd ~/.vim/bundle
for plugin in ${plugins_git[@]} 
do
	git clone $plugin
done
popd

# Install VIM plugins from vim.org
for plugin in ${plugins_vim[@]} 
do
	FILE=`curl -sI $plugin | grep -o "filename=.*$" | tr -d '\r' | awk 'BEGIN{FS="="} { print $2; }'`
	FOLDER=`echo $FILE | awk 'BEGIN{FS="."} { print $1; }'`
	curl -so $FILE $plugin
	unzip -qu $FILE -d ~/.vim/bundle/$FOLDER
	echo "Installed $FILE"
	rm -f $FILE
done


# Copy over zshrc config files
ln -fs `pwd`/.zshrc ~/.zshrc
ln -fs `pwd`/.zshrc.ayemeng ~/.zshrc.ayemeng
ln -fs `pwd`/.zshrc.alexmeng ~/.zshrc.alexmeng

# Copy over vimrc
ln -fs `pwd`/.vimrc ~/.vimrc
