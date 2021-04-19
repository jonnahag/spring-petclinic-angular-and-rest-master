*** Keywords ***


Begin Web Test
     Open browser                                  about:blank       ${BROWSER}
     Set Selenium Speed                            .5
Go to Web Page
     Load Page
     Verify Page Loaded
Load Page
     Go to                                         ${URL}
Verify Page Loaded

     ${actualTerm}                                   get text     xpath:/html/body/app-root/app-welcome/h1
     Should Be Equal                                 Welcome to Petclinic    ${actualTerm}
Rightfull Pet to the rightfull owner
     Going to list of all owners page
     Select owner from the list of all owners
     Verify Owner with rightful pet
Going to list of all owners page
    Click element                                    xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/a


    Click element                                    xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a

Select owner from the list of all owners
    ${expecting_ownwer}                              Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[8]/td[1]/a
    ${expecting_pet}                                 Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[8]/td[5]/tr
    Click element                                    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[8]/td[1]/a

Verify Owner with rightful pet
    ${actual_pet}                                    Get Text     xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/dd[1]
    ${actual_owner}                                  Get Text     xpath:/html/body/app-root/app-owner-detail/div/div/table[1]/tr[1]/td/b

    Should Be Equal                                  ${expecting_ownwer}${expecting_pet}    ${actual_owner}${actual_pet}
    Sleep                                            .25

End Web Test
    Close Browser
