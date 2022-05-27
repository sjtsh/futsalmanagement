
from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response

from futsal.models import Admin, Notice


@api_view(['GET'])
def getNotice(request):
    notices = Notice.objects.all()
    returnable = []
    for i in notices:
        aDict = {"admin":   i.admin.name, "description": i.description,
                 "subject": i.subject}
        returnable.append(aDict)
    return Response(returnable)


@api_view(['POST'])
def postNotice(request):
    Notice.objects.create(admin=Admin.objects.get(
        id=request.data["admin"]), description=request.data["description"], subject=request.data["subject"])
    return Response(True)
