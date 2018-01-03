ws_MinHeight = 0

OnExit, ExitSub
return  

^+SPACE::  
WinGet, ws_ID, ID, A
Loop, Parse, ws_IDList, |
{
    IfEqual, A_LoopField, %ws_ID%
    {
        StringTrimRight, ws_Height, ws_Window%ws_ID%, 0
        WinMove, ahk_id %ws_ID%,,,,, %ws_Height%
        StringReplace, ws_IDList, ws_IDList, |%ws_ID%
        return
    }
}
WinGetPos,,,, ws_Height, A
ws_Window%ws_ID% = %ws_Height%
WinMove, ahk_id %ws_ID%,,,,, %ws_MinHeight%
ws_IDList = %ws_IDList%|%ws_ID%
return

ExitSub:
Loop, Parse, ws_IDList, |
{
    if A_LoopField =  
        continue      
    StringTrimRight, ws_Height, ws_Window%A_LoopField%, 0
    WinMove, ahk_id %A_LoopField%,,,,, %ws_Height%
}
ExitApp  
