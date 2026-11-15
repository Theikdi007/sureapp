import 'package:flutter_test/flutter_test.dart';
import 'package:sure_app/core/network/api_exception.dart';
import 'package:sure_app/core/network/interceptors.dart';
import 'package:sure_app/features/cart/data/cart_repository.dart';
import 'package:sure_app/features/cart/data/checkout_dtos.dart';

void main() {
  late MockCartRepository repo;
  setUp(() => repo = MockCartRepository(latency: Duration.zero));

  test('add, change qty, remove: the bag answers with totals', () async {
    final key = IdempotencyKey.generate();
    var cart = await repo.addItem(productId: 'VG-WATCH-3', key: key);
    expect(cart.itemCount, 1);
    // Same key = replay, not a second item.
    cart = await repo.addItem(productId: 'VG-WATCH-3', key: key);
    expect(cart.itemCount, 1);
    cart = await repo.setQty(cart.lines.first.id, 3);
    expect(cart.itemCount, 3);
    expect(cart.lines.first.lineTotal.value, 3 * 2643900);
    cart = await repo.remove(cart.lines.first.id);
    expect(cart.lines, isEmpty);
  });

  test('quote follows the choices; placing empties the bag', () async {
    await repo.addItem(productId: 'VG-IPH-17P', key: IdempotencyKey.generate());
    final express = await repo.quote(
      const CheckoutRequest(mode: 'delivery', shipping: 'express'),
    );
    final standard = await repo.quote(
      const CheckoutRequest(mode: 'delivery', shipping: 'standard'),
    );
    expect(express.deliveryFee.value, 5000);
    expect(standard.deliveryFee.value, 0);
    expect(express.canPlace, isTrue);
    expect(express.points.canRedeem, isFalse);
    expect(express.payments.where((p) => p.enabled).map((p) => p.code), [
      'cod',
    ]);

    final pickup = await repo.quote(const CheckoutRequest(mode: 'pickup'));
    expect(pickup.payments.first.code, 'pay_at_pickup');

    // Wrong expected total → 409 with a fresh quote.
    await expectLater(
      repo.placeOrder(
        const CheckoutRequest(
          mode: 'delivery',
          shipping: 'express',
          expectedTotal: 1,
        ),
        key: IdempotencyKey.generate(),
      ),
      throwsA(
        isA<ApiException>()
            .having((e) => e.code, 'code', 'channel.price_changed')
            .having((e) => e.body?['quote'], 'quote', isNotNull),
      ),
    );

    final key = IdempotencyKey.generate();
    final placed = await repo.placeOrder(
      CheckoutRequest(
        mode: 'delivery',
        shipping: 'express',
        expectedTotal: express.total.value,
      ),
      key: key,
    );
    expect(placed.number, startsWith('APP-'));
    expect((await repo.cart()).lines, isEmpty);
    // Retrying with the same key replays the same order.
    final again = await repo.placeOrder(
      CheckoutRequest(
        mode: 'delivery',
        shipping: 'express',
        expectedTotal: express.total.value,
      ),
      key: key,
    );
    expect(again.number, placed.number);
  });

  test('request body leaves out unset fields', () {
    expect(const CheckoutRequest(mode: 'pickup').toBody(), {'mode': 'pickup'});
  });
}
