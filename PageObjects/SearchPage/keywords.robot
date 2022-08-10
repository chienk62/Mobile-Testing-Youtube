*** Settings ***
Library  AppiumLibrary
Variables  ./locators.py

*** Variables ***


*** Keywords ***

Click Searchbar
    Wait Until Element Is Visible  ${MainPageSearchIcon}
    Click Element  ${MainPageSearchIcon}

Enter Into Searchbar
    [Arguments]  ${searchtext}
    Wait Until Element Is Visible  ${MainPageSearchBar}
    Input Text  ${MainPageSearchBar}  ${searchtext}

Press Search Button
    Press Keycode  66

Click First Video
    Wait Until Page Contains Element  ${SearchPageFirstVideo}
    Click Element  ${SearchPageFirstVideo}
    Sleep  6s

Simpler Bypass Ad
    ${ad status} =  Get Text  id=com.google.android.youtube:id/ad_progress_text
    ${ad status} =  Get Number Ad  ${ad status}
    FOR  ${i}  IN RANGE  ${ad status}
        ${countdown ad} =  Run Keyword And Return Status  
        ...                Page Should Contain Element
        ...                id=com.google.android.youtube:id/ad_countdown
        IF  ${countdown ad} == True
            IF  ${ad status} == ${1}
                Wait Until Page Does Not Contain Element  id=com.google.android.youtube:id/ad_countdown
                BREAK
            END
            Wait Until Page Contains Element  xpath=//*[@resource-id='com.google.android.youtube:id/ad_progress_text' and contains(@text,'${i+1} of ${ad status}']  30s
        ELSE
            Wait Until Page Contain Element  id=com.google.android.youtube:id/skip_ad_button_container
            Tap  id=com.google.android.youtube:id/skip_ad_button_container
            BREAK
        END
    END

Subscribe Channel Of This Video
    ${mixlist}  Run Keyword And Return Status  Page Should Contain Element  ${VideoPageMix}
    IF  ${mixlist}== True  Go Back
    ${subscribed}  Run Keyword And Return Status  Page Should Contain Element  ${VideoPageSubsribeBtn}
    IF  ${subscribed}==True  Click Element  ${VideoPageSubsribeBtn}

Go Back To Search Page
    ${mixlist}  Run Keyword And Return Status  Page Should Contain Element  ${VideoPageMix}
    IF  ${mixlist}== True
        Go Back
        Go Back
    ELSE
        Go Back
    END

Click Subscriptions 
    Wait Until Element Is Visible  ${SearchPageSubscriptions}
    Click Element  ${SearchPageSubscriptions}

Click All Subscribed Channels
    Wait Until Element Is Visible  ${SubsriptionsPageAllBtn}
    Click Element  ${SubsriptionsPageAllBtn}
    Element Should Contain Text  ${SubsriptionsPageTypeBtn}  Most relevant
    Sleep  2s

Verify If Channel Is Subscribed Successfully
    Page Should Contain Element  ${SubscriptionsPageSubscribedChannel}
    Click Element  ${SubscriptionsPageSubscribedChannel}
    Click Element  ${SubscriptionsPageSubscribedHome}
    Page Should Contain Element  ${SubscriptionsPageSubscribedStatus}