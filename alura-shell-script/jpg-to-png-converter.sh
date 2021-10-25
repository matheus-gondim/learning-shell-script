#!/bin/bash

converte_imagem() {
    cd ~/Downloads/imagens-livros
    if [ -d png ]; then
        mkdir png
    fi

    for imagem in *.jpg; do
        # local => serve para definir um escopo local pra variavel
        local imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }')
        convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
    done
}

converte_imagem 2>erros.txt
# $? => Exibe o estado do ultimo comando executado, 0 ou 1
# -eq => é igual, mas tal expressão é utilizada para comparar valores inteiros e não strings

if [$? -eq 0]; then
    echo "Conversão realizada com sucesso"
else
    echo "Houve uma falha no processo"
fi

# Esses fluxos padrões são referenciados por números.
# 0 é referenciado para entrada padrão
# 1 é referenciado para saída padrão
# 2 é referenciado para mensagens de erro
