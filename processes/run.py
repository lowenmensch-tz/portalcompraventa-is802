from multiprocessing import Process
import time
from email_manager import *
from product_manager import *

seconds_in_day = 60 * 60 * 24
seconds_in_hour = 60 * 60
seconds_in_minute = 60

def emailProcess(debug=False):

    if debug:
        while True:
            manager = EmailManager()
            print("5 min email")
            manager.sendEmails()
            time.sleep(300) #Se ejecuta cada 5 min
    else:
        manager = EmailManager()
        seconds = manager.calculateFisrtSleepTime()

        days = seconds // seconds_in_day
        hours = (seconds - (days * seconds_in_day)) // seconds_in_hour
        minutes = (seconds - (days * seconds_in_day) - (hours * seconds_in_hour)) // seconds_in_minute
        print("%s:%s:%s until email process execution." % (days,hours,minutes))

        time.sleep(seconds)

        while True:
            manager.sendEmails()
            time.sleep(604800) #Tiempo de una semana en segundos

def productsProcess(debug=False):
    if debug:
        manager = ProductManager()
        while True:
            print("5 min products")
            manager.dropProductsAndServices()
            time.sleep(300) #Se ejecuta cada 5 min 
    else:
        manager = ProductManager()
        seconds = manager.calculateFisrtSleepTime()

        days = seconds // seconds_in_day
        hours = (seconds - (days * seconds_in_day)) // seconds_in_hour
        minutes = (seconds - (days * seconds_in_day) - (hours * seconds_in_hour)) // seconds_in_minute
        print("%s:%s:%s until drop products and services process execution." % (days,hours,minutes))

        time.sleep(seconds)

        while True:
            manager.dropProductsAndServices()

            time.sleep(86400) #Tiempo de un día en segundos


p1 = Process(target=emailProcess, args=(True,))
p2 = Process(target=productsProcess, args=(True,))

p1.start()
p2.start()