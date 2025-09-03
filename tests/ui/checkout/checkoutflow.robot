*** Settings ***
Library    Browser
Resource    ../../../resources/keywords/cart_keywords.robot
Resource    ../../../resources/keywords/inventory_keywords.robot
Resource    ../../../resources/pages/home_page.robot
Resource    ../../../resources/pages/cart_page.robot
Resource    ../../../resources/keywords/hooks.robot



*** Test Cases ***
Successful Checkout Flow
    [Tags]    component:ui    smoke    regression    severity:critical    jira:SL-UI-012
    Add To Cart    Sauce Labs Backpack
    Go To Cart
    Start Checkout
    Enter Checkout Information    first_name=John    last_name=Doe    postal_code=12345
    Continue Checkout
    Finish Checkout
    Order Success Message Should Be     Thank you for your order!
