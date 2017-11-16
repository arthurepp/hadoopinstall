# hadoopm
Configure os ips das máquinas como no exemplo abaixo antes de começar:

hadoop-master -> 192.168.188.10 
hadoop-slave1 -> 192.168.188.11 
hadoop-slave2 -> 192.168.188.12 

Execute o procedimento abaixo nas maquinas slaves e na master

sudo apt-get -y install git

git clone https://github.com/arthurepp/hadoopm.git

cd hadoopm

# Nas máquinas slave 

Execute os 2 comandos abaixo

chmod +x slave1.sh

./slave1.sh

Quando a máquina Master reiniciar execute os 2 comandos complementares

chmod +x slave2.sh

./slave2.sh

Um dos comandos vai solicitar uma resposta (sim ou não). Digite "yes"
A senha para o usuário hadoop também será requisitada. Digite "hadoop" nas 3 solicitações seguintes.

# Ná máquina Master

Execute os 2 comandos abaixo

chmod +x master1.sh

./master1.sh

No meio da execução do script será solicitada uma senha para o servidor mysql. Coloque "hadoop" e novamente na confirmação

Quando todos as máquinas slaves executarem o arquivo slave2.sh execute os comandos abaixo

chmod +x master2.sh

./master2.sh
