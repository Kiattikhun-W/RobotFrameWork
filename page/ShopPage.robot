*** Settings ***
Documentation     All the page objects and keywords of landing page
Library           SeleniumLibrary
Library    Collections
Library    ../customLibrary/Shop.py

Resource    Generic.robot
*** Variables ***
${Shop_page_load}           css:.nav-link
${product_lists}    iphone X    Blackberry
*** Keywords ***
wait until Element is located in the page
   Wait Until element passed is located on Page   ${Shop_page_load}

Verify Card titles in the Shop page
   @{expectedList} =    Create List     iphone X    Samsung Note 8      Nokia Edge       Blackberry
   ${elements} =  Get WebElements     css:.card-title
   @{actualList} =    create list
    FOR  ${element}    IN    @{elements}
        log    ${element.text}
        Append To List  ${actualList}   ${element.text}
    END
    lists should be equal   ${expectedList}   ${actualList}

#Select the Card
#    [Arguments]    ${cardName}
#    add_items_to_cart_and_checkout  ${cardName}
#    ${elements} =  Get WebElements     css:.card-title
#    ${index}=    set variable    1
#    FOR    ${element}    IN    @{elements}
#        exit for loop if    '${cardName}' == '${element.text}'
#        ${index} =    evaluate    ${index} + 1
#    END
#
#    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
