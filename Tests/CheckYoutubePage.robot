*** Settings ***
Library  AppiumLibrary
Resource  ../PageObjects/SearchPage/keywords.robot
Resource  ../PageObjects/Common/keywords.robot
Test Setup  Open Youtube App
Test Teardown  Close All Applications


*** Test Cases ***
test1
    Click Searchbar
    Enter Into Searchbar  Charlie puth
    Press Search Button
    Click First Video
    # Simpler Bypass Ad
    Subscribe Channel Of This Video
    Go Back To Search Page
    Click Subscriptions
    Click All Subscribed Channels
    Verify If Channel Is Subscribed Successfully
