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
