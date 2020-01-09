class GetroomRateEntity {
	int code;
	GetroomRateData data;
	String message;

	GetroomRateEntity({this.code, this.data, this.message});

	GetroomRateEntity.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		data = json['data'] != null ? new GetroomRateData.fromJson(json['data']) : null;
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

class GetroomRateData {
	List<GetroomRateDataDatalist> dataList;
	String utilizationTotal;

	GetroomRateData({this.dataList, this.utilizationTotal});

	GetroomRateData.fromJson(Map<String, dynamic> json) {
		if (json['dataList'] != null) {
			dataList = new List<GetroomRateDataDatalist>();(json['dataList'] as List).forEach((v) { dataList.add(new GetroomRateDataDatalist.fromJson(v)); });
		}
		utilizationTotal = json['utilizationTotal'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.dataList != null) {
      data['dataList'] =  this.dataList.map((v) => v.toJson()).toList();
    }
		data['utilizationTotal'] = this.utilizationTotal;
		return data;
	}
}

class GetroomRateDataDatalist {
	String timeLineNew;
	int orderBy;
	String zSelect;
	String timeLine;
	int maxNum;
	String percentNum;
	String roomInfoList;
	String groupIds;
	String imageTextDetail;
	int id;
	var updateOn;
	String urlLink;
	int area;
	int systemId;
	int inUseDayNum;
	String utilization;
	String meetingList;
	int isDisplay;
	String coverUrl;
	int isSingle;
	String name;
	int createOn;
	String position;
	String mark;
	int status;

	GetroomRateDataDatalist({this.timeLineNew, this.orderBy, this.zSelect, this.timeLine, this.maxNum, this.percentNum, this.roomInfoList, this.groupIds, this.imageTextDetail, this.id, this.updateOn, this.urlLink, this.area, this.systemId, this.inUseDayNum, this.utilization, this.meetingList, this.isDisplay, this.coverUrl, this.isSingle, this.name, this.createOn, this.position, this.mark, this.status});

	GetroomRateDataDatalist.fromJson(Map<String, dynamic> json) {
		timeLineNew = json['timeLineNew'];
		orderBy = json['orderBy'];
		zSelect = json['zSelect'];
		timeLine = json['timeLine'];
		maxNum = json['maxNum'];
		percentNum = json['percentNum'];
		roomInfoList = json['roomInfoList'];
		groupIds = json['groupIds'];
		imageTextDetail = json['imageTextDetail'];
		id = json['id'];
		updateOn = json['updateOn'];
		urlLink = json['urlLink'];
		area = json['area'];
		systemId = json['systemId'];
		inUseDayNum = json['inUseDayNum'];
		utilization = json['utilization'];
		meetingList = json['meetingList'];
		isDisplay = json['isDisplay'];
		coverUrl = json['coverUrl'];
		isSingle = json['isSingle'];
		name = json['name'];
		createOn = json['createOn'];
		position = json['position'];
		mark = json['mark'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['timeLineNew'] = this.timeLineNew;
		data['orderBy'] = this.orderBy;
		data['zSelect'] = this.zSelect;
		data['timeLine'] = this.timeLine;
		data['maxNum'] = this.maxNum;
		data['percentNum'] = this.percentNum;
		data['roomInfoList'] = this.roomInfoList;
		data['groupIds'] = this.groupIds;
		data['imageTextDetail'] = this.imageTextDetail;
		data['id'] = this.id;
		data['updateOn'] = this.updateOn;
		data['urlLink'] = this.urlLink;
		data['area'] = this.area;
		data['systemId'] = this.systemId;
		data['inUseDayNum'] = this.inUseDayNum;
		data['utilization'] = this.utilization;
		data['meetingList'] = this.meetingList;
		data['isDisplay'] = this.isDisplay;
		data['coverUrl'] = this.coverUrl;
		data['isSingle'] = this.isSingle;
		data['name'] = this.name;
		data['createOn'] = this.createOn;
		data['position'] = this.position;
		data['mark'] = this.mark;
		data['status'] = this.status;
		return data;
	}
}
