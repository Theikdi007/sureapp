import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/interceptors.dart';

part 'repairs_repository.freezed.dart';
part 'repairs_repository.g.dart';

/// `RepairStates`: how the repair card is drawn.
enum RepairState {
  /// Received at the store, not started.
  booked,
  inProgress,

  /// Repaired and waiting at the store.
  ready,

  /// Collected, or closed without a repair.
  done;

  static RepairState parse(String raw) => switch (raw) {
    'in_progress' || 'in-progress' => inProgress,
    'ready' => ready,
    'done' => done,
    _ => booked,
  };

  /// Design system `REPAIR_STATE` badge colors.
  String get color => switch (this) {
    booked => 'primary',
    inProgress => 'warning',
    ready => 'positive',
    done => 'neutral',
  };
}

/// `RepairDto`: a repair ticket at a SureStore service desk.
@freezed
abstract class RepairDto with _$RepairDto {
  const factory RepairDto({
    required String number,
    required String device,
    String? serial,
    required String issue,
    required String state,
    required String statusLabel,
    required bool active,
    String? storeName,

    /// The card's second line ("Yangon HQ · Ready Fri, 24 Jul").
    required String meta,
    required String receivedAt,
    String? promisedAt,
  }) = _RepairDto;

  factory RepairDto.fromJson(Map<String, dynamic> json) =>
      _$RepairDtoFromJson(json);
}

extension RepairDtoX on RepairDto {
  RepairState get repairState => RepairState.parse(state);
}

/// `GET repairs`: the member's repairs, active first.
abstract interface class RepairsRepository {
  Future<List<RepairDto>> repairs();
}

@Riverpod(keepAlive: true)
RepairsRepository repairsRepository(Ref ref) =>
    ref.watch(appConfigProvider).isMock
    ? MockRepairsRepository()
    : ApiRepairsRepository(ref.watch(dioProvider));

@riverpod
Future<List<RepairDto>> repairList(Ref ref) =>
    ref.watch(repairsRepositoryProvider).repairs();

class ApiRepairsRepository implements RepairsRepository {
  ApiRepairsRepository(this._dio);

  final Dio _dio;

  @override
  Future<List<RepairDto>> repairs() => apiCall(() async {
    final res = await _dio.get<List<dynamic>>('repairs');
    return [
      for (final r in res.data!) RepairDto.fromJson(r as Map<String, dynamic>),
    ];
  });
}

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
