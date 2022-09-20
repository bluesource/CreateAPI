// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct APIOverview: Codable {
    /// Example: true
    public var isVerifiablePasswordAuthentication: Bool
    public var sshKeyFingerprints: SshKeyFingerprints?
    /// Example: ["127.0.0.1/32"]
    public var hooks: [String]?
    /// Example: ["127.0.0.1/32"]
    public var web: [String]?
    /// Example: ["127.0.0.1/32"]
    public var api: [String]?
    /// Example: ["127.0.0.1/32"]
    public var git: [String]?
    /// Example: ["13.65.0.0/16", "157.55.204.33/32", "2a01:111:f403:f90c::/62"]
    public var packages: [String]?
    /// Example: ["192.30.252.153/32", "192.30.252.154/32"]
    public var pages: [String]?
    /// Example: ["54.158.161.132", "54.226.70.38"]
    public var importer: [String]?
    /// Example: ["13.64.0.0/16", "13.65.0.0/16"]
    public var actions: [String]?
    /// Example: ["192.168.7.15/32", "192.168.7.16/32"]
    public var dependabot: [String]?

    public struct SshKeyFingerprints: Codable {
        public var sha256Rsa: String?
        public var sha256Dsa: String?
        public var sha256Ecdsa: String?
        public var sha256Ed25519: String?

        public init(sha256Rsa: String? = nil, sha256Dsa: String? = nil, sha256Ecdsa: String? = nil, sha256Ed25519: String? = nil) {
            self.sha256Rsa = sha256Rsa
            self.sha256Dsa = sha256Dsa
            self.sha256Ecdsa = sha256Ecdsa
            self.sha256Ed25519 = sha256Ed25519
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.sha256Rsa = try values.decodeIfPresent(String.self, forKey: "SHA256_RSA")
            self.sha256Dsa = try values.decodeIfPresent(String.self, forKey: "SHA256_DSA")
            self.sha256Ecdsa = try values.decodeIfPresent(String.self, forKey: "SHA256_ECDSA")
            self.sha256Ed25519 = try values.decodeIfPresent(String.self, forKey: "SHA256_ED25519")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(sha256Rsa, forKey: "SHA256_RSA")
            try values.encodeIfPresent(sha256Dsa, forKey: "SHA256_DSA")
            try values.encodeIfPresent(sha256Ecdsa, forKey: "SHA256_ECDSA")
            try values.encodeIfPresent(sha256Ed25519, forKey: "SHA256_ED25519")
        }
    }

    public init(isVerifiablePasswordAuthentication: Bool, sshKeyFingerprints: SshKeyFingerprints? = nil, hooks: [String]? = nil, web: [String]? = nil, api: [String]? = nil, git: [String]? = nil, packages: [String]? = nil, pages: [String]? = nil, importer: [String]? = nil, actions: [String]? = nil, dependabot: [String]? = nil) {
        self.isVerifiablePasswordAuthentication = isVerifiablePasswordAuthentication
        self.sshKeyFingerprints = sshKeyFingerprints
        self.hooks = hooks
        self.web = web
        self.api = api
        self.git = git
        self.packages = packages
        self.pages = pages
        self.importer = importer
        self.actions = actions
        self.dependabot = dependabot
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.isVerifiablePasswordAuthentication = try values.decode(Bool.self, forKey: "verifiable_password_authentication")
        self.sshKeyFingerprints = try values.decodeIfPresent(SshKeyFingerprints.self, forKey: "ssh_key_fingerprints")
        self.hooks = try values.decodeIfPresent([String].self, forKey: "hooks")
        self.web = try values.decodeIfPresent([String].self, forKey: "web")
        self.api = try values.decodeIfPresent([String].self, forKey: "api")
        self.git = try values.decodeIfPresent([String].self, forKey: "git")
        self.packages = try values.decodeIfPresent([String].self, forKey: "packages")
        self.pages = try values.decodeIfPresent([String].self, forKey: "pages")
        self.importer = try values.decodeIfPresent([String].self, forKey: "importer")
        self.actions = try values.decodeIfPresent([String].self, forKey: "actions")
        self.dependabot = try values.decodeIfPresent([String].self, forKey: "dependabot")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(isVerifiablePasswordAuthentication, forKey: "verifiable_password_authentication")
        try values.encodeIfPresent(sshKeyFingerprints, forKey: "ssh_key_fingerprints")
        try values.encodeIfPresent(hooks, forKey: "hooks")
        try values.encodeIfPresent(web, forKey: "web")
        try values.encodeIfPresent(api, forKey: "api")
        try values.encodeIfPresent(git, forKey: "git")
        try values.encodeIfPresent(packages, forKey: "packages")
        try values.encodeIfPresent(pages, forKey: "pages")
        try values.encodeIfPresent(importer, forKey: "importer")
        try values.encodeIfPresent(actions, forKey: "actions")
        try values.encodeIfPresent(dependabot, forKey: "dependabot")
    }
}
