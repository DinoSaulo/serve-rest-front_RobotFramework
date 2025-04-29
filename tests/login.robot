*** Settings ***
Resource  ../resources/variables.resource
Resource  ../resources/settings.resource
Library  FakerLibrary

*** Variables ***
${email} =  FakerLibrary.email

*** Test Cases ***
Cadastrar um novo usuário e validar mensagem
    Abrir o navegador
    Ir para o site Serve Rest Front
    Clicar no botão "Cadastrar-se"
    Preencher o campo nome com "Nome"
    Preencher o campo e-mail com ${email}
    Preencher o campo senha com "12345"
    Selecionar o checkbox "Cadastrar como administrador?"
    Clicar no botão "Cadastrar"
    Então a mensagem "Cadastro realizado com sucesso" é exibida

Login com sucesso ao cadastrar um usuário
    Abrir o navegador
    Ir para o site Serve Rest Front
    Preencher os dados do novo usuário e cadastrar um administrador
    Conferir usuário cadastrado com sucesso
