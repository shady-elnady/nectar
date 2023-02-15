import 'dart:convert';

import '../../../Profile/data/Models/address_model.dart';
import '../../domain/Entities/order.dart';
import 'delivery_model.dart';
import 'payment_model.dart';
import 'promo_code_model.dart';
import 'refund_model.dart';

class OrderModel extends Order {
  const OrderModel({
    required super.url,
    required super.myCart,
    super.promoCode,
    super.isRefundRequested,
    super.isRefundGranted,
    super.shippingAddress,
    super.delivery,
    super.billingAddress,
    super.totalOrderCost,
    super.delvireyCost,
    super.payments,
    super.receivedDate,
    super.finalOrderCost,
    super.totalAmountsPaid,
    super.refund,
    required super.slug,
  });

  factory OrderModel.fromMap(Map<String, dynamic> data) => OrderModel(
        url: data['url'] as String,
        myCart: data['my_cart'] as String,
        promoCode: data['promo_code'] == null
            ? null
            : PromoCodeModel.fromMap(
                data['promo_code'] as Map<String, dynamic>),
        isRefundRequested: data['is_refund_requested'] as bool?,
        isRefundGranted: data['is_refund_granted'] as bool?,
        shippingAddress: data['shipping_address'] == null
            ? null
            : AddressModel.fromMap(
                data['shipping_address'] as Map<String, dynamic>),
        delivery: data['delivery'] == null
            ? null
            : DeliveryModel.fromMap(data['delivery'] as Map<String, dynamic>),
        billingAddress: data['billing_address'] == null
            ? null
            : AddressModel.fromMap(
                data['billing_address'] as Map<String, dynamic>),
        totalOrderCost: (data['total_order_cost'] as num?)?.toDouble(),
        delvireyCost: data['delvirey_cost'] as int?,
        payments: (data['Payments'] as List<dynamic>?)
            ?.map((e) => PaymentModel.fromMap(e as Map<String, dynamic>))
            .toList(),
        receivedDate: data['received_date'] == null
            ? null
            : DateTime.parse(data['received_date'] as String),
        finalOrderCost: (data['Final_Order_Cost'] as num?)?.toDouble(),
        totalAmountsPaid: (data['Total_amounts_Paid'] as num?)?.toDouble(),
        refund: data['Refund'] == null
            ? null
            : RefundModel.fromMap(data['Refund'] as Map<String, dynamic>),
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OrderModel].
  factory OrderModel.fromJson(String data) {
    return OrderModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
