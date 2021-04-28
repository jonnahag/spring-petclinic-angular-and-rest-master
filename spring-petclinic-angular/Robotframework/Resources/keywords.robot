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
    Input Text                     id=address              Zooet
    Input Text                     id=city                 Göteborg
    Input Text                     id=telephone            070234234
    Click Element                  xpath://div/button[contains(string(), "Add Owner")]

Then a new owner should be created

    Click Element                   xpath://a[contains(text(),'Owners')]
    wait until page contains        Owners
    Click Element                   xpath://a/span[contains(text(),'All')]
    wait until page contains        Hallof

#__________________________________________________________________________________________________________

#test 2

Given that the user is on the landing pagee

    Begin Web Test

When a user Creates a new ownerr

    Click Element               xpath://a[contains(text(),'Owners')]
    wait until page contains    Owners
    Click Element               xpath://a[contains(text(),'Owners')]/../ul/li[2]/a
    wait until page contains    Owners
    Input Text                  id=firstName            343434
    Input Text                  id=lastName             934982
    Input Text                  id=address              Glasvägen 33
    Input Text                  id=city                 Göteborg
    Input Text                  id=telephone            0702342345
    Click Element               xpath://div/button[contains(string(), "Add Owner")]

Then a new owner should be createdd

    Click Element                   xpath://a[contains(text(),'Owners')]
    wait until page contains        Owners
    Click Element                   xpath://a/span[contains(text(),'All')]
    wait until page contains        All
    Page should contain             3459834

#____________________________________________________________________________
#test 3

Given that user is on landing paage
    Begin Web Test

When When a user Creates a new owneer
    Click Element                  xpath://a[contains(text(),'Owners')]
    wait until page contains       Owners
    Click Element                  xpath://a[contains(text(),'Owners')]/../ul/li[2]/a
    wait until page contains       Owners

And put already existing personal data
    Input Text                     id=firstName            ${Firstname}
    Input Text                     id=lastName             ${Lastname}
    Input Text                     id=address              Glasvägen 33
    Input Text                     id=city                 Göteborg
    Input Text                     id=telephone            0702342345
    Click Element                  xpath://div/button[contains(string(), "Add Owner")]

Then a duplicate of the owner should be added
    Click Element                   xpath://a[contains(text(),'Owners')]
    wait until page contains        Owners
    Click Element                   xpath://a/span[contains(text(),'All')]
    wait until page contains        Hallof

#____________________________________________________________________________
#test4

Given that the user is on the landing pageee
    Begin Web Test

When a user Creates a new ownner
    Click Element                  xpath://a[contains(text(),'Owners')]
    wait until page contains       Owners
    Click Element                  xpath://a[contains(text(),'Owners')]/../ul/li[2]/a
    wait until page contains       Owners

And use special signs for input in name field
    Click Element               xpath://a[contains(text(),'Owners')]
    wait until page contains    Owners
    Click Element               xpath://a[contains(text(),'Owners')]/../ul/li[2]/a
    wait until page contains    Owners
    Input Text                  id=firstName            >Matt#<
    Input Text                  id=lastName             Uber!
    Input Text                  id=address              Glasvägen 33
    Input Text                  id=city                 Göteborg
    Input Text                  id=telephone            0702342345
    Click Element               xpath://div/button[contains(string(), "Add Owner")]

Then a new owner should be creatted
    Click Element                   xpath://a[contains(text(),'Owners')]
    wait until page contains        Owners
    Click Element                   xpath://a/span[contains(text(),'All')]
    wait until page contains        All
    Page should contain             >Matt#<





End Web Test

   Close Browser
