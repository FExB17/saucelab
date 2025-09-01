*** Settings ***

Library             Browser

Resource            ../../../resources/keywords/auth_keywords.robot
Resource            ../../../resources/keywords/hooks.robot
Variables           ../../../variables/expected_values.yaml


*** Test Cases ***
Login succeeds with valid credentials
    [Tags]   smoke   component:ui   layer:e2e   severity:critical
    Login                    %{STANDARD_USER}   %{PASSWORD}
    Verify Login Succeeds    ${DASHBOARD.HOME}



Locked out user sees account locked error
    [Tags]   smoke   component:ui   layer:e2e   severity:important
    Login    %{LOCKED_OUT_USER}      %{PASSWORD}
    ${actual_error_message}=    Get Login Error Text
    Error Message Should Be     ${actual_error_message}    Epic sadface: Sorry, this user has been locked out.