//
//  MessagingService.swift
//  JoeChatSdk
//
//  Created by Pulkit Kumar on 06/11/16.
//  Copyright © 2016 Joe. All rights reserved.
//

import Foundation

class MessagingService {
    
    let apiClient: MessagingClient
    
    init(withCredentials clientHash: String, customerHash: String) {
        apiClient = MessagingClient(withCredentials: clientHash, customerHash: customerHash)
    }
    
    func sendMessage(message: JhMessage, customerHash: String) -> Void {
        let comp = {(message: JhMessage?, error: Error?) -> Void in
            if message != nil {
                
            } else if error != nil {
                
            } else {
                
            }
        }
        apiClient.sendMessage(message: message, completion: comp)
    }
}
