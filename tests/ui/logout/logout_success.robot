*** Settings ***
Library    Browser
Resource    ../../../resources/keywords/auth_keywords.robot
Resource    ../../../resources/keywords/hooks.robot



*** Test Cases ***
Logout succeeds by using Logout in menu bar
    Logout
    Should land on login page