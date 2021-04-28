*** Keywords ***
Test Navigates to chrome Home Page
Begin WebTest
    OPEN BROWSER                                       about:blank                         chrome
    Set Selenium Speed                                .5
Go To Web Page
     Load Page
     Verify Page Loaded
Load Page
     Go to                                            ${URL}
Verify Page Loaded
    ${actualTerm}                                     get text                            xpath:/html/body/app-root/app-welcome/h1
    Should Be Equal                                   ${Welcome_Message}                ${actualTerm}
All Owners
    Click Element                                    xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/a
    Click Element                                    xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a/span[2]
Select A Owner From The List
    Click Element                                    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[9]/td[1]/a
Add New Pet
     Click Element                                   xpath:/html/body/app-root/app-owner-detail/div/div/button[3]
Input New Pet Detalis
    Click Element                                    id=name
Pet Details
    [Arguments]                                      ${Pet_Name}                          ${Birth_Date}
    Name                                             ${Pet_Name}
    Birth Date                                       ${Birth_Date}
    Click Element                                    id=type
    Click Element                                    xpath://*[@id="type"]/option[2]
    Click Element                                    xpath:/html/body/app-root/app-pet-add/div/div/form/div[6]/div/button[2]
    Set Selenium Speed                                .5
Name
    [Arguments]                                       ${Pet_Name}
    Input Text                                        id=name                             ${Pet_Name}
Birth Date
    [Arguments]                                       ${Birth_Date}
    Input Text                                        xpath:/html/body/app-root/app-pet-add/div/div/form/div[4]/div/input          ${Birth_Date}


Verify Pet Adedd To owner
   ${pet_added}                                      get text                             xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/dd[1]
   Should Contain                                    ${Verify_Pet_Added_1}                 ${pet_added}
   Delete Pet After Verifying
Delete Pet After Verifying
    Click Element                                     xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/button[2]


Verify Pet Added To Invalid Owner
    Click Element                                    xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/a
    Click Element                                    xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a/span[2]
    Click Element                                    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[3]/td[1]/a
    ${link_text}                                    Get Title
    Should Not Be Equal                             ${Verify_Pet_Added_1}                  ${link_text}
    Delete Pet After Verifying in Invalid Owner
Delete Pet After Verifying in Invalid Owner
    All Owners
    Select A Owner From The List
    Delete Pet After Verifying


Verifying Pet Can Add Multiple Times
    ${2nd_Pet_Added}                                get text                             xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/dd[1]
    Should Be Equal                                 ${Verify_Pet_Added_2}                  ${2nd_Pet_Added}
    Delete Pet After Adding multiple Times And Verifying
Delete Pet After Adding multiple Times And Verifying
    Click Element                                   xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/button[2]
    #Click Back Button
    Click Element                                   xpath:/html/body/app-root/app-owner-detail/div/div/button[1]
    Select A Owner From The List
    Click Element                                   xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[3]/table/tr/td[1]/dl/button[2]
    Click Element                                   xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/button[2]


Deleting A Newly Added pet
    Click Element                                   xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/button[2]
    Verify Pet deleted
Verify Pet deleted
    ${Verify_DeletedPet}                            Get Title
    Should Not Be Equal                             ${Verify_Pet_Added_4}                  ${Verify_DeletedPet}

End Web Test
    close browser
