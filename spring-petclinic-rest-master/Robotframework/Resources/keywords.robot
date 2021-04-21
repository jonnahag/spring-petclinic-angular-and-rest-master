*** Keywords ***
Begin Web Test
    Open browser                            about:blank   ${BROWSER}
    Maximize Browser Window
    Go to                                   ${URL}

End Web Test
   Close Browser
