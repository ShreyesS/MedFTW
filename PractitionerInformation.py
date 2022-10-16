from asyncio import run_coroutine_threadsafe
import requests
from ApiFunctions import *

def getPractitionerInformation(id):
    name = getNameById(id)
    location = getLocationByName(name)
    print(location)
getPractitionerInformation(208537)
