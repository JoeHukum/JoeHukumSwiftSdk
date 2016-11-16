//
//  MessagingClient.swift
//  JoeChatSdk
//
//  Created by Pulkit Kumar on 06/11/16.
//  Copyright © 2016 Joe. All rights reserved.
//

import Foundation
import Alamofire

class MessagingClient: BaseHttpClient {
    
    let converter: MessagingConverter
    let customerHash: String
    let headers: [String: String]
    
    init(withClientHash clientHash: String, customerHash: String){
        self.customerHash = customerHash
        self.headers = [ApiHeaderConstants.channelKey: ApiHeaderConstants.channelKey,
                        ApiHeaderConstants.cleintId: clientHash]
        self.converter = MessagingConverter.sharedInstance
    }
    
    func sendMessage(message: JhMessage,
                     completion: @escaping (_ responseObject: JhMessage?, _ error: Error?) -> Void) -> Void {
        let url = baseUrl + ApiUrlConstants.messageSubUrl
        let parameters = ["customer_hash": self.customerHash,
                          "channel":"ios_app_channel",
                          "message": message.content,
                          "refTcktMsgHsh": message.refMessageHash,
                          "cntntTyp": message.contentType?.description]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: self.headers)
            .responseJSON { response in
            switch response.result {
                case .success(let value):
                    let json = value as! NSDictionary
                    completion(self.converter.convertUploadedMessageResponse(dict: json, initMessage: message), nil)
                break
                case .failure(let error):
                    completion(nil, error)
                break
            }
        }
    }
    
    func initChat(completion: @escaping(_ error: Error?)-> Void ) -> Void {
        let url = baseUrl + ApiUrlConstants.initChatSubUrl
        
        Alamofire.request(url, method: .get, headers: self.headers).responseJSON {response in
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
    
    func chatFsync(ticketMessageHash: String, completion: @escaping (_ messages: [JhMessage]?,_ error: Error?)->Void ) -> Void {
        let url = baseUrl + ApiUrlConstants.fsyncSubUrl
        let parameters: [String: Any] = ["orderBy":"asc",
                          "customer_hash": customerHash,
                          "ticketMessageHash": ticketMessageHash,
                          "showCustomerMsg": false]
        Alamofire.request(url, method: .get, parameters: parameters, headers: self.headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = value as! NSDictionary
                completion(self.converter.convertFsyncMessageResponse(dict: json), nil)
                break;
            case .failure(let error):
                completion(nil, error);
                break;
            }
        }
    }
    
    func chatRsync(completion: @escaping (_ messages: [JhMessage]?, _ error: Error?)-> Void) -> Void {
        let url = baseUrl + ApiUrlConstants.rSyncSubUrl
        
    }
}
