*** Settings ***
Documentation                               Infotiv Petclinic Test Functionality
Resource                                    ../Resources/PetclinicKeywords.robot
Library                                     SeleniumLibrary
Test Setup                                  Begin WebTest
Test Teardown                               End Web Test

*** Variables ***
${BROWSER}                                  chrome
${URL}                                      http://localhost:4200/

*** Test Cases ***
Adding a new pet to petclinic website
  [Documentation]                          Testing adding a newpet and verifying
  [Tags]                                   Testing adding a newpet and verifying
  Given Go To Web Page
  When All Owners
  And Select a owner and Add New Pet
  And Input New Pet Detalis
  And Pet Details                             Tommy                 2021/04/19
  Then Verify Pet Adedd To owner
*** Test Cases ***
Editing A pet in petclinic website
  [Documentation]                          Testing Edit A Pet With New Name And Verifying
  [Tags]                                   Testing Edit A Pet With New Name And Verifying
  Given Go To Web Page
  And All Owners
  When Edit a Pet
  And Give a New Pet name                     Storm
  Then Verify New Edited Pet
