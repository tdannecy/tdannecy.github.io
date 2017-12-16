---
layout: post
title: More AutoHotkey scripts
published: true

tags: tech
---

I've got some more AutoHotkey scripts that I wanted to share! These have been extremely 
helpful to me at work and I use them every day.

## CtrlSpaceOnTop.ahk

Just press the Control + Space key and it will toggle the current window to lock on top of 
the others. This can get a bit wonky with multiple windows on top, but most of the time it 
works great.

~~~
^SPACE::  Winset, Alwaysontop, , A
~~~

## CtrlShiftSpaceRollUp.ahk

Press the Control + Shift + Space key to toggle the currently active window roll status. 
This script acts wonky sometimes depending on how the window is composited, so beware.

~~~
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
~~~

## pppassword.ahk

By typing "ppp", this script generates a sufficiently random string of text that can be 
used for passwords. I wanted to make the text easy to remember, but hard to crack with a 
brute force attack (explained nicely by [XKCD 936](https://xkcd.com/936/) 
[A](http://archive.is/978wk) and more in detail on the [wiki 
page](https://www.explainxkcd.com/wiki/index.php/936:_Password_Strength) 
[A](http://archive.is/tzklt).

I thought I would make the passwords a mix of a color, a fruit, a two-digit number, and a 
punctuation character. This combination creates a human readable and memorable string, but 
[rated on password checkers](http://www.passwordmeter.com/), is exceptionally strong. [Some 
sites](https://howsecureismypassword.net/) estimate that it would take an average of tens 
of thousands, if not millions, of years to crack.

You can add more colors, fruits, and symbols, but I wanted to make sure that the 
punctuation characters would be easy to hand write when giving them to new employees and 
that each symbol would not require a US keyboard (no dollar signs, etc.).


~~~
ListOfColors:=["Red", "Green", "Blue", "Yellow", "Orange"]
ListOfFruits:=["Banana", "Mango", "Grape", "Apple", "Peach", "Melon"]
ListOfSymbols:=["{!}", "{@}", "{#}", "{%}", "{^}", "{&}", "{*}"]
return

:R*?:ppp::
Send % ListOfColors[Random(1,ListOfColors.MaxIndex())]
Send % ListOfFruits[Random(1,ListOfFruits.MaxIndex())]
Random, Random, 1, 9
Send % Random
Random, Random, 1, 9
Send % Random
Send % ListOfSymbols[Random(1,ListOfSymbols.MaxIndex())]
return

Random(a,b)
{
	Random, ReturnVal, a, b
	return ReturnVal
}
~~~
