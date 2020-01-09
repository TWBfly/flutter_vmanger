class MyActivityEntity {
	int code;
	Data data;
	String message;

	MyActivityEntity({this.code, this.data, this.message});

	MyActivityEntity.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
	int curPage;
	List<Elements> elements;
	bool firstPage;
	bool lastPage;
	int lastPageNumber;
	int nextPage;
	int pageSize;
	int previousPage;
	int thisPageFirstElementNumber;
	int thisPageLastElementNumber;
	int totalElements;

	Data(
			{this.curPage,
				this.elements,
				this.firstPage,
				this.lastPage,
				this.lastPageNumber,
				this.nextPage,
				this.pageSize,
				this.previousPage,
				this.thisPageFirstElementNumber,
				this.thisPageLastElementNumber,
				this.totalElements});

	Data.fromJson(Map<String, dynamic> json) {
		curPage = json['curPage'];
		if (json['elements'] != null) {
			elements = new List<Elements>();
			json['elements'].forEach((v) {
				elements.add(new Elements.fromJson(v));
			});
		}
		firstPage = json['firstPage'];
		lastPage = json['lastPage'];
		lastPageNumber = json['lastPageNumber'];
		nextPage = json['nextPage'];
		pageSize = json['pageSize'];
		previousPage = json['previousPage'];
		thisPageFirstElementNumber = json['thisPageFirstElementNumber'];
		thisPageLastElementNumber = json['thisPageLastElementNumber'];
		totalElements = json['totalElements'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['curPage'] = this.curPage;
		if (this.elements != null) {
			data['elements'] = this.elements.map((v) => v.toJson()).toList();
		}
		data['firstPage'] = this.firstPage;
		data['lastPage'] = this.lastPage;
		data['lastPageNumber'] = this.lastPageNumber;
		data['nextPage'] = this.nextPage;
		data['pageSize'] = this.pageSize;
		data['previousPage'] = this.previousPage;
		data['thisPageFirstElementNumber'] = this.thisPageFirstElementNumber;
		data['thisPageLastElementNumber'] = this.thisPageLastElementNumber;
		data['totalElements'] = this.totalElements;
		return data;
	}
}

class Elements {
	String activityAddr;
	int actualNum;
	int area;
	String areaName;
	String autoDayTime;
	String cancelStatus;
	int checkin;
	int city;
	String cityName;
	String companyName;
	String contactInfo;
	String contactMobile;
	String contactUser;
	int controlUserCount;
	int createOn;
	String createOnStr;
	String emceeRobots;
	int endTime;
	String endTimeStr;
	String eoUrl;
	int estimateNum;
	var expectPrice;
	int feeType;
	int feeTypeBak;
	String feeTypeBakName;
	String feeTypeName;
	int flag;
	int flagReason;
	String flagReasonName;
	String flagStatus;
	int followStatus;
	var foodIncome;
	int foodUserCount;
	int fromPlat;
	String fromPlatName;
	int hostUserId;
	String hostUserName;
	String infos;
	String invBgPic;
	bool invEnable;
	String invPicTitle;
	String invQrCode;
	String invUrl;
	int isApplyPoints;
	int isImportant;
	String isPay;
	int isVzh;
	String isVzhStatus;
	String mark;
	String meetingAddress;
	int meetingAddressId;
	String meetingIcon;
	int meetingId;
	var meetingIncome;
	String meetingIntro;
	String meetingName;
	String meetingNoticeList;
	String meetingStatus;
	String meetingTypeName;
	int minNum;
	int mtlCount;
	String mtlList;
	var otherPrice;
	String passed;
	String perfectStatus;
	int point;
	String pointRemark;
	int pointStatus;
	String pointStatusName;
	String preTime;
	String preTimeStr;
	int province;
	String provinceName;
	int publishFlag;
	String robotBags;
	var roomIncome;
	int roomNum;
	var roomPrice;
	int saleUserId;
	String saleUserName;
	String salesUserMobile;
	String serialNumber;
	var serveMoney;
	String serviceBagStr;
	String serviceBags;
	String signInQrCode;
	String signUpMsg;
	int smsNum;
	String sponsorName;
	var startTime;
	String startTimeStr;
	int status;
	int systemId;
	String systemName;
	String templateCode;
	String templateUrl;
	int ticketCount;
	int total;
	int type;
	String typeName;
	int unreadNum;
	String userDynamicList;
	String usherRobots;
	int verified;
	String vipGuestList;
	String vipReceiveUser;
	String vvBgPic;
	String vvCount;
	bool vvGroupEnable;
	String vvGroupQrCode;
	String vvGroupUrl;
	String vvPicTitle;
	String vzhMeetingName;
	int vzhStatus;
	String weChatUrl;

	Elements(
			{this.activityAddr,
				this.actualNum,
				this.area,
				this.areaName,
				this.autoDayTime,
				this.cancelStatus,
				this.checkin,
				this.city,
				this.cityName,
				this.companyName,
				this.contactInfo,
				this.contactMobile,
				this.contactUser,
				this.controlUserCount,
				this.createOn,
				this.createOnStr,
				this.emceeRobots,
				this.endTime,
				this.endTimeStr,
				this.eoUrl,
				this.estimateNum,
				this.expectPrice,
				this.feeType,
				this.feeTypeBak,
				this.feeTypeBakName,
				this.feeTypeName,
				this.flag,
				this.flagReason,
				this.flagReasonName,
				this.flagStatus,
				this.followStatus,
				this.foodIncome,
				this.foodUserCount,
				this.fromPlat,
				this.fromPlatName,
				this.hostUserId,
				this.hostUserName,
				this.infos,
				this.invBgPic,
				this.invEnable,
				this.invPicTitle,
				this.invQrCode,
				this.invUrl,
				this.isApplyPoints,
				this.isImportant,
				this.isPay,
				this.isVzh,
				this.isVzhStatus,
				this.mark,
				this.meetingAddress,
				this.meetingAddressId,
				this.meetingIcon,
				this.meetingId,
				this.meetingIncome,
				this.meetingIntro,
				this.meetingName,
				this.meetingNoticeList,
				this.meetingStatus,
				this.meetingTypeName,
				this.minNum,
				this.mtlCount,
				this.mtlList,
				this.otherPrice,
				this.passed,
				this.perfectStatus,
				this.point,
				this.pointRemark,
				this.pointStatus,
				this.pointStatusName,
				this.preTime,
				this.preTimeStr,
				this.province,
				this.provinceName,
				this.publishFlag,
				this.robotBags,
				this.roomIncome,
				this.roomNum,
				this.roomPrice,
				this.saleUserId,
				this.saleUserName,
				this.salesUserMobile,
				this.serialNumber,
				this.serveMoney,
				this.serviceBagStr,
				this.serviceBags,
				this.signInQrCode,
				this.signUpMsg,
				this.smsNum,
				this.sponsorName,
				this.startTime,
				this.startTimeStr,
				this.status,
				this.systemId,
				this.systemName,
				this.templateCode,
				this.templateUrl,
				this.ticketCount,
				this.total,
				this.type,
				this.typeName,
				this.unreadNum,
				this.userDynamicList,
				this.usherRobots,
				this.verified,
				this.vipGuestList,
				this.vipReceiveUser,
				this.vvBgPic,
				this.vvCount,
				this.vvGroupEnable,
				this.vvGroupQrCode,
				this.vvGroupUrl,
				this.vvPicTitle,
				this.vzhMeetingName,
				this.vzhStatus,
				this.weChatUrl});

	Elements.fromJson(Map<String, dynamic> json) {
		activityAddr = json['activityAddr'];
		actualNum = json['actualNum'];
		area = json['area'];
		areaName = json['areaName'];
		autoDayTime = json['autoDayTime'];
		cancelStatus = json['cancelStatus'];
		checkin = json['checkin'];
		city = json['city'];
		cityName = json['cityName'];
		companyName = json['companyName'];
		contactInfo = json['contactInfo'];
		contactMobile = json['contactMobile'];
		contactUser = json['contactUser'];
		controlUserCount = json['controlUserCount'];
		createOn = json['createOn'];
		createOnStr = json['createOnStr'];
		emceeRobots = json['emceeRobots'];
		endTime = json['endTime'];
		endTimeStr = json['endTimeStr'];
		eoUrl = json['eoUrl'];
		estimateNum = json['estimateNum'];
		expectPrice = json['expectPrice'];
		feeType = json['feeType'];
		feeTypeBak = json['feeTypeBak'];
		feeTypeBakName = json['feeTypeBakName'];
		feeTypeName = json['feeTypeName'];
		flag = json['flag'];
		flagReason = json['flagReason'];
		flagReasonName = json['flagReasonName'];
		flagStatus = json['flagStatus'];
		followStatus = json['followStatus'];
		foodIncome = json['foodIncome'];
		foodUserCount = json['foodUserCount'];
		fromPlat = json['fromPlat'];
		fromPlatName = json['fromPlatName'];
		hostUserId = json['hostUserId'];
		hostUserName = json['hostUserName'];
		infos = json['infos'];
		invBgPic = json['invBgPic'];
		invEnable = json['invEnable'];
		invPicTitle = json['invPicTitle'];
		invQrCode = json['invQrCode'];
		invUrl = json['invUrl'];
		isApplyPoints = json['isApplyPoints'];
		isImportant = json['isImportant'];
		isPay = json['isPay'];
		isVzh = json['isVzh'];
		isVzhStatus = json['isVzhStatus'];
		mark = json['mark'];
		meetingAddress = json['meetingAddress'];
		meetingAddressId = json['meetingAddressId'];
		meetingIcon = json['meetingIcon'];
		meetingId = json['meetingId'];
		meetingIncome = json['meetingIncome'];
		meetingIntro = json['meetingIntro'];
		meetingName = json['meetingName'];
		meetingNoticeList = json['meetingNoticeList'];
		meetingStatus = json['meetingStatus'];
		meetingTypeName = json['meetingTypeName'];
		minNum = json['minNum'];
		mtlCount = json['mtlCount'];
		mtlList = json['mtlList'];
		otherPrice = json['otherPrice'];
		passed = json['passed'];
		perfectStatus = json['perfectStatus'];
		point = json['point'];
		pointRemark = json['pointRemark'];
		pointStatus = json['pointStatus'];
		pointStatusName = json['pointStatusName'];
		preTime = json['preTime'];
		preTimeStr = json['preTimeStr'];
		province = json['province'];
		provinceName = json['provinceName'];
		publishFlag = json['publishFlag'];
		robotBags = json['robotBags'];
		roomIncome = json['roomIncome'];
		roomNum = json['roomNum'];
		roomPrice = json['roomPrice'];
		saleUserId = json['saleUserId'];
		saleUserName = json['saleUserName'];
		salesUserMobile = json['salesUserMobile'];
		serialNumber = json['serialNumber'];
		serveMoney = json['serveMoney'];
		serviceBagStr = json['serviceBagStr'];
		serviceBags = json['serviceBags'];
		signInQrCode = json['signInQrCode'];
		signUpMsg = json['signUpMsg'];
		smsNum = json['smsNum'];
		sponsorName = json['sponsorName'];
		startTime = json['startTime'];
		startTimeStr = json['startTimeStr'];
		status = json['status'];
		systemId = json['systemId'];
		systemName = json['systemName'];
		templateCode = json['templateCode'];
		templateUrl = json['templateUrl'];
		ticketCount = json['ticketCount'];
		total = json['total'];
		type = json['type'];
		typeName = json['typeName'];
		unreadNum = json['unreadNum'];
		userDynamicList = json['userDynamicList'];
		usherRobots = json['usherRobots'];
		verified = json['verified'];
		vipGuestList = json['vipGuestList'];
		vipReceiveUser = json['vipReceiveUser'];
		vvBgPic = json['vvBgPic'];
		vvCount = json['vvCount'];
		vvGroupEnable = json['vvGroupEnable'];
		vvGroupQrCode = json['vvGroupQrCode'];
		vvGroupUrl = json['vvGroupUrl'];
		vvPicTitle = json['vvPicTitle'];
		vzhMeetingName = json['vzhMeetingName'];
		vzhStatus = json['vzhStatus'];
		weChatUrl = json['weChatUrl'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['activityAddr'] = this.activityAddr;
		data['actualNum'] = this.actualNum;
		data['area'] = this.area;
		data['areaName'] = this.areaName;
		data['autoDayTime'] = this.autoDayTime;
		data['cancelStatus'] = this.cancelStatus;
		data['checkin'] = this.checkin;
		data['city'] = this.city;
		data['cityName'] = this.cityName;
		data['companyName'] = this.companyName;
		data['contactInfo'] = this.contactInfo;
		data['contactMobile'] = this.contactMobile;
		data['contactUser'] = this.contactUser;
		data['controlUserCount'] = this.controlUserCount;
		data['createOn'] = this.createOn;
		data['createOnStr'] = this.createOnStr;
		data['emceeRobots'] = this.emceeRobots;
		data['endTime'] = this.endTime;
		data['endTimeStr'] = this.endTimeStr;
		data['eoUrl'] = this.eoUrl;
		data['estimateNum'] = this.estimateNum;
		data['expectPrice'] = this.expectPrice;
		data['feeType'] = this.feeType;
		data['feeTypeBak'] = this.feeTypeBak;
		data['feeTypeBakName'] = this.feeTypeBakName;
		data['feeTypeName'] = this.feeTypeName;
		data['flag'] = this.flag;
		data['flagReason'] = this.flagReason;
		data['flagReasonName'] = this.flagReasonName;
		data['flagStatus'] = this.flagStatus;
		data['followStatus'] = this.followStatus;
		data['foodIncome'] = this.foodIncome;
		data['foodUserCount'] = this.foodUserCount;
		data['fromPlat'] = this.fromPlat;
		data['fromPlatName'] = this.fromPlatName;
		data['hostUserId'] = this.hostUserId;
		data['hostUserName'] = this.hostUserName;
		data['infos'] = this.infos;
		data['invBgPic'] = this.invBgPic;
		data['invEnable'] = this.invEnable;
		data['invPicTitle'] = this.invPicTitle;
		data['invQrCode'] = this.invQrCode;
		data['invUrl'] = this.invUrl;
		data['isApplyPoints'] = this.isApplyPoints;
		data['isImportant'] = this.isImportant;
		data['isPay'] = this.isPay;
		data['isVzh'] = this.isVzh;
		data['isVzhStatus'] = this.isVzhStatus;
		data['mark'] = this.mark;
		data['meetingAddress'] = this.meetingAddress;
		data['meetingAddressId'] = this.meetingAddressId;
		data['meetingIcon'] = this.meetingIcon;
		data['meetingId'] = this.meetingId;
		data['meetingIncome'] = this.meetingIncome;
		data['meetingIntro'] = this.meetingIntro;
		data['meetingName'] = this.meetingName;
		data['meetingNoticeList'] = this.meetingNoticeList;
		data['meetingStatus'] = this.meetingStatus;
		data['meetingTypeName'] = this.meetingTypeName;
		data['minNum'] = this.minNum;
		data['mtlCount'] = this.mtlCount;
		data['mtlList'] = this.mtlList;
		data['otherPrice'] = this.otherPrice;
		data['passed'] = this.passed;
		data['perfectStatus'] = this.perfectStatus;
		data['point'] = this.point;
		data['pointRemark'] = this.pointRemark;
		data['pointStatus'] = this.pointStatus;
		data['pointStatusName'] = this.pointStatusName;
		data['preTime'] = this.preTime;
		data['preTimeStr'] = this.preTimeStr;
		data['province'] = this.province;
		data['provinceName'] = this.provinceName;
		data['publishFlag'] = this.publishFlag;
		data['robotBags'] = this.robotBags;
		data['roomIncome'] = this.roomIncome;
		data['roomNum'] = this.roomNum;
		data['roomPrice'] = this.roomPrice;
		data['saleUserId'] = this.saleUserId;
		data['saleUserName'] = this.saleUserName;
		data['salesUserMobile'] = this.salesUserMobile;
		data['serialNumber'] = this.serialNumber;
		data['serveMoney'] = this.serveMoney;
		data['serviceBagStr'] = this.serviceBagStr;
		data['serviceBags'] = this.serviceBags;
		data['signInQrCode'] = this.signInQrCode;
		data['signUpMsg'] = this.signUpMsg;
		data['smsNum'] = this.smsNum;
		data['sponsorName'] = this.sponsorName;
		data['startTime'] = this.startTime;
		data['startTimeStr'] = this.startTimeStr;
		data['status'] = this.status;
		data['systemId'] = this.systemId;
		data['systemName'] = this.systemName;
		data['templateCode'] = this.templateCode;
		data['templateUrl'] = this.templateUrl;
		data['ticketCount'] = this.ticketCount;
		data['total'] = this.total;
		data['type'] = this.type;
		data['typeName'] = this.typeName;
		data['unreadNum'] = this.unreadNum;
		data['userDynamicList'] = this.userDynamicList;
		data['usherRobots'] = this.usherRobots;
		data['verified'] = this.verified;
		data['vipGuestList'] = this.vipGuestList;
		data['vipReceiveUser'] = this.vipReceiveUser;
		data['vvBgPic'] = this.vvBgPic;
		data['vvCount'] = this.vvCount;
		data['vvGroupEnable'] = this.vvGroupEnable;
		data['vvGroupQrCode'] = this.vvGroupQrCode;
		data['vvGroupUrl'] = this.vvGroupUrl;
		data['vvPicTitle'] = this.vvPicTitle;
		data['vzhMeetingName'] = this.vzhMeetingName;
		data['vzhStatus'] = this.vzhStatus;
		data['weChatUrl'] = this.weChatUrl;
		return data;
	}
}