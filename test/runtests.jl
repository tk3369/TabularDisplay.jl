using TabularDisplay
using Test

io = IOBuffer()

@testset "everything" begin

    displaytable(io, [string("randomstr", i) for i in 1:10]; 
        displaywidth=50)
    @test String(take!(io)) == 
        "randomstr1   randomstr5   randomstr9   \n" * 
        "randomstr2   randomstr6   randomstr10  \n" *
        "randomstr3   randomstr7                \n" *
        "randomstr4   randomstr8                "

    displaytable(io, [string("randomstr", i) for i in 1:10]; 
        displaywidth=50, orientation=:row)
    @test String(take!(io)) == 
        "randomstr1   randomstr2   randomstr3   \n" * 
        "randomstr4   randomstr5   randomstr6   \n" * 
        "randomstr7   randomstr8   randomstr9   \n" * 
        "randomstr10                            "

    displaytable(io, [string("randomstr", i) for i in 1:10]; 
        displaywidth=50, orientation=:row, index=true)
    @test String(take!(io)) == 
    "1:randomstr1    2:randomstr2    3:randomstr3    \n" * 
    "4:randomstr4    5:randomstr5    6:randomstr6    \n" * 
    "7:randomstr7    8:randomstr8    9:randomstr9    \n" * 
    "10:randomstr10                                  "

end
