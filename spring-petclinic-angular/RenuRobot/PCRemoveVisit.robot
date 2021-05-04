*** Settings ***
Documentation                   This is test suite to remove pet's visit from petclinic
#Resource                        ../Resources/RemoveVisitKeywords.robot
Library                         SeleniumLibrary
Test Setup                      Begin WebTest
Test Teardown                   End Web Test
*** Variables ***
${BROWSER}                             chrome
${URL}                                 http://localhost:4200/
${Welcome_Message}                     /html/body/app-root/app-welcome/h1
${Owners}                              /html/body/app-root/div[1]/nav/div/ul/li[2]/a
${All_Owners}                          /html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a
${Select_Owner}                        /html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[10]/td[1]/a
${Owner_Info}                          /html/body/app-root/app-owner-detail/div/div/h2[1]
${Pets_And_Visits_Info}                /html/body/app-root/app-owner-detail/div/div/h2[2]
${Add_Visit_Button}                    /html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/button[3]
${Pet_Details}                         /html/body/app-root/app-visit-add/div/div/table/tr/td[1]
${New_Visit}                           /html/body/app-root/app-visit-add/div/div/h2
${Visit_Date}                          /html/body/app-root/app-visit-add/div/div/form/div[1]/div[1]/div/input
${Visit_Description}                   /html/body/app-root/app-visit-add/div/div/form/div[1]/div[2]/div/input
${Add_NewVisit_Button}                 /html/body/app-root/app-visit-add/div/div/form/div[2]/div/button[2]
${Edit_Visit_Button}                   /html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[2]/app-visit-list/table/tr/td[3]/button[1]
${Edit_Visit_Display}                  /html/body/app-root/app-visit-edit/div/div/h2
${Edit_Visit_Date}                     /html/body/app-root/app-visit-edit/div/div/form/div[1]/div[1]/div/input
${Edit_Visit_Description}              /html/body/app-root/app-visit-edit/div/div/form/div[1]/div[2]/div/input
${Update_Visit_Button}                 /html/body/app-root/app-visit-edit/div/div/form/div[2]/div/button[2]
${Delete_Visit_Button}                 /html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[2]/app-visit-list/table/tr/td[3]/button[2]

*** Test Cases ***
Test Add a Visit for a pet
    [Documentation]                    Adding a new Visit and Verifying
    [Tags]                             Add
    Given User Navigates To Webpage
    When User Selects Owners
    And Clicks on All Owners
    And Selects A Owner From The List
    And Selects A Pet To Add Visit
    And Clicks on Add visit
    And Selects a Date
    And Add the Description
    And Clicks on Add A New Visit
    Then Verify New visit is Added

*** Test Cases ***
Test Edit a Visit for a pet
    [Documentation]                    Edit a new Visit and Verifying
    [Tags]                             Edit
    Given User Navigates To Webpage
    When User Selects Owners
    And Clicks on All Owners
    And Selects A Owner From The List
    And Selects A Pet To Edit Visit
    And Clicks on Edit Visit
    And Edit Date for Visit
    And Edit Description of the Visit
    And Clicks on Update Visit
    Then Verify Visit Details are Updated


*** Test Cases ***
Test Remove a Visit for a pet
    [Documentation]                    Remove a new Visit and Verifying
    [Tags]                             Remove
    Given User Navigates To Webpage
    When User Selects Owners
    And Clicks on All Owners
    And Selects A Owner From The List
    And Selects A Pet To Delete Visit
    And Selects A Visit to Delete
    And Clicks on Delete Visit
    Then Verify Visit is Removed


*** Keywords ***

Begin WebTest
    open browser                                 about:blank              chrome
    Set Selenium Speed                           .5
User Navigates To Webpage
    Open browser                                     ${URL}                          ${BROWSER}
Verify Page Loaded
    wait until element is visible                    ${Welcome_Message}
    element should be visible                        ${Welcome_Message}
User Selects Owners
    wait until element is visible                 ${Owners}
    element should be visible                      ${Owners}
    Click Element                                    ${Owners}
    sleep 5
Clicks on All Owners
    wait until page contains element                 ${All_Owners}
    page should contain element                      ${All_Owners}
    Click Element                                    ${All_Owners}
Selects A Owner From The List
    click element                                    ${Select_Owner}
    wait until element is visible                    ${Owner_Info}
    page should contain element                      ${Owner_Info}
Selects A Pet To Add Visit
    wait until element is visible                    ${Pets_And_Visits_Info}
    page should contain element                      ${Pets_And_Visits_Info}
Clicks on Add visit
    press keys                                      ${Add_Visit_Button}                 RETURN
    wait until element is visible                   ${Pet_Details}
    page should contain element                     ${Pet_Details}
    wait until element is visible                   ${New_Visit}
    page should contain element                     ${New_Visit}
Selects a Date
    click element                                   ${Visit_Date}
    input text                                      ${Visit_Date}                   19/04
Add the Description
    click element                                   ${Visit_Description}
    input text                                      ${Visit_Description}            eye checkup
Clicks on Add A New Visit
    press keys                                      ${Add_NewVisit_Button}              RETURN
Verify New visit is Added
    wait until element is visible                   ${Edit_Visit_Button}
    page should contain element                     ${Edit_Visit_Button}


Selects A Pet To Edit Visit
    wait until element is visible                   ${Edit_Visit_Button}
    page should contain element                     ${Edit_Visit_Button}
Clicks on Edit Visit
    press keys                                      ${Edit_Visit_Button}                RETURN
    wait until page contains element                ${Edit_Visit_Display}
    page should contain element                     ${Edit_Visit_Display}
Edit Date for Visit
    click element                                   ${Edit_Visit_Date}
    input text                                      ${Edit_Visit_Date}                  20/05
Edit Description of the Visit
    click element                                   ${Edit_Visit_Description}
    input text                                      ${Edit_Visit_Description}           regular checkup
Clicks on Update Visit
    press keys                                      ${Update_Visit_Button}              RETURN
Verify Visit Details are Updated
    wait until page contains element               ${Edit_Visit_Date}
    page should contain element                    ${Edit_Visit_Date}

Selects A Pet To Delete Visit
    wait until page contains element               ${Delete_Visit_Button}
    page should contain element                    ${Delete_Visit_Button}
Selects A Visit to Delete
    wait until page contains element               ${Edit_Visit_Date}
    page should contain element                    ${Edit_Visit_Date}
    wait until page contains element               ${Edit_Visit_Description}
    page should contain element                    ${Edit_Visit_Description}
Clicks on Delete Visit
    press keys                                     ${Delete_Visit_Button}               RETURN
Verify Visit is Removed
    wait until page does not contain element       ${Edit_Visit_Date}
    wait until page does not contain element       ${Edit_Visit_Description}
    page should not contain element                ${Edit_Visit_Date}
    page should not contain element                ${Edit_Visit_Description}

End Web Test
    close browser



