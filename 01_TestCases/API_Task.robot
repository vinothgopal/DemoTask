
*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections
Library           ../04_Functions/ReadJsonContent.py
Resource  ../02_Configuration/API_Config.txt
Resource  ../03_Resources/API_Functions.robot
*** Variables ***

*** Test Cases ***
TC_Post_API_Task_001
    create session    postTask    ${postUrl}
    &{header}    create dictionary    Content-Type=application/json
    &{body}  create dictionary  hand=wave
    ${postRes}=    post request    postTask   ${Posturi}  headers=${header}  data=${body}
    verifyStatusCode    ${postRes}    ${postStatusCode}
    ${getJsonRes}=    to json    ${postRes.content}
    log    ${getJsonRes}
    verifyResponseValue    ${getJsonRes}    data.hand    ${PostResval}
    verifyResponseValue    ${getJsonRes}    url    ${postUrl}${Posturi}
TC_Get_API_Task_002
    create session    getTask    ${getUrl}
    &{header}    create dictionary    Content-Type=text/html; charset=UTF-8
    ${getRes}=    get request    getTask    /  headers=${header}
    verifyStatusCode    ${getRes}    ${getStatusCode}
    verifyResponseText  ${getRes.content}  ${GetResVal}
