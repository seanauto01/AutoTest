*** Settings ***
Documentation     A resource file with reusable keywords and variables for Submitting New Application.
Library           SeleniumLibrary

*** Variables ***
${FIRST_NAME}     Test
${LAST_NAME}      Last
${ADDRESS}        Address#123123
${POSTAL}         1000
${COUNTRY}        PH
${ROLE}           7026c894-4e85-5e16-910a-b19ca1013c74
${IMAGE}          ${CURDIR}/Gojo.jpg
${CAREER_OBJECTIVE}    None

#Locators
${SUBMIT_NEW_APPLICATION_BUTTON_HOME_PAGE_LOCATOR}               css:a.btn.btn-primary.btn-lg.col-md-auto
${CONTINUE_SUBMISSION_OF_APPLICATION_LOCATOR}                    css:h1[class="h1"]
${SUBMIT_NEW_APPLICATION_BUTTON_IN_CONTINUE_PAGE_LOCATOR}        css:a[class="btn btn-outline-primary"]
${THANK_YOU_FOR_SUBMITTING_YOUR_PROJECT_TEXT_LOCATOR}            css:h1[class='h1 text-center']
${SUMMARY_PAGE_LOCATOR}                                          css:div.card.stepper__item.stepper__item--active
${VALIDATE_AND_SEND_BUTTON_LOCATOR}                              css:body > div:nth-child(1) > main:nth-child(6) > div:nth-child(1) > div:nth-child(1) > div:nth-child(32) > div:nth-child(1) > form:nth-child(1) > div:nth-child(4) > div:nth-child(2) > div:nth-child(4) > div:nth-child(2) > button:nth-child(1)

#Fill Out Form Locators
${FILL_OUT_FORM_PAGE_LOCATOR}                                    css:a.card-header.h2.stepper__label.stepper__label--active
${FIRST_NAME_TEXTBOX_LOCATOR}                                    css:body > div:nth-child(1) > main:nth-child(6) > div:nth-child(1) > div:nth-child(1) > div:nth-child(31) > div:nth-child(1) > form:nth-child(1) > div:nth-child(4) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > fieldset:nth-child(1) > div:nth-child(2) > div:nth-child(1) > fieldset:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > input:nth-child(1)
${LAST_NAME_TEXTBOX_LOCATOR}                                     css:body > div:nth-child(1) > main:nth-child(6) > div:nth-child(1) > div:nth-child(1) > div:nth-child(31) > div:nth-child(1) > form:nth-child(1) > div:nth-child(4) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > fieldset:nth-child(1) > div:nth-child(2) > div:nth-child(1) > fieldset:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > input:nth-child(1)
${ADDRESS_TEXTBOX_LOCATOR}                                       css:body > div:nth-child(1) > main:nth-child(6) > div:nth-child(1) > div:nth-child(1) > div:nth-child(31) > div:nth-child(1) > form:nth-child(1) > div:nth-child(4) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > fieldset:nth-child(1) > div:nth-child(2) > div:nth-child(2) > fieldset:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > textarea:nth-child(1)
${POSTAL_TEXTBOX_LOCATOR}                                        css:input[name='131e1102-02ae-5770-b1a5-df15fcdd4733::e57df0b5-c2ad-514a-967f-ee8b962f5ed4']
${POSTAL_SELECTION_LOCATOR}                                      css:a#ui-id-2
${COUNTRY_DROPDOWN_LOCATOR}                                      css:body > div:nth-child(1) > main:nth-child(6) > div:nth-child(1) > div:nth-child(1) > div:nth-child(31) > div:nth-child(1) > form:nth-child(1) > div:nth-child(4) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > fieldset:nth-child(1) > div:nth-child(2) > div:nth-child(2) > fieldset:nth-child(1) > div:nth-child(2) > div:nth-child(3) > div:nth-child(2) > div:nth-child(1) > div:nth-child(2) > select:nth-child(1)
${IFRAME_LOCATOR}                                                //*[@id="cke_1_contents"]/iframe
${IFRAME_TEXT_EDITOR_LOCATOR}                                    class:cke_editable.cke_editable_themed.cke_contents_ltr.cke_show_borders
${UPLOAD_IMAGE_LOCATOR}                                          css:input[name='Filedata']
${GENDER_MALE_RADIO_BUTTON_LOCATOR}                              css:label[aria-label='Male'] div[class='custom-control-label radio-checkbox-li-element-label']
${ROLE_DROPDOWN_LOCATOR}                                         css:select#field_f801d7d8-0762-5407-95f9-b8c3a793157c
${ROBOT_CHECKBOX_LOCATOR}                                        css:label[aria-label='Robot Framework'] div[class='custom-control-label radio-checkbox-li-element-label']
${NEXT_SCREEN_BUTTON_LOCATOR}                                    css:button#navButtonNext

*** Keywords ***
the Application is submitted
    Click Link    ${SUBMIT_NEW_APPLICATION_BUTTON_HOME_PAGE_LOCATOR}
    Wait Until Element Contains    ${CONTINUE_SUBMISSION_OF_APPLICATION_LOCATOR}    Continue with the submission of an application
    Click Link    ${SUBMIT_NEW_APPLICATION_BUTTON_IN_CONTINUE_PAGE_LOCATOR}
    Wait Until Element Contains    ${FILL_OUT_FORM_PAGE_LOCATOR}    Fill-out all forms
    Fill Out Form
    Sleep    3s
    Click Button    ${NEXT_SCREEN_BUTTON_LOCATOR}
    Sleep    15s
    Wait Until Element Contains    ${SUMMARY_PAGE_LOCATOR}    Summary
    Sleep    3s
    Click Button    ${VALIDATE_AND_SEND_BUTTON_LOCATOR}
    Wait Until Element Contains    ${THANK_YOU_FOR_SUBMITTING_YOUR_PROJECT_TEXT_LOCATOR}    Thank you for submitting your project

Fill Out Form
    Input Text    ${FIRST_NAME_TEXTBOX_LOCATOR}    ${FIRST_NAME}
    Input Text    ${LAST_NAME_TEXTBOX_LOCATOR}     ${LAST_NAME}
    Input Text    ${ADDRESS_TEXTBOX_LOCATOR}       ${ADDRESS}
    Input Text    ${POSTAL_TEXTBOX_LOCATOR}        ${POSTAL}
    Sleep    3s
    Click Element    ${POSTAL_SELECTION_LOCATOR}
    Select From List By Value    ${COUNTRY_DROPDOWN_LOCATOR}    ${COUNTRY}
    Choose File    ${UPLOAD_IMAGE_LOCATOR}    ${IMAGE}
    Click Element    ${GENDER_MALE_RADIO_BUTTON_LOCATOR}
    Select From List By Value    ${ROLE_DROPDOWN_LOCATOR}    ${ROLE}
    Click Element    ${ROBOT_CHECKBOX_LOCATOR}
    Select Frame    ${IFRAME_LOCATOR}
    Wait Until Element is Visible    ${IFRAME_TEXT_EDITOR_LOCATOR}
    Input Text    ${IFRAME_TEXT_EDITOR_LOCATOR}     ${CAREER_OBJECTIVE}
    Unselect Frame 