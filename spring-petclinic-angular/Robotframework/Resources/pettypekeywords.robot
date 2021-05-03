*** Settings ***
Library    SeleniumLibrary
*** Keywords ***


Begin Web Test

     Open browser                                  about:blank       ${BROWSER}

     Maximize Browser Window

     Set Selenium Speed                            .5

Go to Web Page

     Load Page

     Verify Page Loaded

Load Page

     Go to                                         ${URL}
     Wait Until Page Contains                      Welcome to Petclinic

     Set Selenium Speed                            .5

Verify Page Loaded

     ${actualTerm}                                  get text     xpath:/html/body/app-root/app-welcome/h1

     Should Be Equal                                Welcome to Petclinic    ${actualTerm}

Go to list of all Pet Types

     Click element                                  xpath:/html/body/app-root/div[1]/nav/div/ul/li[4]

Configure Pet Type

     Click Element                                  xpath://*[@id="pettypes"]/tbody/tr[1]/td[2]/button[1]

     Input Text                                     xpath://*[@id="name"]   Donkey

     Click Element                                  xpath://*[@id="pettype"]/div[2]/div/button[1]

End Web Test

     Close Browser
