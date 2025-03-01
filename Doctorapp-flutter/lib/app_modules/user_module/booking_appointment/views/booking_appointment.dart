// app_modules/user_module/booking_appointment/views/booking_appointment.dart
import 'package:doctor_booking_/app_config/colors/app_colors.dart';
import 'package:doctor_booking_/main_widgets/app_buttons.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  _BookAppointmentScreenState createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  String selectedReason = "Follow Up";
  String appointmentType = "Online";
  final double doctorFee = 18.0;
  final double platformFee = 2.0;
  TimeOfDay selectedTime = const TimeOfDay(hour: 22, minute: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        elevation: 0,
        title: const Text('Book Appointment',
            style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Select Date & Time
            const Text('Select Date & Time',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  // Wrap EasyDateTimeLine with Expanded
                  child: EasyDateTimeLine(
                    initialDate: DateTime.now(),
                    onDateChange: (selectedDate) {
                      //  `selectedDate` the new date selected.
                    },
                    activeColor: AppColors.appMainColour,
                    dayProps: EasyDayProps(
                      todayHighlightStyle: TodayHighlightStyle.withBackground,
                      todayHighlightColor:
                          AppColors.appMainColour.withOpacity(0.4),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Reason To Visit
            const Text('Reason To Visit',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedReason,
              items: ['Follow Up', 'Consultation', 'Routine Checkup']
                  .map((String reason) {
                return DropdownMenuItem<String>(
                  value: reason,
                  child: Text(reason),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedReason = value!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
            const SizedBox(height: 24),
            // Appointment Type
            const Text('Appointment Type',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRadioButton('Online', 'Online'),
                const SizedBox(width: 16),
                _buildRadioButton('In-Person', 'In-Person'),
              ],
            ),
            const SizedBox(height: 24),
            // Fee Details
            _buildFeeDetails(),
            const SizedBox(height: 16),
            // Book Now Button
            Center(
              child: ButtonWidget(
                text: const Text(
                  'Book Now',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                buttoncolor: AppColors.appMainColour,
                textColor: AppColors.appWhite,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BookAppointmentScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateBox(String label, String value) {
    return Column(
      children: [
        Text(label),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(value, style: const TextStyle(fontSize: 18)),
        ),
      ],
    );
  }

  Widget _buildTimeBox(String label, String value) {
    return Column(
      children: [
        Text(label),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: _selectTime,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(value, style: const TextStyle(fontSize: 18)),
          ),
        ),
      ],
    );
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  Widget _buildRadioButton(String label, String value) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            appointmentType = value;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: appointmentType == value
                ? AppColors.appGreen
                : Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(label,
                style: TextStyle(
                    color: appointmentType == value
                        ? Colors.white
                        : Colors.black)),
          ),
        ),
      ),
    );
  }

  Widget _buildFeeDetails() {
    double totalCost = doctorFee + platformFee;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFeeRow('Doctor Fee', '\$${doctorFee.toStringAsFixed(2)}'),
          _buildFeeRow('Platform Fee', '\$${platformFee.toStringAsFixed(2)}'),
          const Divider(),
          _buildFeeRow('Total Cost', '\$${totalCost.toStringAsFixed(2)}',
              isBold: true),
        ],
      ),
    );
  }

  Widget _buildFeeRow(String label, String amount, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 16,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        Text(amount,
            style: TextStyle(
                fontSize: 16,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }
}
