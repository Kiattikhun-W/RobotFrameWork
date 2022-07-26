*** Settings ***
Documentation     All the page objects and keywords of landing page
Library           SeleniumLibrary
Resource    Generic.robot


*** Variables ***
${Error_Message_Login}  css:.alert-danger


*** Keywords ***

Fill the login From
    [Arguments]     ${username}    ${password}
    input text  id:username     ${username}
    input password  id:password     ${password}
    click button  signInBtn
Fill the login Details and Login Form
    Input Text           id:username     ${user_name}
    Input password       id:password     ${valid_password}
    Click Element       css:input[value='user']
    Wait Until Element Is Visible       css:.modal-body
    Click Button        id:okayBtn
    Click Button        id:okayBtn
    Wait Until Element Is Not Visible   css:.modal-body
    Select From List By Value       css:select.form-control       teach
    Select Checkbox     terms
    Checkbox Should Be Selected     terms
wait until Element is located in the page
    Wait Until element passed is located on Page   ${Error_Message_Login}
verify error message is correct
    #scope variable
#    ${result}=   get text   ${Error_Message_Login}
#    should be equal as strings  ${result}  Incorrect username/password.
    element text should be  ${Error_Message_Login}  Incorrect username/password.



