//
//  BrainControllerRoutes.swift
//  UniversalBrainController
//
//  Created by Kumar Muthaiah on 28/10/18.
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
import KituraContracts
import LoggerAPI
import UDocsUtility
import UDocsDatabaseModel
import UDocsDatabaseUtility
import UDocsMongoDatabaseUtility
import UDocsNeuronModel
import UDocsNeuronUtility
import UDocsBrain
import UDocsDocumentModel

func initializeBrainControllerApplicationRoutes(router: Router) {
    router.all("/dendriteBinaryRequest", middleware: BodyParser())
    router.post("/dendriteBinaryResponse", handler: dendriteBinaryResponse)
    router.post("/dendrite", handler: dendrite)
    router.post("/dendriteBinaryRequest", handler: dendriteBinaryRequest)
}

public func connectToDatabase(databaseOrm: inout DatabaseOrm, udbcDatabaseOrm: inout UDBCDatabaseOrm) -> DatabaseOrmResult<String> {
    let databaesOrmResult = databaseOrm.connect(userName: DatabaseOrmConnection.username, password: DatabaseOrmConnection.password, host: DatabaseOrmConnection.host, port: DatabaseOrmConnection.port, databaseName: DatabaseOrmConnection.database)
    udbcDatabaseOrm.ormObject = databaseOrm as AnyObject
    udbcDatabaseOrm.type = UDBCDatabaseType.MongoDatabase.rawValue
    
    return databaesOrmResult
}

func dendriteBinaryRequest(request: RouterRequest, response: RouterResponse, next: () -> Void) {
    var databaseOrm: DatabaseOrm = MongoDatabaseOrm()
    var udbcDatabaseOrm: UDBCDatabaseOrm = UDBCMongoDatabaseOrm()
    let neuronUtility: NeuronUtility = NeuronUtilityImplementation()

    var neuronResponse = NeuronRequest()
    do {
        let part = request.body?.asMultiPart!
        let jsonUtilityNeuronRequest = JsonUtility<NeuronRequest>()
        var json = ""
        if let theJSONData = try? JSONSerialization.data(
            withJSONObject: part![0].body.asJSON!,
            options: []) {
            json = String(data: theJSONData,
                          encoding: .utf8)!
        }
        let neuronRequest = jsonUtilityNeuronRequest.convertJsonToAnyObject(json: json)
        neuronRequest.neuronOperation.neuronData.binaryData = part![1].body.asRaw!
        
        print("\(BrainControllerApplication.getName()): Start dendrite route")
        
        
        
        let databaesOrmResult = connectToDatabase(databaseOrm: &databaseOrm, udbcDatabaseOrm: &udbcDatabaseOrm)
        if databaesOrmResult.databaseOrmError.count > 0 {
            neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError?.append(neuronUtility.getNeuronOperationError(name: databaesOrmResult.databaseOrmError[0].name, description: databaesOrmResult.databaseOrmError[0].description))
            print("\(BrainControllerApplication.getName()) Failed connecting to database")
        } else {
            print("\(BrainControllerApplication.getName()) Connected to database")
            
            let actualNeuronSource = neuronRequest.neuronSource.name
            
            neuronRequest.neuronSource.name = "BrainControllerApplication"
            let brainControllerNeuron = BrainControllerNeuron.getDendrite(sourceId: neuronRequest.neuronSource._id)
            
            brainControllerNeuron.setDendrite(neuronRequest: neuronRequest, udbcDatabaseOrm: udbcDatabaseOrm,  neuronUtility: neuronUtility)
            neuronResponse = BrainControllerApplication.getRootResponse(neuronSourceId:  neuronRequest.neuronSource._id)
            neuronResponse.neuronSource.name = actualNeuronSource
            if neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError?.count == 0 {
                for success in neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationSuccess! {
                    print("Output: \(success.name), description: \(success.description)")
                }
            } else {
                for error in neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError! {
                    print("Error: \(error.name), description: \(error.description)")
                }
            }
            
        }
    } catch {
        print(error)
    }
        
    defer {
        do {
            try databaseOrm.disconnect()
            print("\(BrainControllerApplication.getName()) Disconnected from database")
        } catch {
            print("\(BrainControllerApplication.getName()): Failed to disconnect from database")
        }
        print("\(BrainControllerApplication.getName()): End dendrite route")
    }
        
        
    response.send(neuronResponse)
    next()
}

func dendriteBinaryResponse(request: RouterRequest, response: RouterResponse, next: () -> Void) {
    var databaseOrm: DatabaseOrm = MongoDatabaseOrm()
    var udbcDatabaseOrm: UDBCDatabaseOrm = UDBCMongoDatabaseOrm()
    let neuronUtility: NeuronUtility = NeuronUtilityImplementation()

    var neuronResponse = NeuronRequest()
    do {
        let neuronRequest = try request.read(as: NeuronRequest.self)
        
        print("\(BrainControllerApplication.getName()): Start dendrite route")
        
        
        
        let databaesOrmResult = connectToDatabase(databaseOrm: &databaseOrm, udbcDatabaseOrm: &udbcDatabaseOrm)
        if databaesOrmResult.databaseOrmError.count > 0 {
            neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError?.append(neuronUtility.getNeuronOperationError(name: databaesOrmResult.databaseOrmError[0].name, description: databaesOrmResult.databaseOrmError[0].description))
            print("\(BrainControllerApplication.getName()) Failed connecting to database")
        } else {
            print("\(BrainControllerApplication.getName()) Connected to database")
            
            let actualNeuronSource = neuronRequest.neuronSource.name
            
            neuronRequest.neuronSource.name = "BrainControllerApplication"
            let brainControllerNeuron = BrainControllerNeuron.getDendrite(sourceId: neuronRequest.neuronSource._id)
            
            brainControllerNeuron.setDendrite(neuronRequest: neuronRequest, udbcDatabaseOrm: udbcDatabaseOrm, neuronUtility: neuronUtility)
            neuronResponse = BrainControllerApplication.getRootResponse(neuronSourceId:  neuronRequest.neuronSource._id)
            neuronResponse.neuronSource.name = actualNeuronSource
            if neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError?.count == 0 {
                for success in neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationSuccess! {
                    print("Output: \(success.name), description: \(success.description)")
                }
            } else {
                for error in neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError! {
                    print("Error: \(error.name), description: \(error.description)")
                }
            }
            
        }
    } catch {
        print(error)
    }
    
    defer {
        do {
            try databaseOrm.disconnect()
            print("\(BrainControllerApplication.getName()) Disconnected from database")
        } catch {
            print("\(BrainControllerApplication.getName()): Failed to disconnect from database")
        }
        print("\(BrainControllerApplication.getName()): End dendrite route")
    }
    
    // Due to limitation of Kitura not able to send multipart/form-data along with json and binary.
    // Already discussed in Kitura discussion and not happened as of 15-Aug-2019.
    // For now implementing binary response alone and later find a tool to
    // implement json and binary data response
    response.headers["Content-Type"] = "multipart/form-data"
    if neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError!.count > 0 {
        print(neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError![0].description)
        response.status(.unknown)
    } else {
        response.status(.OK).send(data: neuronResponse.neuronOperation.neuronData.binaryData!)
    }
    next()
}

func dendrite(request: RouterRequest, response: RouterResponse, next: () -> Void) {
    var databaseOrm: DatabaseOrm = MongoDatabaseOrm()
    var udbcDatabaseOrm: UDBCDatabaseOrm = UDBCMongoDatabaseOrm()
    let neuronUtility: NeuronUtility = NeuronUtilityImplementation()
    var neuronResponse = NeuronRequest()
    do {
        let neuronRequest = try request.read(as: NeuronRequest.self)
        
        print("\(BrainControllerApplication.getName()): Start dendrite route")
        
        
        
        let databaesOrmResult = connectToDatabase(databaseOrm: &databaseOrm, udbcDatabaseOrm: &udbcDatabaseOrm)
        if databaesOrmResult.databaseOrmError.count > 0 {
            neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError?.append(neuronUtility.getNeuronOperationError(name: databaesOrmResult.databaseOrmError[0].name, description: databaesOrmResult.databaseOrmError[0].description))
            print("\(BrainControllerApplication.getName()) Failed connecting to database")
        } else {
            print("\(BrainControllerApplication.getName()) Connected to database")
            
            let actualNeuronSource = neuronRequest.neuronSource.name
            
            neuronRequest.neuronSource.name = "BrainControllerApplication"
            let brainControllerNeuron = BrainControllerNeuron.getDendrite(sourceId: neuronRequest.neuronSource._id)
            
            brainControllerNeuron.setDendrite(neuronRequest: neuronRequest, udbcDatabaseOrm: udbcDatabaseOrm,  neuronUtility: neuronUtility)
            neuronResponse = BrainControllerApplication.getRootResponse(neuronSourceId:  neuronRequest.neuronSource._id)
            neuronResponse.neuronSource.name = actualNeuronSource
            if neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError?.count == 0 {
                for success in neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationSuccess! {
                    print("Output: \(success.name), description: \(success.description)")
                }
            } else {
                for error in neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError! {
                    print("Error: \(error.name), description: \(error.description)")
                }
            }
            
        }
    } catch {
         print(error)
    }
    
    defer {
        do {
            try databaseOrm.disconnect()
            print("\(BrainControllerApplication.getName()) Disconnected from database")
        } catch {
            print("\(BrainControllerApplication.getName()): Failed to disconnect from database")
        }
        print("\(BrainControllerApplication.getName()): End dendrite route")
    }
    
    response.send(neuronResponse)
    next()
}
