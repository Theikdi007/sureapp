import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/warranty_repository.dart';

part 'warranty_providers.g.dart';

@riverpod
Future<List<WarrantyPlanDto>> warrantyPlans(Ref ref) =>
    ref.watch(warrantyRepositoryProvider).plans();

@riverpod
Future<WarrantyPlanDetailDto> warrantyPlanDetail(Ref ref, String id) =>
    ref.watch(warrantyRepositoryProvider).plan(id);

@riverpod
Future<List<WarrantyClaimDto>> warrantyClaims(Ref ref) =>
    ref.watch(warrantyRepositoryProvider).claims();

@riverpod
Future<Uint8List> warrantyClaimPhoto(Ref ref, String number) =>
    ref.watch(warrantyRepositoryProvider).claimPhoto(number);

/// Claim status → `statusColors` key. The API sends a free-form status with
/// a ready label; anything still open reads as warning (prototype).
String claimStatusColor(String status) => switch (status.toLowerCase()) {
  'approved' || 'resolved' || 'completed' || 'closed' => 'positive',
  'rejected' || 'declined' => 'critical',
  _ => 'warning',
};
