import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'address.dart';
import 'delivery.dart';
import 'payment.dart';
import 'promo_code.dart';
import 'refund.dart';

class Order extends Equatable {
  final String? url;
  final String? myCart;
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
  final String? slug;

  const Order({
    this.url,
    this.myCart,
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
    this.slug,
  });

  factory Order.fromMap(Map<String, dynamic> data) => Order(
        url: data['url'] as String?,
        myCart: data['my_cart'] as String?,
        promoCode: data['promo_code'] == null
            ? null
            : PromoCode.fromMap(data['promo_code'] as Map<String, dynamic>),
        isRefundRequested: data['is_refund_requested'] as bool?,
        isRefundGranted: data['is_refund_granted'] as bool?,
        shippingAddress: data['shipping_address'] == null
            ? null
            : Address.fromMap(data['shipping_address'] as Map<String, dynamic>),
        delivery: data['delivery'] == null
            ? null
            : Delivery.fromMap(data['delivery'] as Map<String, dynamic>),
        billingAddress: data['billing_address'] == null
            ? null
            : Address.fromMap(data['billing_address'] as Map<String, dynamic>),
        totalOrderCost: (data['total_order_cost'] as num?)?.toDouble(),
        delvireyCost: data['delvirey_cost'] as int?,
        payments: (data['Payments'] as List<dynamic>?)
            ?.map((e) => Payment.fromMap(e as Map<String, dynamic>))
            .toList(),
        receivedDate: data['received_date'] == null
            ? null
            : DateTime.parse(data['received_date'] as String),
        finalOrderCost: (data['Final_Order_Cost'] as num?)?.toDouble(),
        totalAmountsPaid: (data['Total_amounts_Paid'] as num?)?.toDouble(),
        refund: data['Refund'] == null
            ? null
            : Refund.fromMap(data['Refund'] as Map<String, dynamic>),
        slug: data['slug'] as String?,
      );

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
  /// Parses the string and returns the resulting Json object as [Order].
  factory Order.fromJson(String data) {
    return Order.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Order] to a JSON string.
  String toJson() => json.encode(toMap());

  Order copyWith({
    String? url,
    String? myCart,
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
    String? slug,
  }) {
    return Order(
      url: url ?? this.url,
      myCart: myCart ?? this.myCart,
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
      slug: slug ?? this.slug,
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
