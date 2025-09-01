*** Settings ***
Library    Browser
Resource    ../../../resources/keywords/cart_keywords.robot
Resource    ../../../resources/keywords/inventory_keywords.robot
Resource    ../../../resources/pages/home_page.robot
Resource    ../../../resources/pages/cart_page.robot

Resource    ../../../resources/keywords/hooks.robot



*** Test Cases ***
Cart Displays Added Items Correctly
    [Tags]    component:ui    smoke    regression    severity:high    jira:SC-37
    Add To Items And Open Cart    Sauce Labs Bike Light    Sauce Labs Backpack  
    Cart Should Equal Products Exactly    Sauce Labs Backpack    Sauce Labs Bike Light  