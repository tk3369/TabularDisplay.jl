module TabularDisplay

using Formatting

export displaytable

"""
    displaytable([io::IO], v::AbstractVector{T}; kwargs...)

Display a vector of things in a compact tabular format.
The `io` argument is defaulted to `stdout`.

# Keyword arguments
- padding: minimum number of spaces between column data. Default value is 2.
- index: prepend cell values with indices. Default value is `false`.
- indexsep: string that separate index and cell values.  Default value is `:`.
- align: either `:left` or `:right`.  Default value is `:left`.
- orientation: either `:column` or `:row`.  Default value is `:column`.
- formatter: custom formatter that takes a value and returns a string.  Default value is `string` function.
- displaywidth: custom display width.  Default value is 0, for which the system will use the terminal's size.

# Examples
```
displaytable([string("randomstr", i) for i in 1:56])

using Formatting
foo = generate_formatter("%7.5f")
displaytable(rand(100); padding=5, align=:right, formatter=foo, index=true, indexsep=" -> ")
```
"""
function displaytable end

function displaytable(v::AbstractVector{T}; kwargs...) where T
    return displaytable(stdout, v; kwargs...)
end

function displaytable(io::IO, v::Vector{T};
            padding = 2,
            index = false,
            indexsep = ":",
            align = :left,
            orientation = :column,
            formatter = string,
            displaywidth = 0,
        ) where T

    # convert vector to strings and prepend with index if needed
    ar = formatter.(v)
    if index
        ar = prependindex(ar, indexsep)
    end

    # Calculate number of rows and columns required
    rowwidth = displaywidth > 0 ? displaywidth : displaysize(io)[2]
    #rowwidth -= 1    # at least one space from right margin
    cellwidth = maximum(length.(ar)) + padding
    rowwidth < cellwidth && error("The value for displaywidth is too small. Please specify a value larger than $cellwidth.")
    columns = div(rowwidth, cellwidth)
    rows = ceil(Int, length(ar) / columns)

    # Generate cell and row format string
    cellfmt = string("{:", align == :left ? "<" : ">", string(cellwidth), "s}")
    rowfmt = repeat(cellfmt, columns)

    # Copy the array and append it with blanks for remaining cells
    # This is done to make the loop below easier
    emptyslots = rows * columns - length(ar)
    ar = vcat(ar, ["" for _ in 1:emptyslots])

    # print each row with stride
    for i in 1:rows
        i > 1 && println(io)
        if orientation == :column
            printfmt(io, rowfmt, ar[i:rows:length(ar)]...)
        else
            startidx = (i - 1) * columns + 1
            endidx = startidx + columns - 1
            printfmt(io, rowfmt, ar[startidx:endidx]...)
        end
    end
end

function prependindex(v::AbstractVector{T}, sep::String) where T
    [string(i, sep, v[i]) for i in 1:length(v)]
end

end # module
