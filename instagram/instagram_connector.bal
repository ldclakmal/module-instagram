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
import ballerina/mime;

documentation {Object to initialize the connection with Instagram.
    F{{accessToken}} Access token of the account
    F{{client}} Http client endpoint for api
}
public type InstagramConnector object {

    public {
        string accessToken;
        http:Client client;
    }

    documentation { Return account details
        R{{}} If success, returns account object with basic details, else returns `InstagramError` object
    }
    public function getAccountDetails() returns (Account|InstagramError);
};

public function InstagramConnector::getAccountDetails() returns (Account|InstagramError) {
    endpoint http:Client httpClient = self.client;
    string requestPath = USERS_SELF_API + self.accessToken;
    var response = httpClient->get(requestPath);
    json jsonResponse = check parseResponseToJson(response);
    return mapJsonToAccount(jsonResponse);
}