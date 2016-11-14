//
//  CustomerStore.swift
//  JoeChatSdk
//
//  Created by Pulkit Kumar on 14/11/16.
//  Copyright © 2016 Joe. All rights reserved.
//

import Foundation

class CustomerStore {
    
    static let keyCustomerName: String = "keyCustomerName"
    static let keyCustomerEmail: String = "keyCustomerEmail"
    static let keyCustomerPhone: String = "keyCustomerPhone"
    static let keyCustomerHash: String = "keyCustomerHash"
    
    var defaults: UserDefaults
    
    init () {
        defaults = UserDefaults.standard
    }
    
    public func setCustomerDetails(customerName: String, customerEmail: String, customerPhone: String) {
        defaults.set(customerName, forKey: CustomerStore.keyCustomerName)
        defaults.set(customerEmail, forKey: CustomerStore.keyCustomerEmail)
        defaults.set(customerPhone, forKey: CustomerStore.keyCustomerPhone)
    }
    
    public func getCustomerDetails() -> [String: String] {
        let customerName = defaults.string(forKey: CustomerStore.keyCustomerName)
        let customerEmail = defaults.string(forKey: CustomerStore.keyCustomerEmail)
        let customerPhone = defaults.string(forKey: CustomerStore.keyCustomerPhone)
        return [CustomerStore.keyCustomerName: customerName!,
                CustomerStore.keyCustomerEmail: customerEmail!,
                CustomerStore.keyCustomerPhone: customerPhone!]
    }
    
    public func setCustomerHash(customerHash: String) {
        defaults.set(customerHash, forKey: CustomerStore.keyCustomerHash)
    }
    
    public func getCustomerHash() -> String {
        return defaults.string(forKey: CustomerStore.keyCustomerHash)!
    }
}
