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
    
    public func setCustomerDetails(customer: JhCustomer) {
        defaults.set(customer.name!, forKey: CustomerStore.keyCustomerName)
        defaults.set(customer.email!, forKey: CustomerStore.keyCustomerEmail)
        defaults.set(customer.phone!, forKey: CustomerStore.keyCustomerPhone)
        defaults.set(customer.customerHash!, forKey: CustomerStore.keyCustomerHash)
    }
    
    public func getCustomerDetails() -> JhCustomer {
        let customerName = defaults.string(forKey: CustomerStore.keyCustomerName)
        let customerEmail = defaults.string(forKey: CustomerStore.keyCustomerEmail)
        let customerPhone = defaults.string(forKey: CustomerStore.keyCustomerPhone)
        let customerHash = defaults.string(forKey: CustomerStore.keyCustomerHash)
        return JhCustomer(withName: customerName!, customerHash: customerHash!, email: customerEmail!, phone: customerPhone!)
    }
    
    public func setCustomerHash(customerHash: String) {
        defaults.set(customerHash, forKey: CustomerStore.keyCustomerHash)
    }
    
    public func getCustomerHash() -> String {
        return defaults.string(forKey: CustomerStore.keyCustomerHash)!
    }
}
