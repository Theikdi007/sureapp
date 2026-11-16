// Test-only stand-in moved out of the app build; data from the API doc's
// JSON examples and the prototype.

import 'package:sure_app/features/stores/data/stores_repository.dart';

/// The API doc's two stores plus a closed one so the "Closed" state shows.
class MockStoresRepository implements StoresRepository {
  MockStoresRepository({this.latency = const Duration(milliseconds: 300)});

  final Duration latency;

  @override
  Future<List<StoreDto>> stores({double? lat, double? lng}) async {
    await Future<void>.delayed(latency);
    return const [
      StoreDto(
        code: 'YGN-1',
        name: 'Yangon HQ',
        address: 'No. 15, Pyay Road, Kamayut',
        city: 'Yangon',
        phone: '09 750 066 391',
        latitude: 16.8216,
        longitude: 96.135,
        openNow: true,
        hoursToday: '09:00 – 21:00',
        pickup: true,
      ),
      StoreDto(
        code: 'YGN-2',
        name: 'Bogyoke Market',
        city: 'Yangon',
        latitude: 16.7802,
        longitude: 96.1546,
        openNow: true,
        hoursToday: '09:00 – 21:00',
        pickup: true,
      ),
      StoreDto(
        code: 'MDY-1',
        name: 'Mandalay 78th Street',
        address: '78th Street, Chanayethazan',
        city: 'Mandalay',
        latitude: 21.9747,
        longitude: 96.0836,
        openNow: false,
        hoursToday: 'Closed today',
        pickup: false,
      ),
    ];
  }
}
