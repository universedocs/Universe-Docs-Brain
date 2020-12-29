//
//  DocumentMapSearchDocumentResponse.swift
//  Universe Docs
//
//  Created by Kumar Muthaiah on 31/03/20.
//  Copyright © 2020 Universe Docs. All rights reserved.
//

import Foundation
import UDocsViewModel

public class DocumentMapSearchDocumentResponse : Codable {
    public var _id: String = ""
    public var uvcDocumentMapViewModel = [UVCDocumentMapViewModel]()
    
    public init() {
        
    }
}
