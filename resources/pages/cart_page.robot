*** Settings ***
Library    Browser
Library    Collections
Resource    ../pages/item_page.robot
Resource    inventory_page.robot

*** Variables ***
${LIST_CART}          css=[data-test="cart-list"]
${TITLE_CART_ITEM}      css=[data-test="inventory-item-name"]
${BTN_CHECKOUT}        css=[data-test="checkout"]
${BTN_CONTINUE}        css=[data-test="continue"]
${BTN_FINISH}         css=[data-test="finish"]
${HEADER_SUCCESS}    css=[data-test="complete-header"]

&{FIELD_LOCATORS}    
...    first_name=[data-test="firstName"]
...    last_name=[data-test="lastName"]
...    postal_code=[data-test="postalCode"]

*** Keywords ***

Wait For Cart Page To Load
    Wait For Elements State   ${LIST_CART}    visible   5s


Get All Items Text
    ${all_items}    Get Elements    ${TITLE_CART_ITEM}
    @{items_text_list}    Create List
    FOR    ${item}    IN    @{all_items}
        ${item_text}    Get Text    ${item}
        Append To List    ${items_text_list}    ${item_text}
    END
    RETURN    @{items_text_list}



