
from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response

from futsal.models import Admin, Futsal, Notice


@api_view(['GET'])
def getFutsal(request):
    futsals = Futsal.objects.all()
    returnable = []
    for i in futsals:
        aDict = {"id":i.id,"name":   i.name, "latitude": i.latitude,
                 "longitude": i.longitude}
        returnable.append(aDict)
    return Response(returnable)
