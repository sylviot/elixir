# Exercicio 01
 
## Basic types
|||
|:-|-|
| 1         | **integer** |
| 0xFF      | **integer (hexa)** |
| 0b1010    | **binary** |
| 1.0e-10   | **e scientific ^exp** |
| 1.0       | **float** |
| true      | **boolean** |
| :atom     | **atom / symbol** |
| "string"  | **string** |
| [1, 2, 3] | **list** |
| {1, 2, 4} | **tuple** |

 Diferença entre **List** e **Tuple**?
 A lista é armazenada em memória como uma lista ligada.

 A <-> B <-> C

 **Item A**
 Next B
 Previous null

 **Item B**
 Next C
 Previous A

 **Item C**
 Next null
 Previous B


 
## Basic operators

|||
|-|-|
|+| adição |
|-| subtração |
|*| mutiplicação |
|/| divisão |
|||
|++| concatenar na lista|
|--| subtrair na lista |
|||
|<>| concatenar string |
|||
|\|\| or| or condição|
|&& and| and condição|
|== ===| condição igualdade |
|!= !==| condição diferença |
|! not| negação|
|<| menor que |
|>| maior que |
|<=| menor igual |
|>=| maior igual |

## Pattern Matching and case, cond, and if

{a, b, c} = {1, 2, 3} # correto
{a, 5, c} = {1, 2, 3} # errado

``` elixir
case {1, 2, 3} do
    {9, 9, 9} -> "Número mágico"
    {1, x, 3} -> "Condicão de 1 x 3"
    _ -> "Condição padrão"
end
```

``` elixir
cond do
    2 + 2 == 5 -> "Tá serto!"
    2 * 2 == 6 -> "Tá çerto!"
    1 + 1 == 2 -> "Acertou!"
end
```

``` elixir
if true do
    "Condição verdadeira"
else
    "Condição falsa"
end

# Se não
unless false do
    "Quando for falso"
end
```

## Modules and functions

``` elixir
defmodule Math do
    # Public function
    def sum(a, b) do
        IO.puts("Sum #{a} and #{b}")
        a + b
    end

    # Private function
    defp solve(x) do
        x
    end

    def zero?(0) do
        true
    end

    def zero?(x) when is_integer(x) do
        false
    end
end
```