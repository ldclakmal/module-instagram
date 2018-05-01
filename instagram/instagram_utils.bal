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

documentation { Check for HTTP response and if response is success parse HTTP response object into json and parse error otherwise
    P{{response}} Http response or HTTP connector error with network related errors
    R{{}} Json payload or `InstagramError` if anything wrong happen when HTTP client invocation or parsing response to json
}
function parseResponseToJson(http:Response|error response) returns (json|InstagramError) {
    json result = {};
    match response {
        http:Response httpResponse => {
            var jsonPayload = httpResponse.getJsonPayload();
            match jsonPayload {
                json payload => {
                    if (httpResponse.statusCode != http:OK_200 && httpResponse.statusCode != http:CREATED_201) {
                        InstagramError instagramError = {message:httpResponse.statusCode + WHITE_SPACE
                            + httpResponse.reasonPhrase + DASH_WITH_WHITE_SPACES_SYMBOL + payload.toString()};
                        return instagramError;
                    }
                    return payload;
                }
                error err => {
                    InstagramError instagramError = {message:"Error occurred when parsing response to json."};
                    instagramError.cause = err.cause;
                    return instagramError;
                }
            }
        }
        error err => {
            InstagramError instagramError = {message:"Error occurred when HTTP client invocation."};
            instagramError.cause = err.cause;
            return instagramError;
        }
    }
}