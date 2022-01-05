defmodule ToDoList do
  def main do
   obterOpcao([])
  end

  def menu(opcao, atividades) when opcao == "1" do
    item = IO.gets("informe a atividade \n")
    atividades = atividades ++ [item]
    obterOpcao(atividades)
  end


  def menu(opcao, atividades) when opcao == "L" do
      atividades
      |> Enum.with_index
      |> Enum.each(fn({x, i}) -> IO.puts("#{i} - #{x}") end)
    obterOpcao(atividades)
  end

  def menu(_,_) do
    IO.puts("opção invalida, selecione outra opção!\n")
    main()
  end

  def menu(opcao, atividades) when opcao == "3" do
  IO.gets("diga o numero da atividade que deseja apagar\n")
      atividades
      |> Enum.with_index
      |> Enum.each(fn({x, i}) -> IO.puts("#{i} - #{x}") end)
      #atividades = 
  end 

  def obterOpcao(atividades) do
    IO.puts("1 - inserir atividade")
    IO.puts("2 - concluir atividade")
    IO.puts("3 - apagar atividade")
    IO.puts("L - listar atividades")
    opcao = String.upcase(String.trim(IO.gets("Selecione uma opção: \n")))
    menu(opcao, atividades)
  end

end
ToDoList.main()