*** Settings ***
Documentation    Variables  automation practice project
Library   SeleniumLibrary


*** Variables ***
${URL}   http://automationpractice.com/index.php?
${BROWSER}   chrome
${APP_LOGO}   id:header_logo
${SHOPPING_CART}   class:shopping_cart
${HOMEPAGE_SIGNIN_BTN}   class:login
${LOGIN_USERNAME_FIELD}  name:email
${LOGIN_PASSWORD_FIELD}  id:passwd
${LOGIN_BTN}    name:SubmitLogin
${LOGGEDIN_USER}   Dorice Mbonde
${USER_EMAIL}   lanre_april@gmail.com
${USER_PASSWORD}   testing
${FORGOT_PASSWORD_LINK}    xpath://*[@id="login_form"]/div/p[1]/a
${FORGOT_PASSWORD_EMAIL_FIELD}   id:email
${RETRIEVE_PASSWORD_BTN}   xpath://*[@id="form_forgotpassword"]/fieldset/p/button/span

${CREATE_USER_EMAIL}   id:email_create
${CREATE_USER_BTN}     id:SubmitCreate
${USER_GENDER}         id:id_gender2
${USER_FIRSTNAME}      id:customer_firstname
${USER_LASTNAME}       id:customer_lastname
${NEW_USER_PASSWORD}   id:passwd
${DOB_DAYS}            id:days
${DOB_MONTHS}          id:months
${DOB_YEARS}           id:years
${USER_ADDRESS}        id:address1
${USER_CITY}           id:city
${USER_STATE}          name:id_state
${USER_POSTCODE}       id:postcode
${USER_MOBILE}         id:phone_mobile
${ADD_ALIAS}           name:alias
${REGISTER_BTN}        xpath://span[text() = 'Register']

${MY_ADDRESSES}        xpath://*[@id="center_column"]/div/div[1]/ul/li[3]/a/span
${ADD_NEW_ADDRESSES}   xpath://span[text() = 'Add a new address']
${SAVE_BTN}            id:submitAddress
${DELETE_ADDRESS_BTN}  xpath://*[@id="center_column"]/div[1]/div/div[2]/ul/li[9]/a[2]/span
