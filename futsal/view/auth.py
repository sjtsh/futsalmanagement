from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response

from futsal.models import *


@api_view(['POST'])
def signIn(request):
    email = request.data["email"]
    password = request.data["password"]
    try:
        user = User.objects.get(email=email, password=password)
        return Response({"id": user.id, "email": user.email, "address": user.address, "phone": user.phone, "name": user.name})
    except:
        return Response(False)


@api_view(['POST'])
def signInAdmin(request):
    email = request.data["email"]
    password = request.data["password"]
    try:
        admin = Admin.objects.get(email=email, password=password)
        return Response(admin.name)
    except:
        return Response(False)


@api_view(['POST'])
def signUp(request):
    email = request.data["email"]
    password = request.data["password"]
    address = request.data["address"]
    phone = request.data["number"]
    name = request.data["name"]
    user = User.objects.all().filter(email=email)
    if(len(user) > 0):

        return Response(False)
    else:
        user = User()
        user.name = name
        user.email = email
        user.password = password
        user.address = address
        user.phone = phone
        user.save()
        return Response({"id": user.id, "email": user.email, "address": user.address, "phone": user.phone, "name": user.name})
