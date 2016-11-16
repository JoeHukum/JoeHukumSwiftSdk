//
//  CustomerService.swift
//  JoeChatSdk
//
//  Created by Pulkit Kumar on 06/11/16.
//  Copyright © 2016 Joe. All rights reserved.
//

import Foundation

class CustomerService {
    
    private var customerStore: CustomerStore
    private var customerApi: CustomerClient
    private var clientHash: String
    
    init(withClientHash clientHash: String) {
        self.clientHash = clientHash
        self.customerStore = CustomerStore()
        self.customerApi = CustomerClient(withConverter: CustomerConverter())
    }
    
    public func initCustomer(customer: JhCustomer,
                             completion: @escaping (_ customerHash: String?,_ error: Error?) -> Void) -> Void {
        
        self.customerStore.setCustomerDetails(customer: customer)
        self.customerApi.initCustomer(customer: customer, clientHash: self.clientHash, firebaseToken: "",
                                      completion:
            {(returnCust: JhCustomer?, error: Error?) -> Void in
                if returnCust != nil && returnCust?.customerHash != nil {
                    self.customerStore.setCustomerHash(customerHash: (returnCust?.customerHash)!)
                    completion(returnCust?.customerHash, nil)
            } else {
                completion(nil, error)
            }
        })
    }
}
