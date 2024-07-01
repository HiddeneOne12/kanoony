 String toPascalCase(String text) {
    List<String> words = text.split(' ');

    // Capitalize the first letter of each word
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] = words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
      }
    }

    // Join the words back together with spaces
    return words.join(' ');
  }
