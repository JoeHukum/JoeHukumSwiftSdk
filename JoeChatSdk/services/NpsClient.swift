//
//  NpsService.swift
//  JoeChatSdk
//
//  Created by Pulkit Kumar on 09/11/16.
//  Copyright © 2016 Joe. All rights reserved.
//

import Foundation
import Alamofire

class NpsClient: BaseHttpClient {
    
    
    func sendFeedback (rating: Double, feedback: String, ticketHash: String, completion: @escaping (_ error: Error?)-> Void )
        -> Void {
        let url = baseUrl + ApiUrlConstants.feedbackSubUrl
        let parameters = ["fdbck":feedback, "tcktHsh":ticketHash, "rtng":rating] as [String : Any]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result{
                case .success:
                    completion(nil)
                    break
                case .failure(let error):
                    completion(error)
                    break
                }

        }
    }
    
}
