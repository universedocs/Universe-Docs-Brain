//
//  UDCDocumentModel2.swift
//  Universe Docs Document
//
//  Created by Kumar Muthaiah on 18/02/19.
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
import UDocsDatabaseUtility
import UDocsViewModel

public class UDCDocumentGraphModel1 : Codable {
    public var _id: String = ""
    public var idName: String = ""
    public var name: String = ""
    public var objectId: String = ""
    public var objectName: String = ""
    public var documentMapObjectId: String = ""
    public var documentMapObjectName: String = ""
    public var udcSentencePattern = UDCSentencePattern()
    public var isChildrenAllowed: Bool = false
    public var childrenId: [String]?
    public var parentMap: [String: [String]]?
    public var childrenMap: [String: [String]]?
    public var edge: [String: [String]]?
    public var parentId = [String]()
    public var level: Int = 0
    public var language: String = ""
    public var udcAnalytic = [UDCAnalytic]()
    public var udcProfile = [UDCProfile]()
    public var pathIdName = [[String]]()
    public var udcDocumentTime = UDCDocumentTime()
//    public var udcViewItemCollection = UDCViewItemCollection()
//    public var uvcViewItemCollection = UVCViewItemCollection()
    public var udcDocumentGraphModelReferenceId: String = ""
    private static var predefinedUdcGraphEdgeLabel = [UDCGraphEdgeLabel]()

    public init() {
        
    }
    
    public static func getGraphLabels(udbcDatabaseOrm: UDBCDatabaseOrm, idName: String, udcProfile: [UDCProfile], language: String) throws -> [UDCDocumentGraphModel] {
        var udcDocumentGraphModelArray = [UDCDocumentGraphModel]()
        let databaseOrmUDCDocument = UDCDocument.get(udbcDatabaseOrm: udbcDatabaseOrm, udcProfile: udcProfile, udcDocumentTypeIdName: "UDCDocumentType.DocumentItem", idName: idName, language: language)
        let udcDocument = databaseOrmUDCDocument.object[0]
        let databaseOrmUDCDocumentGraphModel = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm, id: udcDocument.udcDocumentGraphModelId)
        let udcDocumentGraphModel = databaseOrmUDCDocumentGraphModel.object[0]
        let childrenId = udcDocumentGraphModel.edge[UDCDocumentGraphModel.getGraphEdgeLabelId("UDCGraphEdgeLabel.Children", language)]!
        let databaseOrmUDCDocumentGraphModelChild = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm, id: childrenId[0])
        let udcDocumentGraphModelChild = databaseOrmUDCDocumentGraphModelChild.object[0]
        let childrenIdOfChild = udcDocumentGraphModelChild.edge[UDCDocumentGraphModel.getGraphEdgeLabelId("UDCGraphEdgeLabel.Children", language)]!
        for children in childrenIdOfChild {
            let databaseOrmUDCDocumentItem = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm, id: children)
            let udcDocumentItem = databaseOrmUDCDocumentItem.object[0]
            udcDocumentGraphModelArray.append(udcDocumentItem)
        }
        
        return udcDocumentGraphModelArray
    }
    
    public static func loadPredefinedGraphLabels(udbcDatabaseOrm: UDBCDatabaseOrm) throws {
        if predefinedUdcGraphEdgeLabel.count > 0 {
            return
        }
        predefinedUdcGraphEdgeLabel = UDCGraphEdgeLabel.getAll(udbcDatabaseOrm: udbcDatabaseOrm).object
    }
        
    public static func getGraphEdgeLabelId(_ idName: String, _ language: String) -> String {
        for label in predefinedUdcGraphEdgeLabel {
            if label.idName == idName && label.language == language {
                return label._id
            }
        }
        
        return ""
    }
    
    public static func getGraphEdgeLabelId(_ udcDocumentGraphModel: [UDCDocumentGraphModel],_ idName: String, _ language: String) -> String {
        for label in udcDocumentGraphModel {
            if label.idName == idName && label.language == language {
                return label._id
            }
        }
        
        return ""
    }
    
    public func getChildrenEdgeId(_ language: String) -> [String] {
        return self.edge![UDCDocumentGraphModel.getGraphEdgeLabelId("UDCGraphEdgeLabel.Children", language)]!
    }
    
    public func getParentEdgeId(language: String) -> [String] {
        return self.edge![UDCDocumentGraphModel.getGraphEdgeLabelId("UDCGraphEdgeLabel.Parent", language)]!
    }
    
    public func getEdgeId(_ labelId: String) -> [String] {
        if edge!.count > 0 {
            return edge![labelId]!
        } else {
            return []
        }
    }
    
    public func removeAllEdgeId() {
        edge!.removeAll()
    }
    
    public func removeAllChildrenEdgeId() {
        self.edge![UDCDocumentGraphModel.getGraphEdgeLabelId("UDCGraphEdgeLabel.Children", language)]!.removeAll()
    }
    
    public func removeAllParentEdgeId() {
        self.edge![UDCDocumentGraphModel.getGraphEdgeLabelId("UDCGraphEdgeLabel.Parent", language)]!.removeAll()
    }

    public func removeEdgeId(_ labelId: String,  _ at: Int) {
        edge![labelId]!.remove(at: at)
    }

    public func getEdgeId(_ labelId: String, _ at: Int) -> String {
        return edge![labelId]![at]
    }
   
    public func appendEdgeId(_ labelId: String, _ edge: [String]) {
        if self.edge![labelId] == nil {
            self.edge![labelId] = edge
        } else {
            self.edge![labelId]!.append(contentsOf: edge)
        }
    }
    
    public func insertEdgeId(_ labelId: String, _ edge: [String], at: Int) {
        self.edge![labelId]!.insert(contentsOf: edge, at: at)
    }
    
    public static func getAll(collectionName: String, udbcDatabaseOrm: UDBCDatabaseOrm) -> DatabaseOrmResult<UDCDocumentGraphModel1> {
        let DatabaseOrm = udbcDatabaseOrm.ormObject as! DatabaseOrm
        return DatabaseOrm.getAll(collectionName: collectionName)
    }
    
    static public func update<T: Codable>(collectionName: String, udbcDatabaseOrm: UDBCDatabaseOrm, object: T) -> DatabaseOrmResult<T> {
        let udcRecipe = object as! UDCDocumentGraphModel1
        let DatabaseOrm = udbcDatabaseOrm.ormObject as! DatabaseOrm
        
        return DatabaseOrm.update(collectionName: collectionName, id: udcRecipe._id, object: object )
        
    }
    
    static public func save<T: Codable>(collectionName: String, udbcDatabaseOrm: UDBCDatabaseOrm, object: T) -> DatabaseOrmResult<T> {
        
        let DatabaseOrm = udbcDatabaseOrm.ormObject as! DatabaseOrm
        return DatabaseOrm.save(collectionName: collectionName, object: object )
        
    }
}
