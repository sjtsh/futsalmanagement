
# return Feedback(json["name"], json["description"],
#     DateTime.parse(json["created"]), json["created_by"]);
from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response

from futsal.models import *


@api_view(['GET'])
def getFeedback(request):
    feedbacks = Feedback.objects.all()
    returnable = []
    for i in feedbacks:
        aDict = {"name": i.subject, "description": i.description,
                 "created": i.created, "created_by": i.user.email}
        returnable.append(aDict)
    return Response(returnable)


@api_view(['POST'])
def postFeedback(request):
    Feedback.objects.create(user=User.objects.get(
        id=request.data["user"]), subject=request.data["subject"], description=request.data["description"], )
    return Response(True)
