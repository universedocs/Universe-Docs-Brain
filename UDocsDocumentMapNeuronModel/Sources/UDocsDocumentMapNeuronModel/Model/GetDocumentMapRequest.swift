//
//  GetDocumentMapRequest.swift
//  UniversalBrainController
//
//  Created by Kumar Muthaiah on 20/12/18.
//

import Foundation
import UDocsViewModel
import UDocsDocumentModel

public class GetDocumentMapRequest : Codable {
    public var _id: String = ""
    public var udcDocumentId: String?
    public var upcHumanProfileId: String = ""
    public var upcCompanyProfileId: String = ""
    public var upcApplicationProfileId: String = ""
    public var uvcDocumentMapViewTemplateType = UVCDocumentMapViewTemplateType.NamePicture.name
    public var documentLanguage: String = ""
    public var interfaceLanguage: String = ""
    public var udcProfile = [UDCProfile]()
    public var parentId: String = ""
    public var pathIdName: [String]?
    public var treeLevel: Int = 0
    public var isReference: Bool = false
    public var isEditableMode: Bool = false
    public var darkMode: Bool = false

    public init() {
        
    }
}
