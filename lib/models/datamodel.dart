class apidata {
  int? status;
  List<Data>? data;

  apidata({this.status, this.data});

  apidata.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? idNo;
  String? branch;

  Data({this.id, this.name, this.idNo, this.branch});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    idNo = json['id_no'];
    branch = json['branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['id_no'] = this.idNo;
    data['branch'] = this.branch;
    return data;
  }
}