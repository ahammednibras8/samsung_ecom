// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_items.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartItemsAdapter extends TypeAdapter<CartItems> {
  @override
  final int typeId = 1;

  @override
  CartItems read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartItems(
      items: fields[0] as Items,
    );
  }

  @override
  void write(BinaryWriter writer, CartItems obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItemsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
