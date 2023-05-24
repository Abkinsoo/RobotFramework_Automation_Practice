*** Settings ***
Documentation    Validate application homepage and login page
Library   SeleniumLibrary
Resource  MyKeywords.robot
Resource  Variables.robot
Suite Teardown  Close All Browsers



*** Test Cases ***
Verify logo and add to cart are displayed
        [Tags]  Kinsoo
        Check homepage logo and Add to cart


Valid Login1
       #[Tags]  Kinsoo
       Login user1


Valid Login2
       [Tags]  Kinsoo
       Login user2   ${USER_EMAIL}    ${USER_PASSWORD}


Invalid Login1
       #[Tags]  Kinsoo
       Login with incorrect username    lanre@gmail.com    testing

Invalid Login2
       [Tags]  Kinsoo
       Login with incorrect Password    lanre_april2gmail.com    testi


Valid error messages for incorrect login
      #[Tags]  Kinsoo
      [Template]  Verify error message for differnet invalid login scenarios
      #username                  password       errormessage
      lanre_april@gmail.com      test           Invalid password.
      lanre_@gmail.com           testing        Authentication failed.
      ${EMPTY}                   Testing        An email address required.
      ${EMPTY}                   ${EMPTY}       An email address required.


Verufy that users can retrieve forgotten password
    #[Tags]  Kinsoo
    [Setup]  Get to login page
    Retrieve User Password    ${FORGOT_PASSWORD_LINK}    ${FORGOT_PASSWORD_EMAIL_FIELD}    lanre_april@gmail.com    ${RETRIEVE_PASSWORD_BTN}


*** Keywords ***
Verify error message for differnet invalid login scenarios
       [Arguments]    ${username}     ${password}     ${errormessage}
       Open Browser    ${URL}      ${BROWSER}
       Maximize Browser Window
       Click Element    ${HOMEPAGE_SIGNIN_BTN}
       Input Text    ${LOGIN_USERNAME_FIELD}      ${username}
       Input Text    ${LOGIN_PASSWORD_FIELD}     ${password}
       Click Element    ${LOGIN_BTN}
       Page Should Contain      ${errormessage}

