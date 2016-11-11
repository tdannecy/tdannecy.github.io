f13::
temp := clipboardall
clipboard :=
sendinput ^x
clipwait
loop parse, clipboard, `n`t, `r%a_space%
    sendinput % a_loopfield a_space
clipboard := temp
return
