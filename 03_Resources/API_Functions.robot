
*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections
Library           ../04_Functions/ReadJsonContent.py
Resource  ../02_Configuration/API_Config.txt
*** Variables ***

*** Keywords ***
verifyStatusCode
    [Arguments]    ${response}    ${exStatusCode}
    ${Acstatus_code}=    convert to string    ${response.status_code}
    should be equal    ${Acstatus_code}    ${exStatusCode}
    log    ${Acstatus_code}
    log  ${exStatusCode}
get_Request_Content
    ${jsonBody}=  red_request_content
    [Return]  ${jsonBody}
verifyResponseValue
    [Arguments]    ${response}    ${jsonPath}    ${ExValue}
    @{values}=    get value from json    ${response}    ${jsonPath}
    ${acValue}=    get from list    ${values}    0
    should be equal    ${acValue}    ${ExValue}
    log    Actual Valus : ${acValue}
    log    Expected Value : ${ExValue}
verifyResponseText
    [Arguments]    ${response}  ${ExValue}
    ${acValue}=  verifyResponseTextvalues  ${response}  ${ExValue}
    should be equal    '${acValue}'    'True'
    log    Actual Valus : ${response}
    log    Expected Value : ${ExValue}