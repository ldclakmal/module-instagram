# Instagram Connector

The Instagram connector allows you to get users, posts details, search media, comments, tags and get information about
locations through the Instagram REST API. It handles OAuth 2.0 authentication.

## Compatibility

| Ballerina Language Version  | Instagram API Version |
|:---------------------------:|:---------------------:|
| 0.970.0                     | v1                    |

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
	    import wso2/instagram;

	    function main (string... args) {
            endpoint instagram:Client instagramClient {
                clientConfig: {
                    auth: {
                        scheme: "oauth",
                        accessToken: config:getAsString("ACCESS_TOKEN")
                    }
                }
            };

		var details = instagramClient -> getAccountDetails();
		match details {
		    Account account => io:println(account);
		    InstagramError instagramError => test:assertFail(msg = instagramError.message);
		}
	   }
	```