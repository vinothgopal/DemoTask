
*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections
Resource          ../Config.txt
Library           ../FunctionLibrary/ReadJsonContent.py

*** Variables ***
${base_url}       ${url}
${uri}            api/studentsDetails
${firstName}      vinoth
${postStatusCode}    204
${getStatusCode}    200
*** Test Cases ***
TC_Post_Task_003
    create session    postTask    https://www.google.com
    &{header}    create dictionary    Content-Type=ext/html; charset=UTF-8
    #${jsonv}=  get_Request_Content
    #log to console  ${jsonv}
    ${postRes}=    post request    postTask   /gen_204  headers=${header}  params=kone
    verifyStatusCode    ${postRes}    ${postStatusCode}
TC_Get_Task_004
    create session    getTask    https://www.google.com
    &{header}    create dictionary    Content-Type=application/json; charset=UTF-8
    ${getRes}=    get request    getTask    /  headers=${header}
    verifyStatusCode    ${getRes}    ${getStatusCode}
    log to console  ${getRes.content}
    #${getJsonRes}=    to json    ${getRes.content}
*** Keywords ***
verifyStatusCode
    [Arguments]    ${response}    ${exStatusCode}
    ${Acstatus_code}=    convert to string    ${response.status_code}
    should be equal    ${Acstatus_code}    ${exStatusCode}
    log to console    ${Acstatus_code}