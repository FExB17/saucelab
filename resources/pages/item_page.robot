*** Settings ***
Library     Browser



*** Variables ***
${TITLE_PRODUCT}=    css=[data-test="inventory-item-name"]
${DESCRIPTION_PRODUCT}=    css=[data-test="inventory-item-desc"]
${PRICE_PRODUCT}=        css=[data-test="inventory-item-price"]
${BTN_BACK_TO_INVENTORY}    css=[data-test="back-to-products"]


*** Keywords ***

Go Back To Inventory
    Click    ${BTN_BACK_TO_INVENTORY}

Wait For Price Visible
    [Arguments]    ${timeout}=5s
    Wait For Elements State    ${PRICE_PRODUCT}    visible    ${timeout}

Get Price Text
    ${text}=    Get Text    ${PRICE_PRODUCT}
    RETURN    ${text}
    