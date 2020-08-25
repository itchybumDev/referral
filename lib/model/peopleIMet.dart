class PeopleIMet {
  DateTime metTime;
  List<String> ids;

  PeopleIMet({this.metTime, this.ids});

  @override
  String toString() {
    return 'PeopleIMet{metTime: $metTime, ids: $ids}';
  }


  factory PeopleIMet.fromJson(Map<String, dynamic> json) => _$PeopleIMetFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleIMetToJson(this);
}

PeopleIMet _$PeopleIMetFromJson(Map<String, dynamic> json) {
  return PeopleIMet(
    ids: (json['ids'] as List)?.map((e) => e as String)?.toList(),
    metTime: json['metTime'] == null
          ? null
          : json['metTime'].toDate());

}

Map<String, dynamic> _$PeopleIMetToJson(PeopleIMet instance) => <String, dynamic>{
  'ids': instance.ids,
  'metTime': instance.metTime
};