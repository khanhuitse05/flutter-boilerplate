class DeviceInfo {
  String uid;
  String name;
  String platformName;
  String platformVersion;

  DeviceInfo({this.uid, this.name, this.platformName, this.platformVersion});

  DeviceInfo.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    platformName = json['platform_name'];
    platformVersion = json['platform_version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['platform_name'] = this.platformName;
    data['platform_version'] = this.platformVersion;
    return data;
  }
}
