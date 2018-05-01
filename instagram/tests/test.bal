import ballerina/io;
import ballerina/log;
import ballerina/test;
import ballerina/config;

endpoint Client instagramClient {
    clientConfig: {
        auth: {
            scheme: "oauth",
            accessToken: config:getAsString("ACCESS_TOKEN")
        }
    }
};

@test:Config
function testAccountDetails() {
    io:println("\n ---------------------------------------------------------------------------");
    log:printInfo("instagramClient -> getAccountDetails()");

    var details = instagramClient->getAccountDetails();
    match details {
        Account account => io:println(account);
        InstagramError instagramError => test:assertFail(msg = instagramError.message);
    }
}