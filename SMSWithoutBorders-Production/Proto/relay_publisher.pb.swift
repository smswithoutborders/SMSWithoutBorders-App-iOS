// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: relay_publisher.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// Request message for getting the OAuth2 authorization URL
struct Publisher_V1_GetOAuth2AuthorizationUrlRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The platform for which the authorization URL is requested
  var platform: String = String()

  /// Optional state parameter to prevent CSRF attacks
  var state: String = String()

  /// Optional code verifier for PKCE
  var codeVerifier: String = String()

  /// Flag to indicate if the code verifier should be auto-generated
  var autogenerateCodeVerifier: Bool = false

  /// Optional redirect URL for the OAuth2 application
  var redirectURL: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Response message for the OAuth2 GetAuthorizationUrl RPC
struct Publisher_V1_GetOAuth2AuthorizationUrlResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The authorization URL
  var authorizationURL: String = String()

  /// The state parameter for preventing CSRF attacks
  var state: String = String()

  /// The code verifier used for PKCE
  var codeVerifier: String = String()

  /// A response message
  var message: String = String()

  /// The scope of the authorization request
  var scope: String = String()

  /// The client ID for the OAuth2 application
  var clientID: String = String()

  /// The redirect URL for the OAuth2 application
  var redirectURL: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Request message for exchanging the OAuth2 authorization code for a token
struct Publisher_V1_ExchangeOAuth2CodeAndStoreRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The long-lived token of the authenticated entity.
  var longLivedToken: String = String()

  /// The platform for which the token exchange is being performed
  var platform: String = String()

  /// The authorization code received from the authorization server
  var authorizationCode: String = String()

  /// Optional code verifier used for PKCE
  var codeVerifier: String = String()

  /// Optional redirect URL for the OAuth2 application
  var redirectURL: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Response message for the ExchangeOAuth2Code RPC
struct Publisher_V1_ExchangeOAuth2CodeAndStoreResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Indicates if the token exchange and storage was successful
  var success: Bool = false

  /// A response message
  var message: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Request message for revoking and deleting an OAuth2 token
struct Publisher_V1_RevokeAndDeleteOAuth2TokenRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The long-lived token of the authenticated entity.
  var longLivedToken: String = String()

  /// The platform associated with the token.
  var platform: String = String()

  /// The identifier of the account associated with the token.
  var accountIdentifier: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Response message for revoking and deleting an OAuth2 token
struct Publisher_V1_RevokeAndDeleteOAuth2TokenResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// A response message.
  var message: String = String()

  /// Indicates whether the operation was successful.
  var success: Bool = false

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Request message for publishing content
struct Publisher_V1_PublishContentRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The content to be published
  var content: String = String()

  /// Metadata about the content
  var metadata: Dictionary<String,String> = [:]

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Response message for the PublishContent RPC
struct Publisher_V1_PublishContentResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Indicates if the publishing was successful
  var success: Bool = false

  /// A response message
  var message: String = String()

  /// A response from the publisher
  var publisherResponse: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Publisher_V1_GetOAuth2AuthorizationUrlRequest: @unchecked Sendable {}
extension Publisher_V1_GetOAuth2AuthorizationUrlResponse: @unchecked Sendable {}
extension Publisher_V1_ExchangeOAuth2CodeAndStoreRequest: @unchecked Sendable {}
extension Publisher_V1_ExchangeOAuth2CodeAndStoreResponse: @unchecked Sendable {}
extension Publisher_V1_RevokeAndDeleteOAuth2TokenRequest: @unchecked Sendable {}
extension Publisher_V1_RevokeAndDeleteOAuth2TokenResponse: @unchecked Sendable {}
extension Publisher_V1_PublishContentRequest: @unchecked Sendable {}
extension Publisher_V1_PublishContentResponse: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "publisher.v1"

extension Publisher_V1_GetOAuth2AuthorizationUrlRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GetOAuth2AuthorizationUrlRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "platform"),
    2: .same(proto: "state"),
    3: .standard(proto: "code_verifier"),
    4: .standard(proto: "autogenerate_code_verifier"),
    5: .standard(proto: "redirect_url"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.platform) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.state) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.codeVerifier) }()
      case 4: try { try decoder.decodeSingularBoolField(value: &self.autogenerateCodeVerifier) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.redirectURL) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.platform.isEmpty {
      try visitor.visitSingularStringField(value: self.platform, fieldNumber: 1)
    }
    if !self.state.isEmpty {
      try visitor.visitSingularStringField(value: self.state, fieldNumber: 2)
    }
    if !self.codeVerifier.isEmpty {
      try visitor.visitSingularStringField(value: self.codeVerifier, fieldNumber: 3)
    }
    if self.autogenerateCodeVerifier != false {
      try visitor.visitSingularBoolField(value: self.autogenerateCodeVerifier, fieldNumber: 4)
    }
    if !self.redirectURL.isEmpty {
      try visitor.visitSingularStringField(value: self.redirectURL, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Publisher_V1_GetOAuth2AuthorizationUrlRequest, rhs: Publisher_V1_GetOAuth2AuthorizationUrlRequest) -> Bool {
    if lhs.platform != rhs.platform {return false}
    if lhs.state != rhs.state {return false}
    if lhs.codeVerifier != rhs.codeVerifier {return false}
    if lhs.autogenerateCodeVerifier != rhs.autogenerateCodeVerifier {return false}
    if lhs.redirectURL != rhs.redirectURL {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Publisher_V1_GetOAuth2AuthorizationUrlResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GetOAuth2AuthorizationUrlResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "authorization_url"),
    2: .same(proto: "state"),
    3: .standard(proto: "code_verifier"),
    4: .same(proto: "message"),
    5: .same(proto: "scope"),
    6: .standard(proto: "client_id"),
    7: .standard(proto: "redirect_url"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.authorizationURL) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.state) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.codeVerifier) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.message) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.scope) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.clientID) }()
      case 7: try { try decoder.decodeSingularStringField(value: &self.redirectURL) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.authorizationURL.isEmpty {
      try visitor.visitSingularStringField(value: self.authorizationURL, fieldNumber: 1)
    }
    if !self.state.isEmpty {
      try visitor.visitSingularStringField(value: self.state, fieldNumber: 2)
    }
    if !self.codeVerifier.isEmpty {
      try visitor.visitSingularStringField(value: self.codeVerifier, fieldNumber: 3)
    }
    if !self.message.isEmpty {
      try visitor.visitSingularStringField(value: self.message, fieldNumber: 4)
    }
    if !self.scope.isEmpty {
      try visitor.visitSingularStringField(value: self.scope, fieldNumber: 5)
    }
    if !self.clientID.isEmpty {
      try visitor.visitSingularStringField(value: self.clientID, fieldNumber: 6)
    }
    if !self.redirectURL.isEmpty {
      try visitor.visitSingularStringField(value: self.redirectURL, fieldNumber: 7)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Publisher_V1_GetOAuth2AuthorizationUrlResponse, rhs: Publisher_V1_GetOAuth2AuthorizationUrlResponse) -> Bool {
    if lhs.authorizationURL != rhs.authorizationURL {return false}
    if lhs.state != rhs.state {return false}
    if lhs.codeVerifier != rhs.codeVerifier {return false}
    if lhs.message != rhs.message {return false}
    if lhs.scope != rhs.scope {return false}
    if lhs.clientID != rhs.clientID {return false}
    if lhs.redirectURL != rhs.redirectURL {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Publisher_V1_ExchangeOAuth2CodeAndStoreRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ExchangeOAuth2CodeAndStoreRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "long_lived_token"),
    2: .same(proto: "platform"),
    3: .standard(proto: "authorization_code"),
    4: .standard(proto: "code_verifier"),
    5: .standard(proto: "redirect_url"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.longLivedToken) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.platform) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.authorizationCode) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.codeVerifier) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.redirectURL) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.longLivedToken.isEmpty {
      try visitor.visitSingularStringField(value: self.longLivedToken, fieldNumber: 1)
    }
    if !self.platform.isEmpty {
      try visitor.visitSingularStringField(value: self.platform, fieldNumber: 2)
    }
    if !self.authorizationCode.isEmpty {
      try visitor.visitSingularStringField(value: self.authorizationCode, fieldNumber: 3)
    }
    if !self.codeVerifier.isEmpty {
      try visitor.visitSingularStringField(value: self.codeVerifier, fieldNumber: 4)
    }
    if !self.redirectURL.isEmpty {
      try visitor.visitSingularStringField(value: self.redirectURL, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Publisher_V1_ExchangeOAuth2CodeAndStoreRequest, rhs: Publisher_V1_ExchangeOAuth2CodeAndStoreRequest) -> Bool {
    if lhs.longLivedToken != rhs.longLivedToken {return false}
    if lhs.platform != rhs.platform {return false}
    if lhs.authorizationCode != rhs.authorizationCode {return false}
    if lhs.codeVerifier != rhs.codeVerifier {return false}
    if lhs.redirectURL != rhs.redirectURL {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Publisher_V1_ExchangeOAuth2CodeAndStoreResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ExchangeOAuth2CodeAndStoreResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "success"),
    2: .same(proto: "message"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBoolField(value: &self.success) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.message) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.success != false {
      try visitor.visitSingularBoolField(value: self.success, fieldNumber: 1)
    }
    if !self.message.isEmpty {
      try visitor.visitSingularStringField(value: self.message, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Publisher_V1_ExchangeOAuth2CodeAndStoreResponse, rhs: Publisher_V1_ExchangeOAuth2CodeAndStoreResponse) -> Bool {
    if lhs.success != rhs.success {return false}
    if lhs.message != rhs.message {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Publisher_V1_RevokeAndDeleteOAuth2TokenRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RevokeAndDeleteOAuth2TokenRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "long_lived_token"),
    2: .same(proto: "platform"),
    3: .standard(proto: "account_identifier"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.longLivedToken) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.platform) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.accountIdentifier) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.longLivedToken.isEmpty {
      try visitor.visitSingularStringField(value: self.longLivedToken, fieldNumber: 1)
    }
    if !self.platform.isEmpty {
      try visitor.visitSingularStringField(value: self.platform, fieldNumber: 2)
    }
    if !self.accountIdentifier.isEmpty {
      try visitor.visitSingularStringField(value: self.accountIdentifier, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Publisher_V1_RevokeAndDeleteOAuth2TokenRequest, rhs: Publisher_V1_RevokeAndDeleteOAuth2TokenRequest) -> Bool {
    if lhs.longLivedToken != rhs.longLivedToken {return false}
    if lhs.platform != rhs.platform {return false}
    if lhs.accountIdentifier != rhs.accountIdentifier {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Publisher_V1_RevokeAndDeleteOAuth2TokenResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RevokeAndDeleteOAuth2TokenResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "message"),
    2: .same(proto: "success"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.message) }()
      case 2: try { try decoder.decodeSingularBoolField(value: &self.success) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.message.isEmpty {
      try visitor.visitSingularStringField(value: self.message, fieldNumber: 1)
    }
    if self.success != false {
      try visitor.visitSingularBoolField(value: self.success, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Publisher_V1_RevokeAndDeleteOAuth2TokenResponse, rhs: Publisher_V1_RevokeAndDeleteOAuth2TokenResponse) -> Bool {
    if lhs.message != rhs.message {return false}
    if lhs.success != rhs.success {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Publisher_V1_PublishContentRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".PublishContentRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "content"),
    2: .same(proto: "metadata"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.content) }()
      case 2: try { try decoder.decodeMapField(fieldType: SwiftProtobuf._ProtobufMap<SwiftProtobuf.ProtobufString,SwiftProtobuf.ProtobufString>.self, value: &self.metadata) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.content.isEmpty {
      try visitor.visitSingularStringField(value: self.content, fieldNumber: 1)
    }
    if !self.metadata.isEmpty {
      try visitor.visitMapField(fieldType: SwiftProtobuf._ProtobufMap<SwiftProtobuf.ProtobufString,SwiftProtobuf.ProtobufString>.self, value: self.metadata, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Publisher_V1_PublishContentRequest, rhs: Publisher_V1_PublishContentRequest) -> Bool {
    if lhs.content != rhs.content {return false}
    if lhs.metadata != rhs.metadata {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Publisher_V1_PublishContentResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".PublishContentResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "success"),
    2: .same(proto: "message"),
    3: .standard(proto: "publisher_response"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBoolField(value: &self.success) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.message) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.publisherResponse) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.success != false {
      try visitor.visitSingularBoolField(value: self.success, fieldNumber: 1)
    }
    if !self.message.isEmpty {
      try visitor.visitSingularStringField(value: self.message, fieldNumber: 2)
    }
    if !self.publisherResponse.isEmpty {
      try visitor.visitSingularStringField(value: self.publisherResponse, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Publisher_V1_PublishContentResponse, rhs: Publisher_V1_PublishContentResponse) -> Bool {
    if lhs.success != rhs.success {return false}
    if lhs.message != rhs.message {return false}
    if lhs.publisherResponse != rhs.publisherResponse {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
