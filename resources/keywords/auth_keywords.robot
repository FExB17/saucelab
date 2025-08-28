*** Settings ***
Library     Browser
Resource    ../pages/login_page.robot
Resource    ../pages/inventory_page.robot
Resource    ../pages/home_page.robot

Variables    ../../variables/qa.yaml


*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Fill username    ${username}
    Fill password    ${password}
    Click Login

Login As Standard User
    Fill username    ${STANDARD_USER}
    Fill password    ${PASSWORD}
    Click Login

Verify Login Succeeds
    [Arguments]   ${expected}
    inventory_page.Wait Until Loaded
    ${heading}=    inventory_page.Get Products Heading
    Should Be Equal As Strings    ${heading}    ${expected}

Get Login Error Text
    login_page.Wait For Error Visible
    ${text}=    Get Error Text
    RETURN    ${text}

Error Message Should Be
    [Arguments]    ${actual}    ${expected}
    Should Be Equal    ${actual}    ${expected}

Logout
    Open Menu
    Click Logout

Should land on login page
    Login Page Should Be Visible

    