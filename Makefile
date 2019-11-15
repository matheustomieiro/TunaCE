##Installing Lua
i_command := -
ifeq (Ubuntu,$(uname))
  i_command = sudo apt install lua5.2
else
  i_command = brew install lua
endif

lua:
	$(i_command)
##End installation

##Run commands
ifeq (,$ (command -v lua))
   	run:
		@printf "O interpretador lua nao esta instalado!\n"
		@printf "Rode <make lua> para instalar\n"
else
   	run:
	   @lua Tuna.lua
endif