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
Validate if pet is connect to correct owner
   [Documentation]                                   To test if pet is connected to correct owner
   [Tags]                                            Test 1 To Validate pet is connected to correct owner
   Go to Web Page
   Rightfull Pet to the rightfull owner
