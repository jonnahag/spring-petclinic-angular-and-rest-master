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
    Should Be Equal                                   Welcome to Petclinic                ${actualTerm}
All Owners
    Click Element                                    xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/a
    Click Element                                    xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a/span[2]
Select a owner and Add New Pet
    Click Element                                    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[1]/td[1]/a
    Click Element                                    xpath:/html/body/app-root/app-owner-detail/div/div/button[3]
Input New Pet Detalis
    Click Element                                    id=name
Pet Details
    [Arguments]                                      ${Pet_Name}                          ${Birth_Date}
    Name                                             ${Pet_Name}
    Birth Date                                       ${Birth_Date}
    Click Element                                    id=type
    Click Element                                    xpath://*[@id="type"]/option[2]
    Click Element                                    xpath:/html/body/app-root/app-pet-add/div/div/form/div[6]/div/button[2]
Name
    [Arguments]                                       ${Pet_Name}
    Input Text                                        id=name                             ${Pet_Name}
Birth Date
    [Arguments]                                       ${Birth_Date}
    Input Text                                        xpath:/html/body/app-root/app-pet-add/div/div/form/div[4]/div/input          ${Birth_Date}
Verify Pet Adedd To owner
   ${pet_added}                                      get text                             xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/dd[1]
   Should Contain                                    Tommy                                ${pet_added}

Edit a Pet
    Click Element                                    xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[6]/td[1]/a
    Click Element                                    xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/button[1]
Give a New Pet name
    [Arguments]                                      ${editPet_name}
    Input Text                                       id=name                              ${editPet_name}
    Click Element                                    xpath:/html/body/app-root/app-pet-edit/div/div/form/div[6]/div/button[2]
Verify New Edited Pet
    ${newPet_name}                                   get text                               xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/dd[1]
    Should Contain                                   Storm                                  ${newPet_name}
End Web Test
    close browser
