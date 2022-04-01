# <div align="center"> [OBA](https://github.com/paulohgs/script-organizador)

<div align="center"> 

![Swift Badge](https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white)

<div align="center">
    <strong>Descrição</strong><br>
    Script para organização de backup e exclusão de arquivos duplicados em diferentes diretórios.
</div></div>



## Pré-requisitos


- Swift 5

## Instalação


Clone este repositório para um diretório de preferência:

```bash
    git clone https://github.com/paulohgs/script-organizador 
```
Então entre no diretório do projeto:
```bash
    cd script-organizador
```
Execute o seguinte comando para atualizar o repositório e packages:
```bash
    swift package update
```
O projeto agora está apto a funcionar devidamente na sua máquina.

## Utilização


Dentro da pasta do projeto, utilize `swift run script-organizador` com o acréscimo do diretório que vai ser organizado e true, ou false, como opção para realizar backup.

Exemplo com uso de backup:
```bash
    swift run script-organizador ~/Documents -o true
```
> Nesta situação, caso não exista um diretório preferido para backup, será criado um novo diretório no diretório Documents como forma padrão.

Exemplo sem uso de backup:
```bash
    swift run script-organizador ~/Documents -o false
```
> Neste caso será realizado apenas a operação de excluir arquivos duplicados.

## Funcionalidades


- Realizar backup.
- Excluir arquivos duplicados em diferentes diretórios.

## Documentação


Link para a [Documentação](https://lavender-blinker-2a8.notion.site/Solution-Documentation-10e064e44b40452dad26ccc978d51215)

## Licença


[MIT](https://choosealicense.com/licenses/mit/)

## Autor


<div align="center">

<a href="https://github.com/paulohgs">
 <img style="border-radius: 50%;" src="https://avatars.githubusercontent.com/u/62183331?v=4" width="100px;" alt=""/>
 <br />

 <sub><b>Paulo Henrique</b></sub></a> <a href="https://github.com/paulohgs" title="Profile"></a>

 [![Twitter Badge](https://img.shields.io/badge/-@paulohgsft-1ca0f1?style=flat-square&labelColor=1ca0f1&logo=twitter&logoColor=white&link=https://twitter.com/paulohgsft)](https://twitter.com/paulohgsft) [![Linkedin Badge](https://img.shields.io/badge/-Paulo-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/paulohgsft/)](https://www.linkedin.com/in/paulohgsft/) 

