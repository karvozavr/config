#!/bin/bash

git config --global user.name "Dmitrii Abramov"
git config --global user.email "karvozavr@gmail.com"

# Useful named stash show and apply
# Use with git stash save "name"
git config --global alias.sshow "!f() { git stash show stash^{/$*} -p; }; f"
git config --global alias.sapply "!f() { git stash apply stash^{/$*}; }; f"

git config --global alias.log1 "log --oneline"
