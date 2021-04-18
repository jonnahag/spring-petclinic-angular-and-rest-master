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
  [Tags]                                   Test case-1
  Given Go To Web Page
  Pet Types
  Add Pet                                 Rabbit
  Verify Pet Type Added                   Rabbit
*** Test Cases ***
Editing A pet to petclinic website
  [Documentation]                          Testing Edit A Pet With New Name And Verifying
  [Tags]                                   Test case-2
  Given Go To Web Page
  Pet Types
  Edit A Pet
  Give a New Pet name                      Squirell



