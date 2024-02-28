*** Settings ***

Resource                    ../resources/base.resource

Test Setup                  Start Session
Test Teardown               Finish Session

*** Test Cases ***
Deve marcar as techs que usam Appium
    [Tags]                  browserstack

    Navigate To             Check e Radio
    Go To Item              Checkbox
    
    Wait Until Screen Contains        Marque as techs que usam Appium

    @{techs}                Create List
    ...                     Ruby             Python      Java
    ...                     Javascript       C#          Robot Framework

    FOR    ${tech}    IN    @{techs}
        Click By Element    xpath=//android.widget.CheckBox[contains(@text, "${tech}")]    
    END