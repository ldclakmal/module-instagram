# Instagram Connector

The Instagram connector allows you to get users, posts details, search media, comments, tags and get information about
locations through the Instagram REST API. It handles OAuth 2.0 authentication.

## Compatibility

| Ballerina Language Version  | Instagram API Version |
|:---------------------------:|:---------------------:|
| 0.982.0                     | v1                    |

## Getting started

1.  Refer the [Getting Started](https://ballerina.io/learn/getting-started/) guide to download and install Ballerina.

2.  To use Instagram endpoint, you need to provide the following:

       - Access Token

3. Create a new Ballerina project by executing the following command.

	```shell
	   <PROJECT_ROOT_DIRECTORY>$ ballerina init
	```

4. Import the Instagram package to your Ballerina program as follows.

	```ballerina
	    import ballerina/http;
	    import ballerina/io;
	    import ballerina/test;
	    import ballerina/config;
	    import chanakal/instagram;

	    function main (string... args) {
            endpoint instagram:Client instagramClient {
                clientConfig: {
                    auth: {
                        scheme: http:OAUTH2,
                        accessToken: config:getAsString("ACCESS_TOKEN")
                    }
                }
            };

            var details = instagramClient -> getOwnerInfo();
            match details {
                instagram:Account account => io:println(account);
                instagram:InstagramError instagramError => test:assertFail(msg = instagramError.message);
            }
	    }
	```