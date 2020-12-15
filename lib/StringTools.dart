extension StringTool on String {
  String initial() {
    if (this == null || this.isEmpty) {
      return '';
    }

    List<String> words = this.split(' ');

    String initials = '';

    words.forEach((element) {
      initials += element.substring(0, 1).toUpperCase();
    });

    return initials;
  }
}
