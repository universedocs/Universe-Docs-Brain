//
//  UDCTest.swift
//  UDocsDocumentModel
//
//  Created by Kumar Muthaiah on 03/10/20.
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
import UDocsDatabaseUtility
import UDocsDatabaseModel
import UDocsMongoDatabaseUtility

public class UDCTest {
    public init() {
        
    }
    public func start() {
        //        changeTamilToTamil()
        //        addEdge(collectionName: "UDCDocumentMap")
//        let idTa: [String] = ["5fb3d50eafadc6598c7e61a5", "5fb3d528afadc6598c7e623a", "5fb3d623afadc6598c7e6278", "5fb3d62aafadc6598c7e62b6", "5fb3d638afadc6598c7e62f4", "5fb3d853afadc6598c7e6332", "5fb3d863afadc6598c7e6370", "5fb3d873afadc6598c7e63ae", "5fb3d8aeafadc6598c7e64b2", "5fb3d8b9afadc6598c7e64f0", "5fb3d8c4afadc6598c7e652e", "5fb3d8d2afadc6598c7e6567", "5fb3d8d8afadc6598c7e65a0", "5fb3d8ddafadc6598c7e65d9", "5fb3d8e4afadc6598c7e6612", "5fb3d8ebafadc6598c7e664b", "5fb3d8f0afadc6598c7e6684", "5fb3d8f6afadc6598c7e66bd", "5fb3d8fcafadc6598c7e66f6", "5fb3d904afadc6598c7e672f", "5fb3d909afadc6598c7e6768", "5fb3d90eafadc6598c7e67a1", "5fb3d917afadc6598c7e67da", "5fb3d91dafadc6598c7e6813", "5fb3d922afadc6598c7e684c", "5fb3d928afadc6598c7e6885", "5fb3d932afadc6598c7e68be", "5fb3d937afadc6598c7e68f7", "5fb3d93bafadc6598c7e6930", "5fb3d941afadc6598c7e6969", "5fb3d965afadc6598c7e6b8d", "5fb3d970afadc6598c7e6bc6", "5fb3d976afadc6598c7e6bff", "5fb3d97cafadc6598c7e6c38", "5fb3d986afadc6598c7e6c71", "5fb3d98cafadc6598c7e6caa", "5fb3d990afadc6598c7e6ce3", "5fb3d996afadc6598c7e6d1c", "5fb3d99cafadc6598c7e6d55", "5fb3d9a7afadc6598c7e6d8e", "5fb3d9abafadc6598c7e6dc7", "5fb3d9b1afadc6598c7e6e00", "5fb3d9b7afadc6598c7e6e39", "5fb3d9c4afadc6598c7e6e80", "5fb3d9c9afadc6598c7e6eb9", "5fb3d9d1afadc6598c7e6ef2", "5fb3d9d8afadc6598c7e6f2b", "5fb3d9ddafadc6598c7e6f64", "5fb3d9e2afadc6598c7e6f9d", "5fb3d9eeafadc6598c7e6fd6", "5fb3d9f4afadc6598c7e700f", "5fb3d9feafadc6598c7e7080", "5fb3da04afadc6598c7e70b9", "5fb3da10afadc6598c7e70f2", "5fb3da15afadc6598c7e712b", "5fb3da1aafadc6598c7e7164", "5fb3da1fafadc6598c7e719d", "5fb3da23afadc6598c7e71d6", "5fb3da28afadc6598c7e720f", "5fb3da2dafadc6598c7e7248", "5fb3da35afadc6598c7e7281", "5fb3da3aafadc6598c7e72ba", "5fb3da40afadc6598c7e72f3", "5fb3da4cafadc6598c7e732c", "5fb3da61afadc6598c7e7381", "5fb3da67afadc6598c7e73ba", "5fb3da6dafadc6598c7e73f3", "5fb3da84afadc6598c7e742c", "5fb3da8aafadc6598c7e7465", "5fb3da91afadc6598c7e749e", "5fb3da97afadc6598c7e74d7", "5fb3da9eafadc6598c7e7510", "5fb40305cce76864a71c2071", "5fb40313cce76864a71c20b8", "5fb4031bcce76864a71c20f1", "5fb40326cce76864a71c2138", "5fb4032acce76864a71c2171", "5fb40330cce76864a71c21aa", "5fb403c7cce76864a71c21e3", "5fb403cdcce76864a71c221c", "5fb403d2cce76864a71c2255", "5fb403ddcce76864a71c229c", "5fb403e2cce76864a71c22d5", "5fb403e6cce76864a71c230e", "5fb403eccce76864a71c2347", "5fb403f0cce76864a71c2380", "5fb403f4cce76864a71c23b9", "5fb403f8cce76864a71c23f2", "5fb403fdcce76864a71c242b", "5fb40403cce76864a71c2464", "5fb4040fcce76864a71c24ab", "5fb40415cce76864a71c24e4", "5fb4041ccce76864a71c251d", "5fb40421cce76864a71c2556", "5fb4042bcce76864a71c259d", "5fb4042fcce76864a71c25d6", "5fe18b30a9cbc07ce977a427", "5fe196b8fff2c36ecf05f0fc", "5fe196c1fff2c36ecf05f135", "5fe196cffff2c36ecf05f16e", "5fe196d6fff2c36ecf05f1a7", "5fe196dbfff2c36ecf05f1e0", "5fe196e0fff2c36ecf05f219", "5fe196e6fff2c36ecf05f252", "5fe196ebfff2c36ecf05f28b", "5fe196f1fff2c36ecf05f2c4", "5fe196f7fff2c36ecf05f2fd", "5fe196fcfff2c36ecf05f336", "5fe19702fff2c36ecf05f36f", "5fe19707fff2c36ecf05f3a8"]
//        let idEn: [String] = ["5fb3d4d9afadc6598c7e617e", "5fb3d51cafadc6598c7e620e", "5fb3d529afadc6598c7e624c", "5fb3d624afadc6598c7e628a", "5fb3d62bafadc6598c7e62c8", "5fb3d82aafadc6598c7e6306", "5fb3d853afadc6598c7e6344", "5fb3d864afadc6598c7e6382", "5fb3d8a5afadc6598c7e6486", "5fb3d8b0afadc6598c7e64c4", "5fb3d8bfafadc6598c7e6502", "5fb3d8cdafadc6598c7e6540", "5fb3d8d3afadc6598c7e6579", "5fb3d8d9afadc6598c7e65b2", "5fb3d8deafadc6598c7e65eb", "5fb3d8e5afadc6598c7e6624", "5fb3d8ebafadc6598c7e665d", "5fb3d8f1afadc6598c7e6696", "5fb3d8f7afadc6598c7e66cf", "5fb3d8fdafadc6598c7e6708", "5fb3d904afadc6598c7e6741", "5fb3d909afadc6598c7e677a", "5fb3d90eafadc6598c7e67b3", "5fb3d918afadc6598c7e67ec", "5fb3d91eafadc6598c7e6825", "5fb3d923afadc6598c7e685e", "5fb3d929afadc6598c7e6897", "5fb3d933afadc6598c7e68d0", "5fb3d937afadc6598c7e6909", "5fb3d93cafadc6598c7e6942", "5fb3d941afadc6598c7e697b", "5fb3d968afadc6598c7e6b9f", "5fb3d971afadc6598c7e6bd8", "5fb3d977afadc6598c7e6c11", "5fb3d97dafadc6598c7e6c4a", "5fb3d986afadc6598c7e6c83", "5fb3d98cafadc6598c7e6cbc", "5fb3d991afadc6598c7e6cf5", "5fb3d997afadc6598c7e6d2e", "5fb3d99dafadc6598c7e6d67", "5fb3d9a8afadc6598c7e6da0", "5fb3d9acafadc6598c7e6dd9", "5fb3d9b2afadc6598c7e6e12", "5fb3d9b8afadc6598c7e6e4b", "5fb3d9c5afadc6598c7e6e92", "5fb3d9cbafadc6598c7e6ecb", "5fb3d9d2afadc6598c7e6f04", "5fb3d9d9afadc6598c7e6f3d", "5fb3d9deafadc6598c7e6f76", "5fb3d9e3afadc6598c7e6faf", "5fb3d9eeafadc6598c7e6fe8", "5fb3d9f5afadc6598c7e7021", "5fb3d9faafadc6598c7e7059", "5fb3d9ffafadc6598c7e7092", "5fb3da04afadc6598c7e70cb", "5fb3da11afadc6598c7e7104", "5fb3da16afadc6598c7e713d", "5fb3da1aafadc6598c7e7176", "5fb3da1fafadc6598c7e71af", "5fb3da24afadc6598c7e71e8", "5fb3da29afadc6598c7e7221", "5fb3da2eafadc6598c7e725a", "5fb3da36afadc6598c7e7293", "5fb3da3bafadc6598c7e72cc", "5fb3da41afadc6598c7e7305", "5fb3da4dafadc6598c7e733e", "5fb3da62afadc6598c7e7393", "5fb3da68afadc6598c7e73cc", "5fb3da7fafadc6598c7e7405", "5fb3da85afadc6598c7e743e", "5fb3da8cafadc6598c7e7477", "5fb3da92afadc6598c7e74b0", "5fb3da98afadc6598c7e74e9", "5fb40303cce76864a71c204a", "5fb40306cce76864a71c2083", "5fb40314cce76864a71c20ca", "5fb4031bcce76864a71c2103", "5fb40327cce76864a71c214a", "5fb4032bcce76864a71c2183", "5fb40330cce76864a71c21bc", "5fb403c8cce76864a71c21f5", "5fb403cecce76864a71c222e", "5fb403d3cce76864a71c2267", "5fb403decce76864a71c22ae", "5fb403e2cce76864a71c22e7", "5fb403e7cce76864a71c2320", "5fb403eccce76864a71c2359", "5fb403f1cce76864a71c2392", "5fb403f5cce76864a71c23cb", "5fb403f9cce76864a71c2404", "5fb403fecce76864a71c243d", "5fb40404cce76864a71c2476", "5fb40410cce76864a71c24bd", "5fb40416cce76864a71c24f6", "5fb4041dcce76864a71c252f", "5fb40422cce76864a71c2568", "5fb4042bcce76864a71c25af", "5fe18410c1910c2a05301e25", "5fe18c58561ab51af13a6fa3", "5fe196bbfff2c36ecf05f10e", "5fe196c4fff2c36ecf05f147", "5fe196d0fff2c36ecf05f180", "5fe196d7fff2c36ecf05f1b9", "5fe196dcfff2c36ecf05f1f2", "5fe196e1fff2c36ecf05f22b", "5fe196e9fff2c36ecf05f264", "5fe196effff2c36ecf05f29d", "5fe196f5fff2c36ecf05f2d6", "5fe196fafff2c36ecf05f30f", "5fe19700fff2c36ecf05f348", "5fe19705fff2c36ecf05f381"]
//        let fridEn = ["5fafa5c9c7d1a21a9d05d831"]
//        updateDocumentItemReference(id: fridEn, collectionName: "UDCFoodRecipe", udcDocumentTypeIdName: "UDCDocumentType.FoodRecipe")
//        updateDocumentItemReference(id: idTa, collectionName: "UDCDocumentItemConfiguration", udcDocumentTypeIdName: "UDCDocumentType.DocumentItemConfiguration")
//        updateDocumentItemConfigurationDocuments(language: "ta")
//        updateDocumentItemConfigurationDocuments(language: "ta")
        listDocumentRootDocuments(udcDocumentTypeIdName: "UDCDocumentType.FoodRecipe", documentLanguage: "en")
    }
    
    public func listDocumentRootDocuments(udcDocumentTypeIdName: String, documentLanguage: String) {
//        var databaseOrm: DatabaseOrm = MongoDatabaseOrm()
//        var udbcDatabaseOrm: UDBCDatabaseOrm = UDBCMongoDatabaseOrm()
//        var udcProfileArray = [UDCProfile]()
//        let udcProfile = UDCProfile()
//        udcProfile.profileId = "UPCCompanyProfile.KumarMuthaiah"
//        udcProfile.udcProfileItemIdName =  "UDCProfileItem.Company"
//        udcProfileArray.append(udcProfile)
//        udcProfile.profileId = "UPCApplicationProfile.UniverseDocs"
//        udcProfile.udcProfileItemIdName = "UDCProfileItem.Application"
//        udcProfileArray.append(udcProfile)
//        udcProfile.profileId = "UPCHumanProfile.KumarMuthaiah"
//        udcProfile.udcProfileItemIdName = "UDCProfileItem.Human"
//        udcProfileArray.append(udcProfile)
//        
//        do {
//            let databaesOrmResult = databaseOrm.connect(userName: DatabaseOrmConnection.username, password: DatabaseOrmConnection.password, host: DatabaseOrmConnection.host, port: DatabaseOrmConnection.port, databaseName: DatabaseOrmConnection.database)
//            udbcDatabaseOrm.ormObject = databaseOrm as AnyObject
//            udbcDatabaseOrm.type = UDBCDatabaseType.MongoDatabase.rawValue
//            try UDCDocumentGraphModel.loadPredefinedGraphLabels(udbcDatabaseOrm: udbcDatabaseOrm)
//            let documentTypeName = udcDocumentTypeIdName.components(separatedBy: ".")[1]
//            let  databaseOrmResultUDCDocument = UDCDocumentRoot.get(udbcDatabaseOrm: udbcDatabaseOrm, udcProfile: udcProfileArray, idName: "UDCDocumentRoot.\(documentTypeName)Documents", language: documentLanguage)
//            if databaseOrmResultUDCDocument.databaseOrmError.count > 0 {
//                
//                return
//            }
//            let udcDocumentRoot = databaseOrmResultUDCDocument.object[0]
//            let udcDocumentItemDocument = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm, id: udcDocumentRoot.rootId).object[0]
//            let udcDocumentItemDocumentChild = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm, id: udcDocumentItemDocument.getChildrenEdgeId(documentLanguage)[0]).object[0]
//            for child in udcDocumentItemDocumentChild.getChildrenEdgeId(documentLanguage) {
//                let datasbaseOrmResultUdcDocumentItemDocumentChild = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm, id: child)
//                let udcDocumentItemDocumentChild = datasbaseOrmResultUdcDocumentItemDocumentChild.object[0]
//                print("\(udcDocumentItemDocumentChild._id): \(udcDocumentItemDocumentChild.idName): \(udcDocumentItemDocumentChild.name)")
//                
//            }
//        } catch {
//            print(error)
//        }
//        
//        defer {
//            databaseOrm.disconnect()
//        }
    }
    
    public func listConfigurationItems(language: String) {
           var databaseOrm: DatabaseOrm = MongoDatabaseOrm()
           var udbcDatabaseOrm: UDBCDatabaseOrm = UDBCMongoDatabaseOrm()
           var udcProfileArray = [UDCProfile]()
           let udcProfile = UDCProfile()
           udcProfile.profileId = "UPCCompanyProfile.KumarMuthaiah"
           udcProfile.udcProfileItemIdName =  "UDCProfileItem.Company"
           udcProfileArray.append(udcProfile)
           udcProfile.profileId = "UPCApplicationProfile.UniverseDocs"
           udcProfile.udcProfileItemIdName = "UDCProfileItem.Application"
           udcProfileArray.append(udcProfile)
           udcProfile.profileId = "UPCHumanProfile.KumarMuthaiah"
           udcProfile.udcProfileItemIdName = "UDCProfileItem.Human"
           udcProfileArray.append(udcProfile)
           
           do {
               let databaesOrmResult = databaseOrm.connect(userName: DatabaseOrmConnection.username, password: DatabaseOrmConnection.password, host: DatabaseOrmConnection.host, port: DatabaseOrmConnection.port, databaseName: DatabaseOrmConnection.database)
               udbcDatabaseOrm.ormObject = databaseOrm as AnyObject
               udbcDatabaseOrm.type = UDBCDatabaseType.MongoDatabase.rawValue
               try UDCDocumentGraphModel.loadPredefinedGraphLabels(udbcDatabaseOrm: udbcDatabaseOrm)
               
            let databaseOrmResultmodel = UDCDocument.get(udbcDatabaseOrm: udbcDatabaseOrm, udcDocumentTypeIdName: "UDCDocumentType.DocumentItemConfiguration", language: language)
               if databaseOrmResultmodel.databaseOrmError.count > 0 {
                   print(databaseOrmResultmodel.databaseOrmError[0].description)
                   return
               }
               let udcDocumentItem = databaseOrmResultmodel.object
               for item in udcDocumentItem {
                print("\(item.idName): \(item.name)")
               }
               
           } catch {
               print(error)
           }
           
           defer {
               databaseOrm.disconnect()
           }
       }
    public func updateDocumentItemConfigurationDocuments(language: String) {
        var databaseOrm: DatabaseOrm = MongoDatabaseOrm()
        var udbcDatabaseOrm: UDBCDatabaseOrm = UDBCMongoDatabaseOrm()
        var udcProfileArray = [UDCProfile]()
        let udcProfile = UDCProfile()
        udcProfile.profileId = "UPCCompanyProfile.KumarMuthaiah"
        udcProfile.udcProfileItemIdName =  "UDCProfileItem.Company"
        udcProfileArray.append(udcProfile)
        udcProfile.profileId = "UPCApplicationProfile.UniverseDocs"
        udcProfile.udcProfileItemIdName = "UDCProfileItem.Application"
        udcProfileArray.append(udcProfile)
        udcProfile.profileId = "UPCHumanProfile.KumarMuthaiah"
        udcProfile.udcProfileItemIdName = "UDCProfileItem.Human"
        udcProfileArray.append(udcProfile)
        
        do {
            let databaesOrmResult = databaseOrm.connect(userName: DatabaseOrmConnection.username, password: DatabaseOrmConnection.password, host: DatabaseOrmConnection.host, port: DatabaseOrmConnection.port, databaseName: DatabaseOrmConnection.database)
            udbcDatabaseOrm.ormObject = databaseOrm as AnyObject
            udbcDatabaseOrm.type = UDBCDatabaseType.MongoDatabase.rawValue
            try UDCDocumentGraphModel.loadPredefinedGraphLabels(udbcDatabaseOrm: udbcDatabaseOrm)
            
            let databaseOrmResultmodel = UDCDocumentGraphModel.getWithConfigurations(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm, language: language)
            if databaseOrmResultmodel.databaseOrmError.count > 0 {
                print(databaseOrmResultmodel.databaseOrmError[0].description)
                return
            }
            let udcDocumentItem = databaseOrmResultmodel.object
            for item in udcDocumentItem {
                if item.objectName == "UDCDocumentItemConfiguration" {
//                    print("checking... \(item.name)")
                    let databaseOrmResultUDCDocument = UDCDocument.get(udbcDatabaseOrm: udbcDatabaseOrm, udcProfile: udcProfileArray, udcDocumentTypeIdName: "UDCDocumentType.DocumentItem", idName: "UDCDocument.DocumentItemConfigurationDocuments", language: language)
                    let databaseOrmResultUDCDocumentModel = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm, id: databaseOrmResultUDCDocument.object[0].udcDocumentGraphModelId)
                    let databaseOrmResultUDCDocumentModelChild = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm, id: databaseOrmResultUDCDocumentModel.object[0].getChildrenEdgeId(language)[0])
                    var found = false
                    for child in databaseOrmResultUDCDocumentModelChild.object[0].getChildrenEdgeId(language) {
                        let databaseOrmResultUDCDocumentItem = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm, id: child)
                        if databaseOrmResultUDCDocumentItem.object[0].idName == item.idName {
                            found = true
//                            print("Updated")
                            item.objectId = databaseOrmResultUDCDocumentItem.object[0]._id
                            let databaseOrmResultUDCDocumentItemSave = UDCDocumentGraphModel.update(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm, object: item)
                            if databaseOrmResultUDCDocumentItemSave.databaseOrmError.count > 0 {
                                print("Error updating \(item.name)")
                            }
                            
                            break
                        }
                    }
                    if !found {
                       
                                                   print("Not updated: \(item.name)")
                                                  
                                               
                    }
                }
            }
            
        } catch {
            print(error)
        }
        
        defer {
            databaseOrm.disconnect()
        }
    }
    
    private func createDocumentItems(documentType: String, modelId: String, language: String) {
        var databaseOrm: DatabaseOrm = MongoDatabaseOrm()
        var udbcDatabaseOrm: UDBCDatabaseOrm = UDBCMongoDatabaseOrm()
        var udcProfileArray = [UDCProfile]()
        let udcProfile = UDCProfile()
        udcProfile.profileId = "UPCCompanyProfile.KumarMuthaiah"
        udcProfile.udcProfileItemIdName =  "UDCProfileItem.Company"
        udcProfileArray.append(udcProfile)
        udcProfile.profileId = "UPCApplicationProfile.UniverseDocs"
        udcProfile.udcProfileItemIdName = "UDCProfileItem.Application"
        udcProfileArray.append(udcProfile)
        udcProfile.profileId = "UPCHumanProfile.KumarMuthaiah"
        udcProfile.udcProfileItemIdName = "UDCProfileItem.Human"
        udcProfileArray.append(udcProfile)
        
        do {
            let databaesOrmResult = databaseOrm.connect(userName: DatabaseOrmConnection.username, password: DatabaseOrmConnection.password, host: DatabaseOrmConnection.host, port: DatabaseOrmConnection.port, databaseName: DatabaseOrmConnection.database)
            udbcDatabaseOrm.ormObject = databaseOrm as AnyObject
            udbcDatabaseOrm.type = UDBCDatabaseType.MongoDatabase.rawValue
            try UDCDocumentGraphModel.loadPredefinedGraphLabels(udbcDatabaseOrm: udbcDatabaseOrm)
            
            let databaseOrmResultmodel = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm, id: modelId)
            if databaseOrmResultmodel.databaseOrmError.count > 0 {
                print(databaseOrmResultmodel.databaseOrmError[0].description)
                return
            }
            let model = databaseOrmResultmodel.object[0]
            let databaseOrmResultmodelChild = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm, id: model.getChildrenEdgeId(language)[0])
            if databaseOrmResultmodelChild.databaseOrmError.count > 0 {
                print(databaseOrmResultmodelChild.databaseOrmError[0].description)
                return
            }
            let modelChild = databaseOrmResultmodelChild.object[0]
            let databaseOrmResultDocument = UDCDocument.get(udbcDatabaseOrm: udbcDatabaseOrm, udcDocumentTypeIdName: documentType, language: language)
            if databaseOrmResultDocument.databaseOrmError.count > 0 {
                print(databaseOrmResultDocument.databaseOrmError[0].description)
                return
            }
            let document = databaseOrmResultDocument.object
            for doc in document {
                let newModel = UDCDocumentGraphModel()
                let spdgvPhoto = UDCSentencePatternDataGroupValue()
                spdgvPhoto.udcDocumentId = doc._id
                spdgvPhoto.category = "UDCGrammarCategory.CommonNoun"
                spdgvPhoto.uvcViewItemType = "UVCViewItemType.Photo"
                spdgvPhoto.itemType = "UDCJson.String"
                spdgvPhoto.item = ""
                spdgvPhoto.itemId = ""
                spdgvPhoto.endCategoryId = ""
                spdgvPhoto.endCategoryIdName = "UDCDocumentItem.General"
                newModel.appendSentencePatternGroupValue(newValue: spdgvPhoto)
                if doc.language == "ta" {
                    let databaseOrmResultDocumentLan = UDCDocument.get(udbcDatabaseOrm: udbcDatabaseOrm, documentGroupId: doc.documentGroupId, notEqualsId: doc._id, language: "en")
                    if databaseOrmResultDocumentLan.databaseOrmError.count > 0 {
                        print(databaseOrmResultDocumentLan.databaseOrmError[0].description)
                        return
                    }
                    let documentLan = databaseOrmResultDocumentLan.object[0]
                    let databaseOrmResultmodelChildEn = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm, id: documentLan.udcDocumentGraphModelId)
                    if databaseOrmResultmodelChildEn.databaseOrmError.count > 0 {
                        print("Error in getting")
                        return
                    }
                    
                    let modelChildEn = databaseOrmResultmodelChildEn.object[0]
                    let spdgvEn = UDCSentencePatternDataGroupValue()
                    spdgvEn.udcDocumentId = doc._id
                    spdgvEn.category = "UDCGrammarCategory.CommonNoun"
                    spdgvEn.uvcViewItemType = "UVCViewItemType.Text"
                    spdgvEn.itemType = "UDCJson.String"
                    spdgvEn.item = modelChildEn.name
                    spdgvEn.itemId = modelChildEn._id
                    spdgvEn.endCategoryId = modelChildEn._id
                    spdgvEn.endCategoryIdName = modelChildEn.idName
                    let databaseOrmResultmodelChildChildEn = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm, id: modelChildEn.getChildrenEdgeId(modelChildEn.language)[0])
                    if databaseOrmResultmodelChildChildEn.databaseOrmError.count > 0 {
                        print("Error in getting")
                        return
                    }
                    let modelChildChildEn = databaseOrmResultmodelChildChildEn.object[0]
                    spdgvEn.itemId = modelChildChildEn._id
                    spdgvEn.itemIdName = modelChildChildEn.idName
                    newModel.appendSentencePatternGroupValue(newValue: spdgvEn)
                    
                    let spdgvInterfacePhoto = UDCSentencePatternDataGroupValue()
                    spdgvInterfacePhoto.udcDocumentId = doc._id
                    spdgvInterfacePhoto.category = "UDCGrammarCategory.CommonNoun"
                    spdgvInterfacePhoto.uvcViewItemType = "UVCViewItemType.Photo"
                    spdgvInterfacePhoto.item = ""
                    spdgvInterfacePhoto.itemId = ""
                    spdgvInterfacePhoto.itemType = "UDCJson.String"
                    spdgvInterfacePhoto.itemId = "5e1c861045627a5634112a71"
                    spdgvInterfacePhoto.itemIdName = "UDCDocumentItem.TranslationSeparator"
                    spdgvInterfacePhoto.endCategoryId = "5e1c852b45627a563411274e"
                    spdgvInterfacePhoto.endCategoryIdName = "UDCDocumentItem.DocumentInterfacePhoto"
                    newModel.appendSentencePatternGroupValue(newValue: spdgvInterfacePhoto)
                }

                let spdgv = UDCSentencePatternDataGroupValue()
                spdgv.category = "UDCGrammarCategory.CommonNoun"
                spdgv.uvcViewItemType = "UVCViewItemType.Text"
                spdgv.udcDocumentId = doc._id
                spdgv.endSubCategoryId = ""
                spdgv.endSubCategoryIdName = ""
                let databaseOrmResultmodelChild = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm, id: doc.udcDocumentGraphModelId)
                if databaseOrmResultmodelChild.databaseOrmError.count > 0 {
                    print("Error in getting")
                    return
                }
                    
                
                let modelChild = databaseOrmResultmodelChild.object[0]
                spdgv.endCategoryId = modelChild._id
                spdgv.endCategoryIdName = modelChild.idName
                let databaseOrmResultmodelChildChild = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm, id: modelChild.getChildrenEdgeId(modelChild.language)[0])
                if databaseOrmResultmodelChildChild.databaseOrmError.count > 0 {
                    print("Error in getting")
                    return
                }
                let modelChildChild = databaseOrmResultmodelChildChild.object[0]
                spdgv.itemId = modelChildChild._id
                spdgv.itemIdName = modelChildChild.idName
                spdgv.item = modelChildChild.name
                spdgv.itemId = modelChildChild._id
                newModel.appendSentencePatternGroupValue(newValue: spdgv)
                
                newModel._id = try udbcDatabaseOrm.generateId()
                newModel.name = modelChild.name
                newModel.idName = modelChild.idName
                newModel.language = modelChild.language
                newModel.udcProfile = modelChild.udcProfile
                newModel.udcDocumentTime = modelChild.udcDocumentTime
                let modelSave = UDCDocumentGraphModel.save(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm, object: newModel)
                if modelSave.databaseOrmError.count > 0 {
                    print("Error in updating")
                    
                    return
                }
                
                model.appendEdgeId(UDCDocumentGraphModel.getGraphEdgeLabelId("UDCGraphEdgeLabel.Children", language), [newModel._id])
                let modelParentSave = UDCDocumentGraphModel.update(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm, object: model)
                if modelParentSave.databaseOrmError.count > 0 {
                    print("Error in updating")
                    
                    return
                }
            }
        } catch {
            print(error)
        }
        
        defer {
            databaseOrm.disconnect()
        }
    }
    
    private func updateDocumentItemReference(id: [String], collectionName: String, udcDocumentTypeIdName: String) {
        var databaseOrm: DatabaseOrm = MongoDatabaseOrm()
        var udbcDatabaseOrm: UDBCDatabaseOrm = UDBCMongoDatabaseOrm()
        var udcProfileArray = [UDCProfile]()
        let udcProfile = UDCProfile()
        udcProfile.profileId = "UPCCompanyProfile.KumarMuthaiah"
        udcProfile.udcProfileItemIdName =  "UDCProfileItem.Company"
        udcProfileArray.append(udcProfile)
        udcProfile.profileId = "UPCApplicationProfile.UniverseDocs"
        udcProfile.udcProfileItemIdName = "UDCProfileItem.Application"
        udcProfileArray.append(udcProfile)
        udcProfile.profileId = "UPCHumanProfile.KumarMuthaiah"
        udcProfile.udcProfileItemIdName = "UDCProfileItem.Human"
        udcProfileArray.append(udcProfile)
        do {
            
            let databaesOrmResult = databaseOrm.connect(userName: DatabaseOrmConnection.username, password: DatabaseOrmConnection.password, host: DatabaseOrmConnection.host, port: DatabaseOrmConnection.port, databaseName: DatabaseOrmConnection.database)
            udbcDatabaseOrm.ormObject = databaseOrm as AnyObject
            udbcDatabaseOrm.type = UDBCDatabaseType.MongoDatabase.rawValue
            try UDCDocumentGraphModel.loadPredefinedGraphLabels(udbcDatabaseOrm: udbcDatabaseOrm)
            
            for i in id {
                let databaseOrmResultmodel = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm, id: i)
                if databaseOrmResultmodel.databaseOrmError.count > 0 {
                    print(databaseOrmResultmodel.databaseOrmError[0].description)
                    return
                }
                let model = databaseOrmResultmodel.object[0]
                let databaseOrmResultDocument = UDCDocument.get(udbcDatabaseOrm: udbcDatabaseOrm, udcProfile: udcProfileArray, idName: model.idName.replacingOccurrences(of: "UDCDocumentItem", with: "UDCDocument"), udcDocumentTypeIdName: udcDocumentTypeIdName, language: model.language)
                if databaseOrmResultDocument.databaseOrmError.count > 0 {
                    continue
                }
                let document = databaseOrmResultDocument.object[0]
                let databaseOrmResultDocumentEn = UDCDocument.get(udbcDatabaseOrm: udbcDatabaseOrm, udcProfile: udcProfileArray, idName: model.idName.replacingOccurrences(of: "UDCDocumentItem", with: "UDCDocument"), udcDocumentTypeIdName: udcDocumentTypeIdName, language: "en")
                let documentEn = databaseOrmResultDocumentEn.object[0]
                if document.idName == model.idName.replacingOccurrences(of: "UDCDocumentItem", with: "UDCDocument") && model.language == document.language {
                    if model.getSentencePatternDataGroupValue().count < 3 && model.language == "ta" {
                        continue
                    }
                    if model.getSentencePatternDataGroupValue().count < 2 && model.language == "en" {
                        continue
                    }
                    model.removeSentencePatternGroupValue()
                    let spdgvPhoto = UDCSentencePatternDataGroupValue()
                    spdgvPhoto.udcDocumentId = documentEn._id
                    spdgvPhoto.category = "UDCGrammarCategory.CommonNoun"
                    spdgvPhoto.uvcViewItemType = "UVCViewItemType.Photo"
                    spdgvPhoto.itemType = "UDCJson.String"
                    spdgvPhoto.item = ""
                    spdgvPhoto.itemId = ""
                    spdgvPhoto.endCategoryId = ""
                    spdgvPhoto.endCategoryIdName = "UDCDocumentItem.General"
                    model.appendSentencePatternGroupValue(newValue: spdgvPhoto)
                    print("Found: \(model.name): \(model.idName): \(model._id)")
                    if model.language == "ta" {
                        let databaseOrmResultmodelChildEn = UDCDocumentGraphModel.get(collectionName: collectionName, udbcDatabaseOrm: udbcDatabaseOrm, id: documentEn.udcDocumentGraphModelId)
                        if databaseOrmResultmodelChildEn.databaseOrmError.count > 0 {
                            print("Error in getting")
                            return
                        }
                        
                        let modelChildEn = databaseOrmResultmodelChildEn.object[0]
                        let spdgvEn = UDCSentencePatternDataGroupValue()
                        spdgvEn.udcDocumentId = documentEn._id
                        spdgvEn.category = "UDCGrammarCategory.CommonNoun"
                        spdgvEn.uvcViewItemType = "UVCViewItemType.Text"
                        spdgvEn.itemType = "UDCJson.String"
                        spdgvEn.item = modelChildEn.name
                        spdgvEn.itemId = modelChildEn._id
                        spdgvEn.endCategoryId = modelChildEn._id
                        spdgvEn.endCategoryIdName = modelChildEn.idName
                        let databaseOrmResultmodelChildChildEn = UDCDocumentGraphModel.get(collectionName: collectionName, udbcDatabaseOrm: udbcDatabaseOrm, id: modelChildEn.getChildrenEdgeId(modelChildEn.language)[0])
                        if databaseOrmResultmodelChildChildEn.databaseOrmError.count > 0 {
                            print("Error in getting")
                            return
                        }
                        let modelChildChildEn = databaseOrmResultmodelChildChildEn.object[0]
                        spdgvEn.itemId = modelChildChildEn._id
                        spdgvEn.itemIdName = modelChildChildEn.idName
                        model.appendSentencePatternGroupValue(newValue: spdgvEn)
                        
                        let spdgvInterfacePhoto = UDCSentencePatternDataGroupValue()
                        spdgvInterfacePhoto.udcDocumentId = documentEn._id
                        spdgvInterfacePhoto.category = "UDCGrammarCategory.CommonNoun"
                        spdgvInterfacePhoto.uvcViewItemType = "UVCViewItemType.Photo"
                        spdgvInterfacePhoto.item = ""
                        spdgvInterfacePhoto.itemId = ""
                        spdgvInterfacePhoto.itemType = "UDCJson.String"
                        spdgvInterfacePhoto.itemId = "5e1c861045627a5634112a71"
                        spdgvInterfacePhoto.itemIdName = "UDCDocumentItem.TranslationSeparator"
                        spdgvInterfacePhoto.endCategoryId = "5e1c852b45627a563411274e"
                        spdgvInterfacePhoto.endCategoryIdName = "UDCDocumentItem.DocumentInterfacePhoto"
                        model.appendSentencePatternGroupValue(newValue: spdgvInterfacePhoto)
                    }
                    
                    var spdgv = UDCSentencePatternDataGroupValue()
//                    if model.language == "en" {
//                        model.getSentencePatternGroupValue(wordIndex: 1)
//                    } else {
//                        model.getSentencePatternGroupValue(wordIndex: 3)
//                    }
                    spdgv.category = "UDCGrammarCategory.CommonNoun"
                    spdgv.uvcViewItemType = "UVCViewItemType.Text"
                    spdgv.udcDocumentId = document._id
                    spdgv.endSubCategoryId = ""
                    spdgv.endSubCategoryIdName = ""
                    let databaseOrmResultmodelChild = UDCDocumentGraphModel.get(collectionName: collectionName, udbcDatabaseOrm: udbcDatabaseOrm, id: document.udcDocumentGraphModelId)
                    if databaseOrmResultmodelChild.databaseOrmError.count > 0 {
                        print("Error in getting")
                        return
                    }
                    
                    let modelChild = databaseOrmResultmodelChild.object[0]
                    spdgv.endCategoryId = modelChild._id
                    spdgv.endCategoryIdName = modelChild.idName
                    let databaseOrmResultmodelChildChild = UDCDocumentGraphModel.get(collectionName: collectionName, udbcDatabaseOrm: udbcDatabaseOrm, id: modelChild.getChildrenEdgeId(modelChild.language)[0])
                    if databaseOrmResultmodelChildChild.databaseOrmError.count > 0 {
                        print("Error in getting")
                        return
                    }
                    let modelChildChild = databaseOrmResultmodelChildChild.object[0]
                    spdgv.itemId = modelChildChild._id
                    spdgv.itemIdName = modelChildChild.idName
                    spdgv.item = modelChildChild.name
                    spdgv.itemId = modelChildChild._id

//                    if model.language == "en" {
//                        model.removeSentencePatternGroupValue(wordIndex: 1)
//                    } else {
//                        model.removeSentencePatternGroupValue(wordIndex: 3)
//                    }
                    model.appendSentencePatternGroupValue(newValue: spdgv)
                    model.name = document.name
                    model.udcSentencePattern.sentence = document.name
                    let modelSave = UDCDocumentGraphModel.update(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm, object: model)
                    if modelSave.databaseOrmError.count > 0 {
                        print("Error in updating")
                        
                        return
                    }

                } else {
                    print("NOT Found: \(model.getSentencePatternGroupValue(wordIndex: 1).item!): \(model.name)")
                }
                
            }
            //            }
        } catch {
            print(error)
        }
        
        defer {
            databaseOrm.disconnect()
        }
    }
    
    private func changeTamilToTamil() {
        var databaseOrm: DatabaseOrm = MongoDatabaseOrm()
        var udbcDatabaseOrm: UDBCDatabaseOrm = UDBCMongoDatabaseOrm()
        do {
            
            let databaesOrmResult = databaseOrm.connect(userName: DatabaseOrmConnection.username, password: DatabaseOrmConnection.password, host: DatabaseOrmConnection.host, port: DatabaseOrmConnection.port, databaseName: DatabaseOrmConnection.database)
            udbcDatabaseOrm.ormObject = databaseOrm as AnyObject
            udbcDatabaseOrm.type = UDBCDatabaseType.MongoDatabase.rawValue
            try UDCDocumentGraphModel.loadPredefinedGraphLabels(udbcDatabaseOrm: udbcDatabaseOrm)
            let collectionName = "UDCSwiftProgrammingLanguage"
            let documentType = "UDCDocumentType.SwiftProgrammingLanguage"
            let databaseOrmResultUDCDocumentGraphModel = UDCDocument.getAll(collectionName: "UDCDocument", udbcDatabaseOrm: udbcDatabaseOrm)
            if databaesOrmResult.databaseOrmError.count > 0 {
                print(databaesOrmResult.databaseOrmError[0].description)
                return
            }
            print("Size: \(databaseOrmResultUDCDocumentGraphModel.object.count): \(databaseOrmResultUDCDocumentGraphModel.object[databaseOrmResultUDCDocumentGraphModel.object.count - 1]._id)")
            let udcdm = databaseOrmResultUDCDocumentGraphModel.object
            for model in udcdm {
                if model.language == "ta" && model.udcDocumentTypeIdName == documentType {
                    print("Changing \(model.name)")
                    changeLanguageToLanguage(collectionName: collectionName, childrenId: [model.udcDocumentGraphModelId], udbcDatabaseOrm: udbcDatabaseOrm)
                }
            }
        } catch {
            print(error)
        }
        
        defer {
            databaseOrm.disconnect()
        }
    }
    
    private func changeLanguageToLanguage(collectionName: String, childrenId: [String], udbcDatabaseOrm: UDBCDatabaseOrm) {
        for id in childrenId {
            let databaseOrmResultModel = UDCDocumentGraphModel.get(collectionName: collectionName, udbcDatabaseOrm: udbcDatabaseOrm, id: id)
            if databaseOrmResultModel.databaseOrmError.count > 0 {
                print(databaseOrmResultModel.databaseOrmError[0].description)
                return
            }
            let modelData = databaseOrmResultModel.object[0]
            modelData.language = "ta"
            let databaseOrmResultSave = UDCDocumentGraphModel.update(collectionName: collectionName, udbcDatabaseOrm: udbcDatabaseOrm, object: modelData)
            if databaseOrmResultSave.databaseOrmError.count > 0 {
                print(databaseOrmResultSave.databaseOrmError[0].description)
                return
            }
            if modelData.getChildrenEdgeId("en").count > 0 {
                changeLanguageToLanguage(collectionName: collectionName, childrenId: modelData.getChildrenEdgeId("en"), udbcDatabaseOrm: udbcDatabaseOrm)
            }
        }
    }
    
    private func addEdge(collectionName: String) {
        var databaseOrm: DatabaseOrm = MongoDatabaseOrm()
        var udbcDatabaseOrm: UDBCDatabaseOrm = UDBCMongoDatabaseOrm()
        do {
            
            let databaesOrmResult = databaseOrm.connect(userName: DatabaseOrmConnection.username, password: DatabaseOrmConnection.password, host: DatabaseOrmConnection.host, port: DatabaseOrmConnection.port, databaseName: DatabaseOrmConnection.database)
            udbcDatabaseOrm.ormObject = databaseOrm as AnyObject
            udbcDatabaseOrm.type = UDBCDatabaseType.MongoDatabase.rawValue
            try UDCDocumentGraphModel1.loadPredefinedGraphLabels(udbcDatabaseOrm: udbcDatabaseOrm)
            let databaseOrmResultUDCDocumentGraphModel = UDCDocumentGraphModel1.getAll(collectionName: collectionName, udbcDatabaseOrm: udbcDatabaseOrm)
            if databaesOrmResult.databaseOrmError.count > 0 {
                print(databaesOrmResult.databaseOrmError[0].description)
                return
            }
            print("Size: \(databaseOrmResultUDCDocumentGraphModel.object.count): \(databaseOrmResultUDCDocumentGraphModel.object[databaseOrmResultUDCDocumentGraphModel.object.count - 1]._id)")
            let udcdm = databaseOrmResultUDCDocumentGraphModel.object
            for (modelIndex, model) in udcdm.enumerated() {
                print(model.name)
                //                if model.idName.hasSuffix("UDCDocumentItem.BasicDetail") {
                if model.childrenMap != nil {
                    model.childrenMap!.removeAll()
                }
                if model.parentMap != nil {
                    model.parentMap!.removeAll()
                }
                if model.edge != nil {
                    if model.edge!.count > 0 {
                        model.edge!.removeAll()
                    }
                }
                if model.parentId.count > 0 && ((model.childrenId == nil) || model.childrenId!.count == 0)  {
                    model.edge = [UDCDocumentGraphModel1.getGraphEdgeLabelId("UDCGraphEdgeLabel.Parent", model.language): model.parentId]
                } else
                if model.parentId.count == 0 && ((model.childrenId != nil) && model.childrenId!.count > 0)  {
                    model.edge = [UDCDocumentGraphModel1.getGraphEdgeLabelId("UDCGraphEdgeLabel.Children", model.language): model.childrenId!]
                } else
                if model.parentId.count > 0 && ((model.childrenId != nil) && model.childrenId!.count > 0) {
                    model.edge = [UDCDocumentGraphModel1.getGraphEdgeLabelId("UDCGraphEdgeLabel.Parent", model.language): model.parentId]
                    model.edge![UDCDocumentGraphModel1.getGraphEdgeLabelId("UDCGraphEdgeLabel.Children", model.language)] = model.childrenId!
                } else {
                    model.edge = [:]
                }
                print("Saving \(modelIndex)...")
                let result = UDCDocumentGraphModel1.update(collectionName: collectionName, udbcDatabaseOrm: udbcDatabaseOrm, object: model)
                if result.databaseOrmError.count > 0 {
                    print(result.databaseOrmError[0].description)
                    return
                }
                //                }
            }
        } catch {
            print(error)
        }
        
        defer {
            databaseOrm.disconnect()
        }
    }
    
}
