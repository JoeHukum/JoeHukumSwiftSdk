//
//  Constants.swift
//  JoeChatSdk
//
//  Created by Pulkit Kumar on 08/11/16.
//  Copyright © 2016 Joe. All rights reserved.
//

import Foundation

class ApiUrlConstants {
    static let messageSubUrl: String = "/conversation/v2/ticket/smart/"
    static let feedbackSubUrl: String = "/ticket/rate/"
    static let initChatSubUrl: String = "/conversation/v2/initChat/"
    static let fsyncSubUrl: String = "/conversation/v2/fsync"
    static let customerInitSubUrl: String = "/customer/init"
    static let imageUploadSubUrl: String = "/file/upload"
    static let rSyncSubUrl: String = "/conversation/v2/rsync"
}

class ApiHeaderConstants {
    static let channelKey: String = "X-CommChannel"
    static let channel: String = "ios_app_channel"
    static let cleintId: String = "X-ClientId"
}
