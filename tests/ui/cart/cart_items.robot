*** Settings ***
Library    Browser
Resource    ../../../resources/keywords/cart_keywords.robot
Resource    ../../../resources/keywords/inventory_keywords.robot
Resource    ../../../resources/pages/home_page.robot
Resource    ../../../resources/pages/cart_page.robot

Resource    ../../../resources/keywords/hooks.robot



*** Test Cases ***
Cart Displays Added Items Correctly
    [Tags]    component:ui    smoke    regression    severity:high    jira:SL-UI-009
    Add To Cart    Sauce Labs Bike Light
    Add To Cart    Sauce Labs Backpack
    Go To Cart
    Cart Should Equal Products Exactly    Sauce Labs Backpack    Sauce Labs Bike Light  
