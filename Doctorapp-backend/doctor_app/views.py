from datetime import date
from django.shortcuts import get_object_or_404
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView
from sympy import Q

from adminapp import models
from .models import Appointment,  ChatMessage, ChatMessage1, ChatRoom, Disease, DoctorAvailableTime, Feedback, Slots, User, Doctor
from .serializers import BookAppointmentSerializer, ChatMessageSerializer, ChatRoomSerializer, DoctorAvailableTimeSerializer, DoctorSerializer, FeedbackSerializer, SlotsSerializer, UserRegisterSerializer, DoctorRegisterSerializer, UserSerializer, ViewAppointmentSerializer
from rest_framework.status import HTTP_400_BAD_REQUEST, HTTP_200_OK
from django.shortcuts import get_object_or_404
from django.db.models import Q




# User Registration View
class UserRegistrationView(APIView):
    permission_classes = [AllowAny]

    def post(self, request, *args, **kwargs):
        email = request.data.get('email')
        if User.objects.filter(email=email).exists():
            response_data = {
                "status": "failed",
                "message": "Email already exists",
            }
            return Response(response_data, status=status.HTTP_400_BAD_REQUEST)

        serializer = UserRegisterSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            response_data = {
                "status": "success",
                "message": "User created successfully",
            }
            return Response(response_data, status=status.HTTP_200_OK)
        else:
            response_data = {
                "status": "failed",
                "message": "Invalid details",
                "errors": serializer.errors,
            }
            return Response(response_data, status=status.HTTP_400_BAD_REQUEST)

    def get(self, request, *args, **kwargs):
        user_id = request.GET.get('id')  # Fetch user ID from query parameters
        if not user_id:
            return Response(
                {"status": "failed", "message": "User ID is required"},
                status=status.HTTP_400_BAD_REQUEST,
            )

        try:
            user = User.objects.get(id=user_id)
            serializer = UserRegisterSerializer(user)
            response_data = {
                "status": "success",
                "data": serializer.data,
            }
            return Response(response_data, status=status.HTTP_200_OK)
        except User.DoesNotExist:
            return Response(
                {"status": "failed", "message": "User not found"},
                status=status.HTTP_404_NOT_FOUND,
            )



# Doctor Registration View
class DoctorRegistrationView(APIView):
    permission_classes = [AllowAny]

    def post(self, request, *args, **kwargs):
        serializer = DoctorRegisterSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            response_data = {
                "status": "success",
                "message": "Doctor created successfully",
            }
            return Response(response_data, status=status.HTTP_200_OK)
        else:
            response_data = {
                "status": "failed",
                "message": "Invalid credentials",
                "errors": serializer.errors,
            }
            return Response(response_data, status=status.HTTP_400_BAD_REQUEST)

    def get(self, request, *args, **kwargs):
        doctor_id = request.query_params.get('id')
        disease_name = request.query_params.get('disease')
        search_query = request.query_params.get('search_query')
        if doctor_id:
            # Retrieve a specific doctor by ID
            try:
                doctor = Doctor.objects.get(id=doctor_id)
                serializer = DoctorRegisterSerializer(doctor)
                response_data = {
                    "status": "success",
                    "data": serializer.data,
                }
                return Response(response_data, status=status.HTTP_200_OK)
            except Doctor.DoesNotExist:
                response_data = {
                    "status": "failed",
                    "message": "Doctor not found",
                }
                return Response(response_data, status=status.HTTP_404_NOT_FOUND)
        elif disease_name:
            # Find the diseases by partial name match (case-insensitive)
            diseases = Disease.objects.filter(name__icontains=disease_name)

            if diseases.exists():
                # Extract doctortypes from the matching diseases
                doctor_types = diseases.values_list('doctortype', flat=True).distinct()

                # Get doctors whose specialization matches any of the found doctor types
                doctors = Doctor.objects.filter(specialization__in=doctor_types)

                # Serialize the doctor data
                serializer = DoctorRegisterSerializer(doctors, many=True)

                # Return response with the data key
                return Response({"data": serializer.data})
            
            return Response({"error": "No matching diseases found"}, status=status.HTTP_404_NOT_FOUND)
        elif search_query:
            # Search for doctors by name or specialization (case-insensitive)
            doctors = Doctor.objects.filter(
                Q(name__icontains=search_query) | Q(specialization__icontains=search_query)|Q(clinic_place__icontains=search_query) |
                Q(district__icontains=search_query)
            )
            if doctors.exists():
                serializer = DoctorRegisterSerializer(doctors, many=True)
                return Response({"status": "success", "data": serializer.data}, status=status.HTTP_200_OK)
            else:
                return Response({"status": "failed", "message": "No doctors found matching the search query"}, status=status.HTTP_404_NOT_FOUND)
        else:
            # Retrieve all approved doctors if no ID or disease name is passed
            approved_doctors = Doctor.objects.filter(status="approved")
            serializer = DoctorRegisterSerializer(approved_doctors, many=True)
            response_data = {
                "status": "success",
                "data": serializer.data,
            }
            return Response(response_data, status=status.HTTP_200_OK)



# Login View
class LoginView(APIView):
    permission_classes = [AllowAny]

    def post(self, request, *args, **kwargs):
        email = request.data.get('email')
        password = request.data.get('password')

        # Check if the user exists
        try:
            user = User.objects.get(email=email, password=password)
            response_data = {
                "status": "success",
                "message": "Login successful",
                "utype": "user",
                "id": user.id,
                "name": user.name,
            }
            return Response({"data": [response_data]}, status=status.HTTP_200_OK)
        except User.DoesNotExist:
            pass

        # Check if the doctor exists
        try:
            doctor = Doctor.objects.get(email=email, password=password, status="approved")
            response_data = {
                "status": "success",
                "message": "Login successful",
                "utype": "doctor",
                "id": doctor.id,
                "name": doctor.name,
            }
            return Response({"data": [response_data]}, status=status.HTTP_200_OK)
        except Doctor.DoesNotExist:
            response_data = {
                "status": "failed",
                "message": "Invalid login credentials",
            }
            return Response({"data": [response_data]}, status=status.HTTP_400_BAD_REQUEST)
        
        
class DoctorAvailableTimeCreateView(APIView):
    """
    API for creating doctor availability and generating slots.
    """
    def post(self, request, *args, **kwargs):
        doctor_id = request.data.get('doctor_id')
        if not doctor_id:
            return Response({"error": "Doctor ID is required."}, status=status.HTTP_400_BAD_REQUEST)

        # Validate doctor existence
        doctor = Doctor.objects.filter(id=doctor_id).first()
        if not doctor:
            return Response({"error": "Invalid Doctor ID."}, status=status.HTTP_404_NOT_FOUND)

        # Serialize and validate data
        serializer = DoctorAvailableTimeSerializer(data=request.data)
        if serializer.is_valid():
            try:
                # Save and create slots
                availability = serializer.save(doctor=doctor)
                availability.create_slots()
                return Response({"success": "Availability added successfully."}, status=status.HTTP_200_OK)
            except Exception as e:
                return Response({"error": f"Failed to create slots: {str(e)}"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class DoctorAvailableTimeCreateView(APIView):
    def post(self, request, *args, **kwargs):
        doctor_id = request.data.get('doctor')
        # Check if doctor_id is provided
        if not doctor_id:
            return Response({"error": "Doctor ID is required."}, status=status.HTTP_400_BAD_REQUEST)
        # Validate the doctor exists
        doctor = Doctor.objects.filter(id=doctor_id).first()
        if not doctor:
            return Response({"error": "Invalid Doctor ID."}, status=status.HTTP_404_NOT_FOUND)
        # Serialize and save availability
        serializer = DoctorAvailableTimeSerializer(data=request.data)
        if serializer.is_valid():
            try:
                doctor_available_time = serializer.save(doctor=doctor)
                doctor_available_time.create_slots()  # Generate slots
                return Response({"success": "Availability added successfully."}, status=status.HTTP_200_OK)
            except Exception as e:
                return Response({"error": f"Failed to create slots: {str(e)}"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    
class SlotsListView(APIView):
    def get(self, request, *args, **kwargs):
        doctor_id = request.query_params.get('doctor_id')
        date = request.query_params.get('date')

        if not doctor_id or not date:
            return Response({"error": "doctor_id and date are required."}, status=status.HTTP_400_BAD_REQUEST)

        try:
            doctor_available_time = DoctorAvailableTime.objects.get(doctor_id=doctor_id, date=date)
            slots = doctor_available_time.slots.all()
            print(slots)
            serializer = SlotsSerializer(slots, many=True)
            return Response({"data": serializer.data}, status=status.HTTP_200_OK)

        except DoctorAvailableTime.DoesNotExist:
            return Response({"data": []}, status=status.HTTP_200_OK)
        
class BookAppointmentView(APIView):

    def post(self, request, *args, **kwargs):
        # Extract required data from request
        user_id = request.data.get("user_id")
        doctor_id = request.data.get("doctor_id")
        slot_id = request.data.get("slot_id")

        # Validate required fields
        if not user_id or not doctor_id or not slot_id:
            return Response(
                {"error": "user_id, doctor_id, and slot_id are required."},
                status=status.HTTP_400_BAD_REQUEST,
            )

        # Fetch related objects or return 404
        try:
            user = User.objects.get(id=user_id)
            doctor = Doctor.objects.get(id=doctor_id)
            slot = Slots.objects.get(id=slot_id)
        except User.DoesNotExist:
            return Response({"error": f"User with ID {user_id} not found."}, status=status.HTTP_404_NOT_FOUND)
        except Doctor.DoesNotExist:
            return Response({"error": f"Doctor with ID {doctor_id} not found."}, status=status.HTTP_404_NOT_FOUND)
        except Slots.DoesNotExist:
            return Response({"error": f"Slot with ID {slot_id} not found."}, status=status.HTTP_404_NOT_FOUND)

        # Check if the slot is already booked
        if Appointment.objects.filter(slot=slot, doctor=doctor).exists():
            return Response(
                {"error": "This slot is already booked."},
                status=status.HTTP_400_BAD_REQUEST,
            )
        doctor_fee = doctor.doctor_fee
        # Create appointment data
        appointment_data = {
            "user": user.id,
            "doctor": doctor.id,
            "booked_date": date.today(),
            "slot": slot.id,
            "status": "booked",
            "payment_status": "paid",
            "amount": doctor_fee,
        }

        # Debug: Print data being passed to the serializer
        print("Appointment Data:", appointment_data)

        # Serialize and save appointment data
        serializer = BookAppointmentSerializer(data=appointment_data)
        if serializer.is_valid():
            try:
                # Save the appointment
                serializer.save()

                # Mark the slot as booked
                slot.is_booked = True
                slot.save()

                return Response(
                    {"message": "Appointment booked successfully"},
                    status=status.HTTP_200_OK,
                )
            except Exception as e:
                # Return any error encountered during the save process
                print(f"Error saving appointment: {e}")
                return Response(
                    {"error": f"Error saving appointment: {str(e)}"},
                    status=status.HTTP_500_INTERNAL_SERVER_ERROR,
                )
        else:
            # Return validation errors
            print("Serializer Errors:", serializer.errors)
            return Response(
                {"errors": serializer.errors},
                status=status.HTTP_400_BAD_REQUEST,
            )

    def get(self, request, *args, **kwargs):
        # Fetch query parameters
        user_id = request.GET.get("user_id")
        doctor_id = request.GET.get("doctor_id")

        # Ensure that either user_id or doctor_id is provided, but not both
        if not user_id and not doctor_id:
            return Response(
                {"error": "user_id or doctor_id is required to view appointments."},
                status=status.HTTP_400_BAD_REQUEST,
            )
        if user_id and doctor_id:
            return Response(
                {"error": "Provide only one of user_id or doctor_id to view appointments."},
                status=status.HTTP_400_BAD_REQUEST,
            )

        # Convert IDs to integers if they are provided
        if user_id:
            try:
                user_id = int(user_id)
            except ValueError:
                return Response(
                    {"error": "user_id must be an integer."},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            appointments = Appointment.objects.filter(user_id=user_id)
        elif doctor_id:
            try:
                doctor_id = int(doctor_id)
            except ValueError:
                return Response(
                    {"error": "doctor_id must be an integer."},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            appointments = Appointment.objects.filter(doctor_id=doctor_id, status="booked")

        # Debug: Print the number of appointments found
        print(f"Appointments found: {appointments.count()}")

        # Handle case when no appointments are found
        if not appointments.exists():
            return Response(
                {"appointments": []},  # Return an empty list instead of an error
                status=status.HTTP_200_OK,
            )

        # Serialize and return appointment data
        serializer = ViewAppointmentSerializer(appointments, many=True)
        return Response(
            {"appointments": serializer.data},
            status=status.HTTP_200_OK,
        )
        
class AcceptedAppointmentsView(APIView):
    def get(self, request, *args, **kwargs):
        # Fetch query parameters
        user_id = request.GET.get("user_id")
        doctor_id = request.GET.get("doctor_id")
        date = request.GET.get("date")  # Get the selected date for filtering (YYYY-MM-DD)

        # Ensure that either user_id or doctor_id is provided, but not both
        if not user_id and not doctor_id:
            return Response(
                {"error": "user_id or doctor_id is required to view accepted appointments."},
                status=status.HTTP_400_BAD_REQUEST,
            )
        if user_id and doctor_id:
            return Response(
                {"error": "Provide only one of user_id or doctor_id to view accepted appointments."},
                status=status.HTTP_400_BAD_REQUEST,
            )

        # Convert IDs to integers if they are provided
        try:
            if user_id:
                user_id = int(user_id)
                appointments = Appointment.objects.filter(user_id=user_id, status="approved")
            elif doctor_id:
                doctor_id = int(doctor_id)
                appointments = Appointment.objects.filter(doctor_id=doctor_id, status="approved",slot__date=date)
        except ValueError:
            return Response(
                {"error": "user_id and doctor_id must be integers."},
                status=status.HTTP_400_BAD_REQUEST,
            )

        # Filter appointments by selected date if provided
        if date:
            try:
                appointments = appointments.filter(slot__date=date)
            except ValueError:
                return Response(
                    {"error": "Invalid date format. Use YYYY-MM-DD."},
                    status=status.HTTP_400_BAD_REQUEST,
                )

        # Debug: Print the number of accepted appointments found
        print(f"Accepted Appointments found: {appointments.count()}")

        # Handle case when no appointments are found
        if not appointments.exists():
            return Response(
                {"appointments": []},  # Return an empty list instead of an error
                status=status.HTTP_200_OK,
            )

        # Serialize and return accepted appointment data
        serializer = ViewAppointmentSerializer(appointments, many=True)
        return Response(
            {"appointments": serializer.data},
            status=status.HTTP_200_OK,
        )

        
class ApproveRejectAppointmentView(APIView):
    """
    API to approve or reject an appointment booking.
    If rejected, the appointment status is marked as 'rejected' and payment status is marked as 'refunded'.
    """

    def post(self, request, *args, **kwargs):
        # Extract required data from request
        appointment_id = request.data.get("appointment_id")
        action = request.data.get("action")  # "approve" or "reject"

        if not appointment_id or not action:
            return Response(
                {"error": "appointment_id and action (approve/reject) are required."},
                status=status.HTTP_400_BAD_REQUEST,
            )

        if action not in ['approve', 'reject']:
            return Response(
                {"error": "Invalid action. Use 'approve' or 'reject'."},
                status=status.HTTP_400_BAD_REQUEST,
            )

        try:
            appointment = Appointment.objects.get(id=appointment_id)
        except Appointment.DoesNotExist:
            return Response({"error": "Appointment not found."}, status=status.HTTP_404_NOT_FOUND)

        # Approve the appointment
        if action == 'approve':
            if appointment.status != 'booked':
                return Response(
                    {"error": "Appointment has already been processed."},
                    status=status.HTTP_400_BAD_REQUEST,
                )

            # Change appointment status to approved
            appointment.status = 'approved'

            # If payment status is still 'pending', change to 'completed'
            if appointment.payment_status == 'pending':
                appointment.payment_status = 'paid'

            appointment.save()

            return Response(
                {"message": "Appointment approved successfully."},
                status=status.HTTP_200_OK,
            )

        # Reject the appointment
        elif action == 'reject':
            if appointment.status != 'booked':
                return Response(
                    {"error": "Appointment has already been processed."},
                    status=status.HTTP_400_BAD_REQUEST,
                )

            # Change appointment status to rejected
            appointment.status = 'rejected'

            # Set payment status to refunded
            if appointment.payment_status in ['pending', 'paid']:
                appointment.payment_status = 'refunded'

            appointment.save()

            return Response(
                {"message": "Appointment rejected successfully and payment refunded."},
                status=status.HTTP_200_OK,
            )
            
            
class DoctorPatientsView(APIView):
    def get(self, request):
        doctor_id = request.GET.get("doctor_id")
        user_id = request.GET.get("user_id")

        if user_id:
            # Fetch unique doctors booked by the user
            user = get_object_or_404(User, id=user_id)
            booked_doctors = Doctor.objects.filter(doctor_appointments__user=user).distinct()
            serializer = DoctorSerializer(booked_doctors, many=True)
            return Response({"data": serializer.data}, status=status.HTTP_200_OK)


        elif doctor_id:
            # Fetch unique users (patients) who booked this doctor
            doctor = get_object_or_404(Doctor, id=doctor_id)
            booked_users = User.objects.filter(user_appointments__doctor=doctor).distinct()
            serializer = UserSerializer(booked_users, many=True)
            return Response({"data": serializer.data}, status=status.HTTP_200_OK)


        return Response({"error": "Provide either user_id or doctor_id"}, status=status.HTTP_400_BAD_REQUEST)


import re

def extract_symptoms(query, symptoms_dataset):
    # Convert the query to lowercase for case-insensitive comparison
    query = query.lower()
    
    # Initialize a list to store extracted symptoms
    matching_symptoms = []

    # Loop through each symptom in the dataset
    for symptom in symptoms_dataset:
        # Convert symptom to lowercase for case-insensitive matching
        if symptom.lower() in query:
            matching_symptoms.append(symptom)
    
    return matching_symptoms

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Disease

# Predefined list of symptoms
symptoms_dataset = [
    "Abdominal Pain", "Acid Reflux", "Allergic Reaction", "Anxiety", 
    "Back Pain", "Bleeding Gums", "Blurry Vision", "Body Weakness", 
    "Breathlessness", "Burning Sensation During Urination", "Chest Pain", 
    "Chills", "Cold Sweats", "Constipation", "Cough", "Dehydration", 
    "Depression", "Diarrhea", "Dizziness", "Dry Skin", 
    "Ear Pain", "Excessive Thirst", "Excessive Urination", "Eye Irritation", 
    "Fatigue", "Fever", "Frequent Urination", "Hair Loss", 
    "Headache", "Heart Palpitations", "Heartburn", "Hives", 
    "Hot Flashes", "Increased Appetite", "Indigestion", "Itchy Skin", 
    "Joint Pain", "Lethargy", "Light Sensitivity", "Loss of Appetite", 
    "Loss of Balance", "Low Blood Pressure", "Lump", "Memory Loss", 
    "Mood Swings", "Muscle Aches", "Muscle Weakness", "Nausea", 
    "Night Sweats", "Numbness", "Pale Skin", "Peeling Skin", 
    "Rash", "Red Eyes", "Red Circular Rash", "Runny Nose", 
    "Seizures", "Shortness of Breath", "Skin Discoloration", "Skin Lesions", 
    "Sneezing", "Sore Throat", "Stiff Neck", "Stomach Cramps", 
    "Stomach Pain", "Sudden Weight Loss", "Sweating", "Swelling", 
    "Swollen Lymph Nodes", "Throat Irritation", "Tingling Sensation", "Tiredness", 
    "Toothache", "Trouble Swallowing", "Unexplained Weight Loss", "Vomiting", 
    "Weakness in Limbs", "Weight Gain", "White Patches in Mouth", "Wheezing", 
    "Yellow Skin", "Yellowing of Eyes", "Yawning", "Yeast Infection", 
    "Pain in Joints", "Bleeding After Injury", "Nasal Congestion", "Burning Sensation", 
    "Dry Mouth", "Cracked Skin", "Loss of Vision", "Blood in Stool", 
    "Rectal Bleeding", "Fainting", "Chest Tightness", "Cyanosis", 
    "Bruising Easily", "Abnormal Heart Rate", "Sweaty Palms", "Clammy Skin"
]

def extract_symptoms(query, symptoms_dataset):
    query = query.lower()  # Convert the query to lowercase
    matching_symptoms = []

    # Check if any symptom in the dataset is found in the query
    for symptom in symptoms_dataset:
        if symptom.lower() in query:
            matching_symptoms.append(symptom)

    return matching_symptoms

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Disease

# Predefined list of symptoms
symptoms_dataset = [
    "Abdominal Pain", "Acid Reflux", "Allergic Reaction", "Anxiety", 
    "Back Pain", "Bleeding Gums", "Blurry Vision", "Body Weakness", 
    "Breathlessness", "Burning Sensation During Urination", "Chest Pain", 
    "Chills", "Cold Sweats", "Constipation", "Cough", "Dehydration", 
    "Depression", "Diarrhea", "Dizziness", "Dry Skin", 
    "Ear Pain", "Excessive Thirst", "Excessive Urination", "Eye Irritation", 
    "Fatigue", "Fever", "Frequent Urination", "Hair Loss", 
    "Headache", "Heart Palpitations", "Heartburn", "Hives", 
    "Hot Flashes", "Increased Appetite", "Indigestion", "Itchy Skin", 
    "Joint Pain", "Lethargy", "Light Sensitivity", "Loss of Appetite", 
    "Loss of Balance", "Low Blood Pressure", "Lump", "Memory Loss", 
    "Mood Swings", "Muscle Aches", "Muscle Weakness", "Nausea", 
    "Night Sweats", "Numbness", "Pale Skin", "Peeling Skin", 
    "Rash", "Red Eyes", "Red Circular Rash", "Runny Nose", 
    "Seizures", "Shortness of Breath", "Skin Discoloration", "Skin Lesions", 
    "Sneezing", "Sore Throat", "Stiff Neck", "Stomach Cramps", 
    "Stomach Pain", "Sudden Weight Loss", "Sweating", "Swelling", 
    "Swollen Lymph Nodes", "Throat Irritation", "Tingling Sensation", "Tiredness", 
    "Toothache", "Trouble Swallowing", "Unexplained Weight Loss", "Vomiting", 
    "Weakness in Limbs", "Weight Gain", "White Patches in Mouth", "Wheezing", 
    "Yellow Skin", "Yellowing of Eyes", "Yawning", "Yeast Infection", 
    "Pain in Joints", "Bleeding After Injury", "Nasal Congestion", "Burning Sensation", 
    "Dry Mouth", "Cracked Skin", "Loss of Vision", "Blood in Stool", 
    "Rectal Bleeding", "Fainting", "Chest Tightness", "Cyanosis", 
    "Bruising Easily", "Abnormal Heart Rate", "Sweaty Palms", "Clammy Skin",
    
    # Adding disease names to the dataset:
    "Cancer", "Asthma", "Diabetes", "Hypertension", "Tuberculosis", 
    "Malaria", "COVID-19", "Pneumonia", "Influenza", "Bronchitis", 
    "Gastritis", "Gallstones", "Liver Cirrhosis", "Hepatitis", 
    "Chronic Fatigue Syndrome", "Parkinson's Disease", "Alzheimer's Disease", 
    "Arthritis", "Osteoporosis", "Epilepsy", "Multiple Sclerosis", 
    "Thyroid Disorders", "Endometriosis", "Cystic Fibrosis", "Chronic Obstructive Pulmonary Disease (COPD)",
    "Stroke", "Heart Attack", "Atrial Fibrillation", "Chronic Kidney Disease", 
    "HIV/AIDS", "Psoriasis", "Eczema", "Acne", "Gout", 
    "Polycystic Ovary Syndrome (PCOS)", "Irritable Bowel Syndrome (IBS)", 
    "Crohn's Disease", "Ulcerative Colitis", "Gallbladder Disease", "Sleep Apnea", 
    "Migraines", "Depression", "Bipolar Disorder", "Anxiety Disorder", 
    "Schizophrenia", "Autism Spectrum Disorder", "Obsessive-Compulsive Disorder (OCD)", 
    "Post-Traumatic Stress Disorder (PTSD)", "Dementia", "Anemia", "Leukemia", 
    "Sickle Cell Disease", "Hemophilia", "Preeclampsia", "Celiac Disease", 
    "Food Allergies", "Lupus", "Fibromyalgia", "Tinnitus", 
    "Sinusitis", "Meningitis", "Dengue Fever", "Chikungunya", 
    "West Nile Virus", "Zika Virus", "Ebola", "Swine Flu", 
    "Norovirus", "Rheumatoid Arthritis", "Cervical Cancer", "Colon Cancer", 
    "Breast Cancer", "Prostate Cancer", "Lung Cancer", "Leukemia", 
    "Melanoma", "Hodgkin's Lymphoma", "Non-Hodgkin's Lymphoma", 
    "Ovarian Cancer", "Endometrial Cancer", "Esophageal Cancer", "Pancreatic Cancer"
]


def extract_symptoms(query, symptoms_dataset):
    query = query.lower()  # Convert the query to lowercase
    matching_symptoms = []

    # Check if any symptom in the dataset is found in the query
    for symptom in symptoms_dataset:
        if symptom.lower() in query:
            matching_symptoms.append(symptom)

    return matching_symptoms

class DiseaseSymptomSearchView(APIView):
    def post(self, request, *args, **kwargs):
        # Extract query from request
        query = request.data.get('query', '')
        if not query:
            return Response({"error": "Query parameter is required"}, status=status.HTTP_400_BAD_REQUEST)

        # Extract symptoms from query
        extracted_symptoms = extract_symptoms(query, symptoms_dataset)

        # Find diseases matching the extracted symptoms or disease name
        diseases = Disease.objects.all()
        matched_diseases = []

        for disease in diseases:
            # Convert disease name to lowercase for case-insensitive matching
            disease_name_lower = disease.name.lower()

            # Check if disease name is in the query
            disease_name_match = disease_name_lower in query.lower()

            # Extract symptoms matching the query
            matching_symptoms = [symptom for symptom in disease.symptoms if symptom.lower() in [s.lower() for s in extracted_symptoms]]
            non_matching_symptoms = [symptom for symptom in extracted_symptoms if symptom.lower() not in [s.lower() for s in disease.symptoms]]
            
            # Calculate the match score
            match_score = len(matching_symptoms) + (1 if disease_name_match else 0)

            if match_score > 0:
                matched_diseases.append({
                    'id': disease.id,
                    'name': disease.name,
                    'description': disease.description,
                    'cause': disease.cause,
                    'treatment': disease.treatment,
                    'disease': disease.name,
                    'matching_symptoms': matching_symptoms,
                    'non_matching_symptoms': non_matching_symptoms,
                    'match_score': match_score,
                    'type': disease.type,
                    'doctortype': disease.doctortype
                })

        # Sort diseases based on match_score (highest first)
        matched_diseases.sort(key=lambda x: x['match_score'], reverse=True)

        return Response({
            "query": query,
            "extracted_symptoms": extracted_symptoms,
            "diseases": matched_diseases
        })


class ChatAPI(APIView):

    def get(self, request, *args, **kwargs):
        # Extract query parameters
        user = request.query_params.get('user')
        doctor = request.query_params.get('doctor')
        sender = request.query_params.get('sender')

        # Validate required parameters
        if not user or not doctor:
            return Response({"error": "User and doctor are required query parameters."},
                             status=status.HTTP_400_BAD_REQUEST)

        # Fetch the chat room based on user and doctor
        try:
            chat_room = ChatRoom.objects.filter(user_id=user, doctor_id=doctor).first()
        except TypeError as e:
            return Response({"error": f"Error while fetching chat room: {str(e)}"},
                             status=status.HTTP_400_BAD_REQUEST)

        if not chat_room:
            return Response({"error": "Chat room not found."}, status=status.HTTP_404_NOT_FOUND)

        # Get the messages for this chat room
        messages = chat_room.messages.all()

        # Mark messages as viewed by the respective sender if they view them
        if sender == "user":
            messages.update(is_viewed_by_user=True)  # Mark all messages as viewed by user
        elif sender == "doctor":
            messages.update(is_viewed_by_doctor=True)  # Mark all messages as viewed by doctor

        # Count unread messages based on sender
        if sender == "user":
            unread_count = messages.filter(is_viewed_by_user=False).count()
        elif sender == "doctor":
            unread_count = messages.filter(is_viewed_by_doctor=False).count()
        else:
            unread_count = 0

        # Serialize the messages
        message_serializer = ChatMessageSerializer(messages, many=True)

        return Response({
            # "data": {
            # "chat_room": ChatRoomSerializer(chat_room).data,
            "data": message_serializer.data,
            # "unread_count": unread_count
            # }
        })

    def post(self, request, *args, **kwargs):
        """
        Endpoint to send a new message in an existing chat room.
        """
        user = request.data.get('user')
        doctor = request.data.get('doctor')
        message = request.data.get('message')
        sender = request.data.get('sender')

        # Validate required parameters
        if not user or not doctor or not message or not sender:
            return Response({"error": "User, doctor, message, and sender are required."},
                             status=status.HTTP_400_BAD_REQUEST)

        # Fetch or create the chat room
        chat_room = self.get_or_create_chat_room(user, doctor)

        # Create the new message
        chat_message = ChatMessage1.objects.create(
            chat_room=chat_room,
            user_id=user if sender == "user" else None,
            doctor_id=doctor if sender == "doctor" else None,
            message=message,
            sender=sender,
            is_viewed_by_user=False,
            is_viewed_by_doctor=False
        )

        # Return the created message
        message_serializer = ChatMessageSerializer(chat_message)

        return Response({"message": "Chat sent successfully!"}, status=status.HTTP_200_OK)


    def get_or_create_chat_room(self, user, doctor):
        """
        Fetches the chat room if it exists, or creates a new one if it doesn't.
        """
        chat_room = ChatRoom.objects.filter(user_id=user, doctor_id=doctor).first()
        
        if not chat_room:
            # Create a new chat room if it doesn't exist
            chat_room, created = ChatRoom.objects.get_or_create(user_id=user, doctor_id=doctor)


        return chat_room

    
    
from django.db.models import Sum
class DoctorAppointmentStatsAPIView(APIView):
    def get(self, request):
        doctor_id = request.GET.get('doctor_id')

        # Validate that doctor_id is provided
        if not doctor_id:
            return Response(
                {"error": "doctor_id query parameter is required."},
                status=status.HTTP_400_BAD_REQUEST
            )

        try:
            # Fetch the doctor's details
            doctor = Doctor.objects.get(id=doctor_id)

            # Count of total appointments
            total_appointments = Appointment.objects.filter(doctor=doctor).count()

            # Sum of total payment received
            total_payment = (
                Appointment.objects.filter(doctor=doctor, payment_status='completed')
                .aggregate(total_payment=Sum('amount'))['total_payment'] or 0
            )

            # Successful response
            return Response({
        "data": {
        "doctor_id": doctor.id,
        "doctor_name": doctor.name,
        "total_appointments": total_appointments,
        "total_payment_received": total_payment,
    }
}, status=status.HTTP_200_OK)

        except Doctor.DoesNotExist:
            # Handle doctor not found
            return Response(
                {"error": "Doctor not found."},
                status=status.HTTP_404_NOT_FOUND
            )
        except Exception as e:
            # Handle other exceptions
            return Response(
                {"error": "An unexpected error occurred.", "details": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )



class FeedbackView(APIView):
    """
    API to handle feedback and rating for doctors.
    """

    def get(self, request):
        """
        Retrieve feedback and ratings for a doctor or all doctors.
        """
        doctor_id = request.query_params.get('doctor_id')
        feedbacks = Feedback.objects.filter(doctor_id=doctor_id) if doctor_id else Feedback.objects.all()
        serializer = FeedbackSerializer(feedbacks, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def post(self, request):
        """
        Submit feedback and rating for a doctor.
        """
        serializer = FeedbackSerializer(data=request.data, context={'request': request})
        if serializer.is_valid():
            serializer.save(user=request.user)
            return Response({"message": "Feedback submitted successfully."}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)