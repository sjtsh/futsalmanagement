from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response
from datetime import datetime, timedelta
from futsal.models import *
from django.utils.timezone import make_aware
from dateutil.tz import tz
from django.utils.timezone import get_current_timezone
import pytz


@api_view(['GET'])
def getBooking(request, type, date):
    startdate = date[0:10]
    enddate = date[0:8] + \
        str(int(date[8:10])+1)
    bookings = Booking.objects.all().filter(booked=False).filter(
        date__date__range=(startdate, enddate)).filter(court_type = type)
    returnable = []
    for i in bookings:
        aDict = {"id":i.id, "court_type":   i.court_type, "date": i.date,
                 "start_time": i.start_time, "end_time": i.end_time, "price": i.price, }
        returnable.append(aDict)
    return Response(returnable)


@api_view(['GET'])
def getUserBooking(request):
    userBookings = UserBooking.objects.all()
    returnable = []
    for i in userBookings:
        aDict = {"user1": i.user1.phone, "user2": i.user2.phone, "court_type":   i.booking.court_type, "date": i.booking.date,
                 "start_time": i.booking.start_time, "end_time": i.booking.end_time, "price": i.booking.price, "created": i.created, }
        returnable.append(aDict)
    return Response(returnable)


# @api_view(['GET'])
# def insertDummy(request):
#     for z in range(30):
#         date = datetime.now() + timedelta(days= z)
#         for court in ["5A", "7A"]:
#             for i in range(7, 19):
#                 start = str(date)[0:11] + str(i).rjust(2, "0") + str(date)[13:len(str(date))]
#                 end = str(date)[0:11] + str(i+1).rjust(2, "0") + str(date)[13:len(str(date))]
#                 actual = str(date)[0:11] + "00" + str(date)[13:len(str(date))]
#                 print(start)
#                 print(end)
#                 print(actual)
#                 Booking.objects.create(
#                     court_type=court, date=str(actual), start_time=str(start), end_time=str(end), price=1200, booked=False)
#     return Response(str(""))
