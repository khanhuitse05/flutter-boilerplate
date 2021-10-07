part of 'order_bloc.dart';

enum ReceiveType {
  node,
  user,
  shop,
}
enum PaymentType {
  node,
  cod,
  momo,
  transfer,
}

class OrderState extends Equatable {
  final PaymentType paymentType;
  final ReceiveType receiveType;

  OrderState({
    this.paymentType = PaymentType.node,
    this.receiveType = ReceiveType.node,
  });
  @override
  List<Object?> get props => [
        paymentType,
        receiveType,
      ];

  OrderState copyWith({
    PaymentType? paymentType,
    ReceiveType? receiveType,
  }) {
    return OrderState(
      paymentType: paymentType ?? this.paymentType,
      receiveType: receiveType ?? this.receiveType,
    );
  }
}
