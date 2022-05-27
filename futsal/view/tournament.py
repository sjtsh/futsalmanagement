
from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response

from futsal.models import *


@api_view(['GET'])
def getTournament(request):
    tournaments = Tournament.objects.all()
    returnable = []
    for i in tournaments:
        aDict = {"admin":   i.admin.name, "name": i.name,
                 "start_date": i.start_date, "end_date": i.end_date, "court_type": i.court_type, "organizer": i.organizer, "registration_cost": i.registration_cost, "id": i.id}
        returnable.append(aDict)
    return Response(returnable)


@api_view(['POST'])
def postTournament(request):
    Tournament.objects.create(admin=Admin.objects.get(id=request.data["admin"]), name=request.data["name"], start_date=request.data["start_date"], end_date=request.data["end_date"],
                              court_type=request.data["court_type"], organizer=request.data["organizer"], registration_cost=request.data["registration_cost"])
    return Response(True)


@api_view(['GET'])
def registerTournament(request, user, tournament):
    Registration.objects.create(user=User.objects.get(
        id=user), tournament=Tournament.objects.get(id=tournament))
    return Response(True)
