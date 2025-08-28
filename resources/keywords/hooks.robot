*** Settings ***
Library    Browser 
Resource    ../pages/login_page.robot
Resource    auth_keywords.robot

*** Keywords ***
Open Browser Session
    New Browser    ${BROWSER}    headless=${HEADLESS}

Open App
    New Context
    New Page    ${BASE_URL}
    
    
Open App and Login
    New Context
    New Page    ${BASE_URL}
    Login Page Should Be Visible
    Login As Standard User
    Wait Until Loaded  


Open App and Login And Wait For Page
    New Context
    New Page    ${BASE_URL}
    Login Page Should Be Visible
    Login As Standard User
    Wait Until Loaded  



Cleanup Test 
    Run Keyword And Ignore Error    '${TEST_STATUS}' == 'FAIL'    Take Screenshot
    Close Context

Cleanup App
    Run Keyword And Ignore Error    Close Page
    Run Keyword And Ignore Error    Close Context
    Run Keyword And Ignore Error    Close Browser