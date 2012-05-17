#! /bin/zsh

# Install oh-my-zsh (see https://github.com/robbyrussell/oh-my-zsh)
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Install pathogen (see https://github.com/tpope/vim-pathogen)
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -so ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Install bufexplorer (see http://www.vim.org/scripts/script.php?script_id=42)
BUF='bufExplorer.zip'
curl -so $BUF http://www.vim.org/scripts/download_script.php\?src_id\=14208
unzip $BUF -d ~/.vim/bundle
rm -f $BUF

# Install color sample pack (see http://www.vim.org/scripts/script.php?script_id=625)
COLORPACK='ColorSamplerPack'
curl -so $COLORPACK http://www.vim.org/scripts/download_script.php?src_id=12179 
unzip $COLORPACK ~/.vim/bundle
rm -f $BUF

# Install NERDTree
NERDTREE='nerdtree.zip'
curl -so $NERDTree http://www.vim.org/scripts/download_script.php?src_id=17123
unzip $NERDTree -d ~/.vim/bundle
rm -f $NERDTree


# Copy over zshrc config files
cp .zshrc ~/
cp .zshrc.ayemeng ~/

# Copy over vimrc
cp .vimrc ~/
