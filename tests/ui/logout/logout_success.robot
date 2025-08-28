*** Settings ***
Library    Browser
Resource    ../../../resources/keywords/auth_keywords.robot
Resource    ../../../resources/keywords/hooks.robot

Variables    ../../../variables/qa.yaml



*** Test Cases ***
Logout succeeds by using Logout in menu bar
    Logout
    Should land on login page