*** Settings ***

Resource                    ../resources/base.resource

Test Setup                  Start Session
Test Teardown               Finish Session

*** Test Cases ***
Deve escolher o nivel Jedi
    Navigate To             Formulários
    Go To Item              Cadastro
    
    Wait Until Screen Contains        Crie sua conta.

    Input Text              id=com.qaxperience.yodapp:id/etUsername        Thiago
    Input Text              id=com.qaxperience.yodapp:id/etEmail           thiago@qax.com
    Input Text              id=com.qaxperience.yodapp:id/etPassword        qax@123

    Select Account Level    Jedi

    Click By Text           CADASTRAR

    Wait Until Screen Contains        Tudo certo, boas vindas ao Yodapp!

*** Keywords ***
Select Account Level
    [Arguments]             ${level}

    Click By Element        id=com.qaxperience.yodapp:id/spinnerJob

    Click By Text           ${level}