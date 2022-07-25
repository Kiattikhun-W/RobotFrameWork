*** Settings ***
Documentation       A resource file
...
...                 The system
Library             SeleniumLibrary

*** Variables ***
${user_name}             rahulshettyacademy
${invalid_password}      123445
${valid_password}        learning
${url}      https://rahulshettyacademy.com/loginpagePractise/
*** Keywords ***
open the browser with the Mortgage payment url
     Create WebDriver   Chrome  executable_path=C:/Users/Tery/Documents/DriverPath/chromedriver.exe
     go to  ${url}
Close Browser Session
    close browser
