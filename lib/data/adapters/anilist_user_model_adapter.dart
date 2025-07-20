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
      id: fields[0],
      name: fields[1],
      avatarImage: fields[2],
      bannerImage: fields[3],
      accessCode: fields[4],
      accessToken: fields[5],
      refreshToken: fields[6],
    );
  }

  @override
  int get typeId => types.anilistUserAdapterType;

  @override
  void write(BinaryWriter writer, AnilistUserModel obj) {
   writer.writeByte(7);
    writer.writeByte(0);
    writer.write(obj.id);
    writer.writeByte(1);
    writer.write(obj.name);
    writer.writeByte(2);
    writer.write(obj.avatarImage);
    writer.writeByte(3);
    writer.write(obj.bannerImage);
    writer.writeByte(4);
    writer.write(obj.accessCode);
    writer.writeByte(5);
    writer.write(obj.accessToken);
    writer.writeByte(6);
    writer.write(obj.refreshToken);
  }
}
