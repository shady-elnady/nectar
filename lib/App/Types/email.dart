import '../Extensions/string.dart';

class EMail extends Comparable<String> {
  @override
  int compareTo(String other) {
    if (other.isValidEmail()) return 0;
    throw UnimplementedError();
  }
}

// typedef EMail = String Function(String email);
