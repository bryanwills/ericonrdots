alias jpnb='jupyter-notebook'

alias cformat='clang-format -i -style=webkit'

alias maketmp='make BUILD_DIR=/tmp/(pwd)'

function statusgit --argument show
    if test -z $show
        set show_status false
    else
        set show_status true
    end

    set_color -o
    printf "Checking git status: "
    if $show_status
        printf "showing all status!"
    end
    printf "\n\n"
    set_color normal

    for dir in ./*/
        cd "$dir"
        
        if git_is_repo
            set final 0
            
            set_color -o
            printf "$dir is:\n"
            set_color normal
            
            if git_is_dirty
                printf "  dirty\n"
                set final 1
            end
            if git_is_staged
                printf "  staged\n"
                set final 1
            end
            if git_is_touched
                printf "  touched\n"
                set final 1
            end

            if test $final = 0
                printf "  clean\n"
                if $show_status
                    git status
                end
                printf "\n"
            else
                git status
                printf "\n"
            end
            
        end
        
        cd -
    end
end
