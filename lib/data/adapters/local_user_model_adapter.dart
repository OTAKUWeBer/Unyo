import 'package:hive/hive.dart';
import 'adapters_types.dart' as types;
import 'package:unyo/data/models/local_user_model.dart';

class LocalUserModelAdapter extends TypeAdapter<LocalUserModel> {
  @override
  LocalUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalUserModel(
      id: fields[0],
      name: fields[1],
      avatarImage: fields[2],
      bannerImage: fields[3],
    );
  }

  @override
  int get typeId => types.localUserAdapterType;

  @override
  void write(BinaryWriter writer, LocalUserModel obj) {
    writer.writeByte(4);
    writer.writeByte(0);
    writer.write(obj.id);
    writer.writeByte(1);
    writer.write(obj.name);
    writer.writeByte(2);
    writer.write(obj.avatarImage);
    writer.writeByte(3);
    writer.write(obj.bannerImage);
  }
}