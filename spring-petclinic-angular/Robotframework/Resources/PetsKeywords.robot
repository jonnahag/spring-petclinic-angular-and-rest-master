*** Keywords ***
User Opens An Application
    Open browser                            ${URL}                          ${BROWSER}
User Selects Owners
    Click Element                           ${OWNERS}
    Click Element                           ${OWNER_MENU}
User Selects ADD NEW
    Click Element                           ${ADD_NEW_OWNER}
    Wait Until Page Contains Element        ${NEW_OWNER}
User Fills Up the Information
    Click Element                           ${FNAME_TEXTBOX}
    Input Text                              ${FNAME_TEXTBOX}
    Click Element                           ${LNAME_TEXTBOX}
    Input Text                              ${LNAME_TEXTBOX}
    Click Element                           ${ADD_TEXTBOX}
    Input Text                              ${ADD_TEXTBOX}
    Click Element                           ${CITY_TEXTBOX}
    Input Text                              ${CITY_TEXTBOX}
    Click Element                           ${PHONE_TEXTBOX}
    Input Text                              ${PHONE_TEXTBOX}
User Clicks on Add Owner
    Click Element                           ${ADD_OWNER_BUTTON}
Owner is addded in Owners List
    Wait Until Page Contains Element        ${OWNERS_LIST}
    Element Should Be Visible               ${OWNERS_LIST}
User Scrolls Page and Select an Owner's Name
    Wait Until Page Contains Element        ${OWNER_NAME}
    Element Should Be Visible               ${OWNER_NAME}
    Click Element                           ${OWNER_NAME}
    Wait Until Page Contains Element        ${OWNER_INFO}
    Element Should Be Visible               ${OWNER_INFO}
User Clicks on Edit Owner
    Click Element                           ${EDIT_OWNER_BUTTON}
    Wait Until Page Contains Element        ${EDIT_OWNER_INFO}
    Element Should Be Visible               ${EDIT_OWNER_INFO}
User Fills Up the Information
    Click Element                           ${FNAME_TEXTBOX}
    Input Text                              ${FNAME_TEXTBOX}
    Click Element                           ${LNAME_TEXTBOX}
    Input Text                              ${LNAME_TEXTBOX}
    Click Element                           ${ADD_TEXTBOX}
    Input Text                              ${ADD_TEXTBOX}
    Click Element                           ${CITY_TEXTBOX}
    Input Text                              ${CITY_TEXTBOX}
    Click Element                           ${PHONE_TEXTBOX}
    Input Text                              ${PHONE_TEXTBOX}
User Clicks on Update Owner Button
    Click Element                           ${UPDATE_OWNER_BUTTON}
    Wait Until Page Contains Element        ${OWNER_INFO}
    Element Should Be Visible               ${OWNER_INFO}
User Clicks on Add New Pet Button
    Click Element                           ${ADD_PET_BUTTON}
    Wait Until Page Contains Element        ${ADD_PET_INFO}
    Element Should Be Visible               ${ADD_PET_INFO}
Add Pet Page gets displayed
    Wait Until Page Contains Element        ${ADD_PET_INFO}
    Element Should Be Visible               ${ADD_PET_INFO}
User Fills Up Pet Information
    Wait Until Page Contains Element        ${OWNER_NAME}
    Element Should BE Visisble              ${OWNER_NAME}
    Click Element                           ${PET_NAME}
    Input Text                              ${PET_NAME}
    Click element                           ${PET_BIRTH_DATE}
    Input Text                              ${PET_BIRTH_DATE}
    Click element                           ${PET_TYPE}
    Input Text                              ${PET_TYPE}