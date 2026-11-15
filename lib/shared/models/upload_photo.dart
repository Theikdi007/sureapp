/// A photo picked for upload (`POST warranty/claims`, `PUT me/avatar`):
/// JPEG, PNG or WebP, up to 5 MB.
class UploadPhoto {
  const UploadPhoto({
    required this.path,
    required this.fileName,
    required this.mimeType,
  });

  final String path;
  final String fileName;

  /// `image/jpeg`, `image/png` or `image/webp`.
  final String mimeType;

  static const maxBytes = 5 * 1024 * 1024;
  static const allowedTypes = {'image/jpeg', 'image/png', 'image/webp'};

  /// Mime type from the file name, or null when the API won't take it.
  static String? mimeFor(String fileName) {
    final ext = fileName.split('.').last.toLowerCase();
    return switch (ext) {
      'jpg' || 'jpeg' => 'image/jpeg',
      'png' => 'image/png',
      'webp' => 'image/webp',
      _ => null,
    };
  }
}
