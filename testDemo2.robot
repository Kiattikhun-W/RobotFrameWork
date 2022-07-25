*** Settings ***
Documentation   To validate login form
Library  SeleniumLibrary
#Do first
Test Setup      open the browser with the Mortgage payment url
#Do after test all case
Test Teardown  Close Browser Session
Resource       resource.robot
#Resource

*** Variables ***
#Global variable
${Error_Message_Login}      css:.alert-danger
${Shop_page_load}           css:.nav-link

*** Test Cases ***
Validate UnSuccessful login
    Fill the login From     ${user_name}     ${invalid_password}
    wait until element display   ${Error_Message_Login}
    verify error message is correct

Validate Successful login
    Fill the login From     ${user_name}     ${valid_password}
    wait until element display  ${Shop_page_load}


*** Keywords ***

Fill the login From
    [Arguments]     ${username}    ${password}
    input text  id:username     ${username}
    input password  id:password     ${password}
    click button  signInBtn
wait until element display
    [Arguments]     ${element}
    wait until element is visible   ${element}
verify error message is correct
    #scope variable
    ${result}=   get text   ${Error_Message_Login}
    should be equal as strings  ${result}  Incorrect username/password.
    element text should be  ${Error_Message_Login}  Incorrect username/password.
