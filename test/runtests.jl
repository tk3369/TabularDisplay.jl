using TabularDisplay
using Base.Test

io = IOBuffer()
displaytable(io, [string("randomstr", i) for i in 1:10]; displaywidth=50)
@test String(take!(io)) == 
    "randomstr1   randomstr5   randomstr9   \n" * 
    "randomstr2   randomstr6   randomstr10  \n" *
    "randomstr3   randomstr7                \n" *
    "randomstr4   randomstr8                "
