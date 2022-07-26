*** Settings ***
Documentation   To validate login form
Library  SeleniumLibrary
Library    Collections
#Do first
Test Setup      open the browser with the Mortgage payment url
#Do after test all case
#Test Teardown  Close Browser Session
Resource       page/Generic.robot
#Resource

*** Variables ***
#Global variable
${Error_Message_Login}      css:.alert-danger
${Shop_page_load}           css:.nav-link

*** Test Cases ***
#Validate UnSuccessful login
#    Fill the login From     ${user_name}     ${invalid_password}
#    wait until element display   ${Error_Message_Login}
#    verify error message is correct

Validate Successful login
    Fill the login From     ${user_name}     ${valid_password}
    wait until element display  ${Shop_page_load}
    Verify Card titles in the Shop page
    Select the Card    Blackberry

Select the Form and navigate to Child window
    Fill the login Details and Login Form

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

Verify Card titles in the Shop page
   @{expectedList} =    Create List     iphone X    Samsung Note 8      Nokia Edge       Blackberry
   ${elements} =  Get WebElements     css:.card-title
   @{actualList} =    create list
    FOR  ${element}    IN    @{elements}
        log    ${element.text}
        Append To List  ${actualList}   ${element.text}
    END
    lists should be equal   ${expectedList}   ${actualList}

Select the Card
    [Arguments]    ${cardName}
    ${elements} =  Get WebElements     css:.card-title
    ${index}=    set variable    1
    FOR    ${element}    IN    @{elements}
        exit for loop if    '${cardName}' == '${element.text}'
        ${index} =    evaluate    ${index} + 1
    END

    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button

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



