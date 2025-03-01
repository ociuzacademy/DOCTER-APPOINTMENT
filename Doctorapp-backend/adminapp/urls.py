from django.urls import path
from .views import *

urlpatterns = [
     path('admin-login/', admin_login, name='admin_login'),  # URL for admin-only login
    path('admin_home/', admin_home, name='admin_home'),
    path('pending-doctors/', pending_doctors, name='pending_doctors'),
    path('approved-doctors/', approved_doctors, name='approved_doctors'),
     path('approve_doctor/<int:doctor_id>/', approve_doctor, name='approve_doctor'),
    path('reject_doctor/<int:doctor_id>/', reject_doctor, name='reject_doctor'),
]

