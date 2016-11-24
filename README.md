# dotfiles

git config
----------

    curl -sL https://raw.githubusercontent.com/thomasleveil/dotfiles/master/git_config.sh | sh



WinSCP PuTTY config
-------------------

- Hit <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>P</kbd>
- `Integration` → `Applications`
- `PuTTY/Terminal client path` : 

        C:\bin\kitty.exe -load "Default Settings" -A -P !# -t -m "%TEMP%\putty.txt" !U@!@ !`cmd.exe /c echo cd '!/' ; TERM=xterm-color /bin/bash -login > "%TEMP%\putty.txt"`


shell tricks
------------

### terminal title 

    TITLEBAR='\[\e]0;\u@\h\a\]'; PS1="${TITLEBAR}${PS1}"
    
### ssh agent management using keychain

    apt install keychain
    
add to the end of `~/.bashrc`:

    /usr/bin/keychain --clear $HOME/.ssh/id_rsa
    source $HOME/.keychain/$HOSTNAME-sh
  
### Oh my zsh

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    sed -ri 's/^ZSH_THEME=".+"(.*)/ZSH_THEME="agnoster"\1/' ~/.zshrc
