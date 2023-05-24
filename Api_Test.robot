*** Settings ***
Documentation    Automate API responses for pet store
Library  RequestsLibrary
Library  JSONLibrary
Library  BuiltIn
Library  Collections



*** Test Cases ***
Get Pets with Status Available
   [Documentation]  This test should get pet by status
   Create Session    My session    https://petstore.swagger.io/v2   verify=true
   ${response}=  GET On Session   My session  /pet/findByStatus?  params=status=available
   Status Should Be    200   ${response}


Get Pets with Status Pending
   [Documentation]  This test should get pet by status
   Create Session    My session    https://petstore.swagger.io/v2   verify=true
   ${response}=  GET On Session   My session  /pet/findByStatus?  params=status=pending
   Status Should Be    200   ${response}


Get Pets with Status Sold
   [Documentation]  This test should get pet by status
   Create Session    My session    https://petstore.swagger.io/v2   verify=true
   ${response}=  GET On Session   My session  /pet/findByStatus?  params=status=sold
   Status Should Be    200   ${response}

Create a pet in pet store
   #[Tags]  Kinsoo
   [Documentation]  This test should create a pet
   ${body}=  Create Dictionary   id=0  name=monkey  status=available
   ${response}=  POST  https://petstore.swagger.io/v2/pet  json=${body}
   Log To Console    ${response}
   Status Should Be    200   ${response}

Update a pet in pet store
   #[Tags]  Kinsoo
   [Documentation]  This test should update a pet
   ${body}=  Create Dictionary   id=9223372036854775807  name=dog  status=available
   ${response}=  PUT   https://petstore.swagger.io/v2/pet  json=${body}
   Log To Console    ${response}
   Status Should Be    200   ${response}


Delete a pet in pet store
   [Tags]  Kinsoo
   [Documentation]  This test should delete a pet
   #Create Session    My session    https://petstore.swagger.io/v2   verify=true
   ${response}=   DELETE    https://petstore.swagger.io/v2/pet/9223372036854775807
   Status Should Be    200   ${response}