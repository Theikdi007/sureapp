import 'package:flutter_test/flutter_test.dart';
import 'package:sure_app/features/cart/data/checkout_dtos.dart';
import 'package:sure_app/features/orders/data/order_dtos.dart';

void main() {
  test('a day lists each slot once, even when the API repeats it', () {
    Map<String, dynamic> slot(String s) => {
      'slot': s,
      'label': s,
      'available': true,
    };
    final day = HomeSetupSlotDayDto.fromJson({
      'date': '2026-11-18',
      'weekday': 'Wed',
      'day': '18',
      'slots': [
        slot('09:00-12:00'),
        slot('13:00-16:00'),
        slot('09:00-12:00'),
        slot('13:00-16:00'),
      ],
    });
    expect(day.slots.map((s) => s.slot), ['09:00-12:00', '13:00-16:00']);
  });

  test('booking status is matched without regard to case', () {
    HomeSetupBookingDto booking(String status) => HomeSetupBookingDto.fromJson({
      'number': 'HSV-1',
      'device': 'Phone',
      'date': '2026-11-19',
      'slot': '13:00-16:00',
      'slotLabel': '13:00 – 16:00',
      'status': status,
      'statusLabel': 'Scheduled',
    });
    expect(booking('scheduled').isScheduled, isTrue);
    expect(booking('Scheduled').isScheduled, isTrue);
    expect(booking('cancelled').isScheduled, isFalse);
  });
}
