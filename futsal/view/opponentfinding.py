from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response

from futsal.models import *


@api_view(['GET'])
def getOpponentFinding(request):
    opponentFindings = OpponentFinding.objects.all()
    returnable = []
    for i in opponentFindings:
        aDict = {"id": i.id, "user": i.user.name,  "start_time": i.booking.start_time,
                 "end_time": i.booking.end_time, "date": i.booking.date, "booking": i.booking.id}
        returnable.append(aDict)
    return Response(returnable)


@api_view(['POST'])
def postOpponentFinding(request):
    OpponentFinding.objects.create(user=User.objects.get(
        id=request.data["user"]), booking=Booking.objects.get(id=request.data["booking"]))
    return Response(True)


@api_view(['POST'])
def acceptOpponentFinding(request):
    oppponentfinding = OpponentFinding.objects.get(id=request.data["id"])
    booking = Booking.objects.get(id=request.data["booking"])
    booking.booked = True
    booking.save()
    UserBooking.objects.create(user1=oppponentfinding.user, user2=User.objects.get(id=request.data["user"]), booking=booking)
    oppponentfinding.delete()
    return Response(True)
