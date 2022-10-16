from asyncio import run_coroutine_threadsafe
import requests
from ApiFunctions import *

def LocationByName(name):
    patient = getPatientByName(name)
    if patient:
        location = patient['resource']['address'][0]
        locationLL = location['extension'][0]['extension']
        locationLine = f"{location['line'][0]}, {location['city']}, {location['state']} {location['postalCode']}"
        return (locationLL[0]['valueDecimal'], locationLL[1]['valueDecimal'], locationLine)

print(LocationByName('Ayala'))