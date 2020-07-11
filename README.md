# TabularDisplay

[![Build Status](https://travis-ci.org/tk3369/TabularDisplay.jl.svg?branch=master)](https://travis-ci.org/tk3369/TabularDisplay.jl) [![Coverage Status](https://coveralls.io/repos/tk3369/TabularDisplay.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/tk3369/TabularDisplay.jl?branch=master) [![codecov.io](http://codecov.io/github/tk3369/TabularDisplay.jl/coverage.svg?branch=master)](http://codecov.io/github/tk3369/TabularDisplay.jl?branch=master)
![Project Status](https://img.shields.io/badge/status-mature-green)

Display a vector of things in a tabular format.  

## Keyword arguments
- padding: minimum number of spaces between column data. Default value is 2.
- index: prepend cell values with indices. Default value is `false`.
- indexsep: string that separate index and cell values.  Default value is `:`.
- align: either `:left` or `:right`.  Default value is `:left`.
- orientation: either `:column` or `:row`.  Default value is `:column`.
- formatter: custom formatter that takes a value and returns a string.  Default value is `string` function.
- displaywidth: custom display width.  Default value is 0, for which the system will use the terminal's size.

## Examples

Assuming a 80-column terminal screen:

```julia
1---------2---------3---------4---------5---------6---------7---------8---------
julia> displaytable(stdout, [string("randomstr", i) for i in 1:16])
randomstr1   randomstr4   randomstr7   randomstr10  randomstr13  randomstr16  
randomstr2   randomstr5   randomstr8   randomstr11  randomstr14               
randomstr3   randomstr6   randomstr9   randomstr12  randomstr15               

julia> using Formatting

julia> foo = generate_formatter("%7.5f")
(::#5) (generic function with 1 method)

julia> displaytable(stdout, rand(35); padding=5, align=:right, formatter=foo, index=true, indexsep=" -> ")
      1 -> 0.08425     10 -> 0.51280     19 -> 0.71986     28 -> 0.50921
      2 -> 0.22630     11 -> 0.83040     20 -> 0.95942     29 -> 0.78327
      3 -> 0.99681     12 -> 0.17092     21 -> 0.80820     30 -> 0.34046
      4 -> 0.17840     13 -> 0.53777     22 -> 0.24029     31 -> 0.87364
      5 -> 0.20914     14 -> 0.25836     23 -> 0.14779     32 -> 0.06027
      6 -> 0.37565     15 -> 0.30872     24 -> 0.27250     33 -> 0.15860
      7 -> 0.79610     16 -> 0.52003     25 -> 0.86022     34 -> 0.27416
      8 -> 0.66101     17 -> 0.64725     26 -> 0.46590     35 -> 0.46035
      9 -> 0.61129     18 -> 0.64148     27 -> 0.65477                  
```
