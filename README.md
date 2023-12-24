<<<<<<< HEAD
# target_systems

## Tela de login

Uma tela de autenticação onde o usuário é obrigado a digitar seu login e senha

![Captura de Tela 2023-12-17 às 21 47 57](https://github.com/matheus-kittler/target_systems/assets/53222107/28f835b3-735c-4990-b661-33229ef7d1e4)

### A tela deve conter

* Um Campo de senha
* Um campo de texto para representar o Login
* Um Label descrito "Política de privacidade"

### Como tela deve se comportar 

* Verificar e alertar se ambos os campos de Login e senha estão preenchidos.
* O campo senha não pode ter menos que dois caracteres.
* O campo senha não pode ter caracteres especiais, sendo apenas possível
informar 'a' até 'Z' e '0' até '9'.
* Ambos os campos não podem ultrapassar 20 caracteres.
* Ambos os campos não podem terminar com o caractere de espaço no final.
* Se ambas as informações esƟveram preenchidas deve ir para a próxima tela.
* Ao tocar no label "PolíƟca de privacidade" uma página web direcionada para o
google.com.br deve ser aberta. 

## Tela de captura de informações

A tela deve salvar as informações digitadas pelo usuário em um card, listando essas informações
salvas e dando a opção de editar ou excluir. Essas informações não podem ser perdidas ao fechar
o app, ou seja, ao abrir a tela as informações salvas anteriormente devem ser mostradas na
ordem. 

![Captura de Tela 2023-12-17 às 21 48 09](https://github.com/matheus-kittler/target_systems/assets/53222107/6eb5c4d4-98cd-490f-95d6-97f2a524f3a7)

### A tela deve conter

* Um card principal e central
* Um campo de texto

### Como a tela deve se comportar

* O foco da digitação deve estar o tempo todo no campo de "Digite seu texto" e não pode
ser perdido ao interagir com a tela.
* Ao acionar o "enter" o campo tem que verificar se a informação foi preenchida.
* O Card principal deve receber a informação digitada do campo.
* As informações precisam ser salvas e lidas uƟlizando a biblioteca shared_ preferences
(hƩps://pub.dev/packages/shared_preferences)
* O Icone de excluir deve abrir um pop-up confirmando a ação.
* Obrigatório a uƟlização do plugin MOBX para a construção da tela. 
>>>>>>> d7b9e787daa50791b06183af38c46768eedc1fbe
