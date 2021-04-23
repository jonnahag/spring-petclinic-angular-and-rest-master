*** Settings ***
Documentation                                      This is some basic  info about the whole test suite
Resource                                            ../Resources/PetKeywords.robot
Library                                            SeleniumLibrary
Test Setup                                         Begin Web Test
Test Teardown                                      End Web Test

*** Variables ***

${BROWSER}                                         chrome
${URL}                                             http://localhost:4200/
${expecting_pet}                                   Mulligan
${expecting_ownwer}                                Maria Escobito


*** Test Cases ***
Validate if pet is connected to the rightful owner or not
   [Documentation]                                   To test if pet is connected to rightful owner
   [Tags]                                            Test 1 To Validate pet is connected to rightful owner
    Given Go to Web Page
    When Select all owners option and go to list of all owners
    And Select any owner from the list of all owners
    Then Verify whether selected Owner is with rightful pet
