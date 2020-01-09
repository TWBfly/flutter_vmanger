class GetbannerDataEntity {
	int code;
	GetbannerDataData data;
	String message;

	GetbannerDataEntity({this.code, this.data, this.message});

	GetbannerDataEntity.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		data = json['data'] != null ? new GetbannerDataData.fromJson(json['data']) : null;
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

class GetbannerDataData {
	int waitMeetingCount;
	int allMeetingCount;
	int overMeetingCount;

	GetbannerDataData({this.waitMeetingCount, this.allMeetingCount, this.overMeetingCount});

	GetbannerDataData.fromJson(Map<String, dynamic> json) {
		waitMeetingCount = json['waitMeetingCount'];
		allMeetingCount = json['allMeetingCount'];
		overMeetingCount = json['overMeetingCount'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['waitMeetingCount'] = this.waitMeetingCount;
		data['allMeetingCount'] = this.allMeetingCount;
		data['overMeetingCount'] = this.overMeetingCount;
		return data;
	}
}
