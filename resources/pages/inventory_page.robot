*** Settings ***
Library     Browser
Library    ../../.venv/lib/python3.10/site-packages/robot/libraries/String.py


*** Variables ***
${HEADING_PRODUCTS}=        css=[data-test="title"]
${ITEM_INVENTORY}=          css=[data-test="inventory-item"]
${LINK__SHOPPING_CART}=     css.shopping_cart_link
${BADGE_SHOPPING_CART}=     css=[data-test="shopping-cart-badge"]
#TODO make dynamic locators


*** Keywords ***
Wait Until Loaded
    Wait For Elements State    ${HEADING_PRODUCTS}    visible    timeout=5s

Get Products Heading
    ${text}=    Get Text    ${HEADING_PRODUCTS}
    RETURN    ${text}

Get Inventory Product Count
    ${count}=     Get Element Count    ${ITEM_INVENTORY}
    RETURN    ${count}


Slugify Product Name
    [Arguments]    ${product_name}
    ${slug}    Convert To Lower Case    ${product_name}
    ${slug}    Replace String    ${slug}    ${SPACE}    -
    RETURN    ${slug}

Get Add Button Selector For Product
    [Arguments]    ${product_name}
    ${slug}=    Slugify Product Name    ${product_name}
    RETURN    css=[data-test="add-to-cart-${slug}"]

Get Remove Button Selector For Product
    [Arguments]    ${product_name}
    ${slug}=    Slugify Product Name    ${product_name}
    RETURN    css=[data-test="remove-${slug}"]


Click Remove
    [Arguments]    ${product_name}
    ${selector}=    Get Remove Button Selector For Product    ${product_name}
    Click    ${selector}


Get Click Button For Product
    [Arguments]    ${product_name}
    ${slug}    Slugify Product Name    ${product_name}
    RETURN    css=[data-test="inventory-item-${slug}-img"]
    





    



    
    
    



