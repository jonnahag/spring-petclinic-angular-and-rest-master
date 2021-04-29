*** Settings ***
Documentation                Testar Selenium och RobotFramework
Resource                     ../Resources/keywords.robot
Library                      SeleniumLibrary
Test Setup                   Begin Web Test
Suite Teardown                End Web Test

*** Variables ***
${BROWSER}      headless chrome
${URL}          http://localhost:4200


*** Test Cases ***

Test edit owner

  [Documentation]         Gherkin2
  [Tags]                  Edit owner

  Given user is on the landing page
  When a user edit a owner
  Then the owner should be uppdated

#________________________________________________________________________________________
