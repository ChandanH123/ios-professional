//
//  LocalState.swift
//  Bankey
//
//  Created by Chandan on 21/08/22.
//

import Foundation

// NSUserDefaults database where we store key-value pairs persistently.
public class LocalState {
    private enum Keys: String {
        case hasOnboarded
    }
    
    public static var hasOnboarded: Bool { // optional setter computed property.
    
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
}
