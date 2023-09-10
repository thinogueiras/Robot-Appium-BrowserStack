*** Settings ***

Resource                    ../resources/base.resource

Test Setup                  Start Session
Test Teardown               Finish Session

*** Test Cases ***
Deve mover o Luke Skywalker para o topo da lista
    Navigate To             Star Wars

    Go To Item              Lista        Luke Skywalker

    ${origin}               Set Variable        //android.widget.TextView[@text="@skywalker"]/../../..//*[contains(@resource-id, "drag_handle")]

    ${target}               Set Variable        //android.widget.TextView[@text="@mando"]/../../..//*[contains(@resource-id, "drag_handle")]

    My Drag And Drop        ${origin}        ${target}

Deve mover o Darth Vader para a base da lista
    Navigate To             Star Wars

    Go To Item              Lista        Darth Vader

    ${origin}               Set Variable        //android.widget.TextView[@text="@darthvader"]/../../..//*[contains(@resource-id, "drag_handle")]

    ${target}               Set Variable        //android.widget.TextView[@text="@chewie"]/../../..//*[contains(@resource-id, "drag_handle")]

    My Drag And Drop        ${origin}        ${target}

Deve validar o texto sobre a Princesa Leia
    Navigate To             Star Wars

    Go To Item              Lista        Princesa Leia

    Click By Element        xpath=//android.widget.TextView[@text="Princesa Leia"]/../../..//*[contains(@resource-id, "indicator")]

    ${text}                 Set Variable        Princesa do planeta Alderaan, membro do Senado Imperial, espiã da Aliança Rebelde e general da Resistência.

    Element Text Should Be        id=com.qaxperience.yodapp:id/textAboutExtended        ${text}