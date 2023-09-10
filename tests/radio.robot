*** Settings ***

Resource                    ../resources/base.resource

Test Setup                  Start Session
Test Teardown               Finish Session

*** Test Cases ***
Deve selecionar a opção Python
    Navigate To             Check e Radio
    Go To Item              Botões de radio        Escolha sua linguagem preferida

    Click By Element        xpath=//android.widget.RadioButton[contains(@text, "Python")]