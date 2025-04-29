*** Settings ***
Resource  ../resources/variables.resource
Resource  ../resources/settings.resource

*** Test Cases ***
Validar opções da navbar do admin
    Abrir o navegador
    Ir para o site Serve Rest Front
    Preencher os dados do novo usuário e cadastrar um administrador
    Conferir que é possível vizualizar as opções "Home", "Cadastrar Usuários", "Listar Usuários", "Cadastrar Produtos", "Listar Produtos" e "Relatórios"

Validar opções da navbar de usuário comum
    Abrir o navegador
    Ir para o site Serve Rest Front
    Preencher os dados do novo usuário e cadastrar
    Conferir que é possível vizualizar as opções "Home", "Lista de Compras" e "Carrinho"
