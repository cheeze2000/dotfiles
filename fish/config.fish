function fish_greeting
end

function fish_prompt
    echo ""

    if set -q IN_NIX_SHELL
        set_color --bold cyan
        echo -n "󱄅  "

        set_color normal
    end

    set_color yellow
    echo -n "󰉋 "

    set_color normal
    echo " $(dirs)"

    echo -n "󰅂 "
end

function fish_right_prompt
    echo $status
end

alias ns="nix-shell --command fish -p"

fish_add_path ~/.pack/bin
