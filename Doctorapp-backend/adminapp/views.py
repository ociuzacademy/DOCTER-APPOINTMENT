from django.shortcuts import get_object_or_404, render, redirect
from django.contrib import messages
from doctor_app.models import *

# Admin login view
def admin_login(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')
        admin = Admin.objects.filter(email=email, password=password, utype='admin').first()
        if admin:
            return redirect('admin_home')
        else:
            messages.error(request, "Invalid email or password.")
    return render(request, 'adminlogin.html')


# Admin home view
def admin_home(request):
    # Count of pending and approved doctors
    pending_count = Doctor.objects.filter(status='pending').count()
    approved_count = Doctor.objects.filter(status='approved').count()
    appointment_count = Appointment.objects.count()

    context = {
        'pending_count': pending_count,
        'approved_count': approved_count,
        'appointment_count': appointment_count,
    }
    return render(request, 'index.html', context)

def pending_doctors(request):
    doctors = Doctor.objects.all()
    return render(request, 'pending_doctors.html', {'doctors': doctors})
def approved_doctors(request):
    doctors = Doctor.objects.all()
    print(doctors)
    return render(request, 'approved_doctors.html', {'doctors': doctors})



def approve_doctor(request, doctor_id):
    doctor = get_object_or_404(Doctor, id=doctor_id)
    doctor.status = 'approved'  # Change the status to 'approved'
    doctor.save()
    # Optionally, add a success message or redirect to the pending doctors list
    return redirect('pending_doctors')  # Redirect to the pending doctors list view

# Reject Doctor
def reject_doctor(request, doctor_id):
    doctor = get_object_or_404(Doctor, id=doctor_id)
    doctor.status = 'rejected'  # Change the status to 'rejected'
    doctor.save()
    # Optionally, add a success message or redirect to the pending doctors list
    return redirect('pending_doctors')  # Redirect to the pending doctors list view

