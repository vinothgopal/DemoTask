import json

def red_request_content():
    file=open("C:\\Users\\k64085043\\PycharmProjects\\DemoProject\\JsonContent\\sample.txt",'r')
    jsonfile=file.read()
    json_content=json.loads(jsonfile)
    return json_content
def verifyResponseTextvalues(acValue,exValue):
    if str(exValue) in str(acValue):
        return True
    else:
        return False
