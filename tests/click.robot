*** Settings ***

Resource                    ../resources/base.resource

Test Setup                  Start Session
Test Teardown               Finish Session

*** Test Cases ***
Deve realizar um clique simples
    Navigate To                  Clique em Botões
    Go To Item                   Clique simples

    Click By Text                CLIQUE SIMPLES
    Wait Until Screen Contains   Isso é um clique simples

Deve realizar um clique longo
    Navigate To                  Clique em Botões
    Go To Item                   Clique longo

    Long Click                   id=com.qaxperience.yodapp:id/long_click

    Wait Until Screen Contains   Isso é um clique longo