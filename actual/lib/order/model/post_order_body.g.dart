// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_order_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostOrderBody _$PostOrderBodyFromJson(Map<String, dynamic> json) =>
    PostOrderBody(
      id: json['id'] as String,
      totalPrice: json['totalPrice'] as int,
      products: (json['products'] as List<dynamic>)
          .map((e) => BasketItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createAt: json['createAt'] as String,
    );

Map<String, dynamic> _$PostOrderBodyToJson(PostOrderBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'products': instance.products,
      'totalPrice': instance.totalPrice,
      'createAt': instance.createAt,
    };
