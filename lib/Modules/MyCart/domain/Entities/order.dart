import 'dart:convert';

import 'package:nectar_mac/App/Entities/sub_base_entity.dart';

import '../../../Profile/domain/Entities/address.dart';
import 'delivery.dart';
import 'payment.dart';
import 'promo_code.dart';
import 'refund.dart';

class Order extends SubBaseEntity {
  final String myCart;
  final PromoCode? promoCode;
  final bool? isRefundRequested;
  final bool? isRefundGranted;
  final Address? shippingAddress;
  final Delivery? delivery;
  final Address? billingAddress;
  final double? totalOrderCost;
  final int? delvireyCost;
  final List<Payment>? payments;
  final DateTime? receivedDate;
  final double? finalOrderCost;
  final double? totalAmountsPaid;
  final Refund? refund;

  const Order({
    required super.url,
    required this.myCart,
    this.promoCode,
    this.isRefundRequested,
    this.isRefundGranted,
    this.shippingAddress,
    this.delivery,
    this.billingAddress,
    this.totalOrderCost,
    this.delvireyCost,
    this.payments,
    this.receivedDate,
    this.finalOrderCost,
    this.totalAmountsPaid,
    this.refund,
    required super.slug,
  });

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'my_cart': myCart,
        'promo_code': promoCode?.toMap(),
        'is_refund_requested': isRefundRequested,
        'is_refund_granted': isRefundGranted,
        'shipping_address': shippingAddress?.toMap(),
        'delivery': delivery?.toMap(),
        'billing_address': billingAddress?.toMap(),
        'total_order_cost': totalOrderCost,
        'delvirey_cost': delvireyCost,
        'Payments': payments?.map((e) => e.toMap()).toList(),
        'received_date': receivedDate?.toIso8601String(),
        'Final_Order_Cost': finalOrderCost,
        'Total_amounts_Paid': totalAmountsPaid,
        'Refund': refund?.toMap(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [Order] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  Order copyWith({
    required String url,
    required String myCart,
    PromoCode? promoCode,
    bool? isRefundRequested,
    bool? isRefundGranted,
    Address? shippingAddress,
    Delivery? delivery,
    Address? billingAddress,
    double? totalOrderCost,
    int? delvireyCost,
    List<Payment>? payments,
    DateTime? receivedDate,
    double? finalOrderCost,
    double? totalAmountsPaid,
    Refund? refund,
    required String slug,
  }) {
    return Order(
      url: this.url,
      myCart: this.myCart,
      promoCode: promoCode ?? this.promoCode,
      isRefundRequested: isRefundRequested ?? this.isRefundRequested,
      isRefundGranted: isRefundGranted ?? this.isRefundGranted,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      delivery: delivery ?? this.delivery,
      billingAddress: billingAddress ?? this.billingAddress,
      totalOrderCost: totalOrderCost ?? this.totalOrderCost,
      delvireyCost: delvireyCost ?? this.delvireyCost,
      payments: payments ?? this.payments,
      receivedDate: receivedDate ?? this.receivedDate,
      finalOrderCost: finalOrderCost ?? this.finalOrderCost,
      totalAmountsPaid: totalAmountsPaid ?? this.totalAmountsPaid,
      refund: refund ?? this.refund,
      slug: this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      url,
      myCart,
      promoCode,
      isRefundRequested,
      isRefundGranted,
      shippingAddress,
      delivery,
      billingAddress,
      totalOrderCost,
      delvireyCost,
      payments,
      receivedDate,
      finalOrderCost,
      totalAmountsPaid,
      refund,
      slug,
    ];
  }
}
