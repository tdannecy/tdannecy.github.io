SendMode Input  ; Forces Send and SendRaw to use SendInput buffering for speed.

;Replace selected text with uppercase
f14::
	Clipboard = ; Empty the clipboard so that ClipWait has something to detect
	SendInput, ^c ;copies selected text
	ClipWait
	StringReplace, OutputText, Clipboard, `r`n, `n, All ;Fix for SendInput sending Windows linebreaks 
	StringLower, OutputText, OutputText
	SendRaw % OutputText
        VarSetCapacity(OutputText, 0) ;free memory
Return
