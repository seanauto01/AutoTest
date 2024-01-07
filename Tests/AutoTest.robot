*** Settings ***
Documentation     A test suite with Submitting New Application Successfully using Gherkin Style.

Resource          ../Resources/Login_Resources.robot
Resource          ../Resources/Submit_App_Resources.robot
# Test Teardown     Close Browser

*** Test Cases ***
Submit New Application Successfully
    Given the Browser Opened to Login Page
    When the User Logs in the Credentials
    Then the User Login Successfully
    And the Application is submitted