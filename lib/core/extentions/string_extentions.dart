extension StringExtension on String? {
  String capitalizeFirstLetter() {
    if (this == null || this!.isEmpty) return '';

    // Trim leading spaces
    String trimmedText = this!.trimLeft();

    // Handle the special case for "Aed"
    if (trimmedText.toLowerCase().contains("aed")) {
      List<String> words = trimmedText.split(" ");
      for (int i = 0; i < words.length; i++) {
        if (words[i].toLowerCase() == "aed") {
          words[i] = "AED";
        } else {
          words[i] = words[i].toLowerCase();
        }
      }
      return words.join(" ");
    }

    // Match a number followed by a period and a space
    final numberPattern = RegExp(r'^(\d+\.\s*)');
    final match = numberPattern.firstMatch(trimmedText);

    if (match != null) {
      final prefix = match.group(0) ?? '';
      final sentence = trimmedText.substring(match.end);
      return prefix + sentence[0].toUpperCase() + sentence.substring(1).toLowerCase();
    } else {
      return trimmedText[0].toUpperCase() + trimmedText.substring(1).toLowerCase();
    }
  }
   String upperCase() {
    if (this == null || this!.isEmpty) return '';
    return this?.toUpperCase()??"";
  }
}