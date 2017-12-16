ListOfColors:=["Red", "Green", "Blue", "Yellow", "Orange"]
ListOfFruits:=["Banana", "Mango", "Grape", "Apple", "Peach", "Melon"]
ListOfSymbols:=["{!}", "{@}", "{#}", "{%}", "{^}", "{&}", "{*}"]
return

:R*?:ppp:: 
Send % ListOfColors[Random(1,ListOfColors.MaxIndex())]
;Sleep 100
Send % ListOfFruits[Random(1,ListOfFruits.MaxIndex())]
;Sleep 100
Random, Random, 1, 9
Send % Random
;Sleep 100
Random, Random, 1, 9
Send % Random
;Sleep 100
Send % ListOfSymbols[Random(1,ListOfSymbols.MaxIndex())]
return

Random(a,b)
{
Random, ReturnVal, a, b
return ReturnVal
}