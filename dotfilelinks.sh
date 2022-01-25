echo "Installing dotfiles"

DIR=$HOME
echo $HOME
ln -snf $DIR/dotfiles/.vim $DIR/.vim
ln -snf $DIR/dotfiles/.vim/.vimrc $DIR/.vimrc 
ln -snf $DIR/dotfiles/.tmux.conf $DIR/.tmux.conf 
ln -snf $DIR/dotfiles/.tmux $DIR/.tmux
ln -snf $DIR/dotfiles/nvim $DIR/.config/nvim 
ln -snf $DIR/dotfiles/.vifm $DIR/.vifm

#### Install FZF into home directory and update ####
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

#### Legacy Stuff ####

# ln -sf $DIR/mc-solarized.ini ~/mc-solarized.ini
# ln -n (--no-dereference) prevents recursive symlinking of directory symlinks
# ln -nsf $DIR/.bash ~/.bash

# source bootstrap file to .bashrc if it's not already included
# BSINCLUDE='. ~/.bash/bootstrap.sh'
# if grep -Fq "$BSINCLUDE" ~/.bashrc;
#       then :;
#       else
#       	    echo -e "\n\n$BSINCLUDE" >> ~/.bashrc
# fi

echo "Installation complete! Relogin please"
