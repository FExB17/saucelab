*** Settings ***
Library    Browser
Resource    ../../../resources/keywords/inventory_keywords.robot
Resource    ../../../resources/keywords/hooks.robot
Resource    ../../../resources/keywords/item_keywords.robot
Resource    ../../../resources/keywords/cart_keywords.robot

Variables    ../../../variables/expected_values.yaml



*** Test Cases ***
Inventory shows exactly 6 products for standard user
    [Tags]    component:ui    regression    severity:medium
    Product Count Should Be    ${DASHBOARD.NUMBER_OF_ITEMS}    


Cart Badge Increments When Product Is Added
    [Tags]    component:ui    smoke    regression    severity:high    jira:SC-34
    Add To Cart    Sauce Labs Backpack    
    Cart Badge Should Be    1
    Product Button Text Should Be    Sauce Labs Backpack    Remove

Cart Badge Disappears When No Products Left
    [Tags]    component:ui    regression    severity:medium    jira:SC-35
    Add To Cart    Sauce Labs Backpack
    Remove Product From Cart    Sauce Labs Backpack
    Cart Badge Should Be    0

Product Details Page Shows Correct Data
    [Tags]    component:ui    regression    severity:medium    jira:SC-36
    Open Product Details    Sauce Labs Bike Light
    Product Title Should Be    Sauce Labs Bike Light
    Product Description Should Be Visible    A red light isn't the desired
    Product Price Should Be Visible

Products Sort A To Z
    [Tags]    component:ui    regression    severity:medium    jira:SC-44
    Set Sort Option    Name (A to Z)
    Inventory List Should Be Alphabetically Sorted From A to Z