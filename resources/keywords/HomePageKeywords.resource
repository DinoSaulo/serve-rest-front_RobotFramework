*** Settings ***
Resource    ../locators/HomePageLocators.resource
Library     Browser
Library  FakerLibrary

*** Variables ***
${BROWSER}           chromium
${HEADLESS}          ${false}
${SITE_SERVE_REST}   https://front.serverest.dev/

*** Keywords ***
Abrir o navegador
    New Browser    browser=${BROWSER}
    ...            headless=${HEADLESS}
    New Context    viewport={'width': 1200, 'height': 800}

Ir para o site Serve Rest Front
    New Page       url=${SITE_SERVE_REST}
    ${title}       Get Title  ==  Front - ServeRest
    Log  ${title}

Clicar no botão "Cadastrar-se"
    Click       css=a[data-testid='cadastrar']

Preencher o campo e-mail com ${EMAIL_FAKER}
    ${EMAIL}    FakerLibrary.Email
    Fill Text   css=input[data-testid='email']      ${EMAIL}

Preencher o campo nome com "${nome}"
    Fill Text   css=input[data-testid='nome']       ${nome}

Preencher o campo senha com "${senha}"
    Fill Text   css=input[data-testid='password']   ${senha}

Selecionar o checkbox "Cadastrar como administrador?"
    Check Checkbox  css=input[data-testid='checkbox']

Clicar no botão "Cadastrar"
    Click   xpath=//*[@id="root"]//button >> text="Cadastrar"

Preencher os dados do novo usuário e cadastrar
    # Record Selector
    # Click    css=.btn-link
    # Click    text="Cadastre-se"
    Click       css=a[data-testid='cadastrar']
    ${EMAIL}    FakerLibrary.Email
    Fill Text   css=input[data-testid='nome']       Saulo Barros
    Fill Text   css=input[data-testid='email']      ${EMAIL}
    Fill Text   css=input[data-testid='password']   123456
    Check Checkbox  css=input[data-testid='checkbox']
    # Click    css=button[data-testid='cadastrar']
    Click   xpath=//*[@id="root"]//button >> text="Cadastrar"

Conferir usuário cadastrado com sucesso
    Wait For Elements State    h1   visible
    Get Text    h1  ==  Bem Vindo Saulo Barros
    Get Element States    css=button[data-testid='logout']  validate  value & visible

Então a mensagem "${mensagem}" é exibida
    ${elemento}=    Get Element    //a[@class='alert-link']
    ${texto}=    Get Text    ${elemento}
    Should Contain    ${texto}      ${mensagem}
    Take Screenshot

Conferir que é possível vizualizar as opções "${option1}", "${option2}", "${option3}", "${option4}", "${option5}" e "${option6}"
    ${elemento}=    Get Element    //a[@data-testid='home']
    ${texto}=    Get Text    ${elemento}
    Should Contain    ${texto}      ${option1}

    ${elemento}=    Get Element    //a[@data-testid='cadastrar-usuarios']
    ${texto}=    Get Text    ${elemento}
    Should Contain    ${texto}      ${option2}

    ${elemento}=    Get Element    //a[@data-testid='listar-usuarios']
    ${texto}=    Get Text    ${elemento}
    Should Contain    ${texto}      ${option3}

    ${elemento}=    Get Element    //a[@data-testid='cadastrar-produtos']
    ${texto}=    Get Text    ${elemento}
    Should Contain    ${texto}      ${option4}

    ${elemento}=    Get Element    //a[@data-testid='listar-produtos']
    ${texto}=    Get Text    ${elemento}
    Should Contain    ${texto}      ${option5}

    ${elemento}=    Get Element    //a[@data-testid='link-relatorios']
    ${texto}=    Get Text    ${elemento}
    Should Contain    ${texto}      ${option6}
    Take Screenshot


