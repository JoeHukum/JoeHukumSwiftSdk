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
    
    init(withClientHash clientHash: String, customerHash: String) {
        apiClient = MessagingClient(withClientHash: clientHash, customerHash: customerHash)
    }
    
    func sendMessage(message: JhMessage, completion : @escaping(_ message: JhMessage?,_ error: Error?)-> Void ) -> Void {
    
        apiClient.sendMessage(message: message, completion: {(message: JhMessage?, error: Error?) -> Void in
            if message != nil {
                completion(message, nil)
            } else {
                completion(nil, error)
            }
        })
    }
    
    func getMessages(completion: @escaping(_ messages: [JhMessage]?, _ error:Error?) -> ()) ->  Void {
        
        apiClient.chatRsync(completion: {(messages: [JhMessage]?, error: Error?)-> Void in
            if (messages != nil) {
                completion(messages, nil)
            } else {
                completion(nil, error)
            }
        })
    }
}
