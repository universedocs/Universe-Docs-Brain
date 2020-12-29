//
//  GetDocumentMapByPathResponse.swift
//  UniversalBrainController
//
//  Created by Kumar Muthaiah on 20/12/18.
//

import Foundation
import UDocsViewModel

public class GetDocumentMapByPathResponse : Codable {
    public var _id: String = ""
    public var uvcDocumentMapViewModel = UVCDocumentMapViewModel()
    public var pathIdName = [String]()
    
    public init() {
        
    }
}
