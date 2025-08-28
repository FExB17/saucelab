*** Settings ***
Library    Browser
Library    OperatingSystem
Resource    ../pages/inventory_page.robot

*** Keywords ***
Product Count Should Be
    [Arguments]    ${expected}
    ${count_of_items}=    Get Inventory Product Count
    Should Be Equal As Integers    ${count_of_items}    ${expected}


Add To Cart
    [Arguments]    ${product_name}
    ${selector}=     Get Add Button Selector For Product    ${product_name}
    Wait For Elements State    ${selector}    visible    5s
    Click    ${selector}


Cart Badge Should Be
    [Arguments]    ${expected}
    IF    ${expected} > 0
        Wait For Elements State    ${BADGE_SHOPPING_CART}    visible    5s
        ${actual}=    Get Text    ${BADGE_SHOPPING_CART}
        Should Be Equal As Numbers    ${actual}    ${expected}
    ELSE
        Wait For Elements State    ${BADGE_SHOPPING_CART}    hidden    5s
    END

Product Button Text Should Be
    [Arguments]    ${product_name}    ${expected}
    ${selector}=    Get Remove Button Selector For Product    ${product_name}
    Wait For Elements State    ${selector}     visible    5s
    ${actual}=    Get Text    ${selector}
    Should Be Equal As Strings    ${actual}    ${expected}


Remove Product From Cart
    [Arguments]    ${product_name}
    Click Remove    ${product_name}


Open Product Details
    [Arguments]    ${product_name}
    ${selector}    Get Click Button For Product    ${product_name}
    Click    ${selector}
    

    
    
