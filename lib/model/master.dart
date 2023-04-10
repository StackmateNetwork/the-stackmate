class Master {
  Master({this.seed, this.root, this.fingerprint, this.network, this.isbackup});

  Master.fromJson(Map<String, dynamic> json) {
    seed = json['seed'] as String;
    root = json['root'] as String;
    fingerprint = json['fingerprint'] as String;
    network = json['network'] as String;
    isbackup = json['isbackup'] as bool;
  }
  String? seed;
  String? root;
  String? fingerprint;
  String? network;
  bool? isbackup;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['seed'] = seed;
    data['root'] = root;
    data['fingerprint'] = fingerprint;
    data['network'] = network;
    data['isbackup'] = isbackup;
    return data;
  }
}
