*** Keywords ***
Test Navigates to chrome Home Page
Begin WebTest
    OPEN BROWSER                                       about:blank                         ${BROWSER}
    #Maximize Browser Window
    Set Selenium Speed                                0.07

Go To Web Page
     Load Page
     Verify Page Loaded
Load Page
     Go to                                            ${URL}
Verify Page Loaded
    ${actualTerm}                                     get text                          xpath:/html/body/app-root/app-welcome/h1
    Should Be Equal                                   ${Welcome_Message}                ${actualTerm}
All Owners
    Click Element                                    xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/a
    Click Element                                    xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a
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
Name
    [Arguments]                                       ${Pet_Name}
    Input Text                                        id=name                             ${Pet_Name}
Birth Date
    [Arguments]                                       ${Birth_Date}
    Input Text                                        xpath:/html/body/app-root/app-pet-add/div/div/form/div[4]/div/input          ${Birth_Date}
#-----------------------------------------
Verify Pet Adedd To owner
   ${pet_added}                                      get text                             xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/dd[1]
   Should Contain                                    ${Verify_Pet_Added_1}                 ${pet_added}
   Delete Pet After Verifying
Delete Pet After Verifying
    Click Element                                     xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/button[2]
#------------------------------------
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
#--------------------------------
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
#-------------------------------------------------------------------------------------------------------------------------
Edit Owner
    Click Element                                   xpath:/html/body/app-root/app-owner-detail/div/div/button[2]
Owner New Detalis
    [Arguments]                                    ${OwnerNew_Adress}                    ${OwnerNew_City}                    ${OwnerNew_Telephone}
    Adress                                         ${OwnerNew_Adress}
    City                                           ${OwnerNew_City}
    Telephone                                      ${OwnerNew_Telephone}
    Click Element                                  xpath:/html/body/app-root/app-owner-edit/div/div/form/div[7]/div/button[2]
Adress
    [Arguments]                                    ${OwnerNew_Adress}
    Input Text                                     id=address                             ${OwnerNew_Adress}
City
    [Arguments]                                    ${OwnerNew_City}
    Input Text                                     id=city                               ${OwnerNew_City}
Telephone
    [Arguments]                                    ${OwnerNew_Telephone}
    Input Text                                     id=telephone                          ${OwnerNew_Telephone}
Verify Owner New Detalis Added
    ${OwnerNew_Details_Added}                      get text                             xpath:/html/body/app-root/app-owner-detail/div/div/table[1]/tr[2]/td
    Should Be Equal                                ${New_Adress}                        ${OwnerNew_Details_Added}

Verify Erorr Message Displayed Or Not
   ${Invalid_PhoneNo}                              get text                              xpath:/html/body/app-root/app-owner-edit/div/div/form/div[6]/div/span[2]
    Should Contain                                 ${ErorrMessage_AcceptsDigits}         ${Invalid_PhoneNo}
#--------------------------------------
Owner Detalis With Empty Box
    Press Keys                                     xpath://*[@id="address"]               CTRL+a+BACKSPACE
    [Arguments]                                    ${OwnerNew_Telephone}
    Only TelephoneNo                               ${OwnerNew_Telephone}
Only TelephoneNo
    [Arguments]                                    ${OwnerNew_Telephone}
    Input Text                                     id=telephone                          ${OwnerNew_Telephone}
Verify Erorr Messages With Red Box
   ${Required_message}                             get text                              xpath:/html/body/app-root/app-owner-edit/div/div/form/div[4]/div/span[2]
    Should Match                                 ${ErorrMessge_Required}                 ${Required_message}
#------------------------------------------------------------------------------------------------------------------------
that the user is on the landing page
    Go To Web Page
a user Creates a new owner
    Click Element                                  xpath://a[contains(text(),'Owners')]
    wait until page contains                       Owners
    Click Element                                  xpath://a[contains(text(),'Owners')]/../ul/li[2]/a
    wait until page contains                       Owners
    Input Text                                     id=firstName                           ${Firstname}
    Input Text                                     id=lastName                            ${Lastname}
    Input Text                                     id=address                             ${Adress1}
    Input Text                                     id=city                                ${City1}
    Input Text                                     id=telephone                           ${Mobile1}
    Click Element                                  xpath://div/button[contains(string(), "Add Owner")]
a new owner should be created
    Click Element                                 xpath://a[contains(text(),'Owners')]
    wait until page contains                      Owners
    Click Element                                 xpath://a/span[contains(text(),'All')]
    page should contain                           ${Firstname}
#--------------------------------
#test 2
that the user has acces to the web page
    Go To Web Page
a user creates a new owner with variables instead of letters
    Click Element                                xpath://a[contains(text(),'Owners')]
    wait until page contains                     Owners
    Click Element                                xpath://a[contains(text(),'Owners')]/../ul/li[2]/a
    wait until page contains                     Owners
    Input Text                                   id=firstName                              ${Firstname2}
    Input Text                                   id=lastName                               ${Firstname2}
    Input Text                                   id=address                                ${Adress2}
    Input Text                                   id=city                                   ${City2}
    Input Text                                   id=telephone                              ${Mobile2}
    Click Element                                xpath://div/button[contains(string(), "Add Owner")]
a new owner should be added to the list
    Click Element                                xpath://a[contains(text(),'Owners')]
    wait until page contains                     Owners
    Click Element                                xpath://a/span[contains(text(),'All')]
    wait until page contains                     All
    Page should contain                          ${Firstname2}
#_____________________________________
#test 3
user is on the landing page
    Go To Web Page
the user Creates a new owner
    Click Element                               xpath://a[contains(text(),'Owners')]
    wait until page contains                    Owners
    Click Element                               xpath://a[contains(text(),'Owners')]/../ul/li[2]/a
    wait until page contains                    Owners
put already existing personal data
    Input Text                                  id=firstName                                 ${Firstname}
    Input Text                                  id=lastName                                  ${Lastname}
    Input Text                                  id=address                                   ${Adress1}
    Input Text                                  id=city                                      ${City1}
    Input Text                                  id=telephone                                 ${Mobile1}
    Click Element                               xpath://div/button[contains(string(), "Add Owner")]
a duplicate of the owner should be added
    Click Element                              xpath://a[contains(text(),'Owners')]
    wait until page contains                   Owners
    Click Element                              xpath://a/span[contains(text(),'All')]
    page should contain                        ${Firstname}
#___________________________________
#test4
user is located on landing page
    Go To Web Page
the user creates new owner
    Click Element                            xpath://a[contains(text(),'Owners')]
    wait until page contains                 Owners
    Click Element                            xpath://a[contains(text(),'Owners')]/../ul/li[2]/a
    wait until page contains                 Owners
use special signs for input in name field
    Click Element                            xpath://a[contains(text(),'Owners')]
    wait until page contains                 Owners
    Click Element                            xpath://a[contains(text(),'Owners')]/../ul/li[2]/a
    wait until page contains                 Owners
    Input Text                               id=firstName                                   ${Firstname3}
    Input Text                               id=lastName                                    ${Lastname3}
    Input Text                               id=address                                     ${Adress2}
    Input Text                               id=city                                        ${City2}
    Input Text                               id=telephone                                   ${Mobile2}
    Click Element                            xpath://div/button[contains(string(), "Add Owner")]
the new owner should be created
    Click Element                           xpath://a[contains(text(),'Owners')]
    wait until page contains                Owners
    Click Element                           xpath://a/span[contains(text(),'All')]
    wait until page contains                All
    Page should contain                     ${Firstname3}
#------------------------------------------------------------------------------------------------------------------------
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
Verify selected Owner is not with rightful pet 1 or test case fails
     ${Actual_Pet1}                                 Get Text      xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/dd[1]
     ${Actual_Owner1}                               Get Text       xpath:/html/body/app-root/app-owner-detail/div/div/table[1]/tr[1]/td/b
     #Should Be Equal                                ${Expecting_Owner1}${Expecting_Pet1}    ${Actual_Owner1}${Actual_Pet1}
     Should Not Be Equal                            ${Expecting_Owner1}${Expecting_Pet1}    ${Actual_Owner1}${Actual_Pet1}
Verify selected Owner is not with rightful pet 2 or testcase fails
     ${Actual_Pet2}                                 Get Text       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/dd[1]
     ${Actual_Owner2}                               Get Text       xpath:/html/body/app-root/app-owner-detail/div/div/table[1]/tr[1]/td/b
    #Should Be Equal(testcase fails)                ${Expecting_Owner2}${Expecting_Pet2}    ${Actual_Owner2} ${Actual_Pet2}
     Should Not Be Equal                            ${Expecting_Owner2}${Expecting_Pet2}    ${Actual_Owner2} ${Actual_Pet2}
Verify whether selected Owner is with rightful pet(2 pets)
     ${Actual_PetA}                              Get Text     xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[1]/dl/dd[1]
     ${Actual_PetB}                              Get Text     xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/dd[1]
     ${Actual_Owner3}                            Get Text     xpath:/html/body/app-root/app-owner-detail/div/div/table[1]/tr[1]/td/b
     Should Be Equal                             ${Expecting_Owner3}${Expecting_PetA}${Expecting_PetB}     ${Actual_Owner3}${Actual_PetA}${Actual_PetB}

#------------------------------------
#Add Pet Type - Jonna

Go to Pet Types
    User is on the landing page
    Click element                                 xpath:/html/body/app-root/div[1]/nav/div/ul/li[4]/a/span[2]
    Verify on the right page

Verify on the right page
    ${Actual_Pettypes_Page}                       Get Text    xpath:/html/body/app-root/app-pettype-list/div/div/h2
    Should be equal                               ${Actual_Pettypes_Page}   ${EXPECTED_PETTYPES_PAGE}

Add a new Pet Type
    Click button                                  xpath:/html/body/app-root/app-pettype-list/div/div/div/button[2]
    Wait until page contains                      New Pet Type
    Click element                                 id:name
    Input Text                                    id:name           ${NEW_PETTYPE_NAME}
    Click element                                 xpath://*[@id="pettype"]/div[2]/div/button
    Sleep                                         0.2 s

Verify added Pet Type
    ${Actual_Pettype_Name}                        Get Value     xpath://*[@id="6"]
    Should be equal                               ${Actual_Pettype_Name}    ${NEW_PETTYPE_NAME}
    Sleep                                         0.2 s

Teardown Add New Pet Type
    Click button                                  xpath://*[@id="pettypes"]/tbody/tr[7]/td[2]/button[2]
    Sleep                                         0.2 s
    Page should not contain element               xpath://*[@id="6"]

#Gherkin Syntax for Add New Pet Type:

user is on the Pet Types page
  Go to Pet Types

a user have added a new Pet Type
  Add a new Pet Type

a user should be able to see the new Pet Type in the list
  Verify added Pet Type
  Teardown Add New Pet Type


#Add existing Pet Type - Jonna

Add existing pet
   Click button                                  xpath:/html/body/app-root/app-pettype-list/div/div/div/button[2]
   Wait until page contains                      New Pet Type
   Click element                                 id:name
   Input Text                                    id:name           ${Existing_Pettype_Name}
   Click element                                 xpath://*[@id="pettype"]/div[2]/div/button

Verify added existing Pet Type
   ${Actual_New_Pettype_Name}                    Get Value     xpath://*[@id="6"]
   Should be equal                               ${Actual_New_Pettype_Name}    ${Existing_Pettype_Name}

a user has added a new Pet Type that already exists
  Add existing pet

a user should see two fields with the same Pet Type
  Verify added existing Pet Type
  Teardown Add New Pet Type

#------------------------------------

End Web Test
    close browser
