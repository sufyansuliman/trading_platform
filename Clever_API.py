import requests
import json 
import numpy as np

url = "https://api.clever.com/v3.0/sections"

querystring = {'limit':'379'}
headers = {
    "Accept": "application/json",
    "Authorization": "Bearer DEMO_TOKEN"
}

response = requests.request("GET", url, headers=headers, params = querystring)

jsonResponse = json.loads(response.text)
allStudents = []
for section in jsonResponse['data']:
    allStudents.append(len(section['data']['students']))
averageStudents = np.mean(allStudents)
print(int(np.round(averageStudents)))

