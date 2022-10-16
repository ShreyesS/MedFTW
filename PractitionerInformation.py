from asyncio import run_coroutine_threadsafe
import requests
from ApiFunctions import *

def getPractitionerInformation(id):
    practitioner = getRequest('Patient', f'/{id}').keys()
    if not practitioner:
        print("No Practitioner Found")
        return False
    practInfo = practitioner[0]['generalPractitioner']['display']
    practID = practitioner[0]['generalPractitioner']['display']
    print(practInfo)
    print(practID)

getPractitionerInformation(778)
