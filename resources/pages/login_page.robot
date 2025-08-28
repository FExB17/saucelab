*** Settings ***
Library     Browser


*** Variables ***
${INPUT_USERNAME}       id=user-name
${INPUT_PASSWORD}       id=password
${BTN_LOGIN}            id=login-button
${HEADING_PRODUCTS}     css=[data-test="title"]
${ERROR_MESSAGE}        css=[data-test="error"]
${CONTAINER_LOGIN}      css=[data-test="login-container"]


*** Keywords ***
Open Login Page
    [Arguments]    ${base_url}
    New Page    ${base_url}

Fill username
    [Arguments]    ${username}
    Fill Text    ${INPUT_USERNAME}    ${username}

Fill password
    [Arguments]    ${password}
    Fill Text    ${INPUT_PASSWORD}    ${password}

Click Login
    Click    ${BTN_LOGIN}

Wait For Error Visible
    Wait For Elements State    ${ERROR_MESSAGE}    visible    timeout=5s

Get Error Text
    ${text}=    Get Text    ${ERROR_MESSAGE}
    RETURN    ${text}

Login Page Should Be Visible
    Get Element    ${BTN_LOGIN}
