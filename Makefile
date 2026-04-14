## ─────────────────────────────────────────────
##  Makefile genérico para C++  |  Arch Linux
##  Uso: make <nome_sem_extensao>
##  Ex:  make main   →  compila main.cpp → ./main
## ─────────────────────────────────────────────

CXX      := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -Wpedantic -O2

# Regra padrão: exibe ajuda se chamado sem alvo
.DEFAULT_GOAL := help

## Compila e executa qualquer arquivo .cpp pelo nome
## Ex: make hello  →  g++ hello.cpp -o hello && ./hello
%: %.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
	@echo "✔  Compilado: $@ — executando...\n"
	@./$@

## Compila com símbolos de debug (gdb/valgrind)
## Ex: make hello.debug
%.debug: %.cpp
	$(CXX) $(CXXFLAGS) -g3 -DDEBUG $< -o $@
	@echo "✔  Build debug: $@ — executando...\n"
	@./$@

## Remove binários gerados (sem extensão, sem Makefile)
clean:
	@find . -maxdepth 1 -type f ! -name "*.cpp" ! -name "*.h" \
	         ! -name "Makefile" ! -name "*.md" -delete
	@echo "✔  Diretório limpo."

## Exibe esta ajuda
help:
	@echo ""
	@echo "  Uso:"
	@echo "    make <arquivo>        Compila <arquivo>.cpp → ./<arquivo>"
	@echo "    make <arquivo>.debug  Compila com -g3 para debug"
	@echo "    make clean            Remove todos os binários gerados"
	@echo ""
	@echo "  Exemplo:"
	@echo "    make main             →  g++ main.cpp -o main"
	@echo ""

.PHONY: clean help
