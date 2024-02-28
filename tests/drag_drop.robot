*** Settings ***

Resource                    ../resources/base.resource

Test Setup                  Start Session
Test Teardown               Finish Session

*** Test Cases ***
Deve arrastar o Luke Skywalker para o topo da lista
    [Tags]                  browserstack

    Navigate To             Star Wars

    Go To Item              Lista        
    
    Wait Until Screen Contains        Luke Skywalker

    ${origin}               Set Variable        //android.widget.TextView[@text="@skywalker"]/../../..//*[contains(@resource-id, "drag_handle")]

    ${target}               Set Variable        //android.widget.TextView[@text="@mando"]/../../..//*[contains(@resource-id, "drag_handle")]

    My Drag And Drop        ${origin}        ${target}

Deve arrastar o Darth Vader para a base da lista
    Navigate To             Star Wars

    Go To Item              Lista        
    
    Wait Until Screen Contains        Darth Vader

    ${origin}               Set Variable        //android.widget.TextView[@text="@darthvader"]/../../..//*[contains(@resource-id, "drag_handle")]

    ${target}               Set Variable        //android.widget.TextView[@text="@chewie"]/../../..//*[contains(@resource-id, "drag_handle")]

    My Drag And Drop        ${origin}        ${target}