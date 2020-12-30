//
//  main.swift
//  UniversalBrainController
//
//  Created by Kumar Muthaiah on 23/10/18.
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
import Kitura
import LoggerAPI
import AppKit
import Kitura
import UDocsUtility
import UDocsDatabaseModel
import UDocsMongoDatabaseUtility
import UDocsBrain
import HeliumLogger
import UDocsDocumentModel

DatabaseOrmConnection.host = "localhost"
DatabaseOrmConnection.port = 27017
DatabaseOrmConnection.username = "kumar"
DatabaseOrmConnection.password = "Sevenhills93*"
DatabaseOrmConnection.database = "UniversalController"
//DatabaseOrmConnection.database = "UniverseDocsDev"

//let arguments = CommandLine.arguments
var arguments = [String]()

arguments.append("Universe Docs")
arguments.append("Controller")
//#if os(Linux)

//let myCertFile = "/tmp/Creds/cert.pem"
//let myKeyFile = "/tmp/Creds/key.pem"

//let mySSLConfig =  SSLConfig(withCACertificateDirectory: nil,
//                             usingCertificateFile: myCertFile,
//                             withKeyFile: myKeyFile,
//                             usingSelfSignedCerts: true)
//#else // on macOS

//let myCertKeyFile = "/Users/kumarmuthaiah/Documents/Kumar/Projects/Universal Docs Documentation/SSL Security Documents/universedocs/www.universedocs.com.pfx"
//
//let ssl =  SSLConfig(withChainFilePath: myCertKeyFile,
//                     withPassword: "Paradu93*",
//                     usingSelfSignedCerts: true)

//#endif
 
//if arguments[1] == "Controller" {
//
//
//
//    let router = Router()
//
//    HeliumLogger.use()
//
//    initializeBrainControllerApplicationRoutes(router: router)
//
//    Kitura.addHTTPServer(onPort: 83, with: router) // withSSL: ssl)
//    Kitura.run()
//} else if arguments[1] == "Scheduler" {
//    let brainShcedulerApplication = BrainShcedulerApplication()
//    brainShcedulerApplication.start()
//} else {
//    print("Invalid argument: UniverseDocsBrain Controller or Scheduler")
//}



//let mongoDatabaseUtility = MongoDatabaseUtility()
//let result = mongoDatabaseUtility.printCollectionCodes(databaseOrmConnection: DatabaseOrmConnection.self)
//if !result {
//    print("Failed to print")
//}

//let result = mongoDatabaseUtility.copyDatabases(connectionDetails: [["username": "kumar", "password": "Sevenhills93*", "host": "localhost", "port": 27017, "database": "UniversalController"], ["username": "kumar", "password": "Sevenhills93*", "host": "localhost", "port": 27017, "database": "UniverseDocsDev"]])
//if !result {
//    print("Failed to copy collections")
//}

//let result = mongoDatabaseUtility.deleteUnwantedTables(connectionDetails: ["username": "kumar", "password": "Sevenhills93*", "host": "localhost", "port": 27017, "database": "UniverseDocsDev"])
//if !result {
//    print("Failed to copy collections")
//}
//let pdfFileUtility = PDFFileUtility()
//pdfFileUtility.makePDF()

UDCTest().start()
//
//print(SwiftGoogleTranslate.shared.detect(text: "¡Hola!"))
//
//print(SwiftGoogleTranslate.shared.languages())
//let universalBrainControllerTest = UniversalBrainControllerTest()
//try universalBrainControllerTest.start(sourceId: "")

//let sourceId = NSUUID().uuidString
//let universalBrainControllerTest = UniversalBrainControllerTest.getDendrite(sourceId: sourceId) as! UniversalBrainControllerTest
//try universalBrainControllerTest.start(sourceId: sourceId)
