*** Settings ***
Documentation                               Infotiv Petclinic Test Functionality
Resource                                    ../Resources/PetclinicKeywords.robot
Library                                     SeleniumLibrary
Test Setup                                  Begin WebTest
Test Teardown                               End Web Test

*** Variables ***
${BROWSER}                                  chrome
${URL}                                      http://localhost:4200/
${Welcome_Message}                          Welcome to Petclinic
${Give_New_PetName_1}                       Venus
${Give_New_PetName_2}                       Jupiter
${Give_New_PetName_3}                       Mars
${Give_New_PetName_4}                       Mercury
${NewPet_BirthDate}                         2021/04/19
${Verify_Owner}                             David Schroeder
${Verify_Pet_Added_1}                       Venus
${Verify_Pet_Added_2}                       Jupiter
${Verify_Pet_Added_4}                       Mercury

*** Test Cases ***
Adding a new pet to A Owner
  [Documentation]                          Testing adding a newpet and verifying
  [Tags]                                   Testing adding a newpet and verifying
  Given Go To Web Page
  When All Owners
  And Select A Owner From The List
  And Add New Pet
  And Input New Pet Detalis
  And Pet Details                             ${Give_New_PetName_1}                ${NewPet_BirthDate}
  Then Verify Pet Adedd To owner

*** Test Cases ***
Adding A New Pet To The Owner And verifying With Diffrent Owner
    [Documentation]                          Adding a newpet and verifying with InValid Owner
    [Tags]                                   Testing adding a newpet and verifying With Diffrent Owner
    Given Go To Web Page
    When All Owners
    And Select A Owner From The List
    And Add New Pet
    And Input New Pet Detalis
    And Pet Details                             ${Give_New_PetName_1}                ${NewPet_BirthDate}
    Then Verify Pet Added To Invalid Owner

*** Test Cases ***
Adding A New Pet To The Owner And verifying Pet Can Add Multiple Types
    [Documentation]                          Adding a newpet and verifying It Can Add Multile Times
    [Tags]                                   Testing adding Multiple Pets and verifying
    Given Go To Web Page
    When All Owners
    And Select A Owner From The List
    And Add New Pet
    And Input New Pet Detalis
    And Pet Details                             ${Give_New_PetName_1}                ${NewPet_BirthDate}
    And Add New Pet
    And Input New Pet Detalis
    And Pet Details                             ${Give_New_PetName_2}                ${NewPet_BirthDate}
    And Add New Pet
    And Input New Pet Detalis
    And Pet Details                             ${Give_New_PetName_3}                ${NewPet_BirthDate}
    Then Verifying Pet Can Add Multiple Times

*** Test Cases ***
Deleting A Newly Added Pet
    [Documentation]                            Adding And Deleting same Pet And Verifying
    [Tags]                                     Testing Deletiing Pet and verifying
    Given Go To Web Page
    When All Owners
    And Select A Owner From The List
    And Add New Pet
    And Input New Pet Detalis
    And Pet Details                             ${Give_New_PetName_4}                ${NewPet_BirthDate}
    And Deleting A Newly Added pet
    Then Verify Pet deleted














