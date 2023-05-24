*** Settings ***
Documentation    Verifying the new user account functionality
Library   SeleniumLibrary
Resource  MyKeywords.robot
Resource  Variables.robot
Suite Setup  Get to login page
Suite Teardown  Close All Browsers



*** Test Cases ***
Verify that user can create new account
       [Tags]  Kinsoo
       Enter email for new user and click the create account button
       Enter firstname, lastname and password   Lola    Gold   testi
       Select user date of birth in days, months and years
       Enter Address, City, State, Postcode, Mobile, Alias and click on Register


Add new Address to User profile
      #[Tags]  Kinsoo
      Enter user credentials to add address and password   ${USER_EMAIL}    ${USER_PASSWORD}
      Add a new address and save
      [Teardown]  Delete Address and close browser





*** Keywords ***
