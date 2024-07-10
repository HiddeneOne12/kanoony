 // String toPascalCase(String text) {
 //    List<String> words = text.split(' ');
 //
 //    // Capitalize the first letter of each word
 //    for (int i = 0; i < words.length; i++) {
 //      if (words[i].isNotEmpty) {
 //        words[i] = words[i][0].capitalizeFirstLetter() + words[i].substring(1).toLowerCase();
 //      }
 //    }
 //
 //    // Join the words back together with spaces
 //    return words.join(' ');
 //  }

 String capitalizeFirst(String text) {
   if (text.isEmpty) return text;
   return text[0].toUpperCase() + text.substring(1).toLowerCase();
 }