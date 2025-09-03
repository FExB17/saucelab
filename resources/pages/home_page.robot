*** Settings ***
Library     Browser
Library    String


*** Variables ***
${BURGER_MENU}          css=[id="react-burger-menu-btn"]
${BTN_LOGOUT}        css=[data-test="logout-sidebar-link"]
${LINK_CART}        css=[data-test="shopping-cart-link"]
${BTN_RESET}          css=[data-test="reset-sidebar-link"]
${TITLE_CART}        css=[data-test="title"]


*** Keywords ***

Open Menu
    Click    ${BURGER_MENU}

Click Reset
    Click    ${BTN_RESET}


Click Logout
    Click    ${BTN_LOGOUT}

Go To Cart
    Click    ${LINK_CART}
    Wait For Elements State    ${TITLE_CART}         visible    5s


