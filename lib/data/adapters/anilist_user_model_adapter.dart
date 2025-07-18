import 'package:hive/hive.dart';
import 'adapters_types.dart' as types;
import 'package:unyo/data/models/anilist_user_model.dart';

class AnilistUserModelAdapter extends TypeAdapter<AnilistUserModel> {
  @override
  AnilistUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnilistUserModel(
      name: fields[0],
      avatarImage: fields[1],
      accessToken: fields[2],
      refreshToken: fields[3],
    );
  }

  @override
  int get typeId => types.anilistUserAdapterType;

  @override
  void write(BinaryWriter writer, AnilistUserModel obj) {
    writer.writeByte(4);
    writer.writeByte(0);
    writer.write(obj.name);
    writer.writeByte(1);
    writer.write(obj.avatarImage);
    writer.writeByte(2);
    writer.write(obj.accessToken);
    writer.writeByte(3);
    writer.write(obj.refreshToken);
  }
}
