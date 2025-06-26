function clip --description 'Copy entire contents of file to clipboard'
    if count $argv -eq 0
        echo "Usage: clip <file> [...]"
        return 1
    end

    for file in $argv
        if not test -f $file
            echo "File not found: $file"
            return 1
        end

        # read the entire file
        set -l content (cat $file)

        # 1) macOS?
        if test (uname) = "Darwin"
            printf '%s' "$content" | pbcopy
            continue
        end

        # 2) Wayland?
        if type -q wl-copy
            printf '%s' "$content" | wl-copy
            continue
        end

        # 3) X11?
        if type -q xclip
            printf '%s' "$content" | xclip -selection clipboard
            continue
        else if type -q xsel
            printf '%s' "$content" | xsel --clipboard --input
            continue
        end

        # 4) Fallback: OSC 52 (base64-encodes and emits the clipboard escape)
        set -l b64 (printf '%s' "$content" | base64 | tr -d '\n')
        # \e]52;c;<data>\a
        printf '\e]52;c;%s\a' "$b64"
    end

    return 0
end