from django.db import models

class User(models.Model):
    name = models.TextField()
    email = models.TextField()
    password = models.TextField()
    address = models.TextField()
    phone = models.TextField()

class Admin(models.Model):
    name = models.TextField()
    email = models.TextField()
    password = models.TextField()


class Notice(models.Model):
    admin = models.ForeignKey(Admin, on_delete=models.CASCADE)
    subject = models.TextField()
    description = models.TextField()


class Feedback(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    subject = models.TextField()
    description = models.TextField()
    created = models.DateTimeField(auto_now=True)


class Futsal(models.Model):
    name = models.TextField()
    latitude = models.FloatField()
    longitude = models.FloatField()


class Tournament(models.Model):
    admin = models.ForeignKey(
        Admin, on_delete=models.CASCADE)  # primarily named user
    name = models.TextField()
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()
    court_type = models.TextField()
    organizer = models.TextField()  # doubt previously organizer
    registration_cost = models.TextField()


class Payment(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    payment_method = models.TextField()
    cost = models.TextField()
    payment_date = models.DateTimeField()


class Registration(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    tournament = models.ForeignKey(Tournament, on_delete=models.CASCADE)


class Booking(models.Model):
    court_type = models.TextField()
    date = models.DateTimeField()
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    price = models.IntegerField()
    booked = models.BooleanField()


class UserBooking(models.Model):
    user1 = models.ForeignKey(User, on_delete=models.CASCADE, related_name='matchfinder')
    user2 = models.ForeignKey(User, on_delete=models.CASCADE)
    booking = models.ForeignKey(Booking, on_delete=models.CASCADE)
    created = models.DateTimeField(auto_now=True)


class OpponentFinding(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    booking = models.ForeignKey(Booking, on_delete=models.CASCADE)
