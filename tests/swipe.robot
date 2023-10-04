*** Settings ***

Resource                    ../resources/base.resource

Test Setup                  Start Session
Test Teardown               Finish Session

*** Test Cases ***
Deve remover o Darth Vader
    Navigate To             Star Wars

    Go To Item              Lista
    
    Wait Until Screen Contains        Darth Vader

    ${positions}            Get Element Location    xpath=//android.widget.TextView[@text="@darthvader"]

    ${start_x}              Set Variable        ${positions}[x]
    ${start_y}              Set Variable        ${positions}[y]
    ${offset_x}             Evaluate            ${positions}[x] - 500
    ${offset_y}             Set Variable        ${positions}[y]
    
    Swipe                   ${start_x}    ${start_y}    ${offset_x}    ${offset_y}

    Click By Element        id=com.qaxperience.yodapp:id/btnRemove

    Wait Until Screen Does Not Contain        Darth Vader