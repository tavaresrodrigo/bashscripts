#!/bin/bash
 echo "Informe o seu servidor proxy http, default [localhost]"
 read  HTTPPROXY
        if [ "$HTTPPROXY" = "" ];then
        HTTPPROXY="localhost"
        else
             echo "Servidor proxy configurado = $HTTPPROXY"
        fi
 echo "Informe a porta do servidor proxy, default [3128]"
 read  PORTPROXY
        if [ "$PORTPROXY" = "" ];then
        PORTPROXY="3128"
        else
             echo "Porta configurada = $PORTPROXY"
        fi
 echo "Proxy transparente ? (Sem usuario e senha) [Sim]?"
 read TRANSPARENT
        if [[ "$TRANSPARENT" = "N" ]] || [[ "$TRANSPARENT" = "No" ]] || [[ "$TRANSPARENT" = "Não" ]] || [[ "$TRANSPARENT" = "Nao" ]];then
            echo  "Informe sua Chave ou usuario:"
            read  CHAVE
            echo  "Informe sua Senha:"
            read -s SENHA
            export http_proxy="http://$CHAVE:$SENHA@$HTTPPROXY:$PORTPROXY"
            export https_proxy="https://$CHAVE:$SENHA@$HTTPPROXY:$PORTPROXY"
       else
            echo "O proxy sera configurado de maneira transparente"
            export http_proxy="http://$HTTPPROXY:$PORTPROXY"
            export https_proxy="https://$HTTPPROXY:$PORTPROXY"
       fi
echo -e "---------PROXY CONFIGURADO COM SUCESSO---------\n"
echo -e "A configuracao vale apenas para sessao atual, caso usuario inicie uma nova sessao, sera necessario configurar o proxy novamente.\n"
echo -e "Para reconfigurar execute o comando source configuraproxy em seu terminal.\n"
