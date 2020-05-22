`sh -c 'curl -fLo "${$HOME/.gitconfig}" \
       https://raw.githubusercontent.com/altern/UNIX_config/master/.gitconfig`

`sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`

`sh -c 'curl -fLo "${$HOME/.config/nvim}" --create-dirs \
       https://raw.githubusercontent.com/altern/UNIX_config/master/init.vim`
