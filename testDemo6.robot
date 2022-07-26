*** Settings ***
Documentation   To validate login form
Library  SeleniumLibrary
Library    Collections
Library    customLibrary/Shop.py
#Do first
Test Setup      open the browser with the Mortgage payment url
#Do after test all case
Test Teardown  Close Browser Session
Resource        page/Generic.robot
Resource        page/LandingPage.robot
Resource        page/ShopPage.robot



*** Variables ***
#Global variable


*** Test Cases ***
Validate UnSuccessful login
    LandingPage.Fill the login From     ${user_name}     ${invalid_password}
    LandingPage.wait until Element is located in the page
    LandingPage.verify error message is correct

Validate Successful login
    LandingPage.Fill the login From     ${user_name}     ${valid_password}
    ShopPage.wait until Element is located in the page
    ShopPage.Verify Card titles in the Shop page
    ShopPage.Select the Card


Select the Form and navigate to Child window
    LandingPage.Fill the login Details and Login Form





