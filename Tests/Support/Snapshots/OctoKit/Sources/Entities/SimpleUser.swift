// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct SimpleUser: Codable {
    public var name: String?
    public var email: String?
    /// Example: "octocat"
    public var login: String
    public var id: Int
    /// Example: "MDQ6VXNlcjE="
    public var nodeID: String
    /// Example: "https://github.com/images/error/octocat_happy.gif"
    public var avatarURL: URL
    /// Example: "41d064eb2195891e12d0413f63227ea7"
    public var gravatarID: String?
    /// Example: "https://api.github.com/users/octocat"
    public var url: URL
    /// Example: "https://github.com/octocat"
    public var htmlURL: URL
    /// Example: "https://api.github.com/users/octocat/followers"
    public var followersURL: URL
    /// Example: "https://api.github.com/users/octocat/following{/other_user}"
    public var followingURL: String
    /// Example: "https://api.github.com/users/octocat/gists{/gist_id}"
    public var gistsURL: String
    /// Example: "https://api.github.com/users/octocat/starred{/owner}{/repo}"
    public var starredURL: String
    /// Example: "https://api.github.com/users/octocat/subscriptions"
    public var subscriptionsURL: URL
    /// Example: "https://api.github.com/users/octocat/orgs"
    public var organizationsURL: URL
    /// Example: "https://api.github.com/users/octocat/repos"
    public var reposURL: URL
    /// Example: "https://api.github.com/users/octocat/events{/privacy}"
    public var eventsURL: String
    /// Example: "https://api.github.com/users/octocat/received_events"
    public var receivedEventsURL: URL
    /// Example: "User"
    public var type: String
    public var isSiteAdmin: Bool
    /// Example: "2020-07-09T00:17:55Z"
    public var starredAt: String?

    public init(name: String? = nil, email: String? = nil, login: String, id: Int, nodeID: String, avatarURL: URL, gravatarID: String? = nil, url: URL, htmlURL: URL, followersURL: URL, followingURL: String, gistsURL: String, starredURL: String, subscriptionsURL: URL, organizationsURL: URL, reposURL: URL, eventsURL: String, receivedEventsURL: URL, type: String, isSiteAdmin: Bool, starredAt: String? = nil) {
        self.name = name
        self.email = email
        self.login = login
        self.id = id
        self.nodeID = nodeID
        self.avatarURL = avatarURL
        self.gravatarID = gravatarID
        self.url = url
        self.htmlURL = htmlURL
        self.followersURL = followersURL
        self.followingURL = followingURL
        self.gistsURL = gistsURL
        self.starredURL = starredURL
        self.subscriptionsURL = subscriptionsURL
        self.organizationsURL = organizationsURL
        self.reposURL = reposURL
        self.eventsURL = eventsURL
        self.receivedEventsURL = receivedEventsURL
        self.type = type
        self.isSiteAdmin = isSiteAdmin
        self.starredAt = starredAt
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.name = try values.decodeIfPresent(String.self, forKey: "name")
        self.email = try values.decodeIfPresent(String.self, forKey: "email")
        self.login = try values.decode(String.self, forKey: "login")
        self.id = try values.decode(Int.self, forKey: "id")
        self.nodeID = try values.decode(String.self, forKey: "node_id")
        self.avatarURL = try values.decode(URL.self, forKey: "avatar_url")
        self.gravatarID = try values.decodeIfPresent(String.self, forKey: "gravatar_id")
        self.url = try values.decode(URL.self, forKey: "url")
        self.htmlURL = try values.decode(URL.self, forKey: "html_url")
        self.followersURL = try values.decode(URL.self, forKey: "followers_url")
        self.followingURL = try values.decode(String.self, forKey: "following_url")
        self.gistsURL = try values.decode(String.self, forKey: "gists_url")
        self.starredURL = try values.decode(String.self, forKey: "starred_url")
        self.subscriptionsURL = try values.decode(URL.self, forKey: "subscriptions_url")
        self.organizationsURL = try values.decode(URL.self, forKey: "organizations_url")
        self.reposURL = try values.decode(URL.self, forKey: "repos_url")
        self.eventsURL = try values.decode(String.self, forKey: "events_url")
        self.receivedEventsURL = try values.decode(URL.self, forKey: "received_events_url")
        self.type = try values.decode(String.self, forKey: "type")
        self.isSiteAdmin = try values.decode(Bool.self, forKey: "site_admin")
        self.starredAt = try values.decodeIfPresent(String.self, forKey: "starred_at")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(name, forKey: "name")
        try values.encodeIfPresent(email, forKey: "email")
        try values.encode(login, forKey: "login")
        try values.encode(id, forKey: "id")
        try values.encode(nodeID, forKey: "node_id")
        try values.encode(avatarURL, forKey: "avatar_url")
        try values.encodeIfPresent(gravatarID, forKey: "gravatar_id")
        try values.encode(url, forKey: "url")
        try values.encode(htmlURL, forKey: "html_url")
        try values.encode(followersURL, forKey: "followers_url")
        try values.encode(followingURL, forKey: "following_url")
        try values.encode(gistsURL, forKey: "gists_url")
        try values.encode(starredURL, forKey: "starred_url")
        try values.encode(subscriptionsURL, forKey: "subscriptions_url")
        try values.encode(organizationsURL, forKey: "organizations_url")
        try values.encode(reposURL, forKey: "repos_url")
        try values.encode(eventsURL, forKey: "events_url")
        try values.encode(receivedEventsURL, forKey: "received_events_url")
        try values.encode(type, forKey: "type")
        try values.encode(isSiteAdmin, forKey: "site_admin")
        try values.encodeIfPresent(starredAt, forKey: "starred_at")
    }
}
