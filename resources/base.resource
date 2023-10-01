*** Settings ***
Documentation              Base resources

Library                    AppiumLibrary
Library                    libs/extend.py
Library                    libs/mark-test-status.py

Resource                   helpers.resource

*** Variables ***
${ENVIRONMENT}             Local
${BS_USERNAME}             %{BROWSERSTACK_USERNAME} 
${BS_ACCESS_KEY}           %{BROWSERSTACK_ACCESS_KEY}
${BS_APP_ID}               %{BROWSERSTACK_APP_ID}
${BS_URL}                  hub-cloud.browserstack.com/wd/hub

*** Keywords ***
Start Session
    IF  $ENVIRONMENT == 'Local'
        Start Local Session
    ELSE IF  $ENVIRONMENT == 'Remoto'
        Start Remote Session
    ELSE
        Start Local Session
    END

Start Local Session
    Open Application       remote_url=http://localhost:4723
    ...                    alias=Yodapp
    ...                    platformName=Android
    ...                    deviceName=Android Emulator
    ...                    automationName=UIAutomator2
    ...                    app=${EXECDIR}/app/yodapp-beta.apk
    ...                    udid=emulator-5554
    ...                    autoGrantPermissions=true

    Get Started

Start Remote Session
    Open Application       remote_url=https://${BS_USERNAME}:${BS_ACCESS_KEY}@${BS_URL}
    ...                    app=${BS_APP_ID}
    ...                    platformName=Android
    ...                    platformVersion=12.0
    ...                    deviceName=Samsung Galaxy S22 Ultra
    ...                    autoGrantPermissions=true
    ...                    name=Yodapp Tests With Robot Framework & Appium
    ...                    build=browserstack-robot-framework

    Get Started

Get Started
    Click By Text          QAX

Navigate To
    [Arguments]            ${menu_item_text}

    ${menu}                Set Variable        xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]

    Click By Element       ${menu}

    ${menu_item}           Set Variable        xpath=//*[@resource-id="com.qaxperience.yodapp:id/navView"]//*[@text="${menu_item_text}"]

    Click By Element       ${menu_item}

Go To Item
    [Arguments]            ${item}

    Click By Text          ${item}

Mark Test Status
    [Arguments]            ${status}    ${reason}

    Test Status            ${status}    ${reason}

Take Screenshot
    Sleep    1
    Capture Page Screenshot

Finish Session
    Take Screenshot
    Close Application