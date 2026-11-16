import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:sure_app/core/config/app_config.dart';
import 'package:sure_app/core/core_providers.dart';
import 'package:sure_app/core/push/push_registration.dart';
import 'package:sure_app/features/app_config/data/app_config_repository.dart';
import 'package:sure_app/features/auth/data/auth_repository.dart';
import 'package:sure_app/features/cart/data/cart_repository.dart';
import 'package:sure_app/features/catalog/data/catalog_repository.dart';
import 'package:sure_app/features/catalog/data/wishlist_repository.dart';
import 'package:sure_app/features/content/data/content_repository.dart';
import 'package:sure_app/features/home/data/home_repository.dart';
import 'package:sure_app/features/loyalty/data/loyalty_repository.dart';
import 'package:sure_app/features/notifications/data/devices_repository.dart';
import 'package:sure_app/features/notifications/data/notifications_repository.dart';
import 'package:sure_app/features/orders/data/orders_repository.dart';
import 'package:sure_app/features/profile/data/profile_repository.dart';
import 'package:sure_app/features/repairs/data/repairs_repository.dart';
import 'package:sure_app/features/rewards/data/rewards_repository.dart';
import 'package:sure_app/features/stores/data/stores_repository.dart';
import 'package:sure_app/features/warranty/data/warranty_repository.dart';

import 'mocks/mocks.dart';

export 'mocks/mocks.dart';

/// A config that never reaches the network (every repository is overridden).
const testAppConfig = AppConfig(
  flavor: AppFlavor.staging,
  apiBaseUrl: 'https://example.invalid',
);

/// The app config plus every repository swapped for its test stand-in.
///
/// Pass a repository instance to replace the default one (for example to keep
/// a handle on it in the test).
List<Override> mockOverrides({
  Duration latency = Duration.zero,
  AuthRepository? auth,
  ProfileRepository? profile,
  NotificationsRepository? notifications,
  LoyaltyRepository? loyalty,
  WarrantyRepository? warranty,
  DevicesRepository? devices,
}) => [
  pushMessagingProvider.overrideWithValue(FakePushMessaging()),
  devicesRepositoryProvider.overrideWithValue(
    devices ?? MockDevicesRepository(),
  ),
  appConfigProvider.overrideWithValue(testAppConfig),
  appConfigRepositoryProvider.overrideWithValue(MockAppConfigRepository()),
  authRepositoryProvider.overrideWithValue(
    auth ?? MockAuthRepository(latency: latency),
  ),
  cartRepositoryProvider.overrideWithValue(
    MockCartRepository(latency: latency),
  ),
  catalogRepositoryProvider.overrideWithValue(
    MockCatalogRepository(latency: latency),
  ),
  wishlistRepositoryProvider.overrideWithValue(MockWishlistRepository()),
  contentRepositoryProvider.overrideWithValue(
    MockContentRepository(latency: latency),
  ),
  homeRepositoryProvider.overrideWithValue(
    MockHomeRepository(latency: latency),
  ),
  loyaltyRepositoryProvider.overrideWithValue(
    loyalty ?? MockLoyaltyRepository(latency: latency),
  ),
  notificationsRepositoryProvider.overrideWithValue(
    notifications ?? MockNotificationsRepository(latency: latency),
  ),
  ordersRepositoryProvider.overrideWithValue(
    MockOrdersRepository(latency: latency),
  ),
  profileRepositoryProvider.overrideWithValue(
    profile ?? MockProfileRepository(latency: latency),
  ),
  repairsRepositoryProvider.overrideWithValue(
    MockRepairsRepository(latency: latency),
  ),
  rewardsRepositoryProvider.overrideWithValue(
    MockRewardsRepository(latency: latency),
  ),
  storesRepositoryProvider.overrideWithValue(
    MockStoresRepository(latency: latency),
  ),
  warrantyRepositoryProvider.overrideWithValue(
    warranty ?? MockWarrantyRepository(latency: latency),
  ),
];
