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
${New_Adress}                               LinnePlatsen100
${New_City}                                 Göteborg
${New_Telephone}                            12345678
${TelephoneNo_Alphabets}                    ABCD
${ErorrMessage_AcceptsDigits}               Phone number only accept digits
${ErorrMessge_Required}                     Address is required

*** Test Cases ***
Editing a Owner Details in petclinic website
  [Documentation]                          Testing Editing Owner Details and verifying
  [Tags]                                   Editing A Owner and verifying
  Given Go To Web Page
  When All Owners
  And Select A Owner From The List
  And Edit Owner
  And Owner New Detalis                   ${New_Adress}   ${New_City}   ${New_Telephone}
  Then Verify Owner New Detalis Added

*** Test Cases ***
Editing a Owner Details With Invalid Values
  [Documentation]                          Editing Owner Telephone Number with Alphabets and verifying
  [Tags]                                   Editing With Alphabets and Erorr Message Should Come
  Given Go To Web Page
  When All Owners
  And Select A Owner From The List
  And Edit Owner
  And Owner New Detalis                   ${New_Adress}   ${New_City}   ${TelephoneNo_Alphabets}
  Then Verify Erorr Message Displayed Or Not

*** Test Cases ***
Editing a Owner Details With Empty Details/Values
  [Documentation]                          Leaving any Of The Details Empty and verifying
  [Tags]                                   Empty Detail Box and Erorr Message Should Come
  Given Go To Web Page
  When All Owners
  And Select A Owner From The List
  And Edit Owner
  And Owner Detalis With Empty Box         ${New_Telephone}
  Then Verify Erorr Messages With Red Box
