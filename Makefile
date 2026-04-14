## ─────────────────────────────────────────────
##  Makefile genérico para C  
##  Uso: make <nome_sem_extensao>
##  Ex:  make main   →  compila main.c → ./main
## ─────────────────────────────────────────────

CC     := gcc
CFLAGS := -std=c11 -Wall -Wextra -Wpedantic -O2

# Regra padrão: exibe ajuda se chamado sem alvo
.DEFAULT_GOAL := help

## Compila e executa qualquer arquivo .c pelo nome
## Ex: make hello  →  gcc hello.c -o hello && ./hello
%: %.c
	$(CC) $(CFLAGS) $< -o $@
	@echo "✔  Compilado: $@ — executando...\n"
	@./$@

## Compila com símbolos de debug (gdb/valgrind)
## Ex: make hello.debug
%.debug: %.c
	$(CC) $(CFLAGS) -g3 -DDEBUG $< -o $@
	@echo "✔  Build debug: $@ — executando...\n"
	@./$@

## Remove binários gerados
clean:
	@find . -maxdepth 1 -type f ! -name "*.c" ! -name "*.h" \
	         ! -name "Makefile" ! -name "*.md" -delete
	@echo "✔  Diretório limpo."

## Exibe esta ajuda
help:
	@echo ""
	@echo "  Uso:"
	@echo "    make <arquivo>        Compila e executa <arquivo>.c"
	@echo "    make <arquivo>.debug  Compila com -g3 para debug"
	@echo "    make clean            Remove todos os binários gerados"
	@echo ""
	@echo "  Exemplo:"
	@echo "    make main             →  gcc main.c -o main && ./main"
	@echo ""

.PHONY: clean help
