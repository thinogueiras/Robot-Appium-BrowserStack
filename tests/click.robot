*** Settings ***

Resource                   ../resources/base.resource

Test Setup                 Start Session
Test Teardown              Finish Session

*** Test Cases ***
Deve realizar um clique simples
    Navigate To                  Clique em Botões
    Go To Item                   Clique simples          Botão clique simples

    Click By Text                CLIQUE SIMPLES
    Wait Until Page Contains     Isso é um clique simples

Deve realizar um clique longo
    Navigate To                  Clique em Botões
    Go To Item                   Clique longo            Botão clique longo

    ${locator}                   Set Variable            id=com.qaxperience.yodapp:id/long_click
    ${positions}                 Get Element Location    ${locator}

    Tap With Positions           1000        ${${positions}[x], ${positions}[y]}

    Wait Until Page Contains     Isso é um clique longo