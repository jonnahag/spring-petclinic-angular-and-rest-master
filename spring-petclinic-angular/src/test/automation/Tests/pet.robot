*** Settings ***
Documentation                              This is some basic  info about the whole test suite
Resource                                   ../Resources/PetKeywords.robot
Library                                    SeleniumLibrary
Test Setup                                 Begin Web Test
Test Teardown                              End Web Test

*** Variables ***

${BROWSER}                                 chrome
${URL}                                     http://localhost:4200/
${expecting_pet}                           Mulligan
${expecting_owner}                         Maria Escobito
${expecting_owner1}                        Harold Davis
${expecting_pet1}                          George
#${Valid_pet}                               Mulligan
#${Valid_owner}                             Maria Escobito
#${Invalid_owner}                           Harold Davis
#${Invalid_pet}                             George
#${Empty_owner}                             Empty
#${Empty_pet}                               Empty
*** Test Cases ***
Validate if pet is connected to the rightful owner or not
   [Documentation]                         To test if pet is connected to rightful owner
   [Tags]                                  Test 1 To Validate pet is connected to rightful owner
    Given Go to Web Page
    When Go to list of all owners
    And Select an owner
    Then Verify selected Owner is with rightful pet

Testcase 2 Invalid Owner
    [Documentation]                         To test if pet is not connected to rightful owner
    [Tags]                                  Test 2 To Validate pet is not connected to rightful owner
     Given Go to Web Page
     When Go to list of all owners
     And Inspect same owner and pet but click on different owner
     And click on different owner
     Then Verify selected Owner is not with rightful pet or test case fails

Testcase 3 Invalid Pet
    [Documentation]                         To test if pet is not connected to rightful owner
    [Tags]                                  Test 3 To Validate pet is not connected to rightful owner
     Given Go to Web Page
     When Go to list of all owners
     And Inspect on one owner and other's pet but click on same owner
     Then Verify selected Owner is not with rightful pet 1 or test case fails


#*** Test Cases ***               Owner name        Pet                   click owner
#Invalid pet                      same             not same                same
#Invalid click owner              same             same                    not
#Invalid Owner name And Pet       not              not                     same
#Empty Owner name                 not              same                    same
#Empty  Owner name And Pet        empty            empty                   same

