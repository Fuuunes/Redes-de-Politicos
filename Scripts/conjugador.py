import sys

def conjugar(verbo):
    lexema = verbo[:-2]
    morfemas = open('morfemas.txt', 'r')

    for morfema in morfemas:
        print(lexema + morfema),

    morfemas.close

for argumento in sys.argv[1:]:
    conjugar(argumento)
