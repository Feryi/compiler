FROM gcc:9.2

# Copia todos los archivos al contenedor
COPY . /DockerWorld
WORKDIR /DockerWorld/

# Instala las dependencias necesarias
RUN apt-get update && apt-get install -y bison flex

# Compila el código
RUN lex cali.l
RUN yacc -y -d cali.y
RUN gcc -o a.out y.tab.c lex.yy.c

# Ejecuta el archivo generado con el archivo de entrada
CMD ["./a.out", "test.txt"]

