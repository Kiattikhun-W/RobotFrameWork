*** Settings ***
Documentation       A resource file
...
...                 The system
Library             SeleniumLibrary

*** Variables ***
${user_name}             xxx
${invalid_password}      xxx
${valid_password}        xxx
${url}      xxx
*** Keywords ***
open the browser with the Mortgage payment url
     Create WebDriver   Chrome  executable_path=path/chromedriver.exe
     go to  ${url}
Close Browser Session
    close browser
