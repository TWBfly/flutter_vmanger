class LoginEntity {
	int code;
	LoginData data;
	String message;

	LoginEntity({this.code, this.data, this.message});

	LoginEntity.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
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

class LoginData {
	String experience;
	int addressId;
	int points;
	String userSettingList;
	String password;
	String systemName;
	String starName;
	String registrationId;
	int issuedPoints;
	String iconUrl;
	int id;
	int pointStatus;
	int validityTime;
	String nickName;
	int isAdmin;
	String depName;
	String businessCard;
	int growthValue;
	String deviceToken;
	int areaCode;
	int fromPlat;
	String roleName;
	String motto;
	String streetInfoName;
	int depId;
	int refereeUserId;
	int userType;
	String pointStatusName;
	int status;
	String birthday;
	String systemAddress;
	int cityCode;
	String openId;
	String pointProportion;
	int recommendNum;
	List<LoginDataUserrolelist> userRoleList;
	String positionName;
	String characters;
	int userDisplay;
	int isApprover;
	int userLevel;
	String cityName;
	int updateOn;
	String email;
	int systemId;
	int exchangePoints;
	int provinceCode;
	int roleId;
	int userSource;
	int sex;
	String mobile;
	int isVip;
	String token;
	String tokenRy;
	String realName;
	String userLevelName;
	int positionId;
	String systemShortName;
	int examinePoints;
	String addressName;
	int createOn;
	int isPayed;

	LoginData({this.experience, this.addressId, this.points, this.userSettingList, this.password, this.systemName, this.starName, this.registrationId, this.issuedPoints, this.iconUrl, this.id, this.pointStatus, this.validityTime, this.nickName, this.isAdmin, this.depName, this.businessCard, this.growthValue, this.deviceToken, this.areaCode, this.fromPlat, this.roleName, this.motto, this.streetInfoName, this.depId, this.refereeUserId, this.userType, this.pointStatusName, this.status, this.birthday, this.systemAddress, this.cityCode, this.openId, this.pointProportion, this.recommendNum, this.userRoleList, this.positionName, this.characters, this.userDisplay, this.isApprover, this.userLevel, this.cityName, this.updateOn, this.email, this.systemId, this.exchangePoints, this.provinceCode, this.roleId, this.userSource, this.sex, this.mobile, this.isVip, this.token, this.tokenRy, this.realName, this.userLevelName, this.positionId, this.systemShortName, this.examinePoints, this.addressName, this.createOn, this.isPayed});

	LoginData.fromJson(Map<String, dynamic> json) {
		experience = json['experience'];
		addressId = json['addressId'];
		points = json['points'];
		userSettingList = json['userSettingList'];
		password = json['password'];
		systemName = json['systemName'];
		starName = json['starName'];
		registrationId = json['registrationId'];
		issuedPoints = json['issuedPoints'];
		iconUrl = json['iconUrl'];
		id = json['id'];
		pointStatus = json['pointStatus'];
		validityTime = json['validityTime'];
		nickName = json['nickName'];
		isAdmin = json['isAdmin'];
		depName = json['depName'];
		businessCard = json['businessCard'];
		growthValue = json['growthValue'];
		deviceToken = json['deviceToken'];
		areaCode = json['areaCode'];
		fromPlat = json['fromPlat'];
		roleName = json['roleName'];
		motto = json['motto'];
		streetInfoName = json['streetInfoName'];
		depId = json['depId'];
		refereeUserId = json['refereeUserId'];
		userType = json['userType'];
		pointStatusName = json['pointStatusName'];
		status = json['status'];
		birthday = json['birthday'];
		systemAddress = json['systemAddress'];
		cityCode = json['cityCode'];
		openId = json['openId'];
		pointProportion = json['pointProportion'];
		recommendNum = json['recommendNum'];
		if (json['userRoleList'] != null) {
			userRoleList = new List<LoginDataUserrolelist>();(json['userRoleList'] as List).forEach((v) { userRoleList.add(new LoginDataUserrolelist.fromJson(v)); });
		}
		positionName = json['positionName'];
		characters = json['characters'];
		userDisplay = json['userDisplay'];
		isApprover = json['isApprover'];
		userLevel = json['userLevel'];
		cityName = json['cityName'];
		updateOn = json['updateOn'];
		email = json['email'];
		systemId = json['systemId'];
		exchangePoints = json['exchangePoints'];
		provinceCode = json['provinceCode'];
		roleId = json['roleId'];
		userSource = json['userSource'];
		sex = json['sex'];
		mobile = json['mobile'];
		isVip = json['isVip'];
		token = json['token'];
		tokenRy = json['tokenRy'];
		realName = json['realName'];
		userLevelName = json['userLevelName'];
		positionId = json['positionId'];
		systemShortName = json['systemShortName'];
		examinePoints = json['examinePoints'];
		addressName = json['addressName'];
		createOn = json['createOn'];
		isPayed = json['isPayed'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['experience'] = this.experience;
		data['addressId'] = this.addressId;
		data['points'] = this.points;
		data['userSettingList'] = this.userSettingList;
		data['password'] = this.password;
		data['systemName'] = this.systemName;
		data['starName'] = this.starName;
		data['registrationId'] = this.registrationId;
		data['issuedPoints'] = this.issuedPoints;
		data['iconUrl'] = this.iconUrl;
		data['id'] = this.id;
		data['pointStatus'] = this.pointStatus;
		data['validityTime'] = this.validityTime;
		data['nickName'] = this.nickName;
		data['isAdmin'] = this.isAdmin;
		data['depName'] = this.depName;
		data['businessCard'] = this.businessCard;
		data['growthValue'] = this.growthValue;
		data['deviceToken'] = this.deviceToken;
		data['areaCode'] = this.areaCode;
		data['fromPlat'] = this.fromPlat;
		data['roleName'] = this.roleName;
		data['motto'] = this.motto;
		data['streetInfoName'] = this.streetInfoName;
		data['depId'] = this.depId;
		data['refereeUserId'] = this.refereeUserId;
		data['userType'] = this.userType;
		data['pointStatusName'] = this.pointStatusName;
		data['status'] = this.status;
		data['birthday'] = this.birthday;
		data['systemAddress'] = this.systemAddress;
		data['cityCode'] = this.cityCode;
		data['openId'] = this.openId;
		data['pointProportion'] = this.pointProportion;
		data['recommendNum'] = this.recommendNum;
		if (this.userRoleList != null) {
      data['userRoleList'] =  this.userRoleList.map((v) => v.toJson()).toList();
    }
		data['positionName'] = this.positionName;
		data['characters'] = this.characters;
		data['userDisplay'] = this.userDisplay;
		data['isApprover'] = this.isApprover;
		data['userLevel'] = this.userLevel;
		data['cityName'] = this.cityName;
		data['updateOn'] = this.updateOn;
		data['email'] = this.email;
		data['systemId'] = this.systemId;
		data['exchangePoints'] = this.exchangePoints;
		data['provinceCode'] = this.provinceCode;
		data['roleId'] = this.roleId;
		data['userSource'] = this.userSource;
		data['sex'] = this.sex;
		data['mobile'] = this.mobile;
		data['isVip'] = this.isVip;
		data['token'] = this.token;
		data['tokenRy'] = this.tokenRy;
		data['realName'] = this.realName;
		data['userLevelName'] = this.userLevelName;
		data['positionId'] = this.positionId;
		data['systemShortName'] = this.systemShortName;
		data['examinePoints'] = this.examinePoints;
		data['addressName'] = this.addressName;
		data['createOn'] = this.createOn;
		data['isPayed'] = this.isPayed;
		return data;
	}

	@override
	String toString() {
		return 'LoginData{experience: $experience, addressId: $addressId, points: $points, userSettingList: $userSettingList, password: $password, systemName: $systemName, starName: $starName, registrationId: $registrationId, issuedPoints: $issuedPoints, iconUrl: $iconUrl, id: $id, pointStatus: $pointStatus, validityTime: $validityTime, nickName: $nickName, isAdmin: $isAdmin, depName: $depName, businessCard: $businessCard, growthValue: $growthValue, deviceToken: $deviceToken, areaCode: $areaCode, fromPlat: $fromPlat, roleName: $roleName, motto: $motto, streetInfoName: $streetInfoName, depId: $depId, refereeUserId: $refereeUserId, userType: $userType, pointStatusName: $pointStatusName, status: $status, birthday: $birthday, systemAddress: $systemAddress, cityCode: $cityCode, openId: $openId, pointProportion: $pointProportion, recommendNum: $recommendNum, userRoleList: $userRoleList, positionName: $positionName, characters: $characters, userDisplay: $userDisplay, isApprover: $isApprover, userLevel: $userLevel, cityName: $cityName, updateOn: $updateOn, email: $email, systemId: $systemId, exchangePoints: $exchangePoints, provinceCode: $provinceCode, roleId: $roleId, userSource: $userSource, sex: $sex, mobile: $mobile, isVip: $isVip, token: $token, tokenRy: $tokenRy, realName: $realName, userLevelName: $userLevelName, positionId: $positionId, systemShortName: $systemShortName, examinePoints: $examinePoints, addressName: $addressName, createOn: $createOn, isPayed: $isPayed}';
	}

}

class LoginDataUserrolelist {
	int systemId;
	int roleId;
	String roleName;
	int createOn;
	int id;
	int updateOn;
	int userId;
	int status;

	LoginDataUserrolelist({this.systemId, this.roleId, this.roleName, this.createOn, this.id, this.updateOn, this.userId, this.status});

	LoginDataUserrolelist.fromJson(Map<String, dynamic> json) {
		systemId = json['systemId'];
		roleId = json['roleId'];
		roleName = json['roleName'];
		createOn = json['createOn'];
		id = json['id'];
		updateOn = json['updateOn'];
		userId = json['userId'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['systemId'] = this.systemId;
		data['roleId'] = this.roleId;
		data['roleName'] = this.roleName;
		data['createOn'] = this.createOn;
		data['id'] = this.id;
		data['updateOn'] = this.updateOn;
		data['userId'] = this.userId;
		data['status'] = this.status;
		return data;
	}

	@override
	String toString() {
		return 'LoginDataUserrolelist{systemId: $systemId, roleId: $roleId, roleName: $roleName, createOn: $createOn, id: $id, updateOn: $updateOn, userId: $userId, status: $status}';
	}

}
