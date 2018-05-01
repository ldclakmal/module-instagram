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

documentation { Object for Instagram endpoint.
    F{{instagramConnector}} Reference to InstagramConnector type
}
public type Client object {

    public {
        InstagramConnector instagramConnector = new;
    }

    documentation { Initialize Instagram endpoint
        P{{instagramConfig}} Instagram configuraion
    }
    public function init(InstagramConfiguration instagramConfig);

    documentation { Initialize Instagram endpoint
        R{{}} The Instagram connector object
    }
    public function getCallerActions() returns InstagramConnector;

};

documentation {
    F{{accessToken}} Access token of the account
    F{{clientConfig}} The http client endpoint
}
public type InstagramConfiguration {
    string accessToken;
    http:ClientEndpointConfig clientConfig;
};

public function Client::init(InstagramConfiguration instagramConfig) {
    http:AuthConfig? auth = instagramConfig.clientConfig.auth;
    match auth {
        http:AuthConfig authConfig => {
            self.instagramConnector.accessToken = authConfig.accessToken;
        }
        () => {}
    }
    self.instagramConnector.client.init(instagramConfig.clientConfig);
}

public function Client::getCallerActions() returns InstagramConnector {
    return self.instagramConnector;
}
