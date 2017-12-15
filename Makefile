#MAKEFILE OF BATTLESHIP-TCF

#DEFINIZIONE DEL COMPILATORE
JC = javac
#OPZIONI DEL COMPILATORE
#JFLAGS = 
#IDENTIFICA TUTTI I FILE DA CUI IL PROGRAMMA DIPENDE
OBJECTS = Point.class Object.class Character.class Obstacle.class Player.class Game.class
#IDENTIFICA IL NUMERO DI JOBS PER MAKE
#(NON UTILIZZARE PIÙ DEL NUMERO DI CORES DISPONIBILI)
CPUCORES = 1

all:
	$(MAKE) -j $(CPUCORES) running-tcf

#ISTRUZIONI PER L'ESEGUIBILE
running-tcf: $(OBJECTS)
	jar -cvf $@.jar ./endlessrunningtcf/*.class

#ISTRUZIONI PER COMPILARE LE VARIE CLASSI
%.class: %.java
	 $(JC) -d ./ -cp ./ $^
	 
#ISTRUZIONI PER ELIMINARE I FILE *.class
clean: 
	 @echo -e "\033[1;34m"RIMOZIONE DEI BINARI IN CORSO..." \033[0m"
	 $(RM) -r ./endlessrunningtcf
	 @echo -e "\033[1;34m"RIMOZIONE TERMINATA" \033[0m"

#ISTRUZIONI PER LANCIARE IL PROGRAMMA
run:
	java -cp running-tcf.jar endlessrunningtcf.Game