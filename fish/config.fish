function fish_prompt
    set -l last_status $status
    echo ""

    if test $last_status -eq 0
        set_color black -b yellow
        echo -n " $(dirs) "
        set_color yellow -b normal
        echo -n ""
    else
        set_color --bold white -b red
        echo -n " ! "

        set_color normal

        set_color black -b yellow
        echo -n " $(dirs) "
        set_color yellow -b normal
        echo -n ""
    end

    set_color normal
    echo -n " "
end

function icat
    kitty +kitten icat $argv
end

function magit
    emacs -nw
end

set fish_color_valid_path
set fish_pager_color_prefix cyan --bold

fish_add_path /home/cheeze/.ghcup/bin
fish_add_path /home/cheeze/.local/bin
