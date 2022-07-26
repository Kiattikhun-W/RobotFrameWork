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
Resource        page/CheckoutPage.robot
Resource        page/ConfirmationPage.robot


*** Variables ***
#Global variable
@{product_lists}    iphone X    Blackberry
@{MESSAGES}    Robot    Framework

${country_name}             India


*** Test Cases ***
Validate UnSuccessful login
    LandingPage.Fill the login From     ${user_name}     ${invalid_password}
    LandingPage.wait until Element is located in the page
    LandingPage.verify error message is correct

End to end ecommerce Product validation
    LandingPage.Fill the login From     ${user_name}    ${valid_password}
    ShopPage.wait until Element is located in the page
    ShopPage.Verify Card titles in the Shop page
    add items to cart and checkout      ${product_lists}
    CheckoutPage.Verify items in the Checkout Page and proceed
    ConfirmationPage.Enter the Country and select the terms      ${country_name}
    ConfirmationPage.Purchase the Product and Confirm the Purchase


Select the Form and navigate to Child window
    LandingPage.Fill the login Details and Login Form





