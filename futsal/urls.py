from django.urls import path
from futsal.view.auth import *
from futsal.view.booking import *
from futsal.view.feedback import *
from futsal.view.futsal import getFutsal
from futsal.view.opponentfinding import *

from futsal.view.notice import *
from futsal.view.tournament import *

from .views import *
from rest_framework.routers import DefaultRouter

urlpatterns = [
    path('notice/', getNotice),
    path('notice/insert/', postNotice),

    path('tournament/', getTournament),
    path('tournament/insert/', postTournament),
    path('register/<int:user>/<int:tournament>/', registerTournament),

    path('signin/', signIn),
    path('signup/', signUp),
    path('signinadmin/', signInAdmin),

    path('feedback/', getFeedback),
    path('feedback/insert/', postFeedback),

    path('booking/<str:type>/<str:date>', getBooking),
    path('userbooking/', getUserBooking),

    path('opponent/', getOpponentFinding),
    path('post/', postOpponentFinding),
    path('accept/', acceptOpponentFinding),

    path('futsal/', getFutsal),

    # path('dummy/', insertDummy),
    # path('exams/<int:pk>/', getExams),
]
