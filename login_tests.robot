*** Settings ***
Resource        resource.robot

Suite Setup     Prepare Browser
Suite Teardown  Close Browser

Test Setup  Open Obstacle

*** Test cases ***

SUCCESSFUL LOGIN
    Wait Until Page Contains Element    //input[@id='login-button']
    Input Text                          id=user-name    standard_user
    Input Text                          id=password     secret_sauce
    Click Element                       //input[@id='login-button']
    Verify Solved SUCCESSFUL LOGIN

WRONG PASSWORD
Wait Until Page Contains Element        //input[@id='login-button']
    Input Text                          id=user-name    standard_user
    Input Text                          id=password     wrong
    Click Element                       //input[@id='login-button']
    Verify Solved UNSUCCESSFUL LOGIN

WRONG USERNAME 
    Wait Until Page Contains Element    //input[@id='login-button']
    Input Text                          id=user-name    wrong_user
    Input Text                          id=password     secret_sauce
    Click Element                       //input[@id='login-button']
    Verify Solved UNSUCCESSFUL LOGIN

WRONG USERNAME AND PASSWORD
    Wait Until Page Contains Element    //input[@id='login-button']
    Input Text                          id=user-name    wrong
    Input Text                          id=password     wronger
    Click Element                       //input[@id='login-button']
    Verify Solved UNSUCCESSFUL LOGIN
