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

    sudo apt install fonts-powerline
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    sed -ri 's/^ZSH_THEME=".+"(.*)/ZSH_THEME="agnoster"\1/' ~/.zshrc
    sed -ri 's/^(#\s*)?ENABLE_CORRECTION=.*/ENABLE_CORRECTION="true"/' ~/.zshrc
    sed -ri 's@^(#\s*)?HIST_STAMPS=.*@HIST_STAMPS="dd/mm/yyyy"@' ~/.zshrc
    sed -ri 's/^(#\s*)?COMPLETION_WAITING_DOTS=.*/COMPLETION_WAITING_DOTS="true"/' ~/.zshrc
    

# Toolbox

## commands

    sudo apt update
    sudo apt install curl dnsutils git htop jq python3-pip ncdu tree vim-nox wget zsh 
    sudo pip install docker-compose httpie

- [BorgBackup](https://borgbackup.readthedocs.io/en/stable/installation.html) - deduplicating backup program. Optionally, it supports compression and authenticated encryption.
- [Borgmatic](https://github.com/witten/borgmatic) - wrapper script for the Borg backup software that creates and prunes backups
- [mitmproxy](https://github.com/mitmproxy/mitmproxy/) - interactive HTTPS proxy
- [mtr](https://www.bitwizard.nl/mtr/) - ping + traceroute

## services

- [Cabot](https://cabotapp.com/) - Self-hosted, easily-deployable monitoring and alerts service - like a lightweight PagerDuty
- [cockpit](https://cockpit-project.org/running.html#debian) - server manager that makes it easy to administer your GNU/Linux servers via a web browser
- [docker-ce](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- [fail2ban](https://www.fail2ban.org) - scans log files (e.g. /var/log/apache/error_log) and bans IPs that show the malicious signs -- too many password failures, seeking for exploits, etc
- [netdata](https://my-netdata.io/) - distributed real-time performance and health monitoring 
    > [installation](https://github.com/firehol/netdata/wiki/Installation#linux-one-liner): `bash <(curl -Ss https://my-netdata.io/kickstart.sh) all --dont-wait`

## docker-compose recipes

- [mysql](doco/mysql/)
- [postgres](doco/postgres/)
