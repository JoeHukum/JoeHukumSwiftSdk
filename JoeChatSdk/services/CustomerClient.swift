//
//  CustomerClient.swift
//  JoeChatSdk
//
//  Created by Pulkit Kumar on 06/11/16.
//  Copyright © 2016 Joe. All rights reserved.
//

import Foundation
import Alamofire

class CustomerClient: BaseHttpClient {
    
    let converter: CustomerConverter
    
    init(withConverter converter: CustomerConverter) {
        self.converter = converter
    }
    
    func initCustomer(customer: JhCustomer,
                      clientHash: String,
                      firebaseToken: String,
                      completion: @escaping (_ customer: JhCustomer?, _ error: Error?)->Void ) -> Void {
        
        let url = baseUrl + ApiUrlConstants.customerInitSubUrl
        let params = ["phone": customer.phone!,
                      "verified": true,
                      "email": customer.email!,
                      "channel": ApiHeaderConstants.channel,
                      "customer_hash": customer.customerHash!,
                      "prms": "",
                      "firebase_token": ""] as [String : Any]
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON {response in
                switch response.result {
                case .success(let value):
                    let json = value as! NSDictionary
                    completion(self.converter.customerFromInitReponse(dict: json), nil)
                    break
                case .failure(let error):
                    print(error)
                    completion(nil, error)
                    break
                }
        }
    }
}
