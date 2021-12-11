// Generated by Create API
// https://github.com/kean/CreateAPI
//
// swiftlint:disable all

import Foundation
import APIClient
import HTTPHeaders

public enum Paths {}

extension Paths {
  public static var pet: Pet {
    Pet(path: "/pet")
  }

  public struct Pet {
    /// Path: `/pet`
    public let path: String

    /// Add a new pet to the store
    public func post(_ body: edgecases_indent_with_two_width_spaces.Pet) -> Request<Void> {
      .post(path, body: body)
    }

    /// Update an existing pet
    public func put(_ body: edgecases_indent_with_two_width_spaces.Pet) -> Request<Void> {
      .put(path, body: body)
    }
  }
}

extension Paths.Pet {
  public var findByStatus: FindByStatus {
    FindByStatus(path: path + "/findByStatus")
  }

  public struct FindByStatus {
    /// Path: `/pet/findByStatus`
    public let path: String


  }
}

extension Paths.Pet {
  public var findByTags: FindByTags {
    FindByTags(path: path + "/findByTags")
  }

  public struct FindByTags {
    /// Path: `/pet/findByTags`
    public let path: String


  }
}

extension Paths.Pet {
  public func petID(_ petID: String) -> WithPetID {
    WithPetID(path: path + "/" + petID)
  }

  public struct WithPetID {
    /// Path: `/pet/{petId}`
    public let path: String

    /// Find pet by ID
    public func get() -> Request<edgecases_indent_with_two_width_spaces.Pet> {
      .get(path)
    }

    /// Deletes a pet
    public func delete() -> Request<Void> {
      .delete(path)
    }
  }
}

extension Paths.Pet.WithPetID {
  public var uploadImage: UploadImage {
    UploadImage(path: path + "/uploadImage")
  }

  public struct UploadImage {
    /// Path: `/pet/{petId}/uploadImage`
    public let path: String


  }
}

extension Paths {
  public static var store: Store {
    Store(path: "/store")
  }

  public struct Store {
    /// Path: `/store`
    public let path: String
  }
}

extension Paths.Store {
  public var inventory: Inventory {
    Inventory(path: path + "/inventory")
  }

  public struct Inventory {
    /// Path: `/store/inventory`
    public let path: String

    /// Returns pet inventories by status
    public func get() -> Request<[String: Int]> {
      .get(path)
    }
  }
}

extension Paths.Store {
  public var order: Order {
    Order(path: path + "/order")
  }

  public struct Order {
    /// Path: `/store/order`
    public let path: String

    /// Place an order for a pet
    public func post(_ body: edgecases_indent_with_two_width_spaces.Order) -> Request<edgecases_indent_with_two_width_spaces.Order> {
      .post(path, body: body)
    }
  }
}

extension Paths.Store.Order {
  public func orderID(_ orderID: String) -> WithOrderID {
    WithOrderID(path: path + "/" + orderID)
  }

  public struct WithOrderID {
    /// Path: `/store/order/{order_id}`
    public let path: String

    /// Find purchase order by ID
    public func get() -> Request<edgecases_indent_with_two_width_spaces.Order> {
      .get(path)
    }

    /// Delete purchase order by ID
    public func delete() -> Request<Void> {
      .delete(path)
    }
  }
}

extension Paths {
  public static var user: User {
    User(path: "/user")
  }

  public struct User {
    /// Path: `/user`
    public let path: String

    /// Create user
    public func post(_ body: edgecases_indent_with_two_width_spaces.User) -> Request<Void> {
      .post(path, body: body)
    }
  }
}

extension Paths.User {
  public var createWithArray: CreateWithArray {
    CreateWithArray(path: path + "/createWithArray")
  }

  public struct CreateWithArray {
    /// Path: `/user/createWithArray`
    public let path: String

    /// Creates list of users with given input array
    public func post(_ body: [User]) -> Request<Void> {
      .post(path, body: body)
    }
  }
}

extension Paths.User {
  public var createWithList: CreateWithList {
    CreateWithList(path: path + "/createWithList")
  }

  public struct CreateWithList {
    /// Path: `/user/createWithList`
    public let path: String

    /// Creates list of users with given input array
    public func post(_ body: [User]) -> Request<Void> {
      .post(path, body: body)
    }
  }
}

extension Paths.User {
  public var login: Login {
    Login(path: path + "/login")
  }

  public struct Login {
    /// Path: `/user/login`
    public let path: String

    /// Logs user into the system
    public func get() -> Request<String> {
      .get(path)
    }

    public enum GetHeaders {
      /// Calls per hour allowed by the user
      @available(*, deprecated, message: "Deprecated")
      public static let rateLimit = HTTPHeader<Int>(field: "X-Rate-Limit")
      /// Date in UTC when toekn expires
      public static let expiresAfter = HTTPHeader<Date>(field: "X-Expires-After")
    }
  }
}

extension Paths.User {
  public var logout: Logout {
    Logout(path: path + "/logout")
  }

  public struct Logout {
    /// Path: `/user/logout`
    public let path: String

    /// Logs out current logged in user session
    public func get() -> Request<Void> {
      .get(path)
    }
  }
}

extension Paths.User {
  public func username(_ username: String) -> WithUsername {
    WithUsername(path: path + "/" + username)
  }

  public struct WithUsername {
    /// Path: `/user/{username}`
    public let path: String

    /// Get user by user name
    public func get() -> Request<edgecases_indent_with_two_width_spaces.User> {
      .get(path)
    }

    /// Updated user
    public func put(_ body: edgecases_indent_with_two_width_spaces.User) -> Request<Void> {
      .put(path, body: body)
    }

    /// Delete user
    public func delete() -> Request<Void> {
      .delete(path)
    }
  }
}

extension Paths {
  public static var fake: Fake {
    Fake(path: "/fake")
  }

  public struct Fake {
    /// Path: `/fake`
    public let path: String

    /// To test enum parameters
    public func get() -> Request<Void> {
      .get(path)
    }

    /// To test "client" model
    public func patch(_ body: Client) -> Request<Client> {
      .patch(path, body: body)
    }
  }
}

