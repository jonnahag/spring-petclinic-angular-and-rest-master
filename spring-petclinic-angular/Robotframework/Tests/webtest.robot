*** Settings ***
Documentation                Testar Selenium och RobotFramework
Resource                     ../Resources/keywords.robot
Library                      SeleniumLibrary
Suite Setup                 Suite settings
Test Setup                  Begin Web Test
Suite Teardown              End Web Test

*** Variables ***
${BROWSER}      headless chrome
${URL}          http://localhost:4200
${Firstname}        Hallof
${Lastname}         Ramsey


*** Test Cases ***

Test add a new owner
    [Documentation]         Adding a new owner
    [Tags]                  Test 1 Add new owner

    Given that the user is on the landing page
    When a user Creates a new owner
    Then a new owner should be created

#________________________________________________________________________________________

Test to insert variables as name and lasname

  [Documentation]         Variables as input for name/lastname
  [Tags]                  Test 2 Variables for input text

  Given that the user is on the landing pagee
  When a user Creates a new ownerr
  Then a new owner should be createdd
#___________________________________________________________________

Test to add a owner that already exist

  [Documentation]         Adding already existing owner
  [Tags]                  Test 3 Add same owner


  Given that user is on landing paage
  When When a user Creates a new owneer
  And put already existing personal data
  Then a duplicate of the owner should be added




#________________________________________________________________________________________
Test to add owner with special signs

    [Documentation]     input with special signs
    [Tags]              Test 4 special signs

    Given that the user is on the landing pageee
    When a user Creates a new ownner
    And use special signs for input in name field
    Then a new owner should be creatted
