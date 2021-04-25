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

Go to list of all owners
     Click element                                  xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/a

     Click element                                  xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a
Select an owner

     ${expecting_owner}                             Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[8]/td[1]/a

     ${expecting_pet}                               Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[8]/td[5]/tr

     Click element                                  xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[8]/td[1]/a

Inspect same owner and pet but click on different owner

     ${expecting_owner}                             Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[8]/td[1]/a

     ${expecting_pet}                               Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[8]/td[5]/tr

click on different owner

     Click element                                  xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[7]/td[1]/a

Inspect on one owner and other's pet but click on same owner


     ${expecting_owner1}                            Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[9]/td[1]/a
     ${expecting_pet1}                              Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[5]/td[5]/tr
     Click element                                  xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[4]/td[1]/a
Verify selected Owner is with rightful pet
     ${actual_pet}                                  Get Text     xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/dd[1]

     ${actual_owner}                                Get Text     xpath:/html/body/app-root/app-owner-detail/div/div/table[1]/tr[1]/td/b

     Should Be Equal                                ${expecting_owner}${expecting_pet}     ${actual_owner}${actual_pet}

     Sleep                                          .25

Verify selected Owner is not with rightful pet or test case fails
     ${actual_pet}                                  Get Text      xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/dd[1]

     ${actual_owner}                                Get Text       xpath:/html/body/app-root/app-owner-detail/div/div/table[1]/tr[1]/td/b
       #says testcase failed
    #Should Be Equal                                ${expecting_owner}${expecting_pet}    ${actual_owner}${actual_pet}


     Should Not Be Equal                            ${expecting_owner}${expecting_pet}   ${actual_owner}${actual_pet}

     Sleep                                          .25

Verify selected Owner is not with rightful pet 1 or test case fails
     ${actual_pet1}                                  Get Text       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/dd[1]

     ${actual_owner1}                                Get Text       xpath:/html/body/app-root/app-owner-detail/div/div/table[1]/tr[1]/td/b
       #says testcase failed
     #Should Be Equal                                ${expecting_owner1}${expecting_pet1}    ${actual_owner1}${actual_pet1}


     Should Not Be Equal                             ${expecting_owner1}${expecting_pet1}    ${actual_owner1}${actual_pet1}

     Sleep                                           .25

End Web Test
     Close Browser
