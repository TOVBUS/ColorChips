//
//  ChatResponse.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 8/7/24.
//

import SwiftUI
import Alamofire
import Foundation

// MARK: - ChatResponse
struct ChatResponse: Codable {
    let choices: [Choice]
    let created: Int
    let id, model, object: String
    let promptFilterResults: [PromptFilterResult]?
    let systemFingerprint: String?
    let usage: Usage

    enum CodingKeys: String, CodingKey {
        case choices, created, id, model, object
        case promptFilterResults = "prompt_filter_results"
        case systemFingerprint = "system_fingerprint"
        case usage
    }
}

// MARK: - Choice
struct Choice: Codable {
    let contentFilterResults: ChoiceContentFilterResults?
    let finishReason: String
    let index: Int
    let logprobs: JSONNull?
    let message: Message

    enum CodingKeys: String, CodingKey {
        case contentFilterResults = "content_filter_results"
        case finishReason = "finish_reason"
        case index, logprobs, message
    }
}

// MARK: - ChoiceContentFilterResults
struct ChoiceContentFilterResults: Codable {
    let hate: Hate?
    let protectedMaterialCode, protectedMaterialText: ProtectedMaterial?
    let selfHarm, sexual, violence: Hate?

    enum CodingKeys: String, CodingKey {
        case hate
        case protectedMaterialCode = "protected_material_code"
        case protectedMaterialText = "protected_material_text"
        case selfHarm = "self_harm"
        case sexual, violence
    }
}

// MARK: - Hate
struct Hate: Codable {
    let filtered: Bool
    let severity: String
}

// MARK: - ProtectedMaterial
struct ProtectedMaterial: Codable {
    let filtered, detected: Bool?
}

// MARK: - Message
struct Message: Codable {
    let content: String
    let role: String
}

// MARK: - PromptFilterResult
struct PromptFilterResult: Codable {
    let promptIndex: Int
    let contentFilterResults: PromptFilterResultContentFilterResults

    enum CodingKeys: String, CodingKey {
        case promptIndex = "prompt_index"
        case contentFilterResults = "content_filter_results"
    }
}

// MARK: - PromptFilterResultContentFilterResults
struct PromptFilterResultContentFilterResults: Codable {
    let hate: Hate?
    let jailbreak: ProtectedMaterial?
    let selfHarm, sexual, violence: Hate?

    enum CodingKeys: String, CodingKey {
        case hate, jailbreak
        case selfHarm = "self_harm"
        case sexual, violence
    }
}

// MARK: - Usage
struct Usage: Codable {
    let completionTokens, promptTokens, totalTokens: Int

    enum CodingKeys: String, CodingKey {
        case completionTokens = "completion_tokens"
        case promptTokens = "prompt_tokens"
        case totalTokens = "total_tokens"
    }
}

// MARK: - Encode/decode helpers
class JSONNull: Codable, Hashable {
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
