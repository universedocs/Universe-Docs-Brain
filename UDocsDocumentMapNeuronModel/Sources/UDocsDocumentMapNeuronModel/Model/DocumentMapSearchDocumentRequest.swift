//
//  DocumentMapSearchDocumentRequest.swift
//  Universe Docs
//
//  Created by Kumar Muthaiah on 31/03/20.
//  Copyright © 2020 Universe Docs. All rights reserved.
//

import Foundation
import UDocsDocumentModel
import UDocsViewModel

public class DocumentMapSearchDocumentRequest : Codable {
    public var _id: String = ""
    public var text: String?
    public var treeLevel: Int = 0
    public var udcDocumentId: String = ""
    public var udcProfile = [UDCProfile]()
    public var documentLanguage: String = ""
    public var interfaceLanguage: String = ""
    public var uvcDocumentMapViewTemplateType = UVCDocumentMapViewTemplateType.NamePicture.name
    public var darkMode: Bool = false

    public init() {
        
    }
}
