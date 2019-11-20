Imb = {}

--Funcao que instancia um imobilizado
--args: Nome(string), codigo(integer), fabricante(string), data_de_dispacho()
--return: Imobilizado(object)
function Imb:new(name, code, mnf, dd)
	local newObj = {}
	setmetatable(newObj,{__index=self})
	newObj.name = name or "none"
	newObj.code = code or 0
	newObj.mnf = mnf or "none"
	newObj.dto = dd or "none"
	return newObj
end

--Funcao que seta parametros de um imobilizado
--args: Nome(string), codigo(integer), fabricante(string), data_de_dispacho()
function Imb:set(name, code, mnf, dd)
	if name then self.name = name end
	if code then self.code = code end
	if mnf then self.mnf = mnf end
	if dd then self.mnt = dd end
end

--Funcao que coleta dados de um imobilizado
--return: Nome(string), codigo(integer), fabricante(string), data_de_dispacho()
function Imb:get()
	return self.name, self.code, self.mnf, self.mnt
end

return Imb
