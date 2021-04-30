*** Settings ***
Documentation    This is some basic information about adding a new Owner and assign a pet to the owner
Library          Selenium Library


*** Variables ***
${url}                       http://localhost:4200/petclinic/welcome
${BROWSER}                   headlesschrome
${OWNERS}                    /html/body/app-root/div[1]/nav/div/ul/li[2]/a
${ADD_NEW_OWNER}             /html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[2]/a
${OWNER_menu}                /html/body/app-root/div[1]/nav/div/ul/li[2]/ul
${NEW_OWNER}                  /html/body/app-root/div[1]/nav/div/ul/li[2]/ul

*** Test Cases ***
Add an Owner to Spring PetClinic
    [Documentation]         This is the information to add an Owner
    [Tags]    UI_TEST
    Given User opens An Application
    And User Selects Owners
    Then User Selects ADD NEW
    Then User Fills Up the Information
    Then User Clicks on Add Owner
    Then Owner is addded in Owners List
    Then User Scrolls Page and Select an Owner's Name
    Then User Clicks on Edit Owner
    Then User Fills Up the Information
    Then User Clicks on Update Owner Button
    Then User Clicks on Add New Pet Button
    Then Add Pet Page gets displayed
    Then User Fills Up Pet Information
    Then User Clicks On Save Pet Button
    Then User Clicks On Add Visit
    Then User Selects Date
    Then User Add Description
    Then User Clicks On Add Visit
    Then User Clicks On Edit Pet
    Then User Fills Up Pet Information
    Then User Clicks On Update Pet
    Then User Clicks On Back Button
    Then User Goes Back To Owners List
    Then Close the Browser



*** Keywords ***
Provided precondition
    Setup system under test