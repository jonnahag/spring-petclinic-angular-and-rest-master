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
    ${actualTerm}                                     get text                              xpath:/html/body/app-root/app-welcome/h1
    Should Be Equal                                   Welcome to Petclinic                  ${actualTerm}
Pet Types
    Click Element                                    xpath:/html/body/app-root/div[1]/nav/div/ul/li[4]/a/span[2]
    Click Element                                    xpath:/html/body/app-root/app-pettype-list/div/div/div/button[2]
Add Pet
    [Arguments]                                      ${Pet_Type}
    Pet Type                                         ${Pet_Type}
    Click Element                                    xpath://*[@id="pettype"]/div[2]/div/button
Pet Type
    [Arguments]                                      ${Pet_Type}
    Input Text                                       id=name                               ${Pet_Type}

Verify Pet Type Added
    [Arguments]                                      ${petType_name}
    Verify Added
Verify Added
     ${petType_name}                                 get text                             id=6
     Should Contain                                  Rabbit                              ${petType_name}
Edit A Pet
    Click Element                                    xpath://*[@id="pettypes"]/tbody/tr[4]/td[2]/button[1]
    #Give a New Pet name                              ${editPetType_name}
Give a New Pet name
    [Arguments]                                      ${editPetType_name}
    Input Text                                       id=name                              ${editPetType_name}
    Click Element                                    xpath://*[@id="pettype"]/div[2]/div/button[1]
Verify New Edited Pet
     ${newPetType_name}                              get text                             id=3
     Should Contain                                  Squirelll                                ${newPetType_name}
End Web Test
    close browser
