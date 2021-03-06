using Latexify
using WatchJuliaBurn

ord_keys = sort(collect(WatchJuliaBurn.func_to_emojis), by=x->string(x[1]))
function to_string(emojis)
    join([emoji isa Tuple ? string(emoji[1]) : string(emoji) for emoji in emojis], ", ")
end

function to_version(emojis)
    if any(x->x isa Tuple, emojis)
        return join([emoji isa Tuple ? string(emoji[2]) : "1" for emoji in emojis], ", ")
    else
        return ""
    end
end

ar = reduce(vcat, ['`' * string(key) * '`' to_string(emojis) to_version(emojis)]
    for (key, emojis) in ord_keys)
ar = vcat(["Function" "Emojis" "Julia Version"], ar)

md_ar = md(ar; latex=false)

code_snippet = "vcat(round(log(pi)), broadcast(tan â inv, rand(3)))"

dots = "https://raw.githubusercontent.com/JuliaLang/julia/master/doc/src/assets/julia.ico"
intro = """[![CI](https://github.com/theogf/WatchJuliaBurn.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/theogf/WatchJuliaBurn.jl/actions/workflows/CI.yml)
# â<img src="$(dots)" height="26"/>ð¥.jl

WatchJuliaBurn aims at destroying the look of your code by adding emojis like :smile: and kaomojis like câ¯Â°â¡Â°ââ¯ instead of your favorite Julia functions.
For a serious use of unicode characters see also [Ueauty.jl](https://gitlab.com/ExpandingMan/Ueauty.jl)


## Add your own awfulness!

Don't hesitate to add your worst creations via PR. All you need to do is to add the function and emoji to the `func_to_emojis` internal `Dict`. Don't touch the `README`!
It will be automatically generated after your PR is merged. Also tests are optional since tests are for losers!

## Emojify your code

You can use the `emojify` function to recursively emojify all the files in a given path. `emojify` will replace all functions for which an alias is known
by the corresponding emoji (a random one is picked every time if multiple options are possible).
For example:
```julia
$(code_snippet)
```
will return
```julia
$(WatchJuliaBurn.emojify_string(code_snippet))
```

## List of emojis

"""

outro = """
## Control Flow
You can now replace boring old try/catch/finally clauses with fancy monkey flow!
```julia
@ð begin
    ð
    	ð£()
    ð(ð¥)
    	ð¥(ð¥)
    ð
    	ð()
    end
```
Parsing may behave weird when there are infix operators around the block. Try enclosing everything with parenthesis like `@ð(begin ... end)` if that happens.

## REPL

You can use the [EmojiSymbols.jl](https://github.com/wookay/EmojiSymbols.jl) package to super-turbo-charge your REPL experience!
"""

open(joinpath(@__DIR__, "..", "README.md"), "w") do io
    write(io, intro * string(md_ar) * outro)
end
