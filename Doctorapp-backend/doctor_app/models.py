from datetime import timezone
from django.db import models

# Create your models here.


class User(models.Model):
    name = models.CharField(max_length=100, default='')
    phone_number = models.CharField(max_length=15, default='')
    age = models.CharField(max_length=3)
    email = models.EmailField()
    password = models.CharField(max_length=100, default='')
    image = models.ImageField(upload_to='users', null=True, blank=True)
    utype = models.CharField(max_length=10, default='user')

    def __str__(self):
        return self.name  # Display the user's name


class Doctor(models.Model):
    name = models.CharField(max_length=100, default='')
    phone_number = models.CharField(max_length=15, default='')
    specialization = models.CharField(max_length=150, default='')
    qualification = models.CharField(max_length=150, default='')
    experience = models.CharField(max_length=50, default='')
    email = models.EmailField()
    password = models.CharField(max_length=100, default='')
    utype = models.CharField(max_length=10, default='doctor')
    status = models.CharField(max_length=20, default='pending')
    image = models.ImageField(upload_to='doctors', null=True, blank=True)
    doctor_fee = models.CharField(max_length=10, default='')
    clinic_place = models.CharField(max_length=255, default='', blank=True)
    bio = models.TextField(default='', blank=True)
    district = models.CharField(max_length=255, default='', blank=True)
    id_image = models.ImageField(upload_to='doctors_id', null=True, blank=True)

    def __str__(self):
        return self.name  # Display the doctor's name


class Disease(models.Model):
    name = models.CharField(max_length=100, default='')
    symptoms = models.JSONField(default=list)
    type = models.CharField(max_length=50, default='')
    doctortype = models.CharField(max_length=50, default='')
    description = models.TextField(default='', blank=True)  # Added description field
    cause = models.TextField(default='', blank=True)  # Added cause field
    treatment = models.TextField(default='', blank=True)  # Added treatment field



class Admin(models.Model):
    username = models.CharField(max_length=100,default='')
    password = models.CharField(max_length=100,default='')
    email = models.CharField(max_length=100,unique=True)
    utype = models.CharField(max_length=20,default='admin')


class ChatMessage(models.Model):
    sender_user = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True)  # User sending the message
    sender_doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE, null=True, blank=True)  # doctor sending the message
    receiver_user = models.ForeignKey(User, related_name='receiver_user', on_delete=models.CASCADE, null=True, blank=True)  # User receiving the message
    receiver_doctor = models.ForeignKey(Doctor, related_name='receiver_doctor', on_delete=models.CASCADE, null=True, blank=True)  # doctor receiving the message
    message = models.TextField()
    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'Message from {self.sender_user or self.sender_doctor} to {self.receiver_user or self.receiver_doctor} at {self.timestamp}'

class ChatRoom(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="chat_room")
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE, related_name="chat_room")

    class Meta:
        unique_together = ('user', 'doctor')
        indexes = [
            models.Index(fields=['user', 'doctor']),
        ]

    def __str__(self):
        return f"ChatRoom({self.user.name} & {self.doctor.name})"
    

    
class ChatMessage1(models.Model):
    """
    Stores individual chat messages exchanged in a chat room.
    """
    SENDER_CHOICES = [
        ('user', 'User'),
        ('doctor', 'Doctor')
    ]

    chat_room = models.ForeignKey(ChatRoom, on_delete=models.CASCADE, related_name="messages")
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="sent_messages", null=True, blank=True)
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE, related_name="sent_messages", null=True, blank=True)
    
    message = models.TextField()
    sender = models.CharField(max_length=10, choices=SENDER_CHOICES)  # Indicates whether the sender is a user or a doctor
    
    is_viewed_by_user = models.BooleanField(default=False)  # Tracks if user has seen the message
    is_viewed_by_doctor = models.BooleanField(default=False)  # Tracks if doctor has seen the message

    created_at = models.DateTimeField(auto_now_add=True)  # Timestamp for when the message was created
    is_deleted = models.BooleanField(default=False)  # Soft delete for messages

    class Meta:
        ordering = ['created_at']  # Ensure messages are retrieved in chronological order
        indexes = [
            models.Index(fields=['chat_room', 'created_at']),  # Index for efficient message retrieval
        ]

    def __str__(self):
        sender_name = self.user.name if self.user else self.doctor.name
        return f"Message from {sender_name}: {self.message[:20]}..."

class Feedback(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True)
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE, related_name='feedbacks')
    feedback = models.TextField()
    rating = models.CharField(max_length=100,default='')
    timestamp = models.DateTimeField(auto_now_add=True)

    
from datetime import timedelta, datetime


class DoctorAvailableTime(models.Model):
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE, related_name='doctor_available_time')
    date = models.DateField()
    day = models.CharField(max_length=100)
    start_time = models.TimeField()
    end_time = models.TimeField()
    is_available = models.BooleanField(default=True)

    def create_slots(self, slot_duration=30):
        """
        Create slots for the available time.
        """
        start_time = datetime.combine(self.date, self.start_time)
        end_time = datetime.combine(self.date, self.end_time)
        slot_duration = timedelta(minutes=slot_duration)

        slots = []
        while start_time + slot_duration <= end_time:
            # Calculate the end time for the slot
            slot_end_time = start_time + slot_duration

            slots.append(Slots(
                doctor_available_time=self,
                date=self.date,  # Use the availability date for the slot
                start_time=start_time.time(),  # Store the start time as time object
                end_time=slot_end_time.time(),  # Store the end time as time object
                status="available"  # Default status for the slot
            ))

            start_time += slot_duration

        # Bulk create the slots
        Slots.objects.bulk_create(slots)  # Save all slots at once

    def save(self, *args, **kwargs):
        """
        Override save to generate slots after saving DoctorAvailableTime.
        """
        super().save(*args, **kwargs)
        if not self.slots.exists():  # Ensure slots are not duplicated
            self.create_slots()


class Slots(models.Model):
    doctor_available_time = models.ForeignKey(DoctorAvailableTime, on_delete=models.CASCADE, related_name='slots')
    date = models.DateField()  # Store the specific date for the slot
    start_time = models.TimeField()  # Represents the start time of the slot
    end_time = models.TimeField()  # Represents the end time of the slot
    is_booked = models.BooleanField(default=False)
    status = models.CharField(max_length=100, default="available")


class Appointment(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='user_appointments')
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE, related_name='doctor_appointments')
    booked_date = models.DateField()  # Default to today's date
    slot = models.ForeignKey(Slots, on_delete=models.CASCADE)
    amount = models.CharField(max_length=20)
    status = models.CharField(max_length=20, default='pending')
    payment_status = models.CharField(max_length=20, default='pending')
    
