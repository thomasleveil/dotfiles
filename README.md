# dotfiles

git config
----------

    curl -sL https://raw.githubusercontent.com/thomasleveil/dotfiles/master/git_config.sh | sh

Linux Mint
----------

```shell
sudo apt install guake sublime-text
```

### Yubikey NEO fix

    sudo wget https://raw.githubusercontent.com/Yubico/libu2f-host/master/70-u2f.rules -O /etc/udev/rules.d/70-uf2.rules


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
    

# Toolbox (awesomeness)

## commands

    sudo apt update
    sudo apt install curl dnsutils dtrx git htop jq lnav ncdu python3-pip tree vim-nox wget zsh 
    sudo pip install docker-compose httpie

- [BorgBackup](https://borgbackup.readthedocs.io/en/stable/installation.html) - deduplicating backup program. Optionally, it supports compression and authenticated encryption.
- [Borgmatic](https://github.com/witten/borgmatic) - wrapper script for the Borg backup software that creates and prunes backups
- [ctop](https://ctop.sh/) - Top-like interface for Docker container metrics
- [Dive](https://github.com/wagoodman/dive) - Explore Docker images' layers contents
- [lnav](http://lnav.org/downloads) - log viewer
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

- [DockProm](https://github.com/thomasleveil/dockprom/tree/home) - docker-compose project to deploy Grafana+Prometheus+cAdvisor
- [mysql](doco/mysql/docker-compose.yml) - db, web admin, dump, load
- [postgres](doco/postgres/docker-compose.yml) - db, web admin, dump, load
- [mongodb](doco/mongodb/docker-compose.yml) - db, web admin, dump, load
- [fake smtp](doco/fakesmtp/docker-compose.yml) - smtp server which does not send email for real but provide a web interface to show what would have been sent
- [smtp relay](doco/smtprelay/docker-compose.yml) - when TLS is in the way
- [sftp](doco/sftp/docker-compose.yml)

## other tools

- [Jenkins DSL ready](https://github.com/thomasleveil/docker-jenkins-dsl-ready) - Jenkins ready to go as a Docker image
- [Portainer](https://portainer.io/) - web interface for managing containers, images, networks and volumes
- [Taurus](https://gettaurus.org/) - automate jMeter HTTP load tests
- [teleconsole](https://www.teleconsole.com/) - share a termnial console with anyone (allows to forward ports)
- [testinfra](https://testinfra.readthedocs.io/en/latest/) - test your infrastructure
- [Traefik](https://traefik.io/) - reverse proxy / load balancer that's easy, dynamic, automatic, fast, full-featured, open source, production proven, provides metrics, and integrates with every major cluster technology
- [Venom](https://github.com/ovh/venom) - manage and run your integration tests with efficiency - Venom run executors (script, HTTP Request, web, imap, etc... ) and assertions
