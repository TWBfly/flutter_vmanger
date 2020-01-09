class GethotInfolistEntity {
	int code;
	GethotInfolistData data;
	String message;

	GethotInfolistEntity({this.code, this.data, this.message});

	GethotInfolistEntity.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		data = json['data'] != null ? new GethotInfolistData.fromJson(json['data']) : null;
		message = json['message'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['message'] = this.message;
		return data;
	}
}

class GethotInfolistData {
	List<GethotInfolistDataDatalist> dataList;

	GethotInfolistData({this.dataList});

	GethotInfolistData.fromJson(Map<String, dynamic> json) {
		if (json['dataList'] != null) {
			dataList = new List<GethotInfolistDataDatalist>();(json['dataList'] as List).forEach((v) { dataList.add(new GethotInfolistDataDatalist.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.dataList != null) {
      data['dataList'] =  this.dataList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class GethotInfolistDataDatalist {
	String name;
	var createOn;
	var startOn;
	int id;
	int type;
	String content;

	GethotInfolistDataDatalist({this.name, this.createOn, this.startOn, this.id, this.type, this.content});

	GethotInfolistDataDatalist.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		createOn = json['createOn'];
		startOn = json['startOn'];
		id = json['id'];
		type = json['type'];
		content = json['content'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['createOn'] = this.createOn;
		data['startOn'] = this.startOn;
		data['id'] = this.id;
		data['type'] = this.type;
		data['content'] = this.content;
		return data;
	}
}
