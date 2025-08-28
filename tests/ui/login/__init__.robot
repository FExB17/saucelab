*** Settings ***
Resource        ../../../resources/keywords/hooks.robot

Suite Setup     Open Browser Session
Suite Teardown  Cleanup App
Test Setup      Open App
Test Teardown   Cleanup Test
Test Timeout    2 minutes