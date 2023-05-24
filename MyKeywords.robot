*** Settings ***
Documentation    Keywords for automation practice project
Library   SeleniumLibrary
Library  FakerLibrary
Resource  Variables.robot




*** Keywords ***
Check homepage logo and Add to cart
        Open Browser   ${URL}    ${BROWSER}
        Maximize Browser Window
        Wait Until Element Is Visible     ${APP_LOGO}     10s
        Wait Until Element Is Visible    ${SHOPPING_CART}    10s
        Capture Page Screenshot



Get to login page
       Open Browser   ${URL}    ${BROWSER}
       Maximize Browser Window
       Wait And Click Element     ${HOMEPAGE_SIGNIN_BTN}



Login user1
       Open Browser   ${URL}    ${BROWSER}
       Maximize Browser Window
       Wait And Click Element    ${HOMEPAGE_SIGNIN_BTN}
       Wait And Input Text    ${LOGIN_USERNAME_FIELD}     ${USER_EMAIL}
       Wait And Input Text   ${LOGIN_PASSWORD_FIELD}     ${USER_PASSWORD}
       Wait And Click Element    ${LOGIN_BTN}
       Page Should Contain    ${LOGGEDIN_USER}


Login user2
       [Arguments]    ${username}     ${password}
       Open Browser   ${URL}    ${BROWSER}
       Maximize Browser Window
       Wait And Click Element    ${HOMEPAGE_SIGNIN_BTN}
       Wait And Input Text    ${LOGIN_USERNAME_FIELD}     ${username}
       Wait And Input Text    ${LOGIN_PASSWORD_FIELD}     ${password}
       Wait And Click Element    ${LOGIN_BTN}
       Page Should Contain    ${LOGGEDIN_USER}


Enter user credentials to add address and password
       [Arguments]    ${username}     ${password}
       Wait And Input Text    ${LOGIN_USERNAME_FIELD}     ${username}
       Wait And Input Text    ${LOGIN_PASSWORD_FIELD}     ${password}
       Wait And Click Element    ${LOGIN_BTN}




Login with incorrect username
       [Arguments]    ${username}     ${password}
       Open Browser   ${URL}    ${BROWSER}
       Maximize Browser Window
       Wait And Click Element    ${HOMEPAGE_SIGNIN_BTN}
       Wait And Input Text    ${LOGIN_USERNAME_FIELD}     ${username}
       Wait And Input Text    ${LOGIN_PASSWORD_FIELD}     ${password}
       Wait And Click Element    ${LOGIN_BTN}
       Page Should Not Contain    ${LOGGEDIN_USER}


Login with incorrect Password
       [Arguments]    ${username}     ${password}
       Open Browser   ${URL}    ${BROWSER}
       Maximize Browser Window
       Wait And Click Element    ${HOMEPAGE_SIGNIN_BTN}
       Wait And Input Text   ${LOGIN_USERNAME_FIELD}     ${username}
       Wait And Input Text    ${LOGIN_PASSWORD_FIELD}     ${password}
       Wait And Click Element    ${LOGIN_BTN}
       Page Should Not Contain    ${LOGGEDIN_USER}


Retrieve User Password
       [Arguments]    ${ForgotPassword_Link}   ${EmailAddress_Field}  ${EmailAddress}  ${RetrievePassword_btn}
       Wait And Click Element    ${ForgotPassword_Link}
       Wait And Input Text    ${EmailAddress_Field}    ${EmailAddress}
       Wait And Click Element   ${RetrievePassword_btn}
       Wait Until Page Contains   A confirmation email has been sent to your address: ${EmailAddress}   10s




Wait And Click Element
   [Documentation]  Wait for element to be eabled before clicking
   [Arguments]   ${selector}    ${timeouts}=10s
   Wait Until Element Is Enabled    ${selector}
   Click Element  ${selector}


 Wait And Input Text
   [Documentation]  Wait for element to be eabled before inputing text
   [Arguments]   ${selector}  ${text}  ${timeouts}=10s
   Wait Until Element Is Enabled    ${selector}
   Input Text  ${selector}   ${text}


Enter email for new user and click the create account button
     ${email} =  FakerLibrary.email
     log    ${email}
     Set Test Variable    ${email}
     Wait And Input Text   ${CREATE_USER_EMAIL}   ${email}
     Wait And Click Element   ${CREATE_USER_BTN}

Enter firstname, lastname and password
      [Arguments]   ${firstname}  ${lastname}    ${password}
      Wait And Input Text    ${USER_FIRSTNAME}        ${firstname}
      Wait And Input Text    ${USER_LASTNAME}         ${lastname}
      Wait And Input Text    ${NEW_USER_PASSWORD}     ${password}


Select user date of birth in days, months and years
     Sleep    5
     Select From List By Index    ${DOB_DAYS}       10
     Sleep    5
     Select From List By Index    ${DOB_MONTHS}     9
     Sleep    5
     Select From List By Value    ${DOB_YEARS}      1990


Enter Address, City, State, Postcode, Mobile, Alias and click on Register
    Wait And Input Text         ${USER_ADDRESS}       Testing street
    Wait And Input Text         ${USER_CITY}          Chicago
    Select From List By Label   ${USER_STATE}         Illinois
    Wait And Input Text         ${USER_POSTCODE}      00000
    Wait And Input Text         ${USER_MOBILE}        12345
    Clear Element Text          ${ADD_ALIAS}
    Wait And Input Text         ${ADD_ALIAS}          QA House
    Wait And Click Element      ${REGISTER_BTN}
    Wait Until Page Contains    Lola Gold


Modify Address
    Wait And Input Text         ${USER_ADDRESS}       Testing street
    Wait And Input Text         ${USER_CITY}          Atlanta
    Select From List By Label   ${USER_STATE}         Georgia
    Wait And Input Text         ${USER_POSTCODE}      11111
    Wait And Input Text         ${USER_MOBILE}        12345678
    Clear Element Text          ${ADD_ALIAS}
    Wait And Input Text         ${ADD_ALIAS}          Testing Member
    Wait And Click Element      ${SAVE_BTN}
    #Wait Until Page Contains    Lola Gold




Add a new address and save
    Wait And Click Element    ${MY_ADDRESSES}
    Wait And Click Element    ${ADD_NEW_ADDRESSES}
    Modify Address
    Wait Until Page Contains    Testing Member


Delete Address and close browser
   Wait And Click Element     ${DELETE_ADDRESS_BTN}
   Handle Alert   Accept
   Page Should Not Contain    Testing Member
   Close Browser