PrdClass = require "Produto"
Tpr = {}

--Funcao que instancia um conjunto de produtos
--return: Conjunto de produtos(object)
function Tpr:new()
	local newObj = {}
	setmetatable(newObj,{__index = self})
	newObj.count = 0
	return newObj
end

--Funcao que busca um produto em um conjunto
--args: Nome(string)
--return: Conjunto de Produtos(object)
function Tpr:search(name)
	local found = self:new()
	for _, n in ipairs(self) do
		if n.name == name then
			table.insert(found,n)
		end
	end
	return found
end

--Funcao que instancia um conjunto de produtos
--args: Nome(string), codigo(integer), fabricante(string), data_de_dispacho()
--return: verdadeiro(true) se adicionado; falso(false) se duplicado
function Tpr:add(name, code, mnf, dto)
	for _,n in ipairs(self:search(name)) do
		if(n.code == code) then
			return false
		end
	end
	self.count = self.count + 1
	table.insert(self,self.count,PrdClass:new())
	table.unpack(self,self.count):set(name, code, mnf, dto)
	return true
end

--Funcao que remove um produto de um conjunto
--args: codigo(integer)
function Tpr:remove(code)
	for i, n in ipairs(self) do
		if n.code == code then
			table.remove(self,i)
		end
	end
end


return Tpr