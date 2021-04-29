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

     ${actualTerm}                                 get text     xpath:/html/body/app-root/app-welcome/h1

     Should Be Equal                               Welcome to Petclinic    ${actualTerm}

Go to list of all owners
     Click element                                 xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/a
     Click element                                 xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a
Select an owner
     ${Expecting_Owner1}                           Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[8]/td[1]/a
     ${Expecting_Pet1}                             Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[8]/td[5]/tr
     Click element                                 xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[8]/td[1]/a
Inspect same owner and pet but click on different owner
     ${Expecting_Owner1}                           Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[8]/td[1]/a
     ${Expecting_Pet1}                             Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[8]/td[5]/tr
Click on different owner
     Click element                                 xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[7]/td[1]/a
Inspect on one owner and other's pet but click on same owner
     ${Expecting_Owner2}                           Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[9]/td[1]/a
     ${Expecting_Pet2}                             Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[5]/td[5]/tr
     Click element                                 xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[4]/td[1]/a
Select an owner with 2 pets
     ${Expecting_Owner3}                         Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[3]/td[1]/a
     ${Expecting_PetA}                           Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[3]/td[5]/tr[1]
     ${Expecting_PetB}                           Get Text    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[3]/td[5]/tr[2]
     Click element                               xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[3]/td[1]/a
Verify selected Owner is with rightful pet 1
     ${Actual_Pet1}                                Get Text     xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/dd[1]
     ${Actual_Owner1}                              Get Text     xpath:/html/body/app-root/app-owner-detail/div/div/table[1]/tr[1]/td/b
     Should Be Equal                               ${Expecting_Owner1}${Expecting_Pet1}    ${Actual_Owner1}${Actual_Pet1}
     Sleep                                         .25
Verify selected Owner is not with rightful pet 1 or test case fails
     ${Actual_Pet1}                                 Get Text      xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/dd[1]
     ${Actual_Owner1}                               Get Text       xpath:/html/body/app-root/app-owner-detail/div/div/table[1]/tr[1]/td/b
     #Should Be Equal                                ${Expecting_Owner1}${Expecting_Pet1}    ${Actual_Owner1}${Actual_Pet1}
     Should Not Be Equal                            ${Expecting_Owner1}${Expecting_Pet1}    ${Actual_Owner1}${Actual_Pet1}
     Sleep                                          .25
Verify selected Owner is not with rightful pet 2 or testcase fails
     ${Actual_Pet2}                                 Get Text       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/dd[1]

     ${Actual_Owner2}                               Get Text       xpath:/html/body/app-root/app-owner-detail/div/div/table[1]/tr[1]/td/b
    #Should Be Equal(testcase fails)                ${Expecting_Owner2}${Expecting_Pet2}    ${Actual_Owner2} ${Actual_Pet2}
     Should Not Be Equal                            ${Expecting_Owner2}${Expecting_Pet2}    ${Actual_Owner2} ${Actual_Pet2}

     Sleep                                          .25
Verify whether selected Owner is with rightful pet(2 pets)
     ${Actual_PetA}                              Get Text     xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[1]/dl/dd[1]
     ${Actual_PetB}                              Get Text     xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/dd[1]
     ${Actual_Owner3}                            Get Text     xpath:/html/body/app-root/app-owner-detail/div/div/table[1]/tr[1]/td/b
     Should Be Equal                             ${Expecting_Owner3}${Expecting_PetA}${Expecting_PetB}     ${Actual_Owner3}${Actual_PetA}${Actual_PetB}
     Sleep                                       .25
End Web Test
     Close Browser
