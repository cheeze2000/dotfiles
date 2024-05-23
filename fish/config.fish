function fish_greeting
end

function fish_prompt
    set -l s $status
    echo ""

    if test $s -ne 0
        set_color red
        echo -n "  "
    end

    set_color yellow
    echo -n "󰉋 "

    set_color normal
    echo " $(dirs)"

    echo -n "󰅂 "
end
