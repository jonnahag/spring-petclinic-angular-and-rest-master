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
${EXPECTED_PETTYPES_PAGE}              Pet Types
${NEW_PETTYPE_NAME}                    bunny

*** Test Cases ***

Test add a new Pet Type
    [Documentation]                    Adding a new Pet Type
    [Tags]                             Add  Pet Type

    Given user is on the Pet Types page
    When a user have added a new Pet Type
    Then a user should be able to see the new Pet Type in the list


