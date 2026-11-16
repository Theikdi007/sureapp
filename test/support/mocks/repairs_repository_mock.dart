// Test-only stand-in moved out of the app build; data from the API doc's
// JSON examples and the prototype.

import 'package:sure_app/features/repairs/data/repairs_repository.dart';

/// The API doc's example plus one ready and one finished ticket.
class MockRepairsRepository implements RepairsRepository {
  MockRepairsRepository({this.latency = const Duration(milliseconds: 350)});

  final Duration latency;

  @override
  Future<List<RepairDto>> repairs() async {
    await Future<void>.delayed(latency);
    return const [
      RepairDto(
        number: 'YGN-S-2026-001242',
        device: 'Oppo A78 256GB · Green',
        serial: '351982445500120',
        issue: 'Charging port loose — only charges at an angle.',
        state: 'in_progress',
        statusLabel: 'Being repaired',
        active: true,
        storeName: 'Yangon HQ',
        meta: 'Yangon HQ · Ready Mon, 19 Oct',
        receivedAt: '2026-10-17T07:40:00+00:00',
        promisedAt: '2026-10-19T11:30:00+00:00',
      ),
      RepairDto(
        number: 'YGN-S-2026-001198',
        device: 'Samsung Galaxy A14 128GB',
        issue: 'Cracked screen.',
        state: 'ready',
        statusLabel: 'Ready for pickup',
        active: true,
        storeName: 'Bogyoke Market',
        meta: 'Bogyoke Market · Ready now',
        receivedAt: '2026-10-12T04:10:00+00:00',
        promisedAt: '2026-10-15T09:00:00+00:00',
      ),
      RepairDto(
        number: 'YGN-S-2026-000877',
        device: 'Apple AirPods Pro (2nd gen)',
        issue: 'Left earbud does not charge.',
        state: 'done',
        statusLabel: 'Collected',
        active: false,
        storeName: 'Yangon HQ',
        meta: 'Yangon HQ · Collected 2 Aug',
        receivedAt: '2026-07-28T06:00:00+00:00',
      ),
    ];
  }
}
