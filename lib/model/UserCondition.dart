



class UserCondition{
  String myId;
  String myHealth;


  UserCondition({this.myId, this.myHealth});

  factory UserCondition.fromJson(Map<String, dynamic> json) => _$SyncEntryFromJson(json);

  Map<String, dynamic> toJson() => _$SyncEntryToJson(this);
}

UserCondition _$SyncEntryFromJson(Map<String, dynamic> json) {
  return UserCondition(
    myId: json['myId'] as String,
    myHealth: json['myHealth'] as String);

}

Map<String, dynamic> _$SyncEntryToJson(UserCondition instance) => <String, dynamic>{
  'myId': instance.myId,
  'myHealth': instance.myHealth};