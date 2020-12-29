//
//  UPCUserDeviceApplicationProfile.swift
//  Universe_Docs_Profile
//
//  Created by Kumar Muthaiah on 03/01/19.
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

public class USCUserDeviceApplicationProfile : Codable {
    public var _id: String = ""
    public var upcDeviceProfileId: String = ""
    public var deviceId: String = ""
    public var upcHumanProfileId: String = ""
    public var upcApplicationProfileId: String = ""
    public var upcCompanyProfileId: String = ""
    public var uscApplicationSecurityToken: String = ""
    
    public init() {
        
    }
    
    static public func getName() -> String {
        return "USCUserDeviceApplicationProfile"
    }
    
    static public func get(udbcDatabaseOrm: UDBCDatabaseOrm, upcApplicationProfileId: String, upcCompanyProfileId: String, deviceId: String) -> DatabaseOrmResult<USCUserDeviceApplicationProfile> {
        let databaseOrm = udbcDatabaseOrm.ormObject as! DatabaseOrm
        let mongokittenOrmResult = databaseOrm.find(collectionName: USCUserDeviceApplicationProfile.getName(), dictionary: ["upcApplicationProfileId": upcApplicationProfileId, "upcCompanyProfileId": upcCompanyProfileId, "deviceId": deviceId], limitedTo: 0) as DatabaseOrmResult<USCUserDeviceApplicationProfile>
        
        return mongokittenOrmResult
    }
    
    static public func save<T: Codable>(udbcDatabaseOrm: UDBCDatabaseOrm, object: T) -> DatabaseOrmResult<T> {
        
        let DatabaseOrm = udbcDatabaseOrm.ormObject as! DatabaseOrm
        return DatabaseOrm.save(collectionName: USCUserDeviceApplicationProfile.getName(), object: object )
        
    }
}
