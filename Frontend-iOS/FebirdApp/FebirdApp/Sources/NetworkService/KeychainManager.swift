//
//  KeychainManager.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 8/5/24.
//

import Security
import Foundation

class KeychainManager {
    static let shared = KeychainManager()
    private init() {}

    func saveToken(_ token: String) {
        guard let data = token.data(using: .utf8) else { return }
        KeychainManager.save(data, service: "com.yourapp.token", account: "userToken")
    }

    func loadToken() -> String? {
        guard let data = KeychainManager.load(service: "com.yourapp.token", account: "userToken") else { return nil }
        return String(data: data, encoding: .utf8)
    }

    func deleteToken() {
        KeychainManager.delete(service: "com.yourapp.token", account: "userToken")
    }

    func saveMemberID(_ memberID: Int) {
        let data = withUnsafeBytes(of: memberID) { Data($0) }
        KeychainManager.save(data, service: "com.yourapp.memberID", account: "userID")
    }

    func loadMemberID() -> Int? {
        guard let data = KeychainManager.load(service: "com.yourapp.memberID", account: "userID") else { return nil }
        return data.withUnsafeBytes { $0.load(as: Int.self) }
    }

    func deleteMemberID() {
        KeychainManager.delete(service: "com.yourapp.memberID", account: "userID")
    }

    private static func save(_ data: Data, service: String, account: String) {
        let query: [String: Any] = [
            kSecValueData as String: data,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecClass as String: kSecClassGenericPassword
        ]

        SecItemDelete(query as CFDictionary) // 기존 값을 덮어쓰도록 기존 항목 삭제
        SecItemAdd(query as CFDictionary, nil)
    }

    private static func load(service: String, account: String) -> Data? {
        let query: [String: Any] = [
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecClass as String: kSecClassGenericPassword,
            kSecReturnData as String: true
        ]

        var result: AnyObject?
        SecItemCopyMatching(query as CFDictionary, &result)

        return result as? Data
    }

    private static func delete(service: String, account: String) {
        let query: [String: Any] = [
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecClass as String: kSecClassGenericPassword
        ]

        SecItemDelete(query as CFDictionary)
    }
}
