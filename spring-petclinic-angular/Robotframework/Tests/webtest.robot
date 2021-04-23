*** Settings ***
Documentation                Testar Selenium och RobotFramework
Resource                     ../Resources/keywords.robot
Library                      SeleniumLibrary
Test Setup                   Begin Web Test
Test Teardown                End Web Test

*** Variables ***
${BROWSER}      chrome
${URL}          http://localhost:4200


*** Test Cases ***


Access website
    [Documentation]             Test for accessing website Petclinic
    [Tags]                      Access_test
    Set Selenium Speed          0
    #Test website connection
    Wait until page contains    SpringPetclinicAngular
    Click Element               xpath:/html/body/app-root/div[1]/nav/div/ul/li[4]
    Click Element               xpath://*[@id="pettypes"]/tbody/tr[1]/td[2]/button[1]
    Input Text                  id=name   Donkey
    Click Element               xpath://*[@id="pettype"]/div[2]/div/button[1]
    Click Element               xpath:/html/body/app-root/div[1]/nav/div/ul/li[1]/a
    Wait Until Page Contains    SpringPetclinicAngular
    Close Browser


# _______________________________________________________________________
