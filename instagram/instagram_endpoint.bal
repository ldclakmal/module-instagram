import ballerina/http;

# Object for Instagram endpoint.
#
# + instagramConnector - Reference to InstagramConnector type
public type Client object {

    public InstagramConnector instagramConnector = new;

    # Initialize Instagram endpoint.
    #
    # + instagramConfig - Instagram configuraion
    public function init(InstagramConfiguration instagramConfig);

    # Initialize Instagram endpoint.
    #
    # + return - The Instagram connector object
    public function getCallerActions() returns InstagramConnector;
};

# Object for instagram configuration.
#
# + accessToken - Access token of the account
# + clientConfig - The http client endpoint
public type InstagramConfiguration record {
    string accessToken;
    http:ClientEndpointConfig clientConfig;
};

function Client::init(InstagramConfiguration instagramConfig) {
    http:AuthConfig? auth = instagramConfig.clientConfig.auth;
    match auth {
        http:AuthConfig authConfig => {
            self.instagramConnector.accessToken = authConfig.accessToken;
        }
        () => {}
    }
    instagramConfig.clientConfig.url = INSTAGRAM_API_URL;
    self.instagramConnector.client.init(instagramConfig.clientConfig);
}

function Client::getCallerActions() returns InstagramConnector {
    return self.instagramConnector;
}
