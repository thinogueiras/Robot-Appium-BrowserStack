*** Settings ***

Resource                    ../resources/base.resource

Test Setup                  Start Session
Test Teardown               Finish Session

*** Variables ***
${email}                    id=com.qaxperience.yodapp:id/etEmail
${password}                 id=com.qaxperience.yodapp:id/etPassword
${btn_entrar}               id=com.qaxperience.yodapp:id/btnSubmit

*** Test Cases ***
Deve logar com sucesso
    Navigate To             Formulários

    Go To Item              Login
    
    Wait Until Screen Contains        Olá Padawan, vamos testar o login?

    Input Text              ${email}         yoda@qax.com
    Input Text              ${password}      jedi

    Click By Element        ${btn_entrar}

    Wait Until Screen Contains        Boas vindas, logado você está.

Não deve logar com senha incorreta
    Navigate To             Formulários

    Go To Item              Login            
    
    Wait Until Screen Contains        Olá Padawan, vamos testar o login?

    Input Text              ${email}         yoda@qax.com
    Input Text              ${password}      test

    Click By Element        ${btn_entrar}

    Wait Until Screen Contains        Oops! Credenciais incorretas.