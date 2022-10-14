enum PaymentType {
  node('N/A'),
  cod('COD'),
  apple('Apple Pay'),
  visa('Visa');

  final String name;
  const PaymentType(this.name);
}
