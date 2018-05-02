Connects to Instagram from Ballerina.

# Package Overview

The Instagram connector allows you to get users, posts details, search media, comments, tags and get information about
locations through the Instagram REST API. It handles OAuth 2.0 authentication.

**User Operations**

The `chanakal/instagram` package contains operations to get the Instagram account details.

## Compatibility
|                          |    Version     |
|:------------------------:|:--------------:|
| Ballerina Language       | 0.970.0        |
| Instagram API            | v1             |

## Sample
First, import the `chanakal/instagram` package into the Ballerina project.
```ballerina
import chanakal/instagram;
```

**Obtaining Tokens to Run the Sample**

1. Visit [Instagram](https://www.instagram.com/developer/) and create a Instagram Developer Account.
2. Create a connected app and obtain the following credentials:
- Access Token

You can now enter the credentials in the Instagram endpoint configuration.
```ballerina
endpoint instagram:Client instagramEP {
   clientConfig:{
       auth:{
           scheme:"oauth",
           accessToken:"<your_access_token>"
       }
   }
};
```
The `getOwnerInfo` function returns the information about the owner of the access_token.
```ballerina
    var details = instagramClient->getOwnerInfo();
    match details {
        Account account => io:println(account);
        InstagramError instagramError => test:assertFail(msg = instagramError.message);
    }
```
The `getMostRecentMedia` function returns the most recent media published by the owner of the access_token.
```ballerina
    var details = instagramClient->getMostRecentMedia();
    match details {
        json response => io:println(response);
        InstagramError instagramError => test:assertFail(msg = instagramError.message);
    }
```