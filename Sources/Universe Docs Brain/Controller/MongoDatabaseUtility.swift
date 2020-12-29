//
//  MongoDatabaseUtility.swift
//  UDocsBrainMongoDatabase
//
//  Created by Kumar Muthaiah on 28/06/20.
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
import UDocsMongoDatabaseUtility
import UDocsSecurityNeuronModel
import UDocsDocumentModel
import UDocsProfileModel
import UDocsViewModel
import UDocsNeuronModel
import UDocsNeuronUtility

public class MongoDatabaseUtility {
    public func copyDatabases(connectionDetails: [[String: Any]]) -> Bool {
        let fromDatabaseOrm: MongoDatabaseOrm = MongoDatabaseOrm()
        let databaseOrmResultConnect = fromDatabaseOrm.connect(userName: connectionDetails[0]["username"] as! String, password: connectionDetails[0]["password"] as! String, host: connectionDetails[0]["host"] as! String, port: connectionDetails[0]["port"] as! Int, databaseName: connectionDetails[0]["database"] as! String)
        if databaseOrmResultConnect.databaseOrmError.count > 0 {
            return false
        }
        let toDatabaseOrm: MongoDatabaseOrm = MongoDatabaseOrm()
        let databaseOrmResultConnectTo = toDatabaseOrm.connect(userName: connectionDetails[1]["username"] as! String, password: connectionDetails[1]["password"] as! String, host: connectionDetails[1]["host"] as! String, port: connectionDetails[1]["port"] as! Int, databaseName: connectionDetails[1]["database"] as! String)
        if databaseOrmResultConnectTo.databaseOrmError.count > 0 {
            return false
        }
   
        let result = copyCollections(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm)
        if !result {
            return result
        }
        
        return true
    }
    
    
    public func printCollectionCodes(databaseOrmConnection: DatabaseOrmConnection.Type) -> Bool {
        let databaseOrm: MongoDatabaseOrm = MongoDatabaseOrm()
        let databaseOrmResultConnect = databaseOrm.connect(userName: databaseOrmConnection.username, password: databaseOrmConnection.password, host: databaseOrmConnection.host, port: databaseOrmConnection.port, databaseName: databaseOrmConnection.database)
        if databaseOrmResultConnect.databaseOrmError.count > 0 {
            return false
        }
        
        let collectionNames = databaseOrm.getCollectionsNames().object
        for collectionName in collectionNames {
            printCode(collectionName: collectionName)
        }
        
        return true
    }
    
    public func deleteUnwantedTables(connectionDetails: [String: Any]) -> Bool {
        let databaseOrm: MongoDatabaseOrm = MongoDatabaseOrm()
        let databaseOrmResultConnect = databaseOrm.connect(userName: connectionDetails["username"] as! String, password: connectionDetails["password"] as! String, host: connectionDetails["host"] as! String, port: connectionDetails["port"] as! Int, databaseName: connectionDetails["database"] as! String)
        if databaseOrmResultConnect.databaseOrmError.count > 0 {
            return false
        }
        let neededCollections = ["USCUserDeviceApplicationProfile",
        "UDCDocumentFavourite",
        "UDCDocumentView",
        "UPCEMailProfile",
        "UPCApplicationProfile",
        "UDCDocumentMap",
        "UDCOptionMap",
        "UPCDeviceProfile",
        "UDCSentencePatternSubstitutionType",
        "UDCMathematicalItem",
        "UDCButton",
        "UDCDocumentMapNode",
        "UVCViewModel",
        "UDCDocument",
        "UPCCompanyProfile",
        "UDCSentencePatternCategory",
        "UDCOptionMapNode",
        "UDCSentencePattern",
        "UDCViewItem",
        "NeuronRequest",
        "UDCUserWordDictionary",
        "UDCSentencePatternCategoryType",
        "UDCDocumentViewType",
        "UPCUserApplicationProfile",
        "UDCPeopleCommunity",
        "UDCDocumentTime",
        "UDCDocumentQuery",
        "UVCViewItemType",
        "UDCMeasurement",
        "UDCApplicationProgramInterface",
        "UDCDocumentItemMap",
        "UDCSentenceGrammarPattern",
        "UDCHumanLanguage",
        "UDCAnalyticItem",
        "UDCSentencePatternExample",
        "UDCDocumentReferenceType",
        "UDCDocumentAccessType",
        "UDCApplicationDocumentType",
        "UDCDocumentItemMapNode",
        "UVCChoice",
        "UDCDocumentType",
        "UDCGrammarItem",
        "UPCHumanProfile",
        "USCApplicationSecurityToken",
        "USCSecurityTokenAuthentication",
        "USCUserNamePasswordAuthentication",
        "UDCApplicationInterfaceBar",
        "UDCApplicationHumanLanguage",
        "USCSecurityPinAuthentication",
        "UDCDocumentRecent",
        "UDCDocumentRoleType",
        "UVCDocumentMapViewModel",
        "UDCAnalyticItemCategory",
        "UDCUserSentencePattern",
        "UDCDocumentItem"]
        
        let databaseOrmResult = databaseOrm.getCollectionsNames() as DatabaseOrmResult<String>
        if databaseOrmResult.databaseOrmError.count > 0 {
            return false
        }
        for collectionFound in databaseOrmResult.object {
            if !neededCollections.contains(collectionFound) {
                print("Dropping collection: \(collectionFound)")
                let databaseOrmResultDrop = databaseOrm.dropCollection(collectionName: collectionFound)
                if databaseOrmResultDrop.databaseOrmError.count > 0 {
                    return false
                }
            }
        }
        
        return true
    }
    
    public func printCode(collectionName: String) {
        print("result = insert(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: \"\(collectionName)\", object: \(collectionName)())\n")
    }
    
    private func copyCollections(fromDatabaseOrm: MongoDatabaseOrm, toDatabaseOrm: MongoDatabaseOrm) -> Bool {
        var result = true
        
        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "USCUserDeviceApplicationProfile", object: USCUserDeviceApplicationProfile())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCDocumentFavourite", object: UDCDocumentFavourite())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCDocumentView", object: UDCDocumentView())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UPCEMailProfile", object: UPCEMailProfile())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UPCApplicationProfile", object: UPCApplicationProfile())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCDocumentMap", object: UDCDocumentMap())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCOptionMap", object: UDCOptionMap())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UPCDeviceProfile", object: UPCDeviceProfile())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCSentencePatternSubstitutionType", object: UDCSentencePatternSubstitutionType())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCMathematicalItem", object: UDCMathematicalItem())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCButton", object: UDCButton())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCDocumentMapNode", object: UDCDocumentMapNode())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UVCViewModel", object: UVCViewModel())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCDocument", object: UDCDocument())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UPCCompanyProfile", object: UPCCompanyProfile())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCSentencePatternCategory", object: UDCSentencePatternCategory())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCOptionMapNode", object: UDCOptionMapNode())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCSentencePattern", object: UDCSentencePattern())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCViewItem", object: UDCViewItem())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "NeuronRequest", object: NeuronRequest())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCUserWordDictionary", object: UDCUserWordDictionary())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCSentencePatternCategoryType", object: UDCSentencePatternCategoryType())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCDocumentViewType", object: UDCDocumentViewType())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UPCUserApplicationProfile", object: UPCUserApplicationProfile())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCPeopleCommunity", object: UDCPeopleCommunity())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCDocumentTime", object: UDCDocumentTime())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCDocumentQuery", object: UDCDocument())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UVCViewItemType", object: UVCViewItemType())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCMeasurement", object: UDCMeasurement())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCApplicationProgramInterface", object: UDCApplicationProgramInterface())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCDocumentItemMap", object: UDCDocumentItemMap())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCSentenceGrammarPattern", object: UDCSentenceGrammarPattern())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCHumanLanguage", object: UDCHumanLanguage())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCAnalyticItem", object: UDCAnalyticItem())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCSentencePatternExample", object: UDCSentencePatternExample())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCDocumentReferenceType", object: UDCDocumentReferenceType())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCDocumentAccessType", object: UDCDocumentAccessType())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCApplicationDocumentType", object: UDCApplicationDocumentType())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCDocumentItemMapNode", object: UDCDocumentItemMapNode())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UVCChoice", object: UVCChoice())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCDocumentType", object: UDCDocumentType())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCGrammarItem", object: UDCGrammarItem())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UPCHumanProfile", object: UPCHumanProfile())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "USCApplicationSecurityToken", object: USCApplicationSecurityToken())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "USCSecurityTokenAuthentication", object: USCSecurityTokenAuthentication())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "USCUserNamePasswordAuthentication", object: USCUserNamePasswordAuthentication())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCApplicationInterfaceBar", object: UDCApplicationInterfaceBar())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCApplicationHumanLanguage", object: UDCApplicationHumanLanguage())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "USCSecurityPinAuthentication", object: USCSecurityPinAuthentication())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCDocumentRecent", object: UDCDocumentRecent())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCDocumentRoleType", object: UDCDocumentRoleType())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UVCDocumentMapViewModel", object: UVCDocumentMapViewModel())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCAnalyticItemCategory", object: UDCAnalyticItemCategory())


        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCUserSentencePattern", object: UDCUserSentencePattern())

        result = copyCollection(fromDatabaseOrm: fromDatabaseOrm, toDatabaseOrm: toDatabaseOrm, collectionName: "UDCDocumentItem", object: UDCDocumentItem())
        
        return result
    }
    
    private func copyCollection<T: Codable>(fromDatabaseOrm: MongoDatabaseOrm, toDatabaseOrm: MongoDatabaseOrm, collectionName: String, object: T) -> Bool {
        
        let datbaseOrmResult = fromDatabaseOrm.getAll(collectionName: collectionName) as DatabaseOrmResult<T>
        if datbaseOrmResult.object.count == 0 {
            print("Failed collection: \(collectionName)...")
            return true
        }
        // If collection not found create it
        let databaseOrmResultCollectionCheck = toDatabaseOrm.isCollectionFound(collectionName: collectionName)
        if (databaseOrmResultCollectionCheck.databaseOrmError.count > 0) || databaseOrmResultCollectionCheck.object[0] == false {
            let databaseOrmResultCreateCollection = toDatabaseOrm.createCollection(collectionName: collectionName) as  DatabaseOrmResult<Bool>
            if databaseOrmResultCreateCollection.databaseOrmError.count > 0 {
                print("Failed collection: \(collectionName)...")
                return false
            }
        } else { // If found delete all records
            let databaseOrmResultRemove = toDatabaseOrm.remove(collectionName: collectionName, dictionary: ["_id": ["$ne": ""]]) as DatabaseOrmResult<T>
            if databaseOrmResultRemove.databaseOrmError.count > 0 {
                print("Failed collection: \(collectionName)...")
                return false
            }
        }
        // Transfer the data to the destination collection
        for object in datbaseOrmResult.object {
            let datbaseOrmResultSave = toDatabaseOrm.save(collectionName: collectionName, object: object)
            if datbaseOrmResultSave.databaseOrmError.count > 0 {
                print("Failed collection: \(collectionName)...")
                return false
            }
        }
        return true
        
    }
}
