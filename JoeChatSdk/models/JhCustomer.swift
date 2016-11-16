//
//  JhCustomer.swift
//  JoeChatSdk
//
//  Created by Pulkit Kumar on 08/11/16.
//  Copyright © 2016 Joe. All rights reserved.
//

import Foundation

class JhCustomer: BaseModel {
    
    var name: String?
    var customerHash: String?
    var email: String?
    var phone: String?
    
    override init() {
        
    }
    
    init(withName name: String, customerHash: String, email: String, phone:String) {
        self.name = name
        self.customerHash = customerHash
        self.email = email
        self.phone = phone
    }
}
