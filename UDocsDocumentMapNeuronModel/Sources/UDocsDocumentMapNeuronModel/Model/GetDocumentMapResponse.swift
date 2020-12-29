//
//  GetDocumentMapResponse.swift
//  UniversalBrainController
//
//  Created by Kumar Muthaiah on 20/12/18.
//

import Foundation
import UDocsViewModel

public class GetDocumentMapResponse : Codable {
    public var _id: String = ""
    public var uvcDocumentMapViewModel = UVCDocumentMapViewModel()
    public var pathIdName: [String]?
    public var isDynamicMap: Bool = false
    public var isReference: Bool = false
    public var isReferenceDocument: Bool = false
    
    public init() {
        
    }
}
