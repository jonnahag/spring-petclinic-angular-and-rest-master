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
${Firstname}                           Anna
${Lastname}                            Ramsey
${Firstname2}                          343434
${Lastname2}                           934982
${Firstname3}                          >Matt#<
${Lastname3}                           Uber!
${Adress1}                             Zooet
${City1}                               Göteborg
${Mobile1}                             070234234
${Adress2}                             Glasvägen 33
${City2}                               Göteborg
${Mobile2}                             0702342343

*** Test Cases ***

Test add a new owner
    [Documentation]                    Adding a new owner
    [Tags]                             Add

    Given that the user is on the landing page
    When a user Creates a new owner
    Then a new owner should be created

#________________________________________________________________________________________

Test to insert variables as name and lasname

  [Documentation]                     Variables as input for name/lastname
  [Tags]                              Test 2 Variables for input text

  Given that the user has acces to the web page
  When a user creates a new owner with variables instead of letters
  Then a new owner should be added to the list
#___________________________________________________________________

Test to add a owner that already exist

  [Documentation]                    Adding already existing owner
  [Tags]                             Test 3 Add same owner


  Given user is on the landing page
  When the user Creates a new owner
  And put already existing personal data
  Then a duplicate of the owner should be added


#________________________________________________________________________________________
Test to add owner with special signs

    [Documentation]                 input with special signs
    [Tags]                          Test 4 special signs

    Given user is located on landing page
    When the user creates new owner
    And use special signs for input in name field
    Then the new owner should be created
