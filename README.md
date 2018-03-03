# TabularDisplay

[![Build Status](https://travis-ci.org/tk3369/TabularDisplay.jl.svg?branch=master)](https://travis-ci.org/tk3369/TabularDisplay.jl)

[![Coverage Status](https://coveralls.io/repos/tk3369/TabularDisplay.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/tk3369/TabularDisplay.jl?branch=master)

[![codecov.io](http://codecov.io/github/tk3369/TabularDisplay.jl/coverage.svg?branch=master)](http://codecov.io/github/tk3369/TabularDisplay.jl?branch=master)

Display a vector of things in a tabular format.  

*Keyword arguments*
- padding: minimum number of spaces between column data. Default value is 2.
- index: prepend cell values with indices. Default value is `false`.
- indexsep: string that separate index and cell values.  Default value is `:`.
- align: either `:left` or `:right`.  Default value is `:left`.
- orientation: either `:column` or `:row`.  Default value is `:column`.
- formatter: custom formatter that takes a value and returns a string.  Default value is `string` function.
- displaywidth: custom display width.  Default value is 0, for which the system will use the terminal's size.

*Examples*
```
displaytable(STDOUT, [string("randomstr", i) for i in 1:56])

using Formatting
foo = generate_formatter("%7.5f")
displaytable(STDOUT, rand(100); padding=5, align=:right, formatter=foo, index=true, indexsep=" -> ")
```