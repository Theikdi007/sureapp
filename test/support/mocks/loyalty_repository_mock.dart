// Test-only stand-in moved out of the app build; data from the API doc's
// JSON examples and the prototype.

import 'package:sure_app/core/network/api_exception.dart';
import 'package:sure_app/core/network/interceptors.dart';
import 'package:sure_app/features/loyalty/data/loyalty_dtos.dart';
import 'package:sure_app/features/loyalty/data/loyalty_repository.dart';
import 'package:sure_app/shared/models/money.dart';

/// Mock-flavor member state (the prototype's Exclusive member). Shared with
/// the rewards mock so claims spend the same balance.
abstract final class MockLoyaltyStore {
  static int points = 12450;
  static int clubScore = 262400;

  static final history = <PointEntryDto>[
    _e(
      't1046',
      'Order reward · #APP-26-1046',
      'Order reward',
      '2026-11-10T08:30:00Z',
      249,
    ),
    _e(
      't1045',
      'Transfer to +95 9 450 012 345',
      'Transfer',
      '2026-11-05T04:12:00Z',
      -1000,
    ),
    _e(
      't1044',
      'Order reward · #APP-26-1044',
      'Order reward',
      '2026-10-18T04:50:00Z',
      2308,
    ),
    _e(
      't1043',
      'Scan & Earn · Yangon HQ',
      'Scan & Earn',
      '2026-10-02T09:05:00Z',
      120,
    ),
    _e(
      't1042',
      'Points payment · Hleden store',
      'Points payment',
      '2026-09-21T06:40:00Z',
      -3000,
    ),
    _e(
      't1041',
      'Top-up code SURE-7K2P-QX',
      'Top-up',
      '2026-09-01T03:00:00Z',
      5000,
    ),
  ];

  static final clubHistory = <PointEntryDto>[
    _e(null, 'Order · #APP-26-1046', 'Order', '2026-11-10T08:30:00Z', 26489),
    _e(null, 'Order · #APP-26-1044', 'Order', '2026-10-18T04:50:00Z', 23079),
    _e(
      null,
      'Scan & Earn · Yangon HQ',
      'Scan & Earn',
      '2026-10-02T09:05:00Z',
      1200,
    ),
  ];

  static PointEntryDto _e(
    String? id,
    String label,
    String type,
    String at,
    int amount,
  ) => PointEntryDto(
    transactionId: id,
    label: label,
    type: type,
    at: at,
    amount: amount,
    opens: id != null,
  );

  static int _seq = 2000;

  /// Records a movement and returns its id.
  static String record(String label, String type, int amount) {
    final id = 't${_seq++}';
    points += amount;
    history.insert(
      0,
      PointEntryDto(
        transactionId: id,
        label: label,
        type: type,
        at: DateTime.now().toUtc().toIso8601String(),
        amount: amount,
        opens: true,
      ),
    );
    return id;
  }
}

class MockLoyaltyRepository implements LoyaltyRepository {
  MockLoyaltyRepository({this.latency = const Duration(milliseconds: 300)});

  final Duration latency;
  final _keys = <String, Object>{};
  int _wrongCodes = 0;

  Future<void> _wait() => Future<void>.delayed(latency);

  static const _tiers = [
    TierDto(
      key: 'classic',
      label: 'Classic',
      clubScoreFrom: 0,
      clubScoreTo: 150000,
      earnRatePer100Ks: 1,
      dailyRedeemLimit: 200000,
    ),
    TierDto(
      key: 'exclusive',
      label: 'Exclusive',
      clubScoreFrom: 150000,
      clubScoreTo: 500000,
      earnRatePer100Ks: 1.2,
      dailyRedeemLimit: 400000,
      current: true,
    ),
    TierDto(
      key: 'vsp',
      label: 'VSP',
      clubScoreFrom: 500000,
      clubScoreTo: 1500000,
      earnRatePer100Ks: 1.5,
      dailyRedeemLimit: 800000,
    ),
    TierDto(
      key: 'vvsp',
      label: 'VVSP',
      clubScoreFrom: 1500000,
      clubScoreTo: 5000000,
      earnRatePer100Ks: 2,
    ),
    TierDto(
      key: 'xsp',
      label: 'XSP',
      clubScoreFrom: 5000000,
      earnRatePer100Ks: 3,
    ),
  ];

  @override
  Future<LoyaltySummaryDto> summary() async {
    await _wait();
    final s = MockLoyaltyStore.clubScore;
    return LoyaltySummaryDto(
      points: MockLoyaltyStore.points,
      earnedThisMonth: 249,
      expiringPoints: 1200,
      expiringOn: '2027-09-30',
      equivalentMmk: MockLoyaltyStore.points,
      tier: 'exclusive',
      tierLabel: 'Exclusive',
      clubScore: s,
      nextTier: 'vsp',
      nextTierLabel: 'VSP',
      nextTierThreshold: 500000,
      progressPercent: (s * 100 ~/ 500000).clamp(0, 100),
      dailyRedeemLimit: 400000,
      earnRatePer100Ks: 1.2,
    );
  }

  @override
  Future<TierBenefitsDto> tiers() async {
    await _wait();
    return const TierBenefitsDto(
      tiers: _tiers,
      currentBenefits: [
        BenefitDto(title: 'Earn Rate', description: '1.2 points per 100 Ks'),
        BenefitDto(
          title: 'Point Usage Daily Limit',
          description: 'Maximum 400,000 Points',
        ),
        BenefitDto(
          title: 'Scan & Earn',
          description: 'Show your QR code in-store, earn instantly',
        ),
        BenefitDto(
          title: 'Partner Rewards',
          description: 'Health Care · Travel & Tour · Lifestyle · F&B',
        ),
        BenefitDto(
          title: 'Transfer Points',
          description: 'Send points to any member effortlessly',
        ),
        BenefitDto(
          title: 'Point Expiration',
          description: 'Points stay valid for 2 years from purchase',
        ),
      ],
      earnRules: [
        EarnRuleDto(condition: 'Every 100 MMK', rewardPoints: 1, clubScore: 1),
      ],
    );
  }

  @override
  Future<Page<PointEntryDto>> points({
    PointsFilter filter = PointsFilter.all,
    String? cursor,
  }) async {
    await _wait();
    return Page(
      items: filter == PointsFilter.all
          ? List.of(MockLoyaltyStore.history)
          : const [],
    );
  }

  @override
  Future<PointDetailDto> pointDetail(String transactionId) async {
    await _wait();
    final e = MockLoyaltyStore.history
        .where((h) => h.transactionId == transactionId)
        .firstOrNull;
    if (e == null) {
      throw const ApiException(
        code: 'mobile.not_found',
        message: "We couldn't find that transaction.",
        status: 404,
      );
    }
    final transfer = e.type == 'Transfer';
    return PointDetailDto(
      transactionId: transactionId,
      label: e.label,
      type: e.type,
      at: e.at,
      amount: e.amount,
      rows: [
        PointDetailRowDto(label: 'Type', value: e.type),
        PointDetailRowDto(label: 'Description', value: e.label),
        PointDetailRowDto(
          label: 'Transaction ID',
          value: transactionId.toUpperCase().padLeft(8, '0'),
        ),
        const PointDetailRowDto(label: 'Status', value: 'Completed'),
        PointDetailRowDto(
          label: 'Club Score',
          value: e.type == 'Order reward' || e.type == 'Scan & Earn'
              ? 'Counted'
              : 'Not counted',
        ),
      ],
      note: e.amount >= 0
          ? 'These points stay valid for 2 years.'
          : transfer
          ? "Transferred points expire for the recipient after 1 month and don't add Club Score."
          : null,
    );
  }

  @override
  Future<Page<PointEntryDto>> clubScores({String? cursor}) async {
    await _wait();
    return Page(items: List.of(MockLoyaltyStore.clubHistory));
  }

  ApiException _bad(String code, String message) =>
      ApiException(code: code, message: message, status: 400);

  TransferPreviewDto _preview(String phone, int amount) {
    final digits = phone.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 7) {
      throw _bad(
        'isure.recipient_not_found',
        'No iSure member uses that number.',
      );
    }
    if (digits.endsWith('776234118')) {
      throw _bad('isure.self_transfer', "You can't send points to yourself.");
    }
    if (amount <= 0) {
      throw _bad('mobile.validation', 'Enter how many points to send.');
    }
    if (amount > MockLoyaltyStore.points) {
      throw _bad(
        'isure.insufficient_points',
        "You don't have enough points for that.",
      );
    }
    return TransferPreviewDto(
      recipientName: 'Ko Aung',
      recipientPhoneDisplay:
          '+95 ${digits.startsWith('0') ? digits.substring(1) : digits}',
      recipientTier: 'Classic',
      amount: amount,
      balanceAfter: MockLoyaltyStore.points - amount,
      note: "Transferred points expire after 1 month for the recipient and don't add Club Score.",
    );
  }

  @override
  Future<TransferPreviewDto> transferPreview({
    required String phone,
    required int amount,
  }) async {
    await _wait();
    return _preview(phone, amount);
  }

  @override
  Future<TransferResultDto> transfer({
    required String phone,
    required int amount,
    String? note,
    required IdempotencyKey key,
  }) async {
    await _wait();
    if (_keys[key.value] case final TransferResultDto seen) return seen;
    final p = _preview(phone, amount);
    final id = MockLoyaltyStore.record(
      'Transfer to ${p.recipientPhoneDisplay}',
      'Transfer',
      -amount,
    );
    final r = TransferResultDto(
      transactionId: id,
      recipientName: p.recipientName,
      amount: amount,
      balance: MockLoyaltyStore.points,
      at: DateTime.now().toUtc().toIso8601String(),
    );
    _keys[key.value] = r;
    return r;
  }

  static final _redeemed = <String>{};

  TopupCodeDto _code(String code) {
    final c = code.trim().toUpperCase();
    if (!RegExp(r'^SURE-[A-Z0-9]{4}-[A-Z0-9]{2}$').hasMatch(c)) {
      if (++_wrongCodes > 5) {
        throw const ApiException(
          code: 'mobile.rate_limited',
          message: 'Too many wrong codes. Try again tomorrow.',
          status: 429,
        );
      }
      throw _bad(
        'isure.code_invalid',
        "That code isn't valid. Check it and try again.",
      );
    }
    return TopupCodeDto(
      code: c,
      points: 5000,
      pointsExpireOn: '2028-11-13',
      owner: 'SureStore gift card',
      terms: 'Points from a top-up code stay valid for 2 years.',
      redeemed: _redeemed.contains(c),
    );
  }

  @override
  Future<TopupCodeDto> topupCheck(String code) async {
    await _wait();
    return _code(code);
  }

  @override
  Future<TopupCodeDto> topupRedeem(
    String code, {
    required IdempotencyKey key,
  }) async {
    await _wait();
    if (_keys[key.value] case final TopupCodeDto seen) return seen;
    final c = _code(code);
    if (c.redeemed) {
      throw _bad('isure.code_invalid', 'This code has already been used.');
    }
    _redeemed.add(c.code);
    MockLoyaltyStore.record('Top-up code ${c.code}', 'Top-up', c.points);
    final r = c.copyWith(redeemed: true, balance: MockLoyaltyStore.points);
    _keys[key.value] = r;
    return r;
  }

  @override
  Future<MemberQrDto> memberQr() async {
    await _wait();
    return MemberQrDto(
      payload: 'ISURE-MOCK-${DateTime.now().millisecondsSinceEpoch}',
      expiresAt: DateTime.now()
          .toUtc()
          .add(const Duration(minutes: 15))
          .toIso8601String(),
      memberName: 'Thiri Aung',
      tierLabel: 'Exclusive',
      phoneDisplay: '+95 9 776 234 118',
      points: MockLoyaltyStore.points,
    );
  }

  @override
  Future<List<CounterRequestDto>> counterRequests() async {
    await _wait();
    return const [];
  }

  @override
  Future<CounterResultDto> counterConfirm({
    required String code,
    required String password,
    required IdempotencyKey key,
  }) async {
    await _wait();
    throw _bad('isure.rejected', 'That request is no longer waiting.');
  }
}
