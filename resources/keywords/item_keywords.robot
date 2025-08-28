*** Settings ***
Library    Browser
Library    Process

Resource    ../pages/item_page.robot
Resource    ../pages/home_page.robot
Resource    ../pages/cart_page.robot


*** Variables ***


*** Keywords ***
Product Title Should Be
    [Arguments]    ${expected}
    ${actual}    Get Text    ${TITLE_PRODUCT}
    Should Be Equal    ${actual}    ${expected}


Product Description Should Be Visible
    [Arguments]    ${expected}
    ${actual}    Get Text    ${DESCRIPTION_PRODUCT}
    Should Contain    ${actual}        ${expected}

Product Price Should Be Visible
    [Arguments]    ${timeout}=5s    ${pattern}=^(\\$|€)?\\s?\\d{1,4}([.,]\\d{2})?$
    Wait For Price Visible    ${timeout}
    ${txt}=    Get Price Text
    Should Match Regexp    ${txt}    ${pattern}    msg=Invalid price format on Item page: '${txt}'

