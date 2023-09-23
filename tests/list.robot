*** Settings ***

Resource                    ../resources/base.resource

Test Setup                  Start Session
Test Teardown               Finish Session

*** Test Cases ***
Deve validar o texto sobre a Princesa Leia
    Navigate To             Star Wars

    Go To Item              Lista        
    
    Wait Until Screen Contains        Princesa Leia

    Click By Element        xpath=//android.widget.TextView[@text="Princesa Leia"]/../../..//*[contains(@resource-id, "indicator")]

    ${text}                 Set Variable        Princesa do planeta Alderaan, membro do Senado Imperial, espiã da Aliança Rebelde e general da Resistência.

    Element Text Should Be        id=com.qaxperience.yodapp:id/textAboutExtended        ${text}

Deve validar o texto sobre o Chewbacca
    Navigate To             Star Wars

    Go To Item              Lista        
    
    Wait Until Screen Contains        Chewbacca

    Click By Element        xpath=//android.widget.TextView[@text="Chewbacca"]/../../..//*[contains(@resource-id, "indicator")]

    ${text}                 Set Variable        Copiloto da Millennium Falcon e o melhor amigo de Han Solo, é um alienígena da raça Wookiee.

    Element Text Should Be        id=com.qaxperience.yodapp:id/textAboutExtended        ${text}