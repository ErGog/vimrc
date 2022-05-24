map <C-y> :call CompileAndRun()<CR>
func! CompileAndRun()
        exec "w"
        if &filetype == 'c'
                exec '!gcc -std=c99 -g %'
                exec '!time ./a.out'
        elseif &filetype == 'cpp'
                exec '!g++ -g % -o %<'
                exec '!time ./%<'
        elseif &filetype == 'python'
                exec '!time python %'
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'zsh'
                :!time zsh %
        elseif &filetype=='lua'
                exec '!time lua5.3 %'
        elseif &filetype=='go'
                exec '!time go run %'
        elseif &filetype=='javascript'
                exec '!time node %'
        elseif &filetype=='d'
                exec '!dmd %'
                exec '!time ./%<'
        elseif &filetype=='rust'
                exec '!time cargo run'
        endif
endfunc
