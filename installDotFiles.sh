#! /bin/zsh -e 
##
# A script installs Ayemeng's dotfiles 
## 

function remove_dir {
  dir=$1
  echo "Removing $dir"
  rm -rf $dir
  if [ -d "$dir" ]
  then 
    mkdir -p $dir
  fi
}

# Install oh-my-zsh (see https://github.com/robbyrussell/oh-my-zsh)
remove_dir ~/.oh-my-zsh
curl -sL https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Remove old vim bundles
remove_dir ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle


# Copy over zshrc config files
ln -fs `pwd`/.zshrc ~/.zshrc
ln -fs `pwd`/.zshrc.ayemeng ~/.zshrc.ayemeng
ln -fs `pwd`/.zshrc.learnsprout ~/.zshrc.learnsprout
ln -fs `pwd`/.tmux.conf ~/.tmux.conf

# Copy over vimrc
ln -fs `pwd`/.vimrc ~/.vimrc

# automatically run BundleInstall for vim to install plugins
vim +BundleInstall +qall
