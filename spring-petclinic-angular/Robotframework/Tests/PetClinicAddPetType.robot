*** Settings ***
Documentation                          Testar Selenium och RobotFramework
Resource                               ../Resources/PetclinicKeywords.robot
Library                                SeleniumLibrary
Test Setup                             Begin WebTest
Test Teardown                          End Web Test

*** Variables ***
${BROWSER}                             chrome
${URL}                                 http://localhost:4200/
${Welcome_Message}                     Welcome to Petclinic

*** Test Cases ***

Test add a new owner
    [Documentation]                    Adding a new owner
    [Tags]                             Add


