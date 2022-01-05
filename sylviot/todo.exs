defmodule ToDo do
    @empty %{}

    def new, do: @empty

    def show(itens) do
        Enum.each(itens, fn {id, value} -> IO.puts("[#{id}] #{value.description} (#{value.status})") end)
    end

    def add(itens, description) when itens == %{} do
        id = 1
        Map.put(itens, id, %{description: description, status: New})
    end

    def add(itens, description) do
        # ToDo - ponto de melhoria... ficou complexo essa parte.
        ids = Map.keys(itens)
        id = List.last(ids) + 1
        Map.put(itens, id, %{description: description, status: New})
    end

    def delete(itens, id) do
        key = String.to_atom(id)

        if Map.has_key?(itens, key) do
            Map.delete(itens, key)
        else
            IO.puts("Id não encontrado")
            itens
        end
    end

    def change_status(itens, id, new_status) do
        key = String.to_atom(id)

        if Map.has_key?(itens, key) do
            Map.update(itens, key, nil, fn item -> change_status(item, new_status) end)
        else
            IO.puts("Id não encontrado")
        end
    end

    defp change_status(item, new_status) do
        Map.update(item, :status, Unknow, fn status -> new_status end)
    end
end

ExUnit.start()

defmodule ToDoTest do
    use ExUnit.Case, async: true
    require ToDo
    import ExUnit.CaptureIO

    test "new" do
        expected = %{}

        result = ToDo.new

        assert expected === result
    end

    test "add when ToDo itens empty" do
        expected = %{1 => %{description: "Test add", status: New}}

        result = ToDo.add(%{}, "Test add")

        assert expected === result
    end

    test "add when ToDo itens has value" do
        expected = %{
            1 => %{description: "Test add", status: New},
            2 => %{description: "Test add more one item", status: New},
            3 => %{description: "Teste add third item", status: New}
        }

        itens =  %{
            1 => %{description: "Test add", status: New},
            2 => %{description: "Test add more one item", status: New}
        }

        result = ToDo.add(itens, "Teste add third item")

        assert expected == result
    end

    test " add when ToDo itens has value" do

    end

    test "delete" do
        expected = %{}

        itens = %{"1": %{description: "Test add", status: New}}
        result = ToDo.delete(itens, "1")

        assert expected == result
    end

    test "change_status" do
        expected = %{"1": %{description: "Test change status", status: Done}}

        itens = %{"1": %{description: "Test change status", status: New}}
        result = ToDo.change_status(itens, "1", Done)

        assert expected === result
    end

    test "show" do
        expected = "[1] Test add (Elixir.New)\n"

        itens = %{
            "1": %{description: "Test add", status: New}
        }

        # Função anonima sem argumento
        execute_show = fn ->
            ToDo.show(itens)
        end

        assert capture_io(execute_show) =~ expected
    end
end
