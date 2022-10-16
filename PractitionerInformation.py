from asyncio import run_coroutine_threadsafe
import requests
from ApiFunctions import *

def getPractitionerInformation(id):
    practitioner = getRequest('Practitioner', f'?patient=Patient/{id}')
    if not practitioner:
        print("No Immunizations Found")
        return False
    print(practitioner)
    """
    lst = []
    for prac in practitioner:
        concatenatedString = imm['resource']['vaccineCode']['coding'][0]['display'] + " - " + imm['resource']['meta']['lastUpdated']
        lst += concatenatedString
        print(concatenatedString)

    return lst
    """