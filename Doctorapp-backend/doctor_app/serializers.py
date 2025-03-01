from .models import *
from rest_framework import serializers


class UserRegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'


class DoctorRegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = Doctor
        fields = '__all__'

class LoginSerializer(serializers.Serializer):
    email = serializers.EmailField()
    password = serializers.CharField(max_length=100)

# class ViewUserProfileSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = User
#         fields = ['name', 'email', 'age', 'phone_number','image']

# class UpdateUserProfileSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = User
#         fields =  ['name','email', 'phone_number','age','password']


# class ViewDoctorProfileSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Doctor
#         fields = '__all__'


# class UpdateDoctorProfileSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Doctor
#         fields =  ['name','email', 'phone_number','experience','image','qualification','specialization','password','doctor_fee']


# class UserViewDoctorSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Doctor
#         fields = '__all__'


# class DiseaseSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Disease
#         fields = '__all__'


# class SearchDiseaseSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Disease
#         fields = '__all__'

# class BookAppointmentSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Appointment
#         fields = '__all__'


# class DoctorViewAppointmentSerializer(serializers.ModelSerializer):
#     # patient_name = serializers.CharField(source='user.name',read_only=True)

#     class Meta:
#         model = Appointment
#         fields = ['id', 'name', 'phone_number', 'date', 'time', 'status']


# class UserViewAppointmentSerializer(serializers.ModelSerializer):
#     doctor_name = serializers.CharField(source='doctor.name',read_only=True)

#     class Meta:
#         model = Appointment
#         fields ='__all__'


# class ApproveDoctorSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Doctor
#         fields = '__all__'

# class DocApproveBookingSerializer(serializers.ModelSerializer):
#     class Meta:    
#         model = Appointment
#         fields = ['status']


# class ChatMessageSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = ChatMessage
#         fields ='__all__'

#     def validate(self, data):
#         sender_user = data.get('sender_user')
#         sender_doctor = data.get('sender_doctor')
#         receiver_user = data.get('receiver_user')
#         receiver_doctor = data.get('receiver_doctor')

#         # Ensure that either sender_user or sender_doctor is set
#         if not sender_user and not sender_doctor:
#             raise serializers.ValidationError("A sender (user or doctor) must be specified.")
        
#         # Ensure that either receiver_user or receiver_doctor is set
#         if not receiver_user and not receiver_doctor:
#             raise serializers.ValidationError("A receiver (user or doctor) must be specified.")
        
#         return data
    
# class PaymentSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Payment
#         fields = '__all__'


# class DeclineAppointmentSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Appointment
#         fields = ['status']

#     def update(self, instance, validated_data):
#         instance.status = validated_data.get('status', instance.status)
#         instance.save()

#         # Update the related payment status
#         payment = instance.payment
#         if payment:
#             payment.payment_status = 'refunded'
#             payment.save()

#         return instance
    

# class UserFeedbackSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Feedback
#         fields = '__all__'
        
        
from .models import DoctorAvailableTime, Slots

class SlotsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Slots
        fields = '__all__'

class DoctorAvailableTimeSerializer(serializers.ModelSerializer):
    class Meta:
        model = DoctorAvailableTime
        fields = '__all__'
        
class BookAppointmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Appointment
        fields = '__all__'
        
        
from rest_framework import serializers
from .models import Appointment

class ViewAppointmentSerializer(serializers.ModelSerializer):
    start_time = serializers.SerializerMethodField()
    end_time = serializers.SerializerMethodField()
    doctor_name = serializers.SerializerMethodField()
    user_name = serializers.SerializerMethodField()  # User name field
    doctor_specialization = serializers.SerializerMethodField()  # Doctor specialization field
    user_phone_number = serializers.SerializerMethodField()  # User phone number field
    doctor_image = serializers.SerializerMethodField()  # Doctor image field
    user_image = serializers.SerializerMethodField()  # User image field
    slot_date = serializers.SerializerMethodField()  # Fix: Correctly define slot_date

    class Meta:
        model = Appointment
        fields = ['id', 'booked_date', 'status', 'user', 'user_name', 'user_phone_number', 'doctor', 
                  'doctor_name', 'doctor_specialization', 'doctor_image', 'user_image', 'slot_date', 
                  'start_time', 'end_time']  # Fix: Removed 'slot' field, added 'slot_date'

    def get_start_time(self, obj):
        return obj.slot.start_time if obj.slot else None  # Ensure slot exists

    def get_end_time(self, obj):
        return obj.slot.end_time if obj.slot else None  # Ensure slot exists

    def get_slot_date(self, obj):
        return obj.slot.date if obj.slot else None  # Fix: Ensure slot exists

    def get_doctor_name(self, obj):
        return obj.doctor.name if obj.doctor else None  # Ensure doctor exists

    def get_user_name(self, obj):
        return obj.user.name if obj.user else None  # Ensure user exists

    def get_doctor_specialization(self, obj):
        return obj.doctor.specialization if obj.doctor else None  # Ensure doctor exists

    def get_user_phone_number(self, obj):
        return obj.user.phone_number if obj.user else None  # Ensure user exists

    def get_doctor_image(self, obj):
        return obj.doctor.image.url if obj.doctor and obj.doctor.image else None  # Ensure doctor and image exist

    def get_user_image(self, obj):
        return obj.user.image.url if obj.user and obj.user.image else None  # Ensure user and image e



from rest_framework import serializers

    
    
class DoctorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Doctor
        fields = ['id', 'name', 'specialization']

class FeedbackSerializer(serializers.ModelSerializer):
    doctor = DoctorSerializer(read_only=True)  # Nested doctor details
    doctor_id = serializers.PrimaryKeyRelatedField(
        queryset=Doctor.objects.all(), source='doctor', write_only=True
    )
    user_id = serializers.PrimaryKeyRelatedField(
        read_only=True, default=serializers.CurrentUserDefault()
    )

    class Meta:
        model = Feedback
        fields = ['id', 'user_id', 'doctor', 'doctor_id', 'feedback', 'rating', 'timestamp']
        



class ChatMessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = ChatMessage1
        fields = '__all__'
        



class ChatRoomSerializer(serializers.ModelSerializer):
    class Meta:
        model = ChatRoom
        fields = '__all__'
        
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'name', 'phone_number', 'email', 'age', 'image']

class DoctorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Doctor
        fields = ['id', 'name', 'phone_number', 'email', 'specialization', 'experience', 'image']