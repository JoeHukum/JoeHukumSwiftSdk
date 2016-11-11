//
//  JhMessage.swift
//  JoeChatSdk
//
//  Created by Pulkit Kumar on 08/11/16.
//  Copyright © 2016 Joe. All rights reserved.
//

import Foundation
import JSQMessagesViewController

class JhMessage: BaseModel, JSQMessageData {
    
    enum MesssageType: CustomStringConvertible {
        case sent
        case received
        var description: String {
            switch self {
            case .sent: return "sent"
            case .received: return "received"
            }
        }
    }
    
    enum ContentType: CustomStringConvertible {
        case text
        case image
        case option
        var description : String {
            switch self {
            case .image: return "img"
            case .option: return "option"
            default: return "txt"
            }
        }
    }
    
    enum ResponseType: CustomStringConvertible {
        case text
        case option
        case int
        case date
        case time
        case rating
        var description: String {
            switch self {
            case .option: return "option"
            case .int: return "int"
            case .date: return "date"
            case .time: return "time"
            case .rating: return "rating"
            default: return "txt"
            }
        }
    }
    
    var id: Int?
    var type: MesssageType
    var ticketMessageHash: String?
    var time: Date
    var author: String?
    var content: String?
    var contentType: ContentType?
    var responseType: ResponseType?
    var isRead: Bool
    var ticketHash: String?
    var publicNote: Bool
    var refMessageHash: String?
    
    init(fromParams type:MesssageType) {
        self.type = type
        self.time = Date()
        self.isRead = false
        self.publicNote = true
    }
    
    // JSQMessageData protocol functions
    public func senderId() -> String! {
        return self.author
    }
    
    public func senderDisplayName() -> String! {
        return self.author
    }
    
    public func date() -> Date! {
        return self.time
    }
    
    public func isMediaMessage() -> Bool {
        return false
    }
    
    public func messageHash() -> UInt {
        return UInt(id!)
    }
    
    public func text() -> String! {
        return self.content
    }
}
