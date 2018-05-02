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
function testOwnerInfo() {
    io:println("\n ---------------------------------------------------------------------------");
    log:printInfo("instagramClient -> getOwnerInfo()");

    var details = instagramClient->getOwnerInfo();
    match details {
        Account account => io:println(account);
        InstagramError instagramError => test:assertFail(msg = instagramError.message);
    }
}

@test:Config
function testMostRecentMedia() {
    io:println("\n ---------------------------------------------------------------------------");
    log:printInfo("instagramClient -> getMostRecentMedia()");

    var details = instagramClient->getMostRecentMedia();
    match details {
        json response => io:println(response);
        InstagramError instagramError => test:assertFail(msg = instagramError.message);
    }
}