extension EmailMasking on String {
  String maskEmail() {
    final emailRegEx = RegExp(r'^[^@]+@[^@]+\.[^@]+');

    if (!emailRegEx.hasMatch(this)) {
      return this;
    }

    // Split the email into local part and domain part
    final parts = split('@');
    final localPart = parts[0];
    final domainPart = parts[1];

    const visibleLength = 3;
    final maskedLength = localPart.length - visibleLength;

    if (localPart.length <= visibleLength) {
      return this;
    }

    final maskedLocalPart =
        localPart.substring(0, visibleLength) + '*' * maskedLength;

    return '$maskedLocalPart@$domainPart';
  }
}
