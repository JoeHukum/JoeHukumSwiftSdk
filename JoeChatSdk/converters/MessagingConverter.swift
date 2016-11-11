//
//  MessagingConverter.swift
//  JoeChatSdk
//
//  Created by Pulkit Kumar on 08/11/16.
//  Copyright © 2016 Joe. All rights reserved.
//

import Foundation

class MessagingConverter {
    
    static let sharedInstance: MessagingConverter = MessagingConverter();

    func convertUploadedMessageResponse(dict: NSDictionary, initMessage: JhMessage) -> JhMessage {
        return JhMessage(fromParams: .sent)
    }
    
    func convertFsyncMessageResponse(dict: NSDictionary) -> [JhMessage]? {
        return nil
    }
}
