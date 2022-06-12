extension UsefulListExtensions<T> on Iterable<T> {
  /// Calculates the sum of a collection of [T] elements. [sumFunction] requires a double to be returned
  /// to use for the calculation.
  ///
  /// Object Example:
  /// ``` dart
  /// final valueList = <Map<String, double>>[{"value": 1.3},{"value": 1},{"value": 2.7},];
  /// final total = valueList.sum((element) => element["value"]!);
  /// print(total); // 5
  /// ```
  /// List of [double] Example:
  /// ``` dart
  /// final valueList = <double>[1.3, 1, 2.7];
  /// final total = valueList.sum((element) => element);
  /// print(total); // 5
  /// ```
  double sum(double Function(T) sumFunction) => fold(
        0,
        (previousValue, element) => previousValue + sumFunction(element),
      );

  /// Calculates the average of a collection of [T] elements. [sumFunction] requires a double to be returned
  /// to use for the calculation. Using an empty list will throw an [UnsupportedError].
  ///
  /// Object Example:
  /// ``` dart
  /// final valueList = <Map<String, double>>[{"value": 1.3},{"value": 1},{"value": 2.7},];
  /// final average = valueList.average((element) => element["value"]!);
  /// print(average); // 1.6666666666666667
  /// ```
  /// List of [double]   Example:
  /// ``` dart
  /// final valueList = <double>[1.3, 1, 2.7];
  /// final average = valueList.average((element) => element);
  /// print(average); // 1.6666666666666667
  /// ```
  double average(double Function(T) sumFunction) {
    if (length <= 0) {
      throw UnsupportedError(
          'List needs to have elements to perform average calculation');
    }
    return sum(sumFunction) / length;
  }

  /// Groups a collection and returns a list of [Map<K, List<T>>] elements.
  /// The Collection gets grouped by [K]
  ///
  /// Example grouping list by age:
  /// ``` dart
  /// final list = [
  ///   {"age": 10, "name": "Tom"},
  ///   {"age": 11, "name": "Jane"},
  ///   {"age": 12, "name": "Kim"},
  ///   {"age": 12, "name": "John"},
  ///   {"age": 10, "name": "Peart"},
  /// ];
  /// var result = list.groupBy((e) => e["age"]);
  /// print(result);
  /// /*
  /// Prints:
  /// {
  ///   10: [
  ///     {"age": 10, "name": "Tom"},
  ///     {"age": 10, "name": "Peart"}
  ///   ],
  ///   11: [
  ///     {"age": 11, "name": "Jane"}
  ///   ],
  ///   12: [
  ///     {"age": 12, "name": "Kim"},
  ///     {"age": 12, "name": "John"}
  ///   ]
  /// };
  /// */
  /// ```
  Map<K, List<T>> groupBy<K>(K Function(T e) keyFunction) => fold(
      <K, List<T>>{},
      (Map<K, List<T>> map, T element) =>
          map..putIfAbsent(keyFunction(element), () => <T>[]).add(element));
}

extension UsefulStringExtensions on String {
  static final _splitRegEx = RegExp(r"(?=(?!^)[A-Z])");

  /// Check if the string is an email
  ///
  /// Example:
  /// ```dart
  /// String email = "test@test.com";
  /// print(email.isEmail); // true
  /// email = "random";
  /// print(email.isEmail); // false
  /// ```
  bool get isEmail => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);

  /// Returns the sentence case of the current string
  ///
  /// Example:
  /// ```dart
  /// String sentence = "hello wOrLd!";
  /// String fixedSentence = sentence.sentenceCase;
  /// print(fixedSentence); // "Hello world!"
  /// ```
  String get sentenceCase =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  /// Capitalizes the first of each separate word. Use in conjunction after
  /// [splitCamelCaseWord] to convert camel cased words to titles
  ///
  /// Example:
  /// ```dart
  /// String sentence = "hello world!";
  /// String titleSentence = sentence.splitCamelCaseWord;
  /// print(titleSentence); // "Hello World!"
  /// ```
  ///
  /// Example with [splitCamelCaseWord]
  /// ``` dart
  /// String sentence = "helloWorld!";
  /// String splitSentence = sentence.splitCamelCaseWord.titleCase;
  /// print(splitSentence); // "Hello World!"
  /// ```
  String get titleCase => replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.sentenceCase)
      .join(" ");

  /// Separates the camelcase word with a [separator] string
  ///
  /// Example:
  /// ```dart
  /// String sentence = "helloWorld!";
  /// String splitSentence = sentence.splitCamelCaseWord;
  /// print(splitSentence); // "hello World!"
  /// ```
  ///
  /// Example with [titleCase]
  /// ``` dart
  /// String sentence = "helloWorld!";
  /// String splitSentence = sentence.splitCamelCaseWord.titleCase;
  /// print(splitSentence); // "Hello World!"
  /// ```
  String splitCamelCaseWord([String separator = " "]) =>
      split(_splitRegEx).join(separator);

  /// Separates the camelcase word into a string list
  ///
  /// Example:
  /// ```dart
  /// String sentence = "helloWorld!";
  /// String splitSentence = sentence.splitCamelCaseList;
  /// print(splitSentence); // ["hello", "World!"]
  /// ```
  List<String> get splitCamelCaseList => split(_splitRegEx);
}
