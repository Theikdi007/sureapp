// Test-only stand-in moved out of the app build; data from the API doc's
// JSON examples and the prototype.
import 'package:sure_app/features/catalog/data/catalog_dtos.dart';
import 'package:sure_app/features/home/data/home_dtos.dart';
import 'package:sure_app/shared/models/money.dart';

/// Mock-flavor catalog: the prototype's products, brands and stores in the
/// API's shapes. Images come from the test server's public media; brand
/// logos are bundled (`asset:` URLs, see `SureImage`).
abstract final class MockCatalog {
  static const _media = 'https://surestoremobileapi.yammobots.com/media';
  static const productImage = '$_media/product-iphone.jpg';

  static Money ks(int v) => Money(value: v, currency: 'MMK');

  static final products = <ProductCardDto>[
    ProductCardDto(
      id: 'VG-WATCH-3',
      name: 'Watch 3',
      brand: 'Apple',
      imageUrl: productImage,
      price: ks(2643900),
      compareAt: ks(2937900),
      discountPercent: 10,
      inStock: true,
      rating: 4.8,
      reviewCount: 12,
    ),
    ProductCardDto(
      id: 'VG-IPH-17PM-2TB',
      name: 'iPhone 17 Pro Max 2TB',
      brand: 'Apple',
      imageUrl: productImage,
      price: ks(3777900),
      compareAt: ks(4197900),
      discountPercent: 10,
      inStock: true,
      rating: 4.9,
      reviewCount: 34,
    ),
    ProductCardDto(
      id: 'VG-IPH-17E-256',
      name: 'iPhone 17e 256GB',
      brand: 'Apple',
      imageUrl: productImage,
      price: ks(2643900),
      compareAt: ks(2937900),
      discountPercent: 10,
      inStock: true,
      reviewCount: 3,
    ),
    ProductCardDto(
      id: 'VG-IPH-17P',
      name: 'iPhone 17 Pro',
      brand: 'Apple',
      imageUrl: productImage,
      price: ks(2307900),
      inStock: true,
      rating: 5,
      reviewCount: 8,
    ),
    ProductCardDto(
      id: 'VG-IPH-AIR-1TB',
      name: 'iPhone Air 1TB',
      brand: 'Apple',
      imageUrl: productImage,
      price: ks(2643900),
      inStock: true,
    ),
    ProductCardDto(
      id: 'VG-IPH-16',
      name: 'iPhone 16',
      brand: 'Apple',
      imageUrl: productImage,
      price: ks(3777900),
      compareAt: ks(4197900),
      discountPercent: 10,
      inStock: true,
      rating: 4.7,
      reviewCount: 21,
    ),
  ];

  static const hero = [
    BannerDto(
      id: 'hero-1',
      imageUrl: '$_media/hero-whats-new.png',
      title: "What's new",
      link: LinkDto(type: 'search', value: ''),
    ),
    BannerDto(
      id: 'hero-2',
      imageUrl: productImage,
      title: 'iPhone 17 Pro',
      link: LinkDto(type: 'search', value: 'iPhone'),
    ),
    BannerDto(
      id: 'hero-3',
      imageUrl: '$_media/hero-whats-new.png',
      title: 'Watch',
      link: LinkDto(type: 'search', value: 'Watch'),
    ),
  ];

  static const whatsNew = [
    BannerDto(
      id: 'wn-1',
      imageUrl: productImage,
      link: LinkDto(type: 'search', value: 'iPhone'),
    ),
    BannerDto(
      id: 'wn-2',
      imageUrl: productImage,
      link: LinkDto(type: 'search', value: 'iPhone 17'),
    ),
    BannerDto(
      id: 'wn-3',
      imageUrl: productImage,
      link: LinkDto(type: 'search', value: 'iPhone Air'),
    ),
  ];

  static BrandDto _brand(String id, String name, String file) => BrandDto(
    id: id,
    name: name,
    logoUrl: null, // mocks ship no logo assets
    initial: name.substring(0, 1),
    color: '#14161B',
    backgroundColor: '#F5F5F7',
    productCount: 4,
  );

  static final brands = [
    _brand('apple', 'Apple', 'apple.svg'),
    _brand('anker', 'Anker', 'anker.svg'),
    _brand('sony', 'Sony', 'sony.svg'),
    _brand('jbl', 'JBL', 'jbl.jpg'),
    _brand('bose', 'Bose', 'bose.svg'),
    _brand('belkin', 'Belkin', 'belkin.svg'),
    _brand('sennheiser', 'Sennheiser', 'sennheiser.svg'),
    _brand('ringke', 'Ringke', 'ringke.png'),
    _brand('aulumu', 'Aulumu', 'aulumu.png'),
    _brand('mageasy', 'Mageasy', 'mageasy.png'),
  ];

  static const vendors = [
    VendorDto(
      id: 'isure',
      name: 'iSure',
      initials: 'iS',
      color: 'rgb(255,255,255)',
      backgroundColor: 'rgb(20,22,27)',
      tagline: 'Apple Premium Reseller in Myanmar',
      rating: 4.9,
      ratingCount: 2400,
      followers: 12400,
      productCount: 5,
    ),
    VendorDto(
      id: 'xtrasure',
      name: 'XtraSure',
      initials: 'XS',
      color: '#A0F04B',
      backgroundColor: '#14372D',
      tagline: 'Member deals & certified accessories',
      rating: 4.8,
      ratingCount: 1300,
      followers: 8100,
      productCount: 4,
    ),
    VendorDto(
      id: 'dyson-care',
      name: 'Dyson Care',
      initials: 'DC',
      color: 'rgb(255,255,255)',
      backgroundColor: 'rgb(124,58,237)',
      tagline: 'Authorized Dyson care & home tech',
      rating: 4.9,
      ratingCount: 900,
      followers: 3200,
      productCount: 0,
    ),
  ];

  static const homeAddress = AddressDto(
    id: '0b0c3a39-9f5d-4f63-9a25-3d2a7f1c1001',
    label: 'Home',
    recipientName: 'Thiri Aung',
    recipientPhone: '09776234118',
    line1: 'No. 12, Baho Road',
    township: 'Hleden, Kamayut',
    city: 'Yangon',
    isDefault: true,
    shortLabel: 'Hleden, Kamayut',
    fullText: 'No. 12, Baho Road, Hleden, Kamayut',
  );
}
