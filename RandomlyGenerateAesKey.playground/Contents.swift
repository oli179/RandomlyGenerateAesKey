import Cocoa

import Foundation
import Security

func generateAesKey(length: Int) -> Data? {
    var keyData = Data(count: length)
    let result = keyData.withUnsafeMutableBytes { SecRandomCopyBytes(kSecRandomDefault, length, $0.baseAddress!) }
    
    if result == errSecSuccess {
        return keyData
    } else {
        print("Failed to generate AES key")
        return nil
    }
}

// 调用示例
if let aesKey1 = generateAesKey(length: 32) { // 32 bytes AES key (256-bit key)
    print("Generated AES Key:", aesKey1.base64EncodedString())
} else {
    print("Failed to generate AES key")
}

if let aesKey2 = generateAesKey(length: 16) { // 32 bytes AES key (256-bit key)
    print("Generated AES Key:", aesKey2.base64EncodedString())
} else {
    print("Failed to generate AES key")
}
