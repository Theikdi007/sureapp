import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../design_system/components/sheet_components.dart';
import '../../design_system/components/sure_toast.dart';
import '../../design_system/tokens/sure_metrics.dart';
import '../models/upload_photo.dart';

/// What [pickUploadPhoto] got: a photo the API will take, or the reason
/// the picked file can't be sent.
sealed class PhotoPick {
  const PhotoPick();
}

class PhotoPicked extends PhotoPick {
  const PhotoPicked(this.photo);
  final UploadPhoto photo;
}

class PhotoRejected extends PhotoPick {
  const PhotoRejected(this.message);
  final String message;
}

/// Asks camera or library, then picks a photo resized for upload and checks
/// it against the API's rules (JPEG/PNG/WebP, ≤ 5 MB). Null when the member
/// cancels or access was denied (a toast explains the latter).
Future<PhotoPick?> pickUploadPhoto(
  BuildContext context, {
  String title = 'Add a photo',
}) async {
  final source = await showSureSheet<ImageSource>(
    context,
    title: title,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SelectRow(
          icon: LucideIcons.camera,
          title: 'Take a photo',
          selected: false,
          onSelect: () => Navigator.pop(context, ImageSource.camera),
        ),
        const SizedBox(height: SureSpace.x2),
        SelectRow(
          icon: LucideIcons.image,
          title: 'Choose from library',
          selected: false,
          onSelect: () => Navigator.pop(context, ImageSource.gallery),
        ),
      ],
    ),
  );
  if (source == null) return null;

  final XFile? file;
  try {
    // Resized and re-encoded, so camera shots fit the 5 MB limit.
    file = await ImagePicker().pickImage(
      source: source,
      maxWidth: 2400,
      maxHeight: 2400,
      imageQuality: 85,
    );
  } on PlatformException {
    if (context.mounted) {
      SureToast.show(
        context,
        source == ImageSource.camera
            ? 'Allow camera access in Settings to take a photo'
            : 'Allow photo access in Settings to choose a photo',
        icon: LucideIcons.imageOff,
        color: SureToastColor.critical,
      );
    }
    return null;
  }
  if (file == null) return null;

  final mime = UploadPhoto.mimeFor(file.name);
  if (mime == null) {
    return const PhotoRejected('Use a JPEG, PNG or WebP photo.');
  }
  if (await file.length() > UploadPhoto.maxBytes) {
    return const PhotoRejected(
      'That file is too large. Photos can be up to 5 MB.',
    );
  }
  return PhotoPicked(
    UploadPhoto(path: file.path, fileName: file.name, mimeType: mime),
  );
}
