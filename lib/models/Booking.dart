import 'package:spacerent_app/models/Room.dart';

class Booking {
  Booking({
    required this.room,
    required this.detail,
    required this.status,
    required this.qr_code,
    required this.message,
    required this.booked_at,
    required this.rental_at,
  });

  final Room room;
  final String detail;
  final String status;
  final String qr_code;
  final String message;
  final int booked_at;
  final int rental_at;

  factory Booking.fromJson(Map<String, dynamic> data) {
    final room = Room.fromJson(new Map<String, dynamic>.from(data['room'] as Map));
    final detail = data['detail'] as String;
    final status = data['status'] as String;
    final qr_code = data['qr_code'] as String;
    final message = data['message'] as String;
    final booked_at = data['booked_at'] as int;
    final rental_at = data['rental_at'] as int;

    return Booking(
      room: room,
      detail: detail,
      status: status,
      qr_code: qr_code,
      message: message,
      booked_at: booked_at,
      rental_at: rental_at,
    );
  }
}
