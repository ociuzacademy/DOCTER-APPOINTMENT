from django.contrib import admin
from .import views
from django.urls import path,include,re_path
from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi
from  rest_framework.routers import DefaultRouter
from .views import *
from django.conf import settings
from django.conf.urls.static import static


schema_view = get_schema_view(
    openapi.Info(
        title="Doctor App API",
        default_version="v1",
        description="API documentation for the Doctor App.",
        terms_of_service="https://www.google.com/policies/terms/",
        license=openapi.License(name="BSD License"),
    ),
    public=True,
    permission_classes=[permissions.AllowAny],
)



urlpatterns = [
   path('user_register/', UserRegistrationView.as_view(), name='user-registration'),
    path('user_profile/', UserRegistrationView.as_view(), name='doctor-profile'),
    
    path('doctor_register/', DoctorRegistrationView.as_view(), name='doctor-registration'),
    path('doctor_profile/', DoctorRegistrationView.as_view(), name='doctor-profile'),
    path('doctor_list/', DoctorRegistrationView.as_view(), name='doctor-list'),
    
    path('add_availability/', DoctorAvailableTimeCreateView.as_view(), name='add-availability'),
    path('slots/', SlotsListView.as_view(), name='slots-list'),
    path('login/', LoginView.as_view(), name='login'),
    path('book_appointment/', BookAppointmentView.as_view(), name='book_appointment'),
    path('approve-reject-booking/', ApproveRejectAppointmentView.as_view(), name='approve_reject_booking'),
    path('search_disease_symptom/', DiseaseSymptomSearchView.as_view(),name='search_disease_symptom'),
    path('chat/', ChatAPI.as_view(), name='chat'),
    path('chat/unread_message_count/', ChatAPI.as_view(), name='unread_message_count'),
    path('doctor-stats/', DoctorAppointmentStatsAPIView.as_view(), name='doctor-stats'),
    path('feedback/', FeedbackView.as_view(), name='feedback-create'),
    path('accepted-appointments/', AcceptedAppointmentsView.as_view(), name='accepted-appointments'),
    path('doctor-patients/', DoctorPatientsView.as_view(), name='doctor-patients'),
]   


if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL,
                          document_root=settings.STATIC_ROOT)
    
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)

