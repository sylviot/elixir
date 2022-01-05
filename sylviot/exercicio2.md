# Exercicio 2

## Module attributes
``` elixir
defmodule Math do
    @moduledoc """
        Algumas funções de matematica.

        ## Exemplo

        iex> Math.sum(1, 1)
        2
    """
    use ExUnit.Case, async true

    Module.register_attribute(__MODULE__, :os, accumulate: true)

    @euler 0.57721
    @pi 3.14159265
    @os 1
    @os 2
    @os 3

    def euler, do: @euler
    def pi, do: @pi
    def param, do: @param

    @doc """
        Calculando a soma de dois numeros.
    """
    def sum(a, b) do
        a + b
    end

    test "test sum" do
        true
    end
end
```


### Usando teste com ExUnit
``` elixir
ExUnit.start()

defmodule Math do
    def sum(a, b) do
        a + b
    end
end

defmodule MathTest do
    # alias Math, as: Matematica
    # import Math
    # import Math, only: [sum: 2]
    # require Math
    
    use ExUnit.Case, async: true
    # require Math

    test "sum" do
        expected = 2

        result = Math.sum(1, 1)

        assert expected == result
    end
end
```
