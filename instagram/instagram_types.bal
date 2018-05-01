// Copyright (c) 2018, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.package instagram;

import ballerina/http;

documentation {
    F{{id}} Unique identifier of the account
    F{{username}} The user name of the account
    F{{profilePicture}} The URL to profile picture of the account
    F{{fullName}} The full name of the account
    F{{bio}} The bio data description of the account
    F{{website}} The website of the account
    F{{isBusiness}} The flag saying is a business account or personal account
    F{{mediaCount}} No. of media have been posted from the account
    F{{followsCount}} No. of followings of the account
    F{{follwedByCount}} No. of followers of the account
}
public type Account {
    string id;
    string username;
    string profilePicture;
    string fullName;
    string bio;
    string website;
    boolean isBusiness;
    int mediaCount;
    int followsCount;
    int follwedByCount;
};

documentation {
    F{{message}} A custom message about the error
    F{{cause}} Error object reffered to the occurred error
}
public type InstagramError {
    string message;
    error? cause;
};
