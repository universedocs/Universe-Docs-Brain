//
//  UPCUserApplicationProfile.swift
//  Universe_Docs_Profile
//
//  Created by Kumar Muthaiah on 26/10/18.
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

public class UPCUserApplicationProfile : Codable  {
    public var _id: String = ""
    public var userProfileId: String = ""
    public var upcApplicationProfileId: String = ""
    public var upcCompanyProfileId: String = ""
    public var upcUserApplicationAuthentication = [UPCUserApplicationAuthentication]()
    
    public init() {
        
    }
    
    static private func getName() -> String {
        return "UPCUserApplicationProfile"
    }
    
    static public func get(udbcDatabaseOrm: UDBCDatabaseOrm, profileId: String, upcApplicationProfileId: String, upcCompanyProfileId: String) -> DatabaseOrmResult<UPCUserApplicationProfile> {
        let databaseOrm = udbcDatabaseOrm.ormObject as! DatabaseOrm
        let mongokittenOrmResult = databaseOrm.find(collectionName: UPCUserApplicationProfile.getName(), dictionary: ["userProfileId": profileId, "upcApplicationProfileId": upcApplicationProfileId, "upcCompanyProfileId": upcCompanyProfileId], limitedTo: 0) as DatabaseOrmResult<UPCUserApplicationProfile>
       
        return mongokittenOrmResult
    }
    
    static public func get(udbcDatabaseOrm: UDBCDatabaseOrm, authenticationId: String, upcApplicationProfileId: String, upcCompanyProfileId: String) -> DatabaseOrmResult<UPCUserApplicationProfile> {
        let databaseOrm = udbcDatabaseOrm.ormObject as! DatabaseOrm
        let mongokittenOrmResult = databaseOrm.find(collectionName: UPCUserApplicationProfile.getName(), dictionary: ["upcUserApplicationAuthentication": ["$elemMatch": ["authenticationId": authenticationId ]], "upcApplicationProfileId": upcApplicationProfileId, "upcCompanyProfileId": upcCompanyProfileId], limitedTo: 0) as DatabaseOrmResult<UPCUserApplicationProfile>
        
        return mongokittenOrmResult
    }
    
    static public func save<T: Codable>(udbcDatabaseOrm: UDBCDatabaseOrm, object: T) -> DatabaseOrmResult<T> {
            let databaseOrm = udbcDatabaseOrm.ormObject as! DatabaseOrm
            return databaseOrm.save(collectionName: UPCUserApplicationProfile.getName(), object: object )

    }
    
    static public func updatePush<T: Codable>(udbcDatabaseOrm: UDBCDatabaseOrm, userProfileId: String, upcApplicationProfileId: String, upcCompanyProfileId: String, upcUserApplicationAuthentication: UPCUserApplicationAuthentication) -> DatabaseOrmResult<T> {
        let databaseOrm = udbcDatabaseOrm.ormObject as! DatabaseOrm
        return  databaseOrm.updatePush(collectionName: UPCUserApplicationProfile.getName(), whereDictionary: ["userProfileId": userProfileId, "upcApplicationProfileId": upcApplicationProfileId, "upcCompanyProfileId": upcCompanyProfileId], setDictionary: ["upcUserApplicationAuthentication": ["_id": upcUserApplicationAuthentication._id, "authenticationType": upcUserApplicationAuthentication.authenticationType, "authenticationId": upcUserApplicationAuthentication.authenticationId]]
        )
        
    }
    
    static public func updatePull<T: Codable>(udbcDatabaseOrm: UDBCDatabaseOrm, userProfileId: String, upcApplicationProfileId: String, upcCompanyProfileId: String, upcUserApplicationAuthentication: UPCUserApplicationAuthentication) -> DatabaseOrmResult<T> {
        let databaseOrm = udbcDatabaseOrm.ormObject as! DatabaseOrm
        return  databaseOrm.updatePull(collectionName: UPCUserApplicationProfile.getName(), whereDictionary: ["userProfileId": userProfileId, "upcApplicationProfileId": upcApplicationProfileId, "upcCompanyProfileId": upcCompanyProfileId], setDictionary: ["upcUserApplicationAuthentication": ["_id": upcUserApplicationAuthentication._id, "authenticationType": upcUserApplicationAuthentication.authenticationType, "authenticationId": upcUserApplicationAuthentication.authenticationId]]
        )
        
    }
}