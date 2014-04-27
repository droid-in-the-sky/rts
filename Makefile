#CFLAGS = -D CEU_DEBUG -D DEBUG0
#CFLAGS = -DDEBUG -g -O0 -v -da -Q #-pg
# valgrind --error-limit=no --leak-check=full ./mtg_trader
# valgrind --tool=massif ./mtg_trader
# ms_print massif.out.19214 |less

all:
	ceu main.ceu
	gcc -Os main.c $(CFLAGS) -lm \
		-lSDL2 -lSDL2_image -lSDL2_ttf -lSDL2_mixer -lSDL2_gfx \
		-o war.exe

clean:
	rm -f *.exe _ceu_

.PHONY: all clean
