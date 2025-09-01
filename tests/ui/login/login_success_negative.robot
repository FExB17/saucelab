*** Settings ***
Library             Browser
Resource            ../../../resources/keywords/auth_keywords.robot
Resource            ../../../resources/keywords/hooks.robot
Variables            ../../../variables/expected_error_messages.yaml

 

*** Test Cases *** 
Invalid password shows message
    Login    ${STANDARD_USER}   ${INVALID_PASSWORD}
     ${actual_error_message}=    Get Login Error Text
    Error Message Should Be     ${actual_error_message}    ${LOGIN.INVALID_PASSWORD}
      

Missing username shows message         
    Login    ${EMPTY}   ${PASSWORD}
     ${actual_error_message}=    Get Login Error Text
    Error Message Should Be     ${actual_error_message}    ${LOGIN.MISSING_USERNAME}