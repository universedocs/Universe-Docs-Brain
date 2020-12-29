//
//  DatabaseOrm.swift
//  UDocsDatabaseNeuron
//
//  Created by Kumar Muthaiah on 10/10/18.
//

import Foundation
import UDocsDatabaseModel
import UDocsDatabaseUtility

public protocol DatabaseOrm {
    static func getName() -> String
    func connect(userName: String, password: String, host: String, port: Int, databaseName: String) -> DatabaseOrmResult<String>
    func disconnect() -> DatabaseOrmResult<String>
    func generateId() -> String
    func startTransaction(options: [[String: Any]]) -> DatabaseOrmResult<String>
    func commitTransaction() -> DatabaseOrmResult<String>
    func abortTransaction() -> DatabaseOrmResult<String>
    func save<T : Codable>(collectionName: String, object: T) -> DatabaseOrmResult<T>
    func find<T: Codable>(collectionName: String, dictionary: [String: Any], limitedTo: Int?, sortOrder: String)  -> DatabaseOrmResult<T>
    func find<T: Codable>(collectionName: String, dictionary: [String: Any], limitedTo: Int?, sortOrder: String, sortedBy: String) -> DatabaseOrmResult<T>
    func find<T: Codable>(collectionName: String, dictionary: [String: Any], projection: [String]?, limitedTo: Int?, sortOrder: String, sortedBy: String) -> DatabaseOrmResult<T>
    func find<T: Codable>(collectionName: String, dictionary: [String: Any], limitedTo: Int?) -> DatabaseOrmResult<T>
    func getAll<T: Codable>(collectionName: String) -> DatabaseOrmResult<T>
    func update<T: Codable>(collectionName: String, whereDictionary: [String: Any], setDictionary: [String: Any]) -> DatabaseOrmResult<T>
    func updatePush<T: Codable>(collectionName: String, whereDictionary: [String: Any], setDictionary: [String: Any]) -> DatabaseOrmResult<T>
    func updatePush<T: Codable>(collectionName: String, whereDictionary: [String: Any], key: String, values: [String], position: Int) -> DatabaseOrmResult<T>
    func updatePull<T: Codable>(collectionName: String, whereDictionary: [String: Any], setDictionary: [String: Any]) -> DatabaseOrmResult<T>
    func update<T : Codable>(collectionName: String, id: String, object: T) -> DatabaseOrmResult<T>
    func update<T : Codable>(collectionName: String, whereDictionary: [String: Any], object: T) -> DatabaseOrmResult<T>
    func remove<T: Codable>(collectionName: String, id: String) -> DatabaseOrmResult<T>
    func remove<T: Codable>(collectionName: String, dictionary: [String: Any]) -> DatabaseOrmResult<T>
}
