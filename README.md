# Restaurantes

## Descrição

A aplicação utiliza informações da API pública de estabelecimentos da Hotmart.
Após isso será possivel obter o valor hash para utilizar ao fim da sua URL para pegar as informações necessárias.

## Instalação

Basta clonar o repositório do projeto em sua máquina.
É necessário o Xcode instalado com simulador ou um Iphone com a versão atualizada do sistema operacional(iOS 13.2).

## Resultado
Com a aplicação é possivel fazer a busca e ter o resultado com a lista de restaurantes em uma collection customizada.
Ao clicar em um dos estabelecimentos é aberto uma nova tela com os detalhes e descrições do local.
Há também uma TabBar para selecionar em qual tela deseja estar com uma animação sutil.

As requisições para o json são feitas de forma nativa através do URLSession.
Como já havia utilizado o Alamofire antes me desafiei a fazer o mesmo sem utilizar Pods.

Existe um pequeno banco de imagens que são selecionadas de forma aleatória para os cards.
