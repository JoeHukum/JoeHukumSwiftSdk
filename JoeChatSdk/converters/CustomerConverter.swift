//
//  CustomerConverter.swift
//  JoeChatSdk
//
//  Created by Pulkit Kumar on 08/11/16.
//  Copyright © 2016 Joe. All rights reserved.
//

import Foundation

class CustomerConverter {
    
    func customerFromInitReponse(dict: NSDictionary) -> JhCustomer {
        var customerDict:[String: Any] = (dict["customerDetail"] as? [String:Any])!
        let customerHash = customerDict["cstmrHsh"] as? String
        return JhCustomer(withName: "", customerHash: customerHash!, email: "", phone: "")
    }
}
