from asyncio import run_coroutine_threadsafe
import requests
from ApiFunctions import *

def getCarePlanInformation(id):
    carePlans = getRequest('CarePlan', f'?subject=Patient/{id}')
    
    plans = []
    if not carePlans:
        print("No Care Plan Found")
        return False
    for carePlan in carePlans:
        s = carePlan['resource']['text']['div']
        strings = []
        s = s.split('>')
        for st in s:
            if st[:1] != '<' and st[:1]:
                strings.append(st.split('<')[0])
        care = {'type' : strings[0],
                'activity' : strings[2],
                'intent' : strings[4]
                }
        plans.append(care)
    
    return plans

