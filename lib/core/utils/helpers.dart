class Helpers{

  String replaceBengaliNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const bengali = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], bengali[i]);
    }
    return input;
  }

  String firstLetters = "";

  String firstLettersOfBook(String input){
    firstLetters = "";
    List<String> words = input.split(" ");
    for (String word in words) {
      if (word.isNotEmpty) {
        firstLetters += word[0];
      }
    }
    return firstLetters;
  }

}