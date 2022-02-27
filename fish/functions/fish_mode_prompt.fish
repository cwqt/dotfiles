function fish_mode_prompt
    if [ $fish_key_bindings = fish_vi_key_bindings ]
        switch $fish_bind_mode
            case default
                set_color blue
                echo -n n
            case insert
                set_color green
                echo -n "i"
            case visual
                set_color magenta
                echo -n "v"
            case replace_one
                set_color red
                echo -n "r"
        end
        echo -n " "
        set_color normal
    end
end
