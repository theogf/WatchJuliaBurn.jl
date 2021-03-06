[![CI](https://github.com/theogf/WatchJuliaBurn.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/theogf/WatchJuliaBurn.jl/actions/workflows/CI.yml)
# โ<img src="https://raw.githubusercontent.com/JuliaLang/julia/master/doc/src/assets/julia.ico" height="26"/>๐ฅ.jl

WatchJuliaBurn aims at destroying the look of your code by adding emojis like :smile: and kaomojis like cโฏยฐโกยฐโโฏ instead of your favorite Julia functions.
For a serious use of unicode characters see also [Ueauty.jl](https://gitlab.com/ExpandingMan/Ueauty.jl)


## Add your own awfulness!

Don't hesitate to add your worst creations via PR. All you need to do is to add the function and emoji to the `func_to_emojis` internal `Dict`. Don't touch the `README`!
It will be automatically generated after your PR is merged. Also tests are optional since tests are for losers!

## Emojify your code

You can use the `emojify` function to recursively emojify all the files in a given path. `emojify` will replace all functions for which an alias is known
by the corresponding emoji (a random one is picked every time if multiple options are possible).
For example:
```julia
vcat(round(log(pi)), broadcast(tan โ inv, rand(3)))
```
will return
```julia
โฌ๏ธ๐น(๐ (๐ชต(๐ฅง)), ๐ก(๐ง๐ปโก๏ธ๐ง๐ฝ โ โ, ๐ฐ(3)))
```

## List of emojis

|        Function |         Emojis | Julia Version |
| ---------------:| --------------:| -------------:|
| `ArgumentError` |             ๐ฌ๐จ |               |
|          `Dict` |              ๐ |               |
|        `Matrix` |              ๐ข |               |
|       `Threads` |              ๐งต |               |
|           `abs` |         ๐๐ช, ๐ฝ๐ช |               |
|          `axes` |             ๐ช๐ช |           1.2 |
|     `broadcast` |              ๐ก |               |
|           `cat` |        ๐ป, ๐น, ๐ |               |
|            `cd` |              ๐ฟ |               |
|          `chop` |             ๐ณ๐ช |           1.2 |
|         `clamp` |             ๐๏ธ |               |
|       `collect` |              ๐งบ |               |
|           `cot` |           ๐งฅ, ๐ฅผ |               |
|         `count` |              ๐งฎ |               |
|    `count_ones` |        ๐งฎ1๏ธโฃ1๏ธโฃ |               |
|   `count_zeros` |        ๐งฎ0๏ธโฃ0๏ธโฃ |               |
|       `delete!` |              ๐ฅ |               |
|      `download` |              ๐ฅ |               |
|         `error` |              ๐ฃ |               |
|          `exit` |              ๐ช |               |
|         `false` |              ๐ |               |
|          `fill` |              ๐ฐ |               |
|       `findall` |             ๐ต๏ธ |               |
|     `findfirst` |             ๐๐ฅ |               |
|      `findnext` |             ๐โญ |               |
|         `first` |              ๐ฅ |               |
|         `float` |             โต๏ธ |               |
|         `foldr` |           ๐, ๐ |               |
|          `hcat` |  โก๏ธ๐ป, โก๏ธ๐น, โก๏ธ๐ |               |
|          `imag` |              ๐ฎ |               |
|           `inv` |              โ |               |
|        `isreal` |             ๐ธโ |               |
|          `join` |             ๐ช๐ถ |               |
|          `keys` |           ๐, ๐ |               |
|          `kill` |             โฐ๏ธ |               |
|           `log` |              ๐ชต |           1.5 |
|           `map` |              ๐บ |               |
|           `mod` |             ๐ต๐ง |               |
|       `nothing` |              โฌ |               |
|          `peek` |             โฐ๏ธ |           1.5 |
|            `pi` |           ๐ฅง, ๐ฐ |               |
|          `pop!` |          ๐พ, ๐น๐ |               |
|         `print` |             ๐จ๏ธ |               |
|          `rand` |           ๐ฐ, ๐ฒ |               |
|           `raw` |              ๐ฅฉ |               |
|         `round` |           ๐ , ๐ต |               |
|           `run` |              ๐ |               |
|          `show` |             โ๏ธ |               |
|          `sign` |           ๐ชง, ๐ |      1.5, 1.5 |
|         `sleep` |           ๐ด, ๐ค |               |
|        `string` |              ๐ป |               |
|           `tan` | ๐ง๐ปโก๏ธ๐ง๐ฝ, ๐ฉ๐ปโก๏ธ๐ฉ๐ฝ |               |
|         `throw` |  cโฏยฐโกยฐโโฏ, ๐คฎ, ๐ฎ |               |
|          `time` |      โฑ๏ธ, โ, โฒ๏ธ |               |
|          `true` |        โ, ๐, ๐ |               |
|          `vcat` |  โฌ๏ธ๐ป, โฌ๏ธ๐น, โฌ๏ธ๐ |               |
|          `view` |          ๐, ๐๏ธ |               |
|         `write` |     ๐๏ธ, โ๏ธ, ๐๏ธ |               |
|           `zip` |              ๐ค |               |
## Control Flow
You can now replace boring old try/catch/finally clauses with fancy monkey flow!
```julia
@๐ begin
    ๐
    	๐ฃ()
    ๐(๐ฅ)
    	๐ฅ(๐ฅ)
    ๐
    	๐()
    end
```
Parsing may behave weird when there are infix operators around the block. Try enclosing everything with parenthesis like `@๐(begin ... end)` if that happens.

## REPL

You can use the [EmojiSymbols.jl](https://github.com/wookay/EmojiSymbols.jl) package to super-turbo-charge your REPL experience!
