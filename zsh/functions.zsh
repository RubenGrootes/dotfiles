#Functions edit, vcs_super_info_wrapper and shell_icon:
#Copyright (C) 2014-2015 Daniel Voogsgerd
#Licensed under MIT license

function edit {
	FILE=$1
	if [ -w "$FILE" ]; then
		echo "Write permission is granted on $FILE"
		if hash "$VISUAL" 2>/dev/null; then
			$VISUAL "$FILE"
		elif hash "$EDITOR" 2>/dev/null; then
			$EDITOR "$FILE"
		else
			echo "The specified editors couldn't be found"
			return 1
		fi

	else
		echo "Write permission is NOT granted on $FILE"
		echo "Opening using sudoedit"
		notify-send "No write permission. Opening using sudo"
		sudoedit $FILE
    fi
}

function vcs_super_info_wrapper {
	if [[ "$(stat -f -c %T .)" != 'cifs' ]]; then
		vcs_super_info
	fi
}

function shell_icon {
	if [[ "$(stat -f -c %T .)" == 'cifs' ]]; then
		echo "☁"
	else
		echo "$"
	fi
}
