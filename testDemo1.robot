*** Settings ***
Documentation   To validate login form
Library  SeleniumLibrary

#Do after test all case
Test Teardown  Close Browser

#Resource

*** Variables ***
#Global variable
${Error_Message_Login}  css:.alert-danger

*** Test Cases ***
Validate UnSuccessful login
    open the browser with the Mortgage payment url
    Fill the login From
    wait until it checks and display error message
    verify error message is correct
*** Keywords ***
open the browser with the Mortgage payment url
     Create WebDriver   Chrome  executable_path=C:/Users/Tery/Documents/DriverPath/chromedriver.exe
     go to  https://rahulshettyacademy.com/loginpagePractise/
Fill the login From
    input text  id:username     Palentine
    input password  id:password     123456
    click button  signInBtn
wait until it checks and display error message
    wait until element is visible  ${Error_Message_Login}
verify error message is correct
    #scope variable
    ${result}=   get text   ${Error_Message_Login}
    should be equal as strings  ${result}  Incorrect username/password.
    element text should be  ${Error_Message_Login}  Incorrect username/password.
