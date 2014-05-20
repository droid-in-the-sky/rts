CFLAGS = -D SDL_MATH
#CFLAGS = -D CEU_DEBUG -D DEBUG0
#CFLAGS = -DDEBUG -g -O0 -v -da -Q #-pg
# valgrind --error-limit=no --leak-check=full ./mtg_trader
# valgrind --tool=massif ./mtg_trader
# ms_print massif.out.19214 |less

all:
	ceu main.ceu
	gcc -Os -g main.c $(CFLAGS) -lm \
		-lSDL2 -lSDL2_image -lSDL2_ttf -lSDL2_mixer -lSDL2_gfx \
		-o war.exe

FILES = group.ceu main.ceu nest.ceu ren.ceu snd.ceu unit.ceu visible.ceu

count:
	wc $(FILES)
	cat $(FILES) | grep "^ *//" | wc
	cat $(FILES) | grep "^ */\*" | wc
	cat $(FILES) | grep "^ *\*" | wc
	#cat group.ceu main.ceu nest.ceu ren.ceu snd.ceu unit.ceu visible.ceu | grep "^$" | wc

clean:
	rm -f *.exe _ceu_

.PHONY: all clean
