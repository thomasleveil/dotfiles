# dotfiles

git config
----------

    curl -sL https://raw.githubusercontent.com/thomasleveil/dotfiles/master/git_config.sh | sh


git radar
---------

    curl -sL https://raw.githubusercontent.com/thomasleveil/dotfiles/master/git-radar.sh | sh


WinSCP PuTTY config
-------------------

- Hit <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>P</kbd>
- `Integration` → `Applications`
- `PuTTY/Terminal client path` : 

        C:\bin\kitty.exe -load "Default Settings" -A -P !# -t -m "%TEMP%\putty.txt" !U@!@ !`cmd.exe /c echo cd '!/' ; TERM=xterm-color /bin/bash -login > "%TEMP%\putty.txt"`
