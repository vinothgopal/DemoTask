*** Settings ***
Library  AppiumLibrary
Resource  ../02_Configuration/Mobile_Config.txt
*** Variables ***

*** Keywords ***
Open_mobile_Settings
    OPEN APPLICATION  ${Appiumhost}  platformName=${Platform}  deviceName=${device}  appPackage=${package}  appActivity=${Activity}  automationName=Uiautomator2
ClickSoundiconandVerifyASoundElements
    wait until page contains element  //android.widget.TextView[@text='Sound']  timeout=10s
    click element  //android.widget.TextView[@text='Sound']
    wait until page contains element  //android.widget.TextView[@text='Media volume']  timeout=10s
    wait until page contains element  //android.widget.TextView[@text='Call volume']
    wait until page contains element  //android.widget.TextView[@text='Ring volume']
    wait until page contains element  //android.widget.TextView[@text='Alarm volume']
    wait until page contains element  //android.widget.TextView[@text='Also vibrate for calls']
    wait until page contains element  //android.widget.TextView[@text='Do Not Disturb']
    wait until page contains element  //android.widget.TextView[contains(@text,'Shortcut to')]
    wait until page contains element  //android.widget.TextView[contains(@text,'Phone ringtone')]
    wait until page contains element  //android.widget.TextView[contains(@text,'Default notification')]
    capture page screenshot
DND_ON_VerifyStatus
    click element  //android.widget.TextView[@text='Do Not Disturb']
    wait until page contains element  //android.widget.Button[contains(@text,'TURN')]
    click element  //android.widget.Button[contains(@text,'TURN')]
    capture page screenshot
    #wait until page contains element  //android.widget.ImageButton[@content-desk='Navigate up']
    click element  //android.widget.TextView[@text='Do Not Disturb']/preceding::android.widget.ImageButton
    capture page screenshot
    ${dndval1}=  get text  //android.widget.TextView[@text='Do Not Disturb']/following-sibling::android.widget.TextView[@resource-id='android:id/summary']
    #log to console  get text  //android.widget.TextView[@text='Do Not Disturb']/following::TextView[1]
    log  ${dndval1}
    should be equal  On  ${dndval1}
    #click element  //android.widget.TextView[@text='Sound']/preceding::android.widget.ImageButton
    capture page screenshot
DND_Off_VerifyStatus
    click element  //android.widget.TextView[@text='Do Not Disturb']
    wait until page contains element  //android.widget.Button[contains(@text,'TURN')]
    click element  //android.widget.Button[contains(@text,'TURN')]
    click element  //android.widget.TextView[@text='Do Not Disturb']/preceding::android.widget.ImageButton
    capture page screenshot
    wait until page contains element  //android.widget.TextView[@text='Do Not Disturb']/following-sibling::android.widget.TextView[@resource-id='android:id/summary']  timeout=10s
    ${dndval2}=  get text  //android.widget.TextView[@text='Do Not Disturb']/following-sibling::android.widget.TextView[@resource-id='android:id/summary']
    #log to console  get text  //android.widget.TextView[@text='Do Not Disturb']/following::TextView[1]
    log  ${dndval2}
    should be equal  Off  ${dndval2}
    click element  //android.widget.TextView[@text='Sound']/preceding::android.widget.ImageButton
