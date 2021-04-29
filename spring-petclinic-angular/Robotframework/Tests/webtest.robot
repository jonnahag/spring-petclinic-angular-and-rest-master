*** Settings ***
Documentation                Testar Selenium och RobotFramework
Resource                     ../Resources/keywords.robot
Library                      SeleniumLibrary
Test Setup                   Begin Web Test
Test Teardown                End Web Test

*** Variables ***
${BROWSER}          chrome
${URL}              http://localhost:4200
${EXPECTED_PET}     cat
${CONFIGURED_PET}   Donkey

*** Test Cases ***


Testcase 1: Test so that user can accses Petsclinic website.
    [Documentation]             Test for accessing website Petclinic
    [Tags]                      Access_test
    Given Go to Web Page

Testcase 2: Test so that if the user clicks on Pet Types all Pet Types show.
    [Documentation]             Test to se all Pet Types
    [Tags]                      PetTypes_test
    Given Go to Web Page
    When Go to list of all Pet Types

Testcase 3: Test so that user can configure the different Pet Types
    [Documentation]             Test to configure Pet Types
    [Tags]                      ConfigurePetTypes_test
    Given Go to Web Page
    When Go to list of all Pet Types
    And Configure Pet Type
    Then End Web Test

# _______________________________________________________________________
