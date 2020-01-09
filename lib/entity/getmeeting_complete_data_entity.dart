class GetmeetingCompleteDataEntity {
	int code;
	GetmeetingCompleteDataData data;
	String message;

	GetmeetingCompleteDataEntity({this.code, this.data, this.message});

	GetmeetingCompleteDataEntity.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		data = json['data'] != null ? new GetmeetingCompleteDataData.fromJson(json['data']) : null;
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

class GetmeetingCompleteDataData {
	GetmeetingCompleteDataDataCount count;

	GetmeetingCompleteDataData({this.count});

	GetmeetingCompleteDataData.fromJson(Map<String, dynamic> json) {
		count = json['count'] != null ? new GetmeetingCompleteDataDataCount.fromJson(json['count']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.count != null) {
      data['count'] = this.count.toJson();
    }
		return data;
	}
}

class GetmeetingCompleteDataDataCount {
	int finishNum;
	int allNum;
	int unFinishNum;

	GetmeetingCompleteDataDataCount({this.finishNum, this.allNum, this.unFinishNum});

	GetmeetingCompleteDataDataCount.fromJson(Map<String, dynamic> json) {
		finishNum = json['finishNum'];
		allNum = json['allNum'];
		unFinishNum = json['unFinishNum'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['finishNum'] = this.finishNum;
		data['allNum'] = this.allNum;
		data['unFinishNum'] = this.unFinishNum;
		return data;
	}
}
