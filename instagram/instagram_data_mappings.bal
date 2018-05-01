function mapJsonToAccount(json jsonPayload) returns Account {
    Account account;
    account.id = jsonPayload.data.id.toString();
    account.username = jsonPayload.data.username.toString();
    account.profilePicture = jsonPayload.data.profile_picture.toString();
    account.fullName = jsonPayload.data.full_name.toString();
    account.bio = jsonPayload.data.bio.toString();
    account.website = jsonPayload.data.website.toString();
    account.isBusiness = <boolean>jsonPayload.data.is_business.toString();
    account.mediaCount = check <int>jsonPayload.data.counts.media.toString();
    account.followsCount = check <int>jsonPayload.data.counts.follows;
    account.follwedByCount = check <int>jsonPayload.data.counts.followed_by;
    return account;
}