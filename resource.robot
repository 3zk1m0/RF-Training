*** Settings ***
Library           SeleniumLibrary   run_on_failure=Nothing

*** Variables ***
${SERVER}         https://www.saucedemo.com/
${BROWSER}        Chrome
${DRIVER}         rf-env/WebDriverManager/chrome/89.0.4389.23/chromedriver_win32/chromedriver.exe
${DELAY}          0.2

*** Keywords ***
Prepare Browser
    Open Browser    ${SERVER}List    ${BROWSER}   executable_path=${DRIVER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Open Obstacle
    Go To   ${SERVER}
    
Verify Solved SUCCESSFUL LOGIN
    Wait Until Location Is  https://www.saucedemo.com/inventory.html

Verify Solved UNSUCCESSFUL LOGIN
    Element Should Contain  css:div.error-message-container h3  Username and password do not match
