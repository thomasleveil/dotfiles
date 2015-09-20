#!/bin/bash
# install git-radar, see https://github.com/michaeldfallen/git-radar

git clone https://github.com/michaeldfallen/git-radar ~/.git-radar
cat >> ~/.bashrc <<-"EOF"
	export PATH=$PATH:$HOME/.git-radar
	export PS1="$PS1\$(git-radar --bash --fetch) "
EOF
