*** Settings ***
Documentation     A resource file with reusable keywords and variables for Login.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}                     Chrome
${URL}                         https://automationinterface1.front.staging.optimy.net/en/
${USER}                        optimyautomationtester@gmail.com
${PASSWORD}                    yRMhojb7

#Locators
${COOKIES_HEADER_LOCATOR}                css:h1#cookies-label
${ALLOW_ALL_COOKIES_BUTTON_LOCATOR}      css:button#cookie-allow-all-button
${LOGIN_BUTTON_LOCATOR}           css:a[href*="login"]
${IDENTIFICATION_TEXT_LOCATOR}    css:h1[class="h1"]
${LOGIN_SUBMIT_BUTTON_LOCATOR}    css:button[class="btn btn-lg btn-primary col-12 mt-1 mt-md-2"]
${USERNAME_TEXTBOX_LOCATOR}       css:input#login-email
${PASSWORD_TEXTBOX_LOCATOR}       css:input#login-password
${USER_MENU_LOCATOR}              css:button#user-menu
${LOGOUT_SELECTOR_LOCATOR}        css:a[href*="logout"]

*** Keywords ***
the Browser Opened to Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Contains    ${COOKIES_HEADER_LOCATOR}    This website uses cookies
    Click Button    ${ALLOW_ALL_COOKIES_BUTTON_LOCATOR}
    Wait Until Element Contains    ${LOGIN_BUTTON_LOCATOR}    Login
    Click Link    ${LOGIN_BUTTON_LOCATOR}
    Login Page should be Open

the User Logs in the Credentials
    Input Username    ${USER}
    Input Password    ${PASSWORD}
    Click Button      ${LOGIN_SUBMIT_BUTTON_LOCATOR}

the User Login Successfully
    Click Button    ${USER_MENU_LOCATOR}
    Element Should Contain    ${LOGOUT_SELECTOR_LOCATOR}    Logout

Login Page should be Open
    Element Should Contain    ${IDENTIFICATION_TEXT_LOCATOR}    Identification

Input Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_TEXTBOX_LOCATOR}    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_TEXTBOX_LOCATOR}    ${password}


