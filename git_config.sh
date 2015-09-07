#!/bin/sh

git config --global user.email "thomasleveil@gmail.com"
git config --global user.name "Thomas LEVEIL"

git config --global color.ui "auto"
git config --global help.autocorrect 10
git config --global push.default simple

git config --global alias.b  'branch'
git config --global alias.ba 'branch -a'
git config --global alias.ci 'commit'
git config --global alias.co 'checkout'
git config --global alias.dc 'diff --cached'
git config --global alias.di 'diff --ignore-space-at-eol'
git config --global alias.from '!git fetch -p; git rebase origin/master'
git config --global alias.lg "log --graph --pretty=format:'%C(auto)%h -%d %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.st 'status'
git config --global alias.stu 'status --untracked-files=no'
