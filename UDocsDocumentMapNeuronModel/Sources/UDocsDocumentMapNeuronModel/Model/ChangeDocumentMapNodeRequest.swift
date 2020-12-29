//
//  ChangeDocumentMapNodeRequest.swift
//  UniversalBrainController
//
//  Created by Kumar Muthaiah on 24/12/18.
//

import Foundation
import UDocsDocumentModel

public class ChangeDocumentMapNodeRequest : Codable {
    public var _id: String = ""
    public var upcHumanProfileId: String = ""
    public var upcCompanyProfileId: String = ""
    public var upcApplicationProfileId: String = ""
    public var language: String = ""
    public var parentId: String = ""
    public var parentPathIdName = [String]()
    public var udcDocumentMapNode = UDCDocumentMapNode()
    public var documentLanguage: String = ""
    public var interfaceLanguage: String = ""
    public var udcDoumentMapNodeId: String = ""
    
    public init() {
        
    }
}
