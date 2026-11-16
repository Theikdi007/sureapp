import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/network/api_exception.dart';
import '../../../design_system/components/list_layout.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/sheet_components.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/components/sure_text_field.dart';
import '../../../design_system/components/sure_toast.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../../shared/widgets/photo_picker.dart';
import '../../repairs/presentation/repairs_screen.dart' show LoadingBlock;
import '../data/profile_repository.dart';
import 'address_sheet.dart';
import 'profile_providers.dart';
import 'profile_widgets.dart';

void _toastError(BuildContext context, Object e) => SureToast.show(
  context,
  e is ApiException ? e.userMessage : 'Something went wrong. Try again.',
  icon: LucideIcons.circleAlert,
  color: SureToastColor.critical,
);

/// Account & Security (prototype `Account Settings`): photo, personal
/// details, password and saved addresses. `PATCH me`, `PUT me/avatar`,
/// `POST me/password`, `GET/POST/PUT/DELETE addresses`.
///
/// The phone number can't change in the app (the member changes it at a
/// store), so it is shown read-only.
class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});

  @override
  ConsumerState<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _address = TextEditingController();
  final _township = TextEditingController();
  final _state = TextEditingController();
  final _phone = TextEditingController();
  String? _dob;
  ProfileDto? _seededFrom;
  bool _saving = false;
  bool _uploading = false;
  ApiException? _error;

  List<TextEditingController> get _fields => [
    _name,
    _email,
    _address,
    _township,
    _state,
  ];

  @override
  void initState() {
    super.initState();
    for (final f in _fields) {
      f.addListener(_onEdit);
    }
  }

  @override
  void dispose() {
    for (final f in _fields) {
      f.dispose();
    }
    _phone.dispose();
    super.dispose();
  }

  void _onEdit() => setState(() => _error = null);

  void _seed(ProfileDto p) {
    if (_seededFrom != null) return;
    _seededFrom = p;
    _name.text = p.name;
    _email.text = p.email ?? '';
    _address.text = p.address ?? '';
    _township.text = p.township ?? '';
    _state.text = p.state ?? '';
    _phone.text = p.phoneDisplay;
    _dob = p.dateOfBirth;
  }

  /// Only the fields the member changed.
  UpdateProfileRequest _changes(ProfileDto p) {
    String? diff(TextEditingController c, String? was) {
      final v = c.text.trim();
      return v == (was ?? '') ? null : v;
    }

    return UpdateProfileRequest(
      name: diff(_name, p.name),
      email: diff(_email, p.email),
      dateOfBirth: _dob == p.dateOfBirth ? null : _dob,
      address: diff(_address, p.address),
      township: diff(_township, p.township),
      state: diff(_state, p.state),
    );
  }

  Future<void> _save(ProfileDto p) async {
    final changes = _changes(p);
    if (changes.isEmpty) return;
    FocusScope.of(context).unfocus();
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      final me = await ref.read(profileProvider.notifier).save(changes);
      if (!mounted) return;
      _seededFrom = me;
      SureToast.show(context, 'Profile saved', icon: LucideIcons.circleCheck);
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _pickDob() async {
    final now = DateTime.now();
    final current = _dob == null ? null : DateTime.tryParse(_dob!);
    final picked = await showDatePicker(
      context: context,
      initialDate: current ?? DateTime(now.year - 25),
      firstDate: DateTime(1920),
      lastDate: now,
      helpText: 'Date of birth',
    );
    if (picked == null) return;
    setState(() {
      _dob = DateFormat('yyyy-MM-dd').format(picked);
      _error = null;
    });
  }

  Future<void> _changePhoto() async {
    final pick = await pickUploadPhoto(context, title: 'Profile photo');
    if (pick == null || !mounted) return;
    switch (pick) {
      case PhotoRejected(:final message):
        SureToast.show(
          context,
          message,
          icon: LucideIcons.imageOff,
          color: SureToastColor.critical,
        );
      case PhotoPicked(:final photo):
        setState(() => _uploading = true);
        try {
          await ref.read(profileProvider.notifier).uploadAvatar(photo);
          if (mounted) {
            SureToast.show(
              context,
              'Photo updated',
              icon: LucideIcons.circleCheck,
            );
          }
        } on Object catch (e) {
          if (mounted) _toastError(context, e);
        } finally {
          if (mounted) setState(() => _uploading = false);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(profileProvider);
    if (profile.value case final p?) _seed(p);
    final p = _seededFrom;

    return PageScaffold(
      title: 'Account settings',
      headerGap: 18,
      maxContentWidth: 720,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: PageScaffold.sidePadding,
          ),
          sliver: SliverToBoxAdapter(
            child: p == null
                ? switch (profile) {
                    AsyncError(:final error) when !profile.isLoading =>
                      EmptyState(
                        icon: LucideIcons.userX,
                        title: "Couldn't load your profile",
                        description: error is ApiException
                            ? error.userMessage
                            : null,
                        action: SureLink(
                          'Try again',
                          onTap: () => ref.invalidate(profileProvider),
                        ),
                      ),
                    _ => const LoadingBlock(),
                  }
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _photoRow(profile.value ?? p),
                      const SizedBox(height: _gap),
                      ..._detailsForm(profile.value ?? p),
                      // The last field row already ends with a 12 pt gap.
                      const SizedBox(height: _gap - SureSpace.x3),
                      const _PasswordSection(),
                      const SizedBox(height: _gap),
                      const _AddressSection(),
                      const SizedBox(height: _gap),
                      ..._saveBlock(profile.value ?? p),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  /// Prototype `Account Settings` column gap.
  static const double _gap = 18;

  Widget _photoRow(ProfileDto p) {
    final c = context.colors;
    return Row(
      children: [
        Stack(
          children: [
            MemberAvatar(name: p.name, photoUrl: p.photoUrl, size: 72),
            if (_uploading)
              Positioned.fill(
                child: Center(
                  child: SizedBox.square(
                    dimension: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: c.primaryInk,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: SureSpace.x4),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                p.phoneDisplay,
                style: SureText.body2(SureTypography.medium)
                    .copyWith(color: c.ink),
              ),
              const SizedBox(height: SureSpace.x1),
              SureLink(
                p.photoUrl == null ? 'Add a photo' : 'Change photo',
                onTap: _uploading ? () {} : _changePhoto,
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _detailsForm(ProfileDto p) {
    final c = context.colors;
    final e = _error;

    Widget field(
      String label,
      TextEditingController controller,
      String key, {
      TextInputType? keyboard,
      Iterable<String>? autofill,
    }) => Padding(
      padding: const EdgeInsets.only(bottom: SureSpace.x3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FieldLabel(label),
          const SizedBox(height: SureSpace.x3),
          SureTextField(
            controller: controller,
            semanticLabel: label,
            keyboardType: keyboard,
            autofillHints: autofill,
            enabled: !_saving,
            error: e?.fieldMessage(key) != null,
          ),
          FieldError(e?.fieldMessage(key)),
        ],
      ),
    );

    final dob = _dob == null ? null : DateTime.tryParse(_dob!);

    return [
      const SectionHeader(
        title: 'Personal details',
        size: SectionHeaderSize.small,
      ),
      const SizedBox(height: SureSpace.x3),
      field('Full name', _name, 'name', autofill: const [AutofillHints.name]),
      Padding(
        padding: const EdgeInsets.only(bottom: SureSpace.x3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const FieldLabel('Phone'),
            const SizedBox(height: SureSpace.x3),
            SureTextField(
              controller: _phone,
              startIcon: LucideIcons.phone,
              enabled: false,
              semanticLabel: 'Phone, ${p.phoneDisplay}',
            ),
            const SizedBox(height: SureSpace.x1),
            Text(
              'To change your number, visit any SureStore branch.',
              style: SureText.caption1().copyWith(color: c.inkFaded),
            ),
          ],
        ),
      ),
      field(
        'Email',
        _email,
        'email',
        keyboard: TextInputType.emailAddress,
        autofill: const [AutofillHints.email],
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: SureSpace.x3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const FieldLabel('Date of birth'),
            const SizedBox(height: SureSpace.x3),
            Semantics(
              button: true,
              label:
                  'Date of birth, '
                  '${dob == null ? 'not set' : DateFormat('d MMMM y').format(dob)}',
              excludeSemantics: true,
              child: InkWell(
                onTap: _saving ? null : _pickDob,
                borderRadius: SureRadius.all(SureRadius.medium),
                child: InputDecorator(
                  isEmpty: dob == null,
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: c.raised,
                    hintText: 'Choose a date',
                    hintStyle: SureText.body2().copyWith(color: c.inkFaded),
                    constraints: const BoxConstraints(minHeight: 48),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 14,
                    ),
                    suffixIcon: Icon(
                      LucideIcons.calendar,
                      size: 18,
                      color: c.inkFaded,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: SureRadius.all(SureRadius.medium),
                      borderSide: BorderSide(
                        color: e?.fieldMessage('dateOfBirth') != null
                            ? c.critical
                            : c.border,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: SureRadius.all(SureRadius.medium),
                      borderSide: BorderSide(
                        color: e?.fieldMessage('dateOfBirth') != null
                            ? c.critical
                            : c.border,
                      ),
                    ),
                  ),
                  child: dob == null
                      ? null
                      : Text(
                          DateFormat('d MMM y').format(dob),
                          style: SureText.body2().copyWith(color: c.ink),
                        ),
                ),
              ),
            ),
            FieldError(e?.fieldMessage('dateOfBirth')),
          ],
        ),
      ),
      field(
        'Address',
        _address,
        'address',
        autofill: const [AutofillHints.streetAddressLine1],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: field('Township', _township, 'township')),
          const SizedBox(width: SureSpace.x3),
          Expanded(
            child: field(
              'State / Region',
              _state,
              'state',
              autofill: const [AutofillHints.addressState],
            ),
          ),
        ],
      ),
    ];
  }

  /// Save Changes sits at the bottom of the page, as in the prototype; a
  /// general (non-field) error shows right above it.
  List<Widget> _saveBlock(ProfileDto p) {
    final e = _error;
    final general =
        e != null &&
            ![
              'name',
              'email',
              'dateOfBirth',
              'address',
              'township',
              'state',
            ].any((f) => e.fieldMessage(f) != null)
        ? e.userMessage
        : null;
    final changed = !_changes(p).isEmpty;
    return [
      if (general != null) ...[
        InlineAlert(
          icon: LucideIcons.circleAlert,
          critical: true,
          text: general,
        ),
        const SizedBox(height: SureSpace.x3),
      ],
      SureButton(
        label: 'Save Changes',
        loading: _saving,
        onPressed: changed ? () => _save(p) : null,
      ),
    ];
  }
}

/// Change password (`POST me/password`), folded away until opened.
class _PasswordSection extends ConsumerStatefulWidget {
  const _PasswordSection();

  @override
  ConsumerState<_PasswordSection> createState() => _PasswordSectionState();
}

class _PasswordSectionState extends ConsumerState<_PasswordSection> {
  final _current = TextEditingController();
  final _new = TextEditingController();
  final _confirm = TextEditingController();
  bool _open = false;
  bool _saving = false;
  ApiException? _error;

  @override
  void initState() {
    super.initState();
    for (final f in [_current, _new, _confirm]) {
      f.addListener(() => setState(() => _error = null));
    }
  }

  @override
  void dispose() {
    _current.dispose();
    _new.dispose();
    _confirm.dispose();
    super.dispose();
  }

  void _toggle() => setState(() {
    _open = !_open;
    _error = null;
    _current.clear();
    _new.clear();
    _confirm.clear();
  });

  bool get _ready =>
      _current.text.isNotEmpty &&
      _new.text.isNotEmpty &&
      _confirm.text.isNotEmpty;

  /// Every message for [field]: `password_weak` lists each unmet rule.
  String? _messages(String field) {
    final list = [
      for (final e in _error?.errors ?? const <ApiFieldError>[])
        if (e.field == field) e.message,
    ];
    return list.isEmpty ? null : list.join('\n');
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      await ref
          .read(profileRepositoryProvider)
          .changePassword(
            currentPassword: _current.text,
            newPassword: _new.text,
            confirm: _confirm.text,
          );
      if (!mounted) return;
      _toggle();
      SureToast.show(
        context,
        'Password updated',
        icon: LucideIcons.lock,
        color: SureToastColor.positive,
      );
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final curErr = _messages('currentPassword');
    final newErr = _messages('newPassword');
    final confErr = _messages('confirm');
    final general =
        _error != null && curErr == null && newErr == null && confErr == null
        ? _error!.userMessage
        : null;

    Widget pwd(
      TextEditingController ctl,
      String hint,
      String? err, {
      Iterable<String>? autofill,
    }) => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SureTextField(
            controller: ctl,
            placeholder: hint,
            semanticLabel: hint,
            obscureText: true,
            startIcon: LucideIcons.lock,
            enabled: !_saving,
            error: err != null,
            autofillHints: autofill,
          ),
          FieldError(err),
        ],
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(
          title: 'Security',
          size: SectionHeaderSize.small,
          action: SureLink(_open ? 'Close' : 'Set password', onTap: _toggle),
        ),
        AnimatedSize(
          duration: SureMotion.medium,
          alignment: Alignment.topCenter,
          child: !_open
              ? const SizedBox(width: double.infinity)
              : Container(
                  margin: const EdgeInsets.only(top: SureSpace.x3),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: SureRadius.all(SureRadius.large),
                    border: Border.all(color: c.boxBorder),
                  ),
                  child: AutofillGroup(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Change Password',
                          style: SureText.body3(SureTypography.bold)
                              .copyWith(color: c.ink),
                        ),
                        const SizedBox(height: 10),
                        pwd(
                          _current,
                          'Current password',
                          curErr,
                          autofill: const [AutofillHints.password],
                        ),
                        pwd(
                          _new,
                          'New password',
                          newErr,
                          autofill: const [AutofillHints.newPassword],
                        ),
                        pwd(
                          _confirm,
                          'Confirm new password',
                          confErr,
                          autofill: const [AutofillHints.newPassword],
                        ),
                        Text(
                          'At least 8 characters, with a letter and a number.',
                          style: SureTypography.style(
                            size: 11,
                            height: 1.5,
                            color: c.inkFaded,
                          ),
                        ),
                        if (general != null) ...[
                          const SizedBox(height: 10),
                          InlineAlert(
                            icon: LucideIcons.circleAlert,
                            critical: true,
                            text: general,
                          ),
                        ],
                        const SizedBox(height: 10),
                        SureButton(
                          label: 'Update Password',
                          size: SureButtonSize.medium,
                          loading: _saving,
                          onPressed: _ready ? _submit : null,
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}

/// Saved addresses: tap to edit, "Add" for a new one.
class _AddressSection extends ConsumerWidget {
  const _AddressSection();

  static IconData iconFor(String name) => switch (name) {
    'map-pin-house' || 'house' || 'home' => LucideIcons.mapPinHouse,
    'building' || 'building-2' || 'briefcase' => LucideIcons.building2,
    _ => LucideIcons.mapPin,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addresses = ref.watch(savedAddressesProvider);
    final list = addresses.value;
    final full = (list?.length ?? 0) >= 10;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(
          title: 'My address',
          size: SectionHeaderSize.small,
          action: list == null || full
              ? null
              : SureLink(
                  'Add New Address',
                  onTap: () => showAddressSheet(context),
                ),
        ),
        const SizedBox(height: SureSpace.x3),
        switch (addresses) {
          AsyncData(:final value) when value.isEmpty => EmptyState(
            icon: LucideIcons.mapPin,
            title: 'No saved addresses',
            description: 'Add one for faster checkout',
            action: SureLink(
              'Add address',
              onTap: () => showAddressSheet(context),
            ),
          ),
          AsyncData(:final value) => ListGroup(
            radius: SureRadius.large,
            children: [
              for (final a in value)
                ListRow(
                  icon: iconFor(a.icon),
                  title: a.isDefault ? '${a.label} · Default' : a.label,
                  subtitle: a.fullText,
                  trailing: Icon(
                    LucideIcons.pencil,
                    size: 16,
                    color: context.colors.inkFaded,
                  ),
                  onTap: () => showAddressSheet(context, address: a),
                ),
            ],
          ),
          AsyncError(:final error) when !addresses.isLoading => EmptyState(
            icon: LucideIcons.wifiOff,
            title: "Couldn't load your addresses",
            description: error is ApiException ? error.userMessage : null,
            action: SureLink(
              'Try again',
              onTap: () => ref.invalidate(savedAddressesProvider),
            ),
          ),
          _ => const LoadingBlock(height: 72),
        },
        if (full) ...[
          const SizedBox(height: SureSpace.x2),
          Text(
            'You can save up to 10 addresses. Remove one to add another.',
            style: SureText.caption1().copyWith(color: context.colors.inkFaded),
          ),
        ],
      ],
    );
  }
}
