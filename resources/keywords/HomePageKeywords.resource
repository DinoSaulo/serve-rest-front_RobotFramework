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

Preencher os dados do novo usuário e cadastrar um administrador
    Click       css=a[data-testid='cadastrar']
    ${EMAIL}    FakerLibrary.Email
    Fill Text   css=input[data-testid='nome']       Saulo Barros
    Fill Text   css=input[data-testid='email']      ${EMAIL}
    Fill Text   css=input[data-testid='password']   123456
    Check Checkbox  css=input[data-testid='checkbox']
    Click   xpath=//*[@id="root"]//button >> text="Cadastrar"

Preencher os dados do novo usuário e cadastrar
    Click       css=a[data-testid='cadastrar']
    ${EMAIL}    FakerLibrary.Email
    Fill Text   css=input[data-testid='nome']       Saulo Barros
    Fill Text   css=input[data-testid='email']      ${EMAIL}
    Fill Text   css=input[data-testid='password']   123456
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
