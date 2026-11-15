import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/api_exception.dart';
import '../../../core/network/interceptors.dart';
import '../../../shared/models/money.dart';
import '../../loyalty/data/loyalty_repository.dart';
import 'rewards_dtos.dart';

part 'rewards_repository.g.dart';

abstract interface class RewardsRepository {
  Future<RewardsHomeDto> home();
  Future<RewardDetailDto> reward(String id);
  Future<ShopCheckDto> checkShop(String id, String shopCode);

  /// Idempotency-Key required. `method`: code | shop | direct | delivery.
  Future<RewardClaimDto> claim(
    String id, {
    required String method,
    String? shopCode,
    String? addressId,
    required IdempotencyKey key,
  });
  Future<Page<MemberBenefitDto>> memberBenefits({String? cursor});
}

@Riverpod(keepAlive: true)
RewardsRepository rewardsRepository(Ref ref) =>
    ref.watch(appConfigProvider).isMock
    ? MockRewardsRepository()
    : ApiRewardsRepository(ref.watch(dioProvider));

class ApiRewardsRepository implements RewardsRepository {
  ApiRewardsRepository(this._dio);

  final Dio _dio;

  String _id(String id) => Uri.encodeComponent(id);

  @override
  Future<RewardsHomeDto> home() => apiCall(() async {
    final res = await _dio.get<Map<String, dynamic>>('rewards/home');
    return RewardsHomeDto.fromJson(res.data!);
  });

  @override
  Future<RewardDetailDto> reward(String id) => apiCall(() async {
    final res = await _dio.get<Map<String, dynamic>>('rewards/${_id(id)}');
    return RewardDetailDto.fromJson(res.data!);
  });

  @override
  Future<ShopCheckDto> checkShop(String id, String shopCode) =>
      apiCall(() async {
        final res = await _dio.get<Map<String, dynamic>>(
          'rewards/${_id(id)}/shops/${_id(shopCode)}',
        );
        return ShopCheckDto.fromJson(res.data!);
      });

  @override
  Future<RewardClaimDto> claim(
    String id, {
    required String method,
    String? shopCode,
    String? addressId,
    required IdempotencyKey key,
  }) => apiCall(() async {
    final res = await _dio.post<Map<String, dynamic>>(
      'rewards/${_id(id)}/claim',
      data: {'method': method, 'shopCode': ?shopCode, 'addressId': ?addressId},
      options: key.options,
    );
    return RewardClaimDto.fromJson(res.data!);
  });

  @override
  Future<Page<MemberBenefitDto>> memberBenefits({String? cursor}) =>
      apiCall(() async {
        final res = await _dio.get<Map<String, dynamic>>(
          'rewards/member-benefits',
          queryParameters: {'cursor': ?cursor},
        );
        return Page.fromJson(res.data!, MemberBenefitDto.fromJson);
      });
}

/// The prototype's rewards (`REWARDS`), claimed against
/// [MockLoyaltyStore]'s balance.
class MockRewardsRepository implements RewardsRepository {
  MockRewardsRepository({this.latency = const Duration(milliseconds: 300)});

  final Duration latency;
  final _keys = <String, RewardClaimDto>{};
  static final _claimed = <String, RewardClaimDto>{};

  Future<void> _wait() => Future<void>.delayed(latency);

  static const _terms = {
    'code':
        'One claim per member each month.\n'
        'Codes stay valid for 1 year after claim.\n'
        'Use the code at checkout in the partner app or at the counter.\n'
        '\n'
        'Promo Code အား User တစ်ဦးလျှင် တစ်လကို (၁) ကြိမ် Claim နိုင်မည်ဖြစ်သည်။\n'
        'Promo Code ၏ သက်တမ်းသည် (၁) နှစ် ဖြစ်ပါသည်။\n'
        'Promo Code အား Partner အက်ပလီကေးရှင်းတွင် အသုံးပြုနိုင်ပါသည်။',
    'shop':
        "Scan the counter's QR at any SureStore service desk.\n"
        'A staff check completes the claim on the spot.\n'
        'Service time depends on the branch queue.\n'
        '\n'
        'SureStore ဆိုင်ခွဲတိုင်းရှိ Service Desk ရှိ QR Code ကို Scan ဖတ်နိုင်ပါသည်။\n'
        'ဝန်ထမ်းမှ စစ်ဆေးပြီးသည်နှင့် Claim ပြီးမြောက်ပါမည်။\n'
        'ဝန်ဆောင်မှုအချိန်သည် ဆိုင်ခွဲအလိုက် ကွာခြားနိုင်ပါသည်။',
    'direct':
        'Claimed items are reserved for 14 days.\n'
        'Collect at any SureStore counter with your member QR.\n'
        'Delivery can be added for eligible items.\n'
        '\n'
        'Claim ပြီးသော ပစ္စည်းများကို (၁၄) ရက်အတွင်း ထုတ်ယူရပါမည်။\n'
        'SureStore ကောင်တာတွင် Member QR ဖြင့် ထုတ်ယူနိုင်ပါသည်။\n'
        'သတ်မှတ်ပစ္စည်းများအတွက် Delivery ထည့်သွင်းနိုင်ပါသည်။',
  };

  static const _cards = [
    RewardCardDto(
      id: 'rw1',
      kind: 'coupon',
      methods: ['code'],
      partner: 'MyoEats',
      benefit: '3,000 MMK',
      title: 'MyoEats 3,000 MMK Discount',
      cost: 3000,
      validUntil: '2027-04-24',
      featured: true,
    ),
    RewardCardDto(
      id: 'rw2',
      kind: 'coupon',
      methods: ['code'],
      partner: 'MyoEats',
      benefit: '5,000 MMK',
      title: 'MyoEats 5,000 MMK Discount',
      cost: 5000,
      validUntil: '2027-04-24',
    ),
    RewardCardDto(
      id: 'rw3',
      kind: 'coupon',
      methods: ['code'],
      partner: 'YoYo Ride',
      benefit: '1,500 MMK',
      title: 'YoYo Ride 1,500 MMK Off',
      cost: 1500,
      validUntil: '2026-12-31',
    ),
    RewardCardDto(
      id: 'rw4',
      kind: 'coupon',
      methods: ['code'],
      partner: 'KafeHub',
      benefit: 'Buy 1 Get 1',
      title: 'KafeHub Buy 1 Get 1',
      cost: 800,
      validUntil: '2026-12-31',
      birthday: true,
      state: 'birthday_locked',
    ),
    RewardCardDto(
      id: 'rw5',
      kind: 'goods',
      methods: ['direct', 'delivery'],
      title: 'Finger Ring Strap (2 pcs)',
      cost: 880,
      validUntil: '2027-09-30',
      stockLeft: 12,
      featured: true,
    ),
    RewardCardDto(
      id: 'rw6',
      kind: 'goods',
      methods: ['direct', 'delivery'],
      title: 'Neoprene Laptop Sleeve 13-inch',
      cost: 8800,
      validUntil: '2027-09-30',
    ),
    RewardCardDto(
      id: 'rw7',
      kind: 'goods',
      methods: ['code'],
      title: '30% Off Phone Cases',
      cost: 100,
      validUntil: '2027-08-31',
      featured: true,
    ),
    RewardCardDto(
      id: 'rw8',
      kind: 'engraving',
      methods: ['shop'],
      title: 'AirPods Case Engraving',
      cost: 500,
      validUntil: '2026-12-31',
    ),
    RewardCardDto(
      id: 'rw9',
      kind: 'engraving',
      methods: ['shop'],
      title: 'Power Bank Engraving',
      cost: 300,
      validUntil: '2026-12-31',
    ),
    RewardCardDto(
      id: 'rw10',
      kind: 'engraving',
      methods: ['shop'],
      title: 'Phone Back Engraving',
      cost: 700,
      validUntil: '2026-12-31',
    ),
  ];

  static const _desc = {
    'rw1': 'Get a 3,000 MMK discount coupon for any MyoEats food delivery order over 10,000 MMK.',
    'rw2': 'Get a 5,000 MMK discount coupon for any MyoEats order over 18,000 MMK.',
    'rw3': '1,500 MMK off your next YoYo Ride trip anywhere in Yangon.',
    'rw4': 'Buy one handcrafted drink, get one free at any KafeHub branch — your birthday-month treat.',
    'rw5': 'Secure-grip ring strap set that fits any phone or case. Claim with points and collect in store, or have it delivered.',
    'rw6': 'Premium protection for MacBook Air 13-inch and similar laptops, in a soft neoprene finish.',
    'rw7': 'A 30% discount voucher for any phone case in store — upgrade protection for your new phone.',
    'rw8': 'Laser-engrave a name or monogram on your AirPods case at the service desk.',
    'rw9': 'Personalise your power bank with laser engraving — ready while you shop.',
    'rw10': 'A clean engraved mark on compatible phone backs and cases, done at the counter.',
  };

  static const _claimedCounts = {
    'rw1': 129,
    'rw2': 86,
    'rw3': 214,
    'rw4': 58,
    'rw5': 342,
    'rw6': 27,
    'rw7': 1240,
    'rw8': 96,
    'rw9': 61,
    'rw10': 44,
  };

  /// The card as this member sees it now.
  RewardCardDto _live(RewardCardDto c) {
    if (_claimed.containsKey(c.id)) return c.copyWith(state: 'claimed');
    if (c.state == 'birthday_locked') return c;
    if (c.cost > MockLoyaltyStore.points) {
      return c.copyWith(state: 'insufficient_points');
    }
    return c;
  }

  @override
  Future<RewardsHomeDto> home() async {
    await _wait();
    final cards = _cards.map(_live).toList();
    List<RewardCardDto> of(String kind) =>
        cards.where((c) => c.kind == kind).toList();
    return RewardsHomeDto(
      points: MockLoyaltyStore.points,
      expiringPoints: 1200,
      expiringOn: '2027-09-30',
      featured: cards.where((c) => c.featured || c.birthday).toList(),
      sections: [
        RewardSectionDto(
          key: 'coupon',
          title: 'Discount Coupons',
          items: of('coupon'),
        ),
        RewardSectionDto(
          key: 'goods',
          title: 'Special Sales',
          items: of('goods'),
        ),
        RewardSectionDto(
          key: 'engraving',
          title: 'Engraving Service',
          items: of('engraving'),
        ),
      ],
    );
  }

  RewardCardDto _find(String id) {
    final c = _cards.where((c) => c.id == id).firstOrNull;
    if (c == null) {
      throw const ApiException(
        code: 'mobile.not_found',
        message: "We couldn't find that reward.",
        status: 404,
      );
    }
    return _live(c);
  }

  @override
  Future<RewardDetailDto> reward(String id) async {
    await _wait();
    final c = _find(id);
    final method = c.methods.first;
    final short = (c.cost - MockLoyaltyStore.points).clamp(0, 1 << 31);
    final (label, enabled, hint) = switch (c.state) {
      'claimed' => (
        method == 'direct'
            ? 'Claimed — collect in store'
            : method == 'code'
            ? 'Claimed'
            : 'Claimed at the counter',
        false,
        method == 'direct'
            ? 'Reserved for 14 days — collect with your member QR'
            : 'You already claimed this reward',
      ),
      'birthday_locked' => (
        'Available in your birthday month',
        false,
        'Come back in your birthday month to claim this',
      ),
      'insufficient_points' => (
        'Need ${_n(short)} more points',
        false,
        'You have ${_n(MockLoyaltyStore.points)} points',
      ),
      _ => (
        switch (method) {
          'code' => 'Redeem Code',
          'shop' => 'Scan to Claim',
          _ => 'Claim Now',
        },
        true,
        c.methods.contains('delivery')
            ? 'Collect in store, or have it delivered'
            : null,
      ),
    };
    return RewardDetailDto(
      card: c,
      description: _desc[id],
      terms: _terms[method == 'delivery' ? 'direct' : method],
      claimedCount: _claimedCounts[id] ?? 0,
      availableCount: c.stockLeft,
      supportPhone: '09 750 066 391',
      shops: const [
        'SureStore Yangon HQ',
        'SureStore Hleden',
        'XtraSure Times City',
      ],
      ctaLabel: label,
      ctaEnabled: enabled,
      hint: hint,
      shortBy: short,
    );
  }

  static String _n(int v) => v.toString().replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (_) => ',',
  );

  static const _shops = {
    'YGN-1': 'SureStore Yangon HQ',
    'YGN-2': 'SureStore Hleden',
    'MDY-1': 'XtraSure Mandalay',
  };

  @override
  Future<ShopCheckDto> checkShop(String id, String shopCode) async {
    await _wait();
    final name = _shops[shopCode.trim().toUpperCase()];
    if (name == null) {
      throw const ApiException(
        code: 'isure.shop_not_allowed',
        message: "This reward can't be claimed at that store.",
        status: 400,
      );
    }
    return ShopCheckDto(
      shopCode: shopCode.trim().toUpperCase(),
      shopName: name,
      allowed: true,
    );
  }

  @override
  Future<RewardClaimDto> claim(
    String id, {
    required String method,
    String? shopCode,
    String? addressId,
    required IdempotencyKey key,
  }) async {
    await _wait();
    if (_keys[key.value] case final seen?) return seen;
    final c = _find(id);
    if (c.state != 'available' || !c.methods.contains(method)) {
      throw const ApiException(
        code: 'isure.reward_unavailable',
        message: "This reward can't be claimed right now.",
        status: 400,
      );
    }
    if (method == 'delivery' && addressId == null) {
      throw const ApiException(
        code: 'mobile.address_required',
        message: 'Choose a delivery address.',
        status: 400,
      );
    }
    String? shopName;
    if (method == 'shop') {
      shopName = (await checkShop(id, shopCode ?? '')).shopName;
    }
    MockLoyaltyStore.record(c.title, 'Reward claim', -c.cost);
    final r = RewardClaimDto(
      rewardId: id,
      method: method,
      title: c.title,
      code: method == 'code'
          ? 'SURE-${id.substring(2).toUpperCase()}-${(c.cost * 7919) % 9000 + 1000}'
          : null,
      claimingId: method == 'code'
          ? null
          : 'CLM-${DateTime.now().millisecondsSinceEpoch % 100000}',
      shopName: shopName,
      pointsUsed: c.cost,
      balance: MockLoyaltyStore.points,
      note: switch (method) {
        'code' => "Paste this code at checkout in the partner app. It's saved in your notifications.",
        'shop' => 'Claimed at $shopName — show this screen to the staff.',
        'delivery' => "We'll deliver it to your address within 3 days.",
        _ => 'Claimed and reserved for 14 days. Collect at any SureStore counter with your member QR.',
      },
    );
    _claimed[id] = r;
    _keys[key.value] = r;
    return r;
  }

  @override
  Future<Page<MemberBenefitDto>> memberBenefits({String? cursor}) async {
    await _wait();
    return const Page(
      items: [
        MemberBenefitDto(
          id: 'mb1',
          title: '10% off accessories',
          instruction: 'Min spend 50,000 MMK',
          code: 'SURE10',
        ),
        MemberBenefitDto(
          id: 'mb2',
          title: 'Free express delivery',
          instruction: 'Exclusive members',
          code: 'GOLDSHIP',
        ),
        MemberBenefitDto(
          id: 'mb3',
          title: '5,000 MMK off',
          instruction: 'Orders over 200,000 MMK',
          code: 'SAVE5K',
        ),
      ],
    );
  }
}
