ImbClass = require "Imobilizado"
Tim = {}

--Funcao que instancia um conjunto de imobilizados
--return: Conjunto de imobilizados(object)
function Tim:new()
	local newObj = {}
	setmetatable(newObj,{__index = self})
	newObj.count = 0
	return newObj
end

--Funcao que busca um imobilizado em um conjunto
--args: Nome(string)
--return: Conjunto de Imobilizados(object)
function Tim:search(name)
	local found = self:new()
	for _, n in ipairs(self) do
		if n.name == name then
			table.insert(found,n)
		end
	end
	return found
end

--Funcao que instancia um conjunto de imobilizados
--args: Nome(string), codigo(integer), fabricante(string), data_de_dispacho()
--return: verdadeiro(true) se adicionado; falso(false) se duplicado
function Tim:add(name, code, mnf, dto)
	for _,n in ipairs(self:search(name)) do
		if(n.code == code) then
			return false
		end
	end
	self.count = self.count + 1
	table.insert(self,self.count,ImbClass:new())
	table.unpack(self,self.count):set(name, code, mnf, dto)
	return true
end

--Funcao que remove um imobilizado de um conjunto
--args: codigo(integer)
function Tim:remove(code)
	for i, n in ipairs(self) do
		if n.code == code then
			table.remove(self,i)
		end
	end
end


return Tim