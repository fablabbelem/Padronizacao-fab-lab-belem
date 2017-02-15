#!/bin/bash

clear
while true; do
echo "==========================================================
        Digite o número do componente a ser instalado:
        1 - Instalar Pacotes do bCNC
        2 - Instalar Kicad
        3 - Instalar Sublime Text
        4 - Instalar Inkscape
	5 - Instalar LibreOffice
	6 - Instalar Repetier Host 1.6.2
	T - Instala todos os pacotes listados acima

        0 - Sair
==========================================================="
echo -n "->OPÇÃO:  "

read opcao

#verificar se foi digitada uma opcao
if [ -z $opcao ]; then
    echo "ERRO: digite uma opcao"
    exit
fi

case $opcao in

    1)
echo "VERIFICANDO SE HÁ ATUALIZAÇÕES"
        sudo apt-get update
	clear
echo "INSTALANDO POSSIVEIS ATUALIZAÇÕES"
	sudo apt-get upgrade -y
	clear
echo "INSTALANDO DEPENDENCIAS"
	sudo apt-get install python-pip -y
	sudo pip install pyserial --upgrade
	sudo apt-get install python python-tk idle python-pmw python-imaging
	sudo apt-get install  git -y
echo "COPIANDO PASTA DO GIT"
	git clone https://github.com/vlachoudis/bCNC.git;;


    2)
echo "ADICIONANDO REPOSITORIO AO LINUX"
        sudo add-apt-repository --yes ppa:js-reynaud/kicad-4 -y
	sudo apt-get update
echo "INSTALANDO KICAD"
	sudo apt-get install kicad -y;;


    3)
echo "ADICIONANDO REPOSITORIO AO LINUX"
	sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
echo "VERIFICANDO SE HÁ ATUALIZAÇÕES"
    sudo apt-get update
	clear
echo "INSTALANDO POSSIVEIS ATUALIZAÇÕES"
   	sudo apt-get upgrade -y
	clear
echo "INSTALANDO SUBLIME TEXT"
  	sudo apt-get install sublime-text-installer;;
  	clear


    4)
echo "VERIFICANDO SE HÁ ATUALIZAÇÕES"
    sudo apt-get update
	clear
echo "INSTALANDO POSSIVEIS ATUALIZAÇÕES"
	sudo apt-get upgrade -y
	clear

echo "INSTALANDO Inkscape"
	sudo apt-get install inkscape -y;;      

    5)
echo "ADICIONANDO REPOSITORIO AO LINUX"
	sudo add-apt-repository -y ppa:libreoffice/ppa
echo "VERIFICANDO SE HÁ ATUALIZAÇÕES"
        sudo apt-get update
	clear
echo "INSTALANDO LibreOffice"
	sudo apt-get install libreoffice libreoffice-style-breeze;;
	
	6)
echo "VERIFICANDO SE HÁ ATUALIZAÇÕES"
    sudo apt-get update
	clear
echo "INSTALANDO POSSIVEIS ATUALIZAÇÕES"
	sudo apt-get upgrade -y
	clear

echo "BAIXANDO Repetier Host"
	wget -c http://download.repetier.com/files/host/linux/repetierHostLinux_1_6_2.tgz
	clear

echo "Descompactando Arquivo e Instalando"
	tar -xzf repetierHostLinux_1_6_2.tgz
	cd RepetierHost
	bash configureFirst.sh
	clear


    T)
echo "Iniciando Instalação de todos os pacotes"

#Verificando Atualizações do Sistema
echo "VERIFICANDO SE HÁ ATUALIZAÇÕES"
    sudo apt-get update
	clear
echo "INSTALANDO POSSIVEIS ATUALIZAÇÕES"
	sudo apt-get upgrade -y
	clear

#Adicionando Repositorios
	#Kicad
echo "ADICIONANDO REPOSITORIO AO LINUX-(KICAD)"
        sudo add-apt-repository --yes ppa:js-reynaud/kicad-4 -y
	
	#Sublime
echo "ADICIONANDO REPOSITORIO AO LINUX (Sublime)"
 	sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
	
	#LibreOffice
echo "ADICIONANDO REPOSITORIO AO LINUX (LibreOffice)"
	sudo add-apt-repository -y ppa:libreoffice/ppa
	
	
	sudo apt-get update
	clear
	
#Instalando Dependencias
	echo "INSTALANDO DEPENDENCIAS"
	sudo apt-get install python-pip -y
	sudo pip install pyserial --upgrade
	sudo apt-get install python python-tk idle python-pmw python-imaging
	sudo apt-get install  git -y
	clear

#Baixando e Instalando Pacotes
	#bCNC
	echo "COPIANDO PASTA DO GIT"
	git clone https://github.com/vlachoudis/bCNC.git
	clear

	#KICAD
	echo "INSTALANDO KICAD"
	sudo apt-get install kicad -y
	clear

	#Sublime
	echo "INSTALANDO Sublime"
  	sudo apt-get install sublime-text-installer
	clear

	#RepetierHost
	echo "BAIXANDO Repetier Host"
	wget -c http://download.repetier.com/files/host/linux/repetierHostLinux_1_6_2.tgz
	clear
	echo "Descompactando Arquivo e Instalando"
	tar -xzf repetierHostLinux_1_6_2.tgz
	cd RepetierHost
	bash configureFirst.sh
	clear
	
	#Inkscape
	echo "INSTALANDO Inkscape"
	sudo apt-get install inkscape -y
	clear
	
	echo "INSTALANDO LibreOffice"
	sudo apt-get install libreoffice libreoffice-style-breeze -y
	clear;;

    0)
        echo "Saindo..."
        exit;;
    *)
        echo
        echo "ERRO: opção inválida"
        echo ;;
esac
done
