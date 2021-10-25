#!/bin/bash

# ps -e -o pid --sort -size => lista os processos retornando somentre o
##  PID en ordem decrescente de qual esta gastando mais memoria

#date +%F => retorna a data completa

#date +%F,%H:%M:%S => retorna a data completa com horas, minutos e segundos

memory_processes() {
    processes=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

    for pid in $processes; do
        nome_processo=$(ps -p $pid -o comm=)
        echo -n $(date +%F,%H:%M:%S,) >>log/$nome_processo.log

        # -n => faz com que não ocorra uma quebra de linha
        tamanho_processo=$(ps -p $pid -o size | grep [0-9])

        #bc => serve para operações aritméticas
        echo " $(bc <<<"scale=2;$tamanho_processo/1024") MB" >>log/$nome_processo.log
    done
}

memory_processes
if [ $? -eq 0 ]; then
    echo "Os arquivos foram salvos com sucesso"
else
    echo "Houve um problema na hora de salvar os arquivos"
fi
