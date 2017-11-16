## Instalado

#Alterar Hostname

hostnamectl set-hostname hadoop-"nome da instancia"

Colocar a senha do administrador para confirmar

#Configurar Rede

nmtui (utilize o TAB para navegar entre as opções)

Edit a connection -> Edit -> IPv4 para manual e depois a opção SHOW

Em ADDRESSES selecione ADD para adicionar o ip 192.168.188.XX/24

Marque a opção "Require IPv4 addressing for this connection"

Na opção IPv6 Configuration altere para "Ignore"

Confirme a alteração em "OK" no final da tela.

Para sair selecione "BACK" e depois "Quit"

Reinicie a máquina
sudo reboot
