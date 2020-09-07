*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections
Library           ../FunctionLibrary/ReadJsonContent.py

*** Variables ***
${base_url}       http://thetestingworldapi.com/
${uri}            api/studentsDetails
${firstName}      vinoth
${postStatusCode}    201
${getStatusCode}    200

*** Test Cases ***
TC_Post_Task_001
    create session    postTask    ${base_url}
    &{header}    create dictionary    Content-Type=application/json
    ${jsonv}=  get_Request_Content
    log to console  ${jsonv}
    ${postRes}=    post request    postTask    ${uri}    headers=${header}    data=${jsonv}
    verifyStatusCode    ${postRes}    ${postStatusCode}
    ${jsonRes}=    to json    ${postRes.content}
    log    ${jsonRes}
    @{id_val}=    get value from json    ${jsonRes}    id
    log to console    ${id_val}
    ${id}=    get from list    ${id_val}    0
    Set Global Variable    ${id}

TC_Get_Task_002
    create session    getTask    ${base_url}
    ${getRes}=    get request    getTask    ${uri}/${id}
    verifyStatusCode    ${getRes}    ${getStatusCode}
    ${getJsonRes}=    to json    ${getRes.content}
    log    ${getJsonRes}
    verifyResponseValue    ${getJsonRes}    data.first_name    ${firstName}

*** Keywords ***
verifyStatusCode
    [Arguments]    ${response}    ${exStatusCode}
    ${Acstatus_code}=    convert to string    ${response.status_code}
    should be equal    ${Acstatus_code}    ${exStatusCode}
    log to console    ${Acstatus_code}
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
