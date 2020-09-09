
*** Settings ***
Library           AppiumLibrary
Resource  ../02_Configuration/Mobile_Config.txt
Resource  ../03_Resources/Mobile_Functions.robot
*** Variables ***

*** Test Cases ***
TC_Mobile_Settings_DND_Status_Change_and_Verify
    Open_mobile_Settings
    ClickSoundiconandVerifyASoundElements
    DND_ON_VerifyStatus
    DND_Off_VerifyStatus
