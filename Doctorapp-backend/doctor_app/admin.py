from django.contrib import admin
from .models import (
    User, Doctor, Disease, Admin, ChatMessage, Feedback,
    DoctorAvailableTime, Slots, Appointment
)

# Register User model
@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    list_display = ('name', 'phone_number', 'email', 'age', 'utype')  # Display essential fields
    search_fields = ('name', 'phone_number', 'email')  # Enable search
    list_filter = ('utype',)  # Filter by user type


# Register Doctor model
@admin.register(Doctor)
class DoctorAdmin(admin.ModelAdmin):
    list_display = ('name', 'phone_number', 'specialization', 'qualification', 'status', 'doctor_fee', 'clinic_place', 'district')
    search_fields = ('name', 'phone_number', 'specialization', 'email')
    list_filter = ('status', 'specialization', 'utype')
    actions = ['approve_doctor', 'reject_doctor']  # Custom actions

    @admin.action(description='Approve selected doctors')
    def approve_doctor(self, request, queryset):
        queryset.update(status='approved')
        self.message_user(request, "Selected doctors have been approved.")

    @admin.action(description='Reject selected doctors')
    def reject_doctor(self, request, queryset):
        queryset.update(status='rejected')
        self.message_user(request, "Selected doctors have been rejected.")


# Register Disease model
@admin.register(Disease)
class DiseaseAdmin(admin.ModelAdmin):
    list_display = ('name', 'type', 'doctortype', 'description', 'cause')
    search_fields = ('name', 'type', 'doctortype')
    list_filter = ('type', 'doctortype')


# # Register Admin model
# @admin.register(Admin)
# class AdminAdmin(admin.ModelAdmin):
#     list_display = ('username', 'email', 'utype')
#     search_fields = ('username', 'email')


# # Register ChatMessage model
# @admin.register(ChatMessage)
# class ChatMessageAdmin(admin.ModelAdmin):
#     list_display = ('sender_user', 'receiver_user', 'message', 'timestamp')
#     search_fields = ('sender_user__name', 'receiver_user__name', 'message')


# # Register Feedback model
# @admin.register(Feedback)
# class FeedbackAdmin(admin.ModelAdmin):
#     list_display = ('user', 'feedback')
#     search_fields = ('user__name', 'feedback')


# # Register DoctorAvailableTime model
# @admin.register(DoctorAvailableTime)
# class DoctorAvailableTimeAdmin(admin.ModelAdmin):
#     list_display = ('doctor', 'date', 'day', 'start_time', 'end_time', 'is_available')
#     list_filter = ('doctor', 'is_available')


# # Register Slots model
# @admin.register(Slots)
# class SlotsAdmin(admin.ModelAdmin):
#     list_display = ('doctor_available_time', 'start_time', 'end_time', 'status', 'is_booked')
#     list_filter = ('status', 'is_booked')


# # Register Appointment model
# @admin.register(Appointment)
# class AppointmentAdmin(admin.ModelAdmin):
#     list_display = ('user', 'doctor', 'booked_date', 'slot', 'amount', 'status', 'payment_status')
#     list_filter = ('status', 'payment_status')
#     search_fields = ('user__name', 'doctor__name', 'amount')
