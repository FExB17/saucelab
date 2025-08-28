*** Settings ***
Library             Browser
Resource            ../../../resources/keywords/auth_keywords.robot
Resource            ../../../resources/keywords/hooks.robot
Variables           ../../../variables/qa.yaml



*** Test Cases *** 
Invalid password shows message
    Login    ${USERS.standard.username}   ${USERS.invalid.password}
     ${actual_error_message}=    Get Login Error Text
    Error Message Should Be     ${actual_error_message}    Epic sadface: Username and password do not match any user in this service
      

Missing username shows message         
    Login    ${EMPTY}   ${USERS.password}
     ${actual_error_message}=    Get Login Error Text
    Error Message Should Be     ${actual_error_message}    Epic sadface: Username is required