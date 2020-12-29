//
//  UDCApplicationHumanLanguage.swift
//  Universe Docs Brain
//
//  Created by Kumar Muthaiah on 17/11/19.
//
//Copyright 2020 Kumar Muthaiah
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
import Foundation
import UDocsDatabaseModel
import UDocsDatabaseUtility

public class UDCApplicationHumanLanguage: Codable {
    public var _id: String = ""
    public var udcProfile = [UDCProfile]()
    public var udcHumanLanguageIdName: String = ""
    
    public init() {
        
    }
    
    public static func getName() -> String {
        return "UDCApplicationHumanLanguage"
    }
    
    public static func get(udcProfile: [UDCProfile], _ udbcDatabaseOrm: UDBCDatabaseOrm) -> DatabaseOrmResult<UDCApplicationHumanLanguage> {
           let databaseOrm = udbcDatabaseOrm.ormObject as! DatabaseOrm
        var all = [[String: Any]]()
        for udcp in udcProfile {
            if udcp.udcProfileItemIdName != "UDCProfileItem.Human" {
                let element: [String: Any] = ["udcProfileItemIdName": udcp.udcProfileItemIdName, "profileId": udcp.profileId]
                let elementMatch: [String: Any] = ["$elemMatch": element]
                all.append(elementMatch)
            }
        }
        let udcProfileAll: [String: Any] = ["$all": all]
        let document: [String: Any] = ["udcProfile": udcProfileAll]
        let databaseOrmResult = databaseOrm.find(collectionName: getName(), dictionary: document, limitedTo: Int(0.0)) as DatabaseOrmResult<UDCApplicationHumanLanguage>
           return databaseOrmResult
       }
       
}
