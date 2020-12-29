//
//  UDCGraphEdgeLabel.swift
//  UDocsDocumentModel
//
//  Created by Kumar Muthaiah on 19/10/20.
//

import Foundation
import UDocsDatabaseModel
import UDocsDatabaseUtility
import UDocsDatabaseUtility
//Copyright 2020 Kumar Muthaiah
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
public class UDCGraphEdgeLabel : Codable {
    public var _id: String = ""
    public var idName: String = ""
    public var name: String = ""
    public var language: String = ""
    
    public init() {
        
    }
    
    public static func getAll(udbcDatabaseOrm: UDBCDatabaseOrm) -> DatabaseOrmResult<UDCGraphEdgeLabel> {
        let DatabaseOrm = udbcDatabaseOrm.ormObject as! DatabaseOrm
        return DatabaseOrm.getAll(collectionName: "UDCGraphEdgeLabel")
    }
    
    public static func getGraphEdgeLabelId(udcGraphEdgeLabel: [UDCGraphEdgeLabel], idName: String, language: String) -> String {
        for label in udcGraphEdgeLabel {
            if label.idName == idName && label.language == language {
                return label._id
            }
        }
        
        return ""
    }
    
}
