*** Settings ***

Resource                    ../resources/base.resource

Test Setup                  Start Session
Test Teardown               Finish Session

*** Test Cases ***
Deve marcar as techs que usam Appium
    Navigate To             Check e Radio
    Go To Item              Checkbox        Marque as techs que usam Appium

    @{techs}                Create List    Ruby    Python    Java    Javascript    C#

    FOR    ${tech}    IN    @{techs}
        Click By Element    xpath=//android.widget.CheckBox[contains(@text, "${tech}")]    
    END