import ballerina/http;

# Record for Instagram account.
#
# + id - Unique identifier of the account
# + username - The user name of the account
# + profilePicture - The URL to profile picture of the account
# + fullName - The full name of the account
# + bio - The bio data description of the account
# + website - The website of the account
# + isBusiness - The flag saying is a business account or personal account
# + mediaCount - No. of media have been posted from the account
# + followsCount - No. of followings of the account
# + follwedByCount - No. of followers of the account
public type Account record {
    string id;
    string username;
    string profilePicture;
    string fullName;
    string bio;
    string website;
    boolean isBusiness;
    int mediaCount;
    int followsCount;
    int follwedByCount;
};

# Record for Instagram error.
#
# + message - A custom message about the error
# + cause - Error object reffered to the occurred error
public type InstagramError record {
    string message;
    error? cause;
};
