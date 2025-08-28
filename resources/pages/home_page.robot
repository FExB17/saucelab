*** Settings ***
Library     Browser
Library    String


*** Variables ***
${BURGER_MENU}          css=[id="react-burger-menu-btn"]
${BTN_LOGOUT}        css=[data-test="logout-sidebar-link"]
${LINK_CART}        css=[data-test="shopping-cart-link"]


*** Keywords ***

Open Menu
    Click    ${BURGER_MENU}


Click Logout
    Click    ${BTN_LOGOUT}

Go To Cart
    Click    ${LINK_CART}


