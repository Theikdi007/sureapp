/// "1 product", "2 products". [count] is what is shown before the noun
/// (it may be formatted, e.g. "1.2k"); [n] decides singular or plural.
String plural(int n, String one, {String? many, String? count}) =>
    '${count ?? n} ${n == 1 ? one : (many ?? '${one}s')}';
