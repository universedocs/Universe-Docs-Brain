//
//  UDCDocumentObject.swift
//  Universe_Docs_Document
//
//  Created by Kumar Muthaiah on 12/11/18.
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

public class UDCDocumentRoot : Codable {
    public var _id: String = ""
    public var udcProfile = [UDCProfile]()
    public var rootId: String = ""
    public var language: String = ""
    
    public init() {
        
    }
    
    static public func getName() -> String {
        return "UDCDocumentRoot"
    }
    
    
    public static func getAll(collectionName: String, udbcDatabaseOrm: UDBCDatabaseOrm) -> DatabaseOrmResult<UDCDocument> {
        let DatabaseOrm = udbcDatabaseOrm.ormObject as! DatabaseOrm
        return DatabaseOrm.getAll(collectionName: collectionName)
    }
    
    static public func get(udbcDatabaseOrm: UDBCDatabaseOrm, udcProfile: [UDCProfile], language: String) -> DatabaseOrmResult<UDCDocumentRoot> {
           let databaseOrm = udbcDatabaseOrm.ormObject as! DatabaseOrm
           var all = [[String: Any]]()
           for udcp in udcProfile {
               let element: [String: Any] = ["udcProfileItemIdName": udcp.udcProfileItemIdName, "profileId": udcp.profileId]
               let elementMatch: [String: Any] = ["$elemMatch": element]
               all.append(elementMatch)
           }
           let udcProfileAll: [String: Any] = ["$all": all]
           return databaseOrm.find(collectionName: UDCDocumentRoot.getName(), dictionary: ["language": language, "udcProfile": udcProfileAll], limitedTo: 0) as DatabaseOrmResult<UDCDocumentRoot>
           
       }
       
    static public func get(collectionName: String, udbcDatabaseOrm: UDBCDatabaseOrm, id: String) -> DatabaseOrmResult<UDCDocumentRoot> {
        let databaseOrm = udbcDatabaseOrm.ormObject as! DatabaseOrm
        
        return databaseOrm.find(collectionName: collectionName, dictionary: ["_id": id], limitedTo: 0) as DatabaseOrmResult<UDCDocumentRoot>
        
    }
    
    static public func save<T: Codable>(udbcDatabaseOrm: UDBCDatabaseOrm, object: T) -> DatabaseOrmResult<T> {
        
        let DatabaseOrm = udbcDatabaseOrm.ormObject as! DatabaseOrm
        return DatabaseOrm.save(collectionName: UDCDocument.getName(), object: object )
        
    }
    
    
    static public func update<T: Codable>(udbcDatabaseOrm: UDBCDatabaseOrm, object: T) -> DatabaseOrmResult<T> {
        let udcRecipe = object as! UDCDocument
        let DatabaseOrm = udbcDatabaseOrm.ormObject as! DatabaseOrm
        return DatabaseOrm.update(collectionName: UDCDocument.getName(), id: udcRecipe._id, object: object )
        
    }
    
    
}
