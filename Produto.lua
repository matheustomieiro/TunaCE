Prd = {}

--Funcao que instancia um produto
--args: Nome(string), codigo(integer), fabricante(string), quantidade(integer)
--return: Produto(object)
function Prd:new(name, code, mnf, qt)
	local newObj = {}
	setmetatable(newObj,{__index=self})
	newObj.name = name or "none"
	newObj.code = code or 0
	newObj.mnf = mnf or "none"
	newObj.qt = qt or "none"
	return newObj
end

--Funcao que seta parametros de um produto
--args: Nome(string), codigo(integer), fabricante(string), quantidade(integer)
function Prd:set(name, code, mnf, qt)
	if name then self.name = name end
	if code then self.code = code end
	if mnf then self.mnf = mnf end
	if qt then self.mnt = qt end
end

--Funcao que coleta dados de um produto
--return: Nome(string), codigo(integer), fabricante(string), quantidade(integer)
function Prd:get()
	return self.name, self.code, self.mnf, self.qt
end

return Prd
