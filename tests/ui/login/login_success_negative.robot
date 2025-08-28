*** Settings ***
Library             Browser
Resource            ../../../resources/keywords/auth_keywords.robot
Resource            ../../../resources/keywords/hooks.robot



*** Test Cases *** 
Invalid password shows message
    Login    ${STANDARD_USER}   ${INVALID_PASSWORD}
     ${actual_error_message}=    Get Login Error Text
    Error Message Should Be     ${actual_error_message}    Epic sadface: Username and password do not match any user in this service
      

Missing username shows message         
    Login    ${EMPTY}   ${PASSWORD}
     ${actual_error_message}=    Get Login Error Text
    Error Message Should Be     ${actual_error_message}    Epic sadface: Username is required