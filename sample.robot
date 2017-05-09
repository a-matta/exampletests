*** Settings ***
Library   Selenium2Library
Library   MyLibrary.py
Library   FakerLibrary

*** Test Cases ***
User can open website
    [Tags]    smoke
    Open Browser  http://localhost:8080/    
    Page Should Contain     Welcome
    Click Link    xpath=/html/body/nav/div/div[2]/ul/li[3]/a
    Page Should Contain     Add Owner
    Click Button    xpath=/html/body/div/div/form/div[2]/div/button
    Close All Browsers

Add owner
    [Tags]  current
    Open Browser  http://localhost:8080/  chrome
    Page Should Contain     Welcome
    Click Link    xpath=/html/body/nav/div/div[2]/ul/li[3]/a
    Click Element  xpath=/html/body/div/div/a
    sleep  1
    ${first_name}=   FakerLibrary.first_name
    Input Text        xpath=//*[@id="firstName"]    ${firstname}
    sleep  1
    ${recieved_value}=    Get Value        xpath=//*[@id="firstName"]
    Log   ${recieved_value}
    sleep  1
    Input Text        xpath=//*[@id="lastName"]  Matta
    Input Text        xpath=//*[@id="address"]    Pasila
    Input Text         xpath=//*[@id="city"]     Helsinki
    Input Text         xpath=//*[@id="telephone"]    0505067114
    sleep  1
    Click Button       xpath=//*[@id="add-owner-form"]/div[2]/div/button
    Close All Browsers
    