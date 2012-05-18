#! /bin/sh
##
# The script installs the dotfiles for the user and vim plugins
## 

# bufexplorer (see http://www.vim.org/scripts/script.php?script_id=42)
plugins[0]=http://www.vim.org/scripts/download_script.php\?src_id\=14208
# color sample pack (see http://www.vim.org/scripts/script.php?script_id=625)
plugins[1]=http://www.vim.org/scripts/download_script.php?src_id=12179 
# NERDTree (see http://www.vim.org/scripts/script.php?script_id=1658)
plugins[2]=http://www.vim.org/scripts/download_script.php?src_id=17123

# Install oh-my-zsh (see https://github.com/robbyrussell/oh-my-zsh)
rm -rf ~/.oh-my-zsh
curl -sL https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Install pathogen (see https://github.com/tpope/vim-pathogen)
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -so ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Install VIM plugins
for plugin in ${plugins[@]} 
do
	TMP='tmp.zip'
	curl -o $TMP $plugin
	unzip -f $TMP -d ~/.vim/bundle
	rm -f $TMP
done

# Copy over zshrc config files
cp .zshrc ~/
cp .zshrc.ayemeng ~/
cp .zshrc.alexmeng ~/

# Copy over vimrc
cp .vimrc ~/
