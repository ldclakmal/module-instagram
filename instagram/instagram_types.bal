import ballerina/http;

documentation {
    F{{id}} Unique identifier of the account
    F{{username}} The user name of the account
    F{{profilePicture}} The URL to profile picture of the account
    F{{fullName}} The full name of the account
    F{{bio}} The bio data description of the account
    F{{website}} The website of the account
    F{{isBusiness}} The flag saying is a business account or personal account
    F{{mediaCount}} No. of media have been posted from the account
    F{{followsCount}} No. of followings of the account
    F{{follwedByCount}} No. of followers of the account
}
public type Account {
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

documentation {
    F{{message}} A custom message about the error
    F{{cause}} Error object reffered to the occurred error
}
public type InstagramError {
    string message;
    error? cause;
};
