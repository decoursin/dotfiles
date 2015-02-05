#! /bin/bash

######### Variables

dir=$HOME/dotfiles
old_dotfiles=$HOME/dotfiles_old

shopt -s nullglob
files=( ${dir}/* )

#########

######## Functions

make_symlinks() {
	read -p "Symlink .${filename}?" -n 1 -r
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		echo 
		continue
	fi
	echo    # (optional) move to a new line
	if [[ -f ${home_file} ]]; then
		echo "Moving '$home_file' to '$old_dotfiles/$filename'"
		# Treat directory like file. Don't overwrite exisiting file.
		mv -T -n "$home_file" "${old_dotfiles}/${filename}"
	fi
	echo -e "Creating symlink from '$src' to '$home_file' \n"
	ln -s "$src" "$home_file"
}

#########

# Makesure the dotfiles directory exists and there is files in it
if [[ ! -d ${dir} && ${#files[@]} -eq 0 ]]; then
	echo "Tbe ${dir} directory does not exist yet or it's empty. Please clone it first."
fi

env -i git submodule init
env -i git submodule update


# Create a ~/dotfiles_old directory
if [[ ! -d ${old_dotfiles} ]]; then
	if mkdir "$old_dotfiles"; then
		echo "Created '${old_dotfiles}' directory."
	else
		echo "Could not create ${old_dotfiles}." >&2
		exit 1
	fi
fi

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for src in "${files[@]}"; do
	filename="$(basename "$src")"
	home_file="$HOME/.${filename}"
	if [[ -f "$src" || -d "$src" ]] && [ "$filename" != "$(basename "$0")" ] && [  "$filename" != "excludes" ]; then
		make_symlinks
	fi
done

echo "Finished!"
exit 0
