*** Settings ***
Library    Browser
Library    OperatingSystem
Library    ../../.venv/lib/python3.10/site-packages/robot/libraries/Collections.py
Resource    ../pages/inventory_page.robot
Resource    ../pages/home_page.robot
Resource    ../pages/cart_page.robot

*** Keywords ***
Product Count Should Be
    [Arguments]    ${expected}
    ${count_of_items}=    Get Inventory Product Count
    Should Be Equal As Integers    ${count_of_items}    ${expected}


Add To Cart
    [Arguments]    @{product_name}
    FOR    ${product}    IN    @{product_name}
        ${selector}=     Get Add Button Selector For Product    ${product}
        Wait For Elements State    ${selector}    visible    5s
        Log To Console    ${selector}
        Click    ${selector}
    END

Add To Items And Open Cart
    [Arguments]    @{product_name}
    Add To Cart    @{product_name}
    Go To Cart

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
    
Set Sort Option
    [Arguments]    ${label}
    Select Options By   ${BTN_SORT}    text    ${label}


Inventory List Should Be Alphabetically Sorted From A to Z
    Get Text 
    @{elements}    Get Elements    ${ITEM_NAMES}
   @{names}    Get Texts   @{elements}
   @{lower_names}    Create List
   FOR    ${n}    IN    @{names}
       ${l}    Convert To Lower Case    ${n}
       Append To List    ${lower_names}    ${l}
   END
   @{sorted_names}    Copy List    ${lower_names}
   Sort List    ${sorted_names}
   Lists Should Be Equal    ${sorted_names}    ${lower_names}
