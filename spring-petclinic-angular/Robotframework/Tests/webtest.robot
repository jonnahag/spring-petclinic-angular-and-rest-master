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
    Click Element               xpath://a[contains(text(),'Owners')]
    Click Element               xpath://a[contains(text(),'Owners')]/../ul/li[2]/a
    Input Text                  id=firstName            Sami
    Input Text                  id=lastName             Khelifi
    Input Text                  id=address              Salviagatan 30
    Input Text                  id=city                 Göteborg
    Input Text                  id=telephone            0704593989
    Click Element               xpath://div/button[contains(string(), "Add Owner")]


# _______________________________________________________________________
