function fish_greeting
end

function fish_prompt
    set -l last_status $status
    echo ""

    if [ $last_status -ne 0 ]
        set_color --bold white -b red
        echo -n " ! "

        set_color normal
    end


    if set -q IN_NIX_SHELL
        set_color --bold black -b cyan
        echo -n " 󱄅  "

        set_color normal
    end

    set_color black -b yellow

    echo -n " $(dirs) "
    set_color yellow -b normal
    echo -n ""

    set_color normal
    echo -n " "
end

alias ns="nix-shell --command fish -p"

fish_add_path ~/.pack/bin
