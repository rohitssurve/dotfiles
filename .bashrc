
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_prompt,aliases,path,exports,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Add tab completion for many Bash commands
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# fuzzy auto-completion
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# autoenv
source /usr/local/opt/autoenv/activate.sh

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh