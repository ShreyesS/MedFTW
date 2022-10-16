from asyncio import run_coroutine_threadsafe
import requests
from ApiFunctions import *

def getCarePlanInformation(id):
    carePlan = getRequest('CarePlan', f'patient=Patient/{id}').keys()
    if not carePlan:
        print("No Care Plan Found")
        return False
    planInfo = carePlan.keys()
    print(planInfo)

getPractitionerInformation(778)
