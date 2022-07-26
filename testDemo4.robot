*** Settings ***
Documentation   To validate login form
Library  SeleniumLibrary
#Do after test all case
Test Teardown  Close Browser
Test Template  Validate UnSuccesful Login
#Resource

*** Variables ***
#Global variable
${Error_Message_Login}  css:.alert-danger

*** Test Cases ***      username        password
Invalid username        dsahed1          learning
Invalid password        rahulshetty     ploudfg
special characters      @#$             learning

*** Keywords ***
Validate UnSuccesful Login
    [Arguments]     ${username}     ${password}
    open the browser with the Mortgage payment url
    Fill the login Form    ${username}      ${password}
    wait until it checks and display error message
    verify error message is correct
open the browser with the Mortgage payment url
     Create WebDriver   Chrome  executable_path=C:/Users/Tery/Documents/DriverPath/chromedriver.exe
     go to  https://rahulshettyacademy.com/loginpagePractise/
Fill the login Form
    [Arguments]     ${username}     ${password}

    input text  id:username     ${username}
    input password  id:password     ${password}
    click button  signInBtn
wait until it checks and display error message
    wait until element is visible  ${Error_Message_Login}
verify error message is correct
    #scope variable
    ${result}=   get text   ${Error_Message_Login}
    should be equal as strings  ${result}  Incorrect username/password.
    element text should be  ${Error_Message_Login}  Incorrect username/password.
