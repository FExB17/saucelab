*** Settings ***
Library    Browser
Library    Process

Resource    ../pages/cart_page.robot


*** Keywords ***
Cart Should Equal Products Exactly
    [Arguments]    @{product_names}
    Wait For Cart Page To Load
    @{actual}    Get All Items Text
    ${actual}    Evaluate    set(${actual})
    ${expected}    Evaluate    set(${product_names})
    Should Be Equal    ${actual}    ${expected}


Start Checkout
    Wait For Elements State    ${BTN_CHECKOUT}    visible    2s
    Click    ${BTN_CHECKOUT}


Continue Checkout
    Wait For Elements State    ${BTN_CONTINUE}    visible    2s
    Click    ${BTN_CONTINUE}

Finish Checkout
    Wait For Elements State    ${BTN_FINISH}    visible    2s
    Click    ${BTN_FINISH}

Order Success Message Should Be
    [Arguments]    ${expected}
    ${actual}    Get Text    ${HEADER_SUCCESS}
    Should Be Equal    ${actual}    ${expected}

Enter Checkout Information 
    [Arguments]    &{fields}
    FOR    ${key}    IN    @{fields.keys()}
        ${exists}    Run Keyword And Return Status    Dictionary Should Contain Key    ${fields}    ${key}
        Run Keyword Unless    ${exists}    Fail    Unknown checkout field: ${key}

        ${locator}    Get From Dictionary    ${FIELD_LOCATORS}    ${key}
        ${text}    Get From Dictionary    ${fields}    ${key}
        Wait For Elements State    ${locator}    visible
        Fill Text    ${locator}    ${text}
    END

