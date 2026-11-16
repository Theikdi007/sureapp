// Test-only stand-in moved out of the app build; data from the API doc's
// JSON examples and the prototype.
import 'dart:typed_data';

import 'package:sure_app/core/network/api_exception.dart';
import 'package:sure_app/core/network/interceptors.dart';
import 'package:sure_app/features/warranty/data/warranty_repository.dart';

/// The API doc's plan plus an active shop warranty; claims filed in this
/// session are kept in memory.
class MockWarrantyRepository implements WarrantyRepository {
  MockWarrantyRepository({this.latency = const Duration(milliseconds: 350)});

  final Duration latency;

  final List<WarrantyClaimDto> _claims = [
    const WarrantyClaimDto(
      number: 'CLM-1024',
      planId: 'shop:356789104455120:0',
      planName: 'SureStore 12-month warranty',
      device: 'Samsung Galaxy A14 128GB',
      description: 'Speaker crackles at high volume during calls.',
      status: 'in_review',
      statusLabel: 'Under review',
      filedAt: '2026-11-10T03:20:00+00:00',
      meta: 'Filed 10 Nov 2026 · Samsung Galaxy A14 128GB',
      staffNote: 'Bring the device to Yangon HQ; we will check it on the spot.',
    ),
  ];
  final Map<String, WarrantyClaimDto> _byKey = {};

  static const _plans = [
    WarrantyPlanDto(
      id: 'shop:356789104455120:0',
      source: 'shop',
      planName: 'SureStore 12-month warranty',
      device: 'Samsung Galaxy A14 128GB',
      serial: '356789104455120',
      endsOn: '2027-03-02',
      active: true,
      expiryText: '109 days left',
    ),
    WarrantyPlanDto(
      id: 'xtraguard:550100168:0',
      source: 'xtraguard',
      planName: 'Isure Power Adapter Warranty',
      device: 'Apple USB-C Power Adapter',
      endsOn: '2026-04-11',
      active: false,
      expiryText: 'Expired 11 Apr 2026',
      policyUrl: 'https://caremestorage.blob.core.windows.net/caremerss/Careme/581941bb-0cf3-4ac8-9ac3-1c5e31e19268.jpeg',
    ),
  ];

  Future<void> _wait() => Future<void>.delayed(latency);

  static ApiException _notFound(String what) => ApiException(
    code: 'mobile.not_found',
    message: "We couldn't find that $what.",
    status: 404,
  );

  WarrantyPlanDto _findPlan(String id) => _plans.firstWhere(
    (p) => p.id == id,
    orElse: () => throw const ApiException(
      code: 'mobile.plan_not_found',
      message: "That warranty plan isn't on your account.",
      status: 404,
    ),
  );

  @override
  Future<List<WarrantyPlanDto>> plans() async {
    await _wait();
    return _plans;
  }

  @override
  Future<WarrantyPlanDetailDto> plan(String id) async {
    await _wait();
    final plan = _findPlan(id);
    return WarrantyPlanDetailDto(
      plan: plan,
      variant: plan.source == 'shop' ? '128GB · Black' : null,
      covers: plan.source == 'shop'
          ? const [
              WarrantyCoverDto(
                name: 'Manufacturing defects',
                description: 'Parts and labour at any SureStore service desk.',
                endsOn: '2027-03-02',
              ),
              WarrantyCoverDto(
                name: 'Battery',
                description: 'Replaced if capacity drops below 80%.',
                endsOn: '2026-09-02',
              ),
            ]
          : const [
              WarrantyCoverDto(
                name: 'Accidental damage',
                description: 'One repair or replacement.',
                policy: 'XtraGuard terms',
                endsOn: '2026-04-11',
              ),
            ],
    );
  }

  @override
  Future<List<WarrantyClaimDto>> claims() async {
    await _wait();
    return List.unmodifiable(_claims);
  }

  @override
  Future<WarrantyClaimDto> claim(String number) async {
    await _wait();
    return _claims.firstWhere(
      (c) => c.number == number,
      orElse: () => throw _notFound('claim'),
    );
  }

  @override
  Future<WarrantyClaimDto> fileClaim({
    required String planId,
    required String description,
    UploadPhoto? photo,
    required IdempotencyKey key,
  }) async {
    await _wait();
    if (_byKey[key.value] case final done?) return done;
    final plan = _findPlan(planId);
    if (!plan.active) {
      throw const ApiException(
        code: 'mobile.plan_expired',
        message:
            'This plan has expired. Book a paid repair at any store instead.',
        status: 400,
        errors: [
          ApiFieldError(
            field: 'planId',
            code: 'mobile.plan_expired',
            message: 'This plan has expired. Book a paid repair at any store instead.',
          ),
        ],
      );
    }
    if (description.trim().length < 10) {
      throw const ApiException(
        code: 'mobile.claim_too_short',
        message: 'Describe what happened in at least 10 characters.',
        status: 400,
        errors: [
          ApiFieldError(
            field: 'description',
            code: 'mobile.claim_too_short',
            message: 'Describe what happened in at least 10 characters.',
          ),
        ],
      );
    }
    final number = 'CLM-${1024 + _claims.length}';
    final claim = WarrantyClaimDto(
      number: number,
      planId: plan.id,
      planName: plan.planName,
      device: plan.device,
      description: description.trim(),
      status: 'submitted',
      statusLabel: 'Submitted',
      filedAt: DateTime.now().toUtc().toIso8601String(),
      meta: 'Filed just now · ${plan.device}',
    );
    _claims.insert(0, claim);
    _byKey[key.value] = claim;
    return claim;
  }

  @override
  Future<Uint8List> claimPhoto(String number) async => throw _notFound('photo');
}
