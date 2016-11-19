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


shell trics
-----------

### terminal title 

    TITLEBAR='\[\e]0;\u@\h\a\]'; PS1="${TITLEBAR}${PS1}"
    
### ssh agent management using keychain

    apt install keychain
    
add to the end of `~/.bashrc`:

    /usr/bin/keychain --clear $HOME/.ssh/id_rsa
    source $HOME/.keychain/$HOSTNAME-sh
    
and to `~/.config/fish/config.fish`:

    Set -gx HOSTNAME (hostname)
    if status --is-interactive;
        keychain --nogui --clear ~/.ssh/id_rsa
        [ -e $HOME/.keychain/$HOSTNAME-fish ]; and . $HOME/.keychain/$HOSTNAME-fish
    end
    
### history reverse lookup in fish

install [fzf](https://github.com/junegunn/fzf)
