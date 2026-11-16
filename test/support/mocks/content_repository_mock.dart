// Test-only stand-in moved out of the app build; data from the API doc's
// JSON examples and the prototype.

import 'package:sure_app/core/network/api_exception.dart';
import 'package:sure_app/features/content/data/content_repository.dart';

class MockContentRepository implements ContentRepository {
  MockContentRepository({this.latency = const Duration(milliseconds: 250)});

  final Duration latency;

  static const _pages = {
    ContentSlugs.terms: ContentPageDto(
      slug: ContentSlugs.terms,
      title: 'Terms of Services',
      body:
          "Orders are confirmed once we've checked them and can be cancelled "
          'free of charge until they are packed.\nPrices are shown and settled '
          'in MMK.',
      updatedAt: '2026-11-02T08:29:46.0742513+00:00',
    ),
    ContentSlugs.privacy: ContentPageDto(
      slug: ContentSlugs.privacy,
      title: 'Privacy Policy',
      body:
          'We use your phone number to sign you in and to find your orders, '
          'repairs and warranty plans.\nWe never sell your data.',
      updatedAt: '2026-11-02T08:29:46.0742513+00:00',
    ),
    ContentSlugs.returnPolicy: ContentPageDto(
      slug: ContentSlugs.returnPolicy,
      title: 'Return policy',
      body:
          'Unopened items can be returned within 7 days at any SureStore '
          'branch with the receipt.\nFaulty devices are repaired or replaced '
          'under their warranty: file a claim in TechVault Warranty or bring '
          'the device to a service desk.',
      updatedAt: '2026-11-02T08:29:46.0742513+00:00',
    ),
  };

  @override
  Future<ContentPageDto> page(String slug) async {
    await Future<void>.delayed(latency);
    final page = _pages[slug];
    if (page == null) {
      throw const ApiException(
        code: 'mobile.not_found',
        message: "We couldn't find that page.",
        status: 404,
      );
    }
    return page;
  }
}
