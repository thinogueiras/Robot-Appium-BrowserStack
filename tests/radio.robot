*** Settings ***

Resource                    ../resources/base.resource

Test Setup                  Start Session
Test Teardown               Finish Session

*** Test Cases ***
Deve selecionar a opcao Python
    [Tags]                  browserstack

    Navigate To             Check e Radio
    Go To Item              Botões de radio        
    
    Wait Until Screen Contains        Escolha sua linguagem preferida

    Click By Element        xpath=//android.widget.RadioButton[contains(@text, "Python")]