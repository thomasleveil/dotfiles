# dotfiles

git config
----------

    curl -sL https://raw.githubusercontent.com/thomasleveil/dotfiles/master/git_config.sh | sh


git radar
---------

_See [project page](https://github.com/michaeldfallen/git-radar#installation)_

    git clone https://github.com/michaeldfallen/git-radar ~/.git-radar
    cat >> ~/.bashrc <<-"EOF"
        export PATH=$PATH:$HOME/.git-radar
        export PS1="$PS1\$(git-radar --bash --fetch) "
    EOF
