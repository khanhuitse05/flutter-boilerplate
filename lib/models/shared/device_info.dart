class DeviceInfo {
  String uid;
  String name;
  String? platformName;
  String platformVersion;

  DeviceInfo({
    required this.uid,
    required this.name,
    required this.platformVersion,
    this.platformName,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['platform_name'] = this.platformName;
    data['platform_version'] = this.platformVersion;
    return data;
  }
}
