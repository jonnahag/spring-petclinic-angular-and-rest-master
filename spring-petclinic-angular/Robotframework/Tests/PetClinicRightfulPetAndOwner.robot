*** Settings ***
Documentation                              This is some basic  info about the whole test suite
Resource                                   ../Resources/PetclinicKeywords.robot
Library                                    SeleniumLibrary
Test Setup                                 Begin Web Test
Test Teardown                              End Web Test

*** Variables ***

${BROWSER}                                 chrome
${URL}                                     http://localhost:4200/
${Welcome_Message}                         Welcome to Petclinic
${Expecting_Pet1}                          Mulligan
${Expecting_Owner1}                        Maria Escobito
${Expecting_Owner2}                        Harold Davis
${Expecting_Pet2}                          George
${Expecting_PetA}                          Jewel
${Expecting_PetB}                          Rosy
${Expecting_Owner3}                        Eduardo Rodriquez
${Error_Message}                           Maria EscobitoMulligan != Jeff BlackLucky



*** Test Cases ***

Testcase 1 Validate if pet is connected to the rightful owner or not
   [Documentation]                         To test if pet is connected to rightful owner
   [Tags]                                  Test 1 To Validate pet is connected to rightful owner
    Given Go To Web Page
    When All Owners
    And Select an owner
    Then Verify selected Owner is with rightful pet 1

Testcase 2 Invalid Owner
    [Documentation]                         To test if pet is not connected to rightful owner
    [Tags]                                  Test 2 To Validate pet is not connected to rightful owner
    Given Go To Web Page
    When All Owners
     And Inspect same owner and pet but click on different owner
     And Click on different owner
     Then Verify selected Owner is not with rightful pet 1 or test case fails

Testcase 3 Invalid Pet
    [Documentation]                         To test if pet is not connected to rightful owner
    [Tags]                                  Test 3 To Validate pet is not connected to rightful owner
     Given Go To Web Page
    When All Owners
     And Inspect on one owner and other's pet but click on same owner
     Then Verify selected Owner is not with rightful pet 2 or test case fails
Testcase 4 Validate if pet(2 pets) are connected to the rightful owner
     [Documentation]                         To test if pets are connected to rightful owner
     [Tags]                                  Test 4 To Validate pets are connected to rightful owner
     Given Go To Web Page
     When All Owners
     And Select an owner with 2 pets
     Then Verify whether selected Owner is with rightful pet(2 pets)




