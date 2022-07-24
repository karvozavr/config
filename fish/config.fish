# disable fish greeting
set fish_greeting

# like `set -o vi` in bash
fish_vi_key_bindings

# load my fish functions
for f in (find ~/.config/fish/f213/ -type f  -name '*.fish')
    source $f
end
