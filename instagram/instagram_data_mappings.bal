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

function mapJsonToAccount(json jsonPayload) returns Account {
    Account account;
    account.id = jsonPayload.data.id.toString();
    account.username = jsonPayload.data.username.toString();
    account.profilePicture = jsonPayload.data.profile_picture.toString();
    account.fullName = jsonPayload.data.full_name.toString();
    account.bio = jsonPayload.data.bio.toString();
    account.website = jsonPayload.data.website.toString();
    account.isBusiness = <boolean>jsonPayload.data.is_business.toString();
    account.mediaCount = check <int>jsonPayload.data.counts.media.toString();
    account.followsCount = check <int>jsonPayload.data.counts.follows;
    account.follwedByCount = check <int>jsonPayload.data.counts.followed_by;
    return account;
}