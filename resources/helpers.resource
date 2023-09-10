*** Settings ***
Documentation              My Custom Keywords

Library                    AppiumLibrary

*** Keywords ***
Wait Until Screen Contains
    [Arguments]            ${text}        ${timeout}=10

    Wait Until Page Contains        text=${text}        timeout=${timeout}

Wait Until Screen Does Not Contain
    [Arguments]            ${text}        ${timeout}=10

    Wait Until Page Does Not Contain      text=${text}        timeout=${timeout}

Click By Text
    [Arguments]            ${text}        ${timeout}=10

    Wait Until Page Contains      text=${text}        timeout=${timeout}
    Click Text                    text=${text}        exact_match=True

Click By Element
    [Arguments]            ${element}     ${timeout}=10

    Wait Until Element Is Visible        ${element}     ${timeout}
    Click Element                        ${element}