*** Settings ***
Library    SeleniumLibrary
*** Keywords ***
Suite settings
    Set Selenium Timeout                    5 seconds

Begin Web Test
    Open browser                            about:blank   ${BROWSER}
    Maximize Browser Window
    Go to                                   ${URL}


Load Page
    Go to                                  ${URL}
Verify Page Loaded
    Wait Until Page Contains        SpringPetclinicAngular

#____________________________________________________________
#test 1
Given that the user is on the landing page
    Begin Web Test

When a user Creates a new owner

    Click Element                  xpath://a[contains(text(),'Owners')]
    wait until page contains       Owners
    Click Element                  xpath://a[contains(text(),'Owners')]/../ul/li[2]/a
    wait until page contains       Owners
    Input Text                     id=firstName            ${Firstname}
    Input Text                     id=lastName             ${Lastname}
    Input Text                     id=address              ${Adress1}
    Input Text                     id=city                 ${City1}
    Input Text                     id=telephone            ${Mobile1}
    Click Element                  xpath://div/button[contains(string(), "Add Owner")]

Then a new owner should be created

    Click Element                   xpath://a[contains(text(),'Owners')]
    wait until page contains        Owners
    Click Element                   xpath://a/span[contains(text(),'All')]
    page should contain             ${Firstname}

#__________________________________________________________________________________________________________

#test 2

Given that the user has acces to the web page

    Begin Web Test

When a user creates a new owner with variables instead of letters

    Click Element               xpath://a[contains(text(),'Owners')]
    wait until page contains    Owners
    Click Element               xpath://a[contains(text(),'Owners')]/../ul/li[2]/a
    wait until page contains    Owners
    Input Text                  id=firstName            ${Firstname2}
    Input Text                  id=lastName             ${Firstname2}
    Input Text                  id=address              ${Adress2}
    Input Text                  id=city                 ${City2}
    Input Text                  id=telephone            ${Mobile2}
    Click Element               xpath://div/button[contains(string(), "Add Owner")]

Then a new owner should be added to the list


    Click Element                   xpath://a[contains(text(),'Owners')]
    wait until page contains        Owners
    Click Element                   xpath://a/span[contains(text(),'All')]
    wait until page contains        All
    Page should contain             ${Firstname2}

#____________________________________________________________________________
#test 3

Given user is on the landing page
    Begin Web Test

When the user Creates a new owner
    Click Element                  xpath://a[contains(text(),'Owners')]
    wait until page contains       Owners
    Click Element                  xpath://a[contains(text(),'Owners')]/../ul/li[2]/a
    wait until page contains       Owners

And put already existing personal data
    Input Text                     id=firstName            ${Firstname}
    Input Text                     id=lastName             ${Lastname}
    Input Text                     id=address              ${Adress1}
    Input Text                     id=city                 ${City1}
    Input Text                     id=telephone            ${Mobile1}
    Click Element                  xpath://div/button[contains(string(), "Add Owner")]

Then a duplicate of the owner should be added
    Click Element                   xpath://a[contains(text(),'Owners')]
    wait until page contains        Owners
    Click Element                   xpath://a/span[contains(text(),'All')]
    page should contain             ${Firstname}

#____________________________________________________________________________
#test4

Given user is located on landing page
    Begin Web Test

When the user creates new owner

    Click Element                  xpath://a[contains(text(),'Owners')]
    wait until page contains       Owners
    Click Element                  xpath://a[contains(text(),'Owners')]/../ul/li[2]/a
    wait until page contains       Owners

And use special signs for input in name field
    Click Element               xpath://a[contains(text(),'Owners')]
    wait until page contains    Owners
    Click Element               xpath://a[contains(text(),'Owners')]/../ul/li[2]/a
    wait until page contains    Owners
    Input Text                  id=firstName            ${Firstname3}
    Input Text                  id=lastName             ${Lastname3}
    Input Text                  id=address              ${Adress2}
    Input Text                  id=city                 ${City2}
    Input Text                  id=telephone            ${Mobile2}
    Click Element               xpath://div/button[contains(string(), "Add Owner")]

Then the new owner should be created

    Click Element                   xpath://a[contains(text(),'Owners')]
    wait until page contains        Owners
    Click Element                   xpath://a/span[contains(text(),'All')]
    wait until page contains        All
    Page should contain             ${Firstname3}





End Web Test

   Close Browser
