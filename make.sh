#! /bin/bash

######### Variables

dotfiles_dir=$HOME/dotfiles
old_dotfiles=$HOME/dotfiles_old

shopt -s nullglob
files=( ${dotfiles_dir}/* )

#########

######## Functions

make_symlinks() {
	read -p "Symlink '${home_file}' (default 'no')?" -r ANSWER
	if [ "$ANSWER" = "y" ] || [ "$ANSWER" = "Y" ] || [ "$ANSWER" = "yes" ]; then
		if [ ! -e "${old_dotfiles}/${filename}" ]; then
			echo "backup '${old_dotfiles}/${filename}' already exists!'"
		elif [ -e ${home_file} ]; then
			echo "Moving '$home_file' to '$old_dotfiles/$filename'"
			# Treat directory like file. Don't overwrite exisiting file.
			mv -T -n "$home_file" "${old_dotfiles}/${filename}"
		fi
		echo -e "Creating symlink from '$src' to '$home_file' \n"
		ln -s "$src" "$home_file"
	fi
}

#########

# Makesure the dotfiles directory exists and there are files in it
if [[ ! -d ${dotfiles_dir} && ${#files[@]} -eq 0 ]]; then
	echo "Tbe ${dotfiles_dir} directory does not exist yet or it's empty. Please clone it first."
fi

env -i git submodule init
env -i git submodule update

# Create a ~/dotfiles_old directory
if [[ ! -d ${old_dotfiles} ]]; then
	if mkdir "$old_dotfiles"; then
		echo "Created '${old_dotfiles}' directory."
	fi
fi

echo "REMINDER: backups don't overwrite existing backups in '${old_dotfiles}'."

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for src in "${files[@]}"; do
	filename="$(basename "$src")"
	if [[ -f "$src" || -d "$src" ]] && [ "$filename" != "$(basename "$0")" ] && [  "$filename" != "excludes" ]; then
		if [ -f "$src" ] || [ "$filename" = "vim" ]; then
		   home_file="$HOME/.${filename}"
		elif [ -d "$src" ]; then
		   home_file="$HOME/${filename}"
		fi
		echo
		make_symlinks
	fi
done

echo "Finished!"
exit 0
