// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videos_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VideoItemAdapter extends TypeAdapter<VideoItem> {
  @override
  final int typeId = 1;

  @override
  VideoItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VideoItem(
      kind: fields[0] as String?,
      etag: fields[1] as String?,
      id: fields[2] as String?,
      video: fields[3] as Video?,
    );
  }

  @override
  void write(BinaryWriter writer, VideoItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.kind)
      ..writeByte(1)
      ..write(obj.etag)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.video);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VideoAdapter extends TypeAdapter<Video> {
  @override
  final int typeId = 2;

  @override
  Video read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Video(
      publishedAt: fields[0] as DateTime?,
      channelId: fields[1] as String?,
      title: fields[2] as String?,
      description: fields[3] as String?,
      thumbnails: fields[4] as Thumbnails?,
      channelTitle: fields[5] as String?,
      playlistId: fields[6] as String?,
      position: fields[7] as int?,
      resourceId: fields[8] as ResourceId?,
    );
  }

  @override
  void write(BinaryWriter writer, Video obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.publishedAt)
      ..writeByte(1)
      ..write(obj.channelId)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.thumbnails)
      ..writeByte(5)
      ..write(obj.channelTitle)
      ..writeByte(6)
      ..write(obj.playlistId)
      ..writeByte(7)
      ..write(obj.position)
      ..writeByte(8)
      ..write(obj.resourceId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ResourceIdAdapter extends TypeAdapter<ResourceId> {
  @override
  final int typeId = 3;

  @override
  ResourceId read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResourceId(
      kind: fields[0] as String?,
      videoId: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ResourceId obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.kind)
      ..writeByte(1)
      ..write(obj.videoId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResourceIdAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ThumbnailsAdapter extends TypeAdapter<Thumbnails> {
  @override
  final int typeId = 4;

  @override
  Thumbnails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Thumbnails(
      thumbnailsDefault: fields[0] as Default?,
      medium: fields[1] as Default?,
      high: fields[2] as Default?,
      standard: fields[3] as Default?,
      maxres: fields[4] as Default?,
    );
  }

  @override
  void write(BinaryWriter writer, Thumbnails obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.thumbnailsDefault)
      ..writeByte(1)
      ..write(obj.medium)
      ..writeByte(2)
      ..write(obj.high)
      ..writeByte(3)
      ..write(obj.standard)
      ..writeByte(4)
      ..write(obj.maxres);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThumbnailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DefaultAdapter extends TypeAdapter<Default> {
  @override
  final int typeId = 5;

  @override
  Default read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Default(
      url: fields[0] as String?,
      width: fields[1] as int?,
      height: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Default obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.width)
      ..writeByte(2)
      ..write(obj.height);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DefaultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
