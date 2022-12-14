import 'package:wellness_hub_australia/app/models/appointment.model.dart';
import 'package:flutter/material.dart';

extension AppointmentHelper on Appointment {
  Color statusColor() {
    switch (status?.toLowerCase()) {
      case 'confirmed':
        return Colors.blue.withOpacity(0.8);
      case 'completed':
        return Colors.green.withOpacity(0.8);
      case 'missed':
        return Colors.orange.withOpacity(0.8);
      case 'cancelled':
        return Colors.red.withOpacity(0.8);
      default:
        return Colors.grey.withOpacity(0.8);
    }
  }
}
