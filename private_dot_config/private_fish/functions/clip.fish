function clip
	if test (count $argv) -eq 0
		echo "Usage: clip filename"
		return 1
	end

	for file in $argv
		if test -f $file
			cat $file | xclip -selection clipboard
		else
			echo "File not found: $file"
			return 1
		end
	end
end
