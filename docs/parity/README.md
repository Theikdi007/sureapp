# Prototype parity screenshots

Side-by-side captures for code review and QA: **left = prototype** (design-ref, headless Chrome, 402×874 @2x), **right = app** (iPhone 17 simulator, mock flavor, light mode). `_0` is the top of the screen; `_1`, `_2` are scrolled about one screen each (scroll offsets differ between the two sides).

Captured 2026-11-16 from commit `26c7ad8`. Findings are filed as GitHub issues labelled `design-parity`.

Not captured on the app side: `app_lock`, `cart_sheet`. Screens for features that are out of this release (live chat, QR/bank/points payment) are intentionally different.

## Regenerate

```sh
# 1. App screenshots -> build/screenshots/
flutter drive --driver=test_driver/screenshot_driver.dart \
  --target=integration_test/prototype_parity_test.dart -d <simulator-id>
flutter drive --driver=test_driver/screenshot_driver.dart \
  --target=integration_test/auth_screens_test.dart -d <simulator-id>
#    rename auth shots: ob1→onboarding_0, login_empty→login_0, otp_partial→otp_0,
#    pwd_new→create_password_0, pwd_login→password_0

# 2. Prototype screenshots (needs Google Chrome and the full prototype bundle,
#    design-ref/prototype/sure-app-prototype.bundle.html, which is not in git)
cd tool/parity && npm install
node proto.mjs "$PWD/../../design-ref/prototype/sure-app-prototype.bundle.html" /tmp/parity/proto

# Dark mode: add --dart-define=PARITY_DARK=true to both flutter drive runs,
#   and `dark` as a third argument to proto.mjs.

# 3. Side-by-side images
python3 compose.py /tmp/parity/proto /tmp/parity/app /tmp/parity/pairs
```

## Screens

- **about**: [about_0.jpg](pairs/about_0.jpg) [about_1.jpg](pairs/about_1.jpg) [about_2.jpg](pairs/about_2.jpg) 
- **account**: [account_0.jpg](pairs/account_0.jpg) [account_1.jpg](pairs/account_1.jpg) [account_2.jpg](pairs/account_2.jpg) 
- **app_lock**: [app_lock_0.jpg](pairs/app_lock_0.jpg) 
- **brands**: [brands_0.jpg](pairs/brands_0.jpg) [brands_1.jpg](pairs/brands_1.jpg) [brands_2.jpg](pairs/brands_2.jpg) 
- **cart**: [cart_0.jpg](pairs/cart_0.jpg) [cart_1.jpg](pairs/cart_1.jpg) [cart_2.jpg](pairs/cart_2.jpg) [cart_sheet_0.jpg](pairs/cart_sheet_0.jpg) [cart_sheet_1.jpg](pairs/cart_sheet_1.jpg) [cart_sheet_2.jpg](pairs/cart_sheet_2.jpg) 
- **cart_sheet**: [cart_sheet_0.jpg](pairs/cart_sheet_0.jpg) [cart_sheet_1.jpg](pairs/cart_sheet_1.jpg) [cart_sheet_2.jpg](pairs/cart_sheet_2.jpg) 
- **checkout**: [checkout_0.jpg](pairs/checkout_0.jpg) [checkout_1.jpg](pairs/checkout_1.jpg) [checkout_2.jpg](pairs/checkout_2.jpg) 
- **create_password**: [create_password_0.jpg](pairs/create_password_0.jpg) 
- **find_store**: [find_store_0.jpg](pairs/find_store_0.jpg) [find_store_1.jpg](pairs/find_store_1.jpg) [find_store_2.jpg](pairs/find_store_2.jpg) 
- **home**: [home_0.jpg](pairs/home_0.jpg) [home_1.jpg](pairs/home_1.jpg) [home_2.jpg](pairs/home_2.jpg) 
- **login**: [login_0.jpg](pairs/login_0.jpg) 
- **member_coupons**: [member_coupons_0.jpg](pairs/member_coupons_0.jpg) [member_coupons_1.jpg](pairs/member_coupons_1.jpg) [member_coupons_2.jpg](pairs/member_coupons_2.jpg) 
- **notification_detail**: [notification_detail_0.jpg](pairs/notification_detail_0.jpg) [notification_detail_1.jpg](pairs/notification_detail_1.jpg) [notification_detail_2.jpg](pairs/notification_detail_2.jpg) 
- **notifications**: [notifications_0.jpg](pairs/notifications_0.jpg) [notifications_1.jpg](pairs/notifications_1.jpg) [notifications_2.jpg](pairs/notifications_2.jpg) 
- **onboarding**: [onboarding_0.jpg](pairs/onboarding_0.jpg) [onboarding_1.jpg](pairs/onboarding_1.jpg) 
- **order_detail**: [order_detail_0.jpg](pairs/order_detail_0.jpg) [order_detail_1.jpg](pairs/order_detail_1.jpg) [order_detail_2.jpg](pairs/order_detail_2.jpg) 
- **orders**: [orders_0.jpg](pairs/orders_0.jpg) [orders_1.jpg](pairs/orders_1.jpg) [orders_2.jpg](pairs/orders_2.jpg) 
- **otp**: [otp_0.jpg](pairs/otp_0.jpg) 
- **password**: [password_0.jpg](pairs/password_0.jpg) 
- **payment_methods**: [payment_methods_0.jpg](pairs/payment_methods_0.jpg) [payment_methods_1.jpg](pairs/payment_methods_1.jpg) [payment_methods_2.jpg](pairs/payment_methods_2.jpg) 
- **points**: [points_0.jpg](pairs/points_0.jpg) [points_1.jpg](pairs/points_1.jpg) [points_2.jpg](pairs/points_2.jpg) 
- **product_detail**: [product_detail_0.jpg](pairs/product_detail_0.jpg) [product_detail_1.jpg](pairs/product_detail_1.jpg) [product_detail_2.jpg](pairs/product_detail_2.jpg) 
- **product_list**: [product_list_0.jpg](pairs/product_list_0.jpg) [product_list_1.jpg](pairs/product_list_1.jpg) [product_list_2.jpg](pairs/product_list_2.jpg) 
- **profile**: [profile_0.jpg](pairs/profile_0.jpg) [profile_1.jpg](pairs/profile_1.jpg) [profile_2.jpg](pairs/profile_2.jpg) 
- **reward_detail**: [reward_detail_0.jpg](pairs/reward_detail_0.jpg) [reward_detail_1.jpg](pairs/reward_detail_1.jpg) [reward_detail_2.jpg](pairs/reward_detail_2.jpg) 
- **rewards**: [rewards_0.jpg](pairs/rewards_0.jpg) [rewards_1.jpg](pairs/rewards_1.jpg) [rewards_2.jpg](pairs/rewards_2.jpg) 
- **support**: [support_0.jpg](pairs/support_0.jpg) [support_1.jpg](pairs/support_1.jpg) [support_2.jpg](pairs/support_2.jpg) 
- **tiers**: [tiers_0.jpg](pairs/tiers_0.jpg) [tiers_1.jpg](pairs/tiers_1.jpg) [tiers_2.jpg](pairs/tiers_2.jpg) 
- **top_up**: [top_up_0.jpg](pairs/top_up_0.jpg) [top_up_1.jpg](pairs/top_up_1.jpg) [top_up_2.jpg](pairs/top_up_2.jpg) 
- **track**: [track_0.jpg](pairs/track_0.jpg) [track_1.jpg](pairs/track_1.jpg) [track_2.jpg](pairs/track_2.jpg) 
- **transfer**: [transfer_0.jpg](pairs/transfer_0.jpg) [transfer_1.jpg](pairs/transfer_1.jpg) [transfer_2.jpg](pairs/transfer_2.jpg) 
- **vendor**: [vendor_0.jpg](pairs/vendor_0.jpg) [vendor_1.jpg](pairs/vendor_1.jpg) [vendor_2.jpg](pairs/vendor_2.jpg) 
- **vendors**: [vendors_0.jpg](pairs/vendors_0.jpg) [vendors_1.jpg](pairs/vendors_1.jpg) [vendors_2.jpg](pairs/vendors_2.jpg) 
- **warranty**: [warranty_0.jpg](pairs/warranty_0.jpg) [warranty_1.jpg](pairs/warranty_1.jpg) [warranty_2.jpg](pairs/warranty_2.jpg) 
- **wishlist**: [wishlist_0.jpg](pairs/wishlist_0.jpg) [wishlist_1.jpg](pairs/wishlist_1.jpg) [wishlist_2.jpg](pairs/wishlist_2.jpg) 
