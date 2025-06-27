function fish_prompt --description 'Write out the prompt'
    set -l last_status $status
    set -l normal (set_color normal)
    set -l user_color (set_color brgreen)
    set -l status_color (set_color brgreen)
    set -l cwd_color (set_color $fish_color_cwd)
    set -l vcs_color (set_color brpurple)
    set -l prompt_status ""

    # Remove directory name length limit
    set -q fish_prompt_pwd_dir_length

    # Change suffix and cwd color when root
    set -l suffix '❯'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set cwd_color (set_color $fish_color_cwd_root)
        end
        set suffix '#'
    end

    # Show red status code on error
    if test $last_status -ne 0
        set status_color (set_color $fish_color_error)
        set prompt_status $status_color "[" $last_status "]" $normal
    end

    # ─── First line: user@host, cwd, VCS, status ────────────────────────
    echo -s \
      $user_color $USER $normal "@" $hostname ' ' \
      $cwd_color (prompt_pwd) \
      $vcs_color (fish_vcs_prompt) \
      $normal ' ' $prompt_status

    # ─── Second line: [shpool:<session>] ❯ ──────────────────────────────
    if set -q SHPOOL_SESSION_NAME
        set_color -b brgreen black
        echo -n "[$SHPOOL_SESSION_NAME]"
        set_color normal
        echo -n ' '
    end
    echo -n -s $status_color $suffix ' ' $normal
end