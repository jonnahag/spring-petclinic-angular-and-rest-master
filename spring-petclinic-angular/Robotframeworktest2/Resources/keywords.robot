*** Keywords ***
Begin Web Test
    Open browser                            about:blank   ${BROWSER}
    Maximize Browser Window
    Go to                                   ${URL}

Suite settings
    Set Selenium Timeout                    5 seconds


Load Page
    Go to                                  ${URL}
Verify Page Loaded
    Wait Until Page Contains        SpringPetclinicAngular

Given user is on the landing page

  Begin Web Test

When a user edit a owner

    Click element                   xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/a
    Click element                   xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a/span[2]
    Click element                   xpath://html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[5]/td[1]/a
    Click element                   xpath://html/body/app-root/app-owner-detail/div/div/button[2]


#____________________________________________________________________________________________

End Web Test
   Close Browser
