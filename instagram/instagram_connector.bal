import ballerina/http;
import ballerina/mime;

documentation {
    Object to initialize the connection with Instagram.

    F{{accessToken}} Access token of the account
    F{{client}} Http client endpoint for api
}
public type InstagramConnector object {

    public string accessToken;
    public http:Client client;

    documentation {
        Get information about the owner of the access_token.

        R{{}} If success, returns account object with basic details, else returns `InstagramError` object
    }
    public function getOwnerInfo() returns (Account|InstagramError);

    documentation {
        Get the most recent media published by the owner of the access_token.

        R{{}} If success, returns json object with details, else returns `InstagramError` object
    }
    public function getMostRecentMedia() returns (json|InstagramError);
};

function InstagramConnector::getOwnerInfo() returns (Account|InstagramError) {
    endpoint http:Client httpClient = self.client;
    string requestPath = USERS_SELF_API + self.accessToken;
    var response = httpClient->get(requestPath);
    json jsonResponse = check parseResponseToJson(response);
    return mapJsonToAccount(jsonResponse);
}

function InstagramConnector::getMostRecentMedia() returns (json|InstagramError) {
    endpoint http:Client httpClient = self.client;
    string requestPath = USERS_MEDIA_RECENT + self.accessToken;
    var response = httpClient->get(requestPath);
    json jsonResponse = check parseResponseToJson(response);
    return jsonResponse;
}