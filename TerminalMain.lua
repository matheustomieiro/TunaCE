function Le_dados(string, rtype)
    io.write(string)
    return io.read(rtype or "*l")
end


Tpr = require "TabelaProdutos"

function Main()
    local op; local estoque = Tpr:new(); local nome;
    local codigo; local fabricante; local quantidade;
    repeat
        io.write(
            "\t\tMENU DE OPCOES\n"..
            "1 - Adicionar um produto\n"..
            "2 - Remover um produto\n"..
            "3 - Procurar um produto\n"..
            "0 - Sair do programa\n\n"..
            "Escolha uma opcao: "
        )
        op = io.read("*number")
        if  op == 1 then
            io.read()
            nome = Le_dados("Digite o nome do produto: ")
            codigo = Le_dados("Digite o codigo do produto: ","*number")
            io.read()
            fabricante = Le_dados("Digite o nome do fabricante: ")
            quantidade = Le_dados("Digite a quantidade: ", "*number")
            print(quantidade)
            estoque:add(nome,codigo,fabricante,quantidade)
        elseif op == 2 then
            print("Olosko")
        elseif op == 3 then
            io.read()
            local name2 = io.read()
            local lista = estoque:search(name2)
            if lista then
                io.write("\tNome\tCodigo\tFab.\tQuant.\n")
                for i,n in ipairs(lista) do
                    io.write(i .. "º: ")
                    print(n:get())
                    print("\n")
                end
            end
        end
    until op == 0
end

Main()