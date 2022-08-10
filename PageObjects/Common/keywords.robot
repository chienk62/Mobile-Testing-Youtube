*** Settings ***
Library  AppiumLibrary


*** Variables ***


*** Keywords ***
Open Youtube App
    Open Application  http://127.0.0.1:4723/wd/hub 	platformName=Android  platformVersion=7.1.2
    ...               deviceName=3752621b7d84  appPackage=com.google.android.youtube
    ...               appActivity=com.google.android.apps.youtube.app.WatchWhileActivity
    Sleep  2s