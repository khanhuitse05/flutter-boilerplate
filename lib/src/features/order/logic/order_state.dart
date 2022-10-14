part of 'order_bloc.dart';

class OrderState extends Equatable {
  final PaymentType paymentType;
  final ReceiveType receiveType;
  final String address;

  OrderState({
    this.paymentType = PaymentType.node,
    this.receiveType = ReceiveType.node,
    this.address = '',
  });
  @override
  List<Object?> get props => [
        paymentType,
        receiveType,
        address,
      ];

  OrderState copyWith({
    PaymentType? paymentType,
    ReceiveType? receiveType,
    String? address,
  }) {
    return OrderState(
      paymentType: paymentType ?? this.paymentType,
      receiveType: receiveType ?? this.receiveType,
      address: address ?? this.address,
    );
  }
}
