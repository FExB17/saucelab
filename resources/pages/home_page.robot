*** Settings ***
Library     Browser
Library    ../../.venv/lib/python3.10/site-packages/robot/libraries/String.py


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


