//
//  DocumentUtility.swift
//  UDocsDocumentUtility
//
//  Created by Kumar Muthaiah on 15/08/20.
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
import UDocsDocumentModel
import UDocsDatabaseModel
import UDocsDatabaseUtility
import UDocsNeuronModel
import UDocsNeuronUtility
import UDocsGrammarNeuron

extension Date {
    /// Returns the amount of years from another date
    public func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    public func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    public func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    public func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    public func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    public func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    public func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    public func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return ""
    }
}

public class DocumentGraphUtility {
    var neuronName: String = ""
    var neuronUtility: NeuronUtility?
    var documentParser = DocumentParser()
    
    var udbcDatabaseOrm: UDBCDatabaseOrm?
    
    public init() {
        
    }
    
    
    public func setNeuronUtility(neuronUtility: NeuronUtility, neuronName: String) {
        self.neuronUtility = neuronUtility
    }
    
    public func setUDBCDatabaseOrm(udbcDatabaseOrm: UDBCDatabaseOrm, neuronName: String) {
        self.udbcDatabaseOrm = udbcDatabaseOrm
        neuronUtility!.setUDBCDatabaseOrm(udbcDatabaseOrm: udbcDatabaseOrm, neuronName: neuronName)
        documentParser.setNeuronUtility(neuronUtility: self.neuronUtility!,  neuronName: neuronName)
        documentParser.setUDBCDatabaseOrm(udbcDatabaseOrm: udbcDatabaseOrm, neuronName: neuronName)
    }
    
    public func generateDocumentItemData(name: String, udcSentencePatternDataGroupValue: UDCSentencePatternDataGroupValue, parentId: String, udcProfile: [UDCProfile], documentItem: inout UDCDocumentGraphModel, documentLanguage: String) throws {
        documentItem._id = try udbcDatabaseOrm!.generateId()
        documentItem.idName = "UDCDocumentItem.\(name.capitalized.replacingOccurrences(of: " ", with: ""))"
        documentItem.level = 2
        documentItem.name = name
        documentItem.language = documentLanguage
        UDCGrammarUtility().getSetencePattern(udcSentencePattern: &documentItem.udcSentencePattern, udcSentencePatternDataGroupValue: [udcSentencePatternDataGroupValue])
        documentItem.udcSentencePattern.sentence = name
        documentItem.udcDocumentTime.createdBy = documentParser.getUDCProfile(udcProfile: udcProfile, idName: "UPCProfileItem.Human")
        documentItem.udcDocumentTime.creationTime = Date()
        documentItem.appendEdgeId(UDCDocumentGraphModel.getGraphEdgeLabelId("UDCGraphEdgeLabel.Parent", documentLanguage), [parentId])
        documentItem.udcProfile = udcProfile
    }
    
    public func getSentencePatternDataGroupValue(name: String) -> UDCSentencePatternDataGroupValue {
        let udcSentencePatternDataGroupValue = UDCSentencePatternDataGroupValue()
        udcSentencePatternDataGroupValue.uvcViewItemType = "UVCViewItemType"
        udcSentencePatternDataGroupValue.category = "UDCGrammarCategory.General"
        udcSentencePatternDataGroupValue.itemType = "UDCJson.String"
        udcSentencePatternDataGroupValue.item = name
        return udcSentencePatternDataGroupValue
    }
    
    public func getSentencePatternDataGroupValue(name: String, category: String) -> UDCSentencePatternDataGroupValue {
        let udcSentencePatternDataGroupValue = UDCSentencePatternDataGroupValue()
        udcSentencePatternDataGroupValue.uvcViewItemType = "UVCViewItemType"
        udcSentencePatternDataGroupValue.category = category
        udcSentencePatternDataGroupValue.item = name
        udcSentencePatternDataGroupValue.itemType = "UDCJson.String"
        return udcSentencePatternDataGroupValue
    }
    
    public func getDocumentGraphModel(name: String,  collectionName: String, documentLanguage: String, level: Int, udcProfile: [UDCProfile], udbcDatbaseOrm: UDBCDatabaseOrm) throws -> UDCDocumentGraphModel {
        let model = UDCDocumentGraphModel()
        model._id = try udbcDatbaseOrm.generateId()
        model.name = name
        model.idName = "\(collectionName).\(name.capitalized.replacingOccurrences(of: " ", with: ""))"
        model.language = documentLanguage
        model.level = 0
        UDCGrammarUtility().getSetencePattern(udcSentencePattern: &model.udcSentencePattern, udcSentencePatternDataGroupValue: [getSentencePatternDataGroupValue(name: name)])
        model.isChildrenAllowed = true
        model.udcDocumentTime.createdBy = documentParser.getUDCProfile(udcProfile: udcProfile, idName: "UPCHumanProfileItem.Human")
        model.udcDocumentTime.creationTime = Date()
        
        return model
    }
    
    public func getDocumentItem(idName: String, findPathIdName: String, findIdName: String, pathIdName: inout [String], documentLanguage: String, udcProfile: [UDCProfile], neuronRequest: NeuronRequest, neuronResponse: inout NeuronRequest) throws -> UDCDocumentGraphModel? {
        
        var returnDocumentId: String = ""
        let labelDcumentItem = try getDocumentModel(udcDocumentId: &returnDocumentId, idName: idName, udcDocumentTypeIdName: "UDCDocumentType.DocumentItem", udcProfile: udcProfile, documentLanguage: documentLanguage, isLanguageChild: true, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        if neuronUtility!.isNeuronOperationError(neuronResponse: neuronResponse) {
            return nil
        }
        pathIdName.append(labelDcumentItem!.idName)
        return try getDocumentItem(childrenId: labelDcumentItem!.getChildrenEdgeId(documentLanguage), idName: idName, findPathIdName: findPathIdName, findIdName:  findIdName, pathIdName: &pathIdName, documentLanguage: documentLanguage, udcProfile: udcProfile, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        
    }
    
    public func getDocumentItem(childrenId: [String], idName: String, findPathIdName: String, findIdName: String, pathIdName: inout [String], documentLanguage: String, udcProfile: [UDCProfile], neuronRequest: NeuronRequest, neuronResponse: inout NeuronRequest) throws -> UDCDocumentGraphModel? {
        
        
        for child in childrenId {
            let databaseOrmModel = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm!, id: child)
            if databaseOrmModel.databaseOrmError.count > 0 {
                neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError?.append(neuronUtility!.getNeuronOperationError(name: databaseOrmModel.databaseOrmError[0].name, description: databaseOrmModel.databaseOrmError[0].description))
                return nil
            }
            let model = databaseOrmModel.object[0]
            if model.idName == findIdName && pathIdName.joined(separator: "->") == findPathIdName {
                return model
            }
            
            if model.getChildrenEdgeId(documentLanguage).count > 0 {
                pathIdName.append(model.idName)
                let retModel = try getDocumentItem(childrenId: model.getChildrenEdgeId(documentLanguage), idName: idName, findPathIdName: findPathIdName, findIdName: findIdName, pathIdName: &pathIdName, documentLanguage: documentLanguage, udcProfile: udcProfile, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
                if retModel != nil {
                    return retModel
                }
                pathIdName.remove(at: pathIdName.count - 1)
            }
        }
        
        return nil
    }
    
    public func getDocumentItem(idName: String, findPathIdName: String, itemNumber: Int, pathIdName: inout [String], documentLanguage: String, udcProfile: [UDCProfile], neuronRequest: NeuronRequest, neuronResponse: inout NeuronRequest) throws -> UDCDocumentGraphModel? {
        
        var returnDocumentId: String = ""
        let labelDcumentItem = try getDocumentModel(udcDocumentId: &returnDocumentId, idName: idName, udcDocumentTypeIdName: "UDCDocumentType.DocumentItem", udcProfile: udcProfile, documentLanguage: documentLanguage, isLanguageChild: true, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        if neuronUtility!.isNeuronOperationError(neuronResponse: neuronResponse) {
            return nil
        }
        pathIdName.append(labelDcumentItem!.idName)
        return try getDocumentItem(childrenId: labelDcumentItem!.getChildrenEdgeId(documentLanguage), idName: idName, findPathIdName: findPathIdName, itemNumber:  itemNumber, pathIdName: &pathIdName, documentLanguage: documentLanguage, udcProfile: udcProfile, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        
        
    }
    
    public func getDocumentItem(childrenId: [String], idName: String, findPathIdName: String, itemNumber: Int, pathIdName: inout [String], documentLanguage: String, udcProfile: [UDCProfile], neuronRequest: NeuronRequest, neuronResponse: inout NeuronRequest) throws -> UDCDocumentGraphModel? {
        
        
        for (childIndex, child) in childrenId.enumerated() {
            let databaseOrmModel = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm!, id: child)
            if databaseOrmModel.databaseOrmError.count > 0 {
                neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError?.append(neuronUtility!.getNeuronOperationError(name: databaseOrmModel.databaseOrmError[0].name, description: databaseOrmModel.databaseOrmError[0].description))
                return nil
            }
            let model = databaseOrmModel.object[0]
            if childIndex == itemNumber && pathIdName.joined(separator: "->") == findPathIdName {
                return model
            }
            
            if model.getChildrenEdgeId(documentLanguage).count > 0 {
                pathIdName.append(model.idName)
                let retModel = try getDocumentItem(childrenId: model.getChildrenEdgeId(documentLanguage), idName: idName, findPathIdName: findPathIdName, itemNumber: itemNumber, pathIdName: &pathIdName, documentLanguage: documentLanguage, udcProfile: udcProfile, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
                if retModel != nil {
                    return retModel
                }
                pathIdName.remove(at: pathIdName.count - 1)
            }
        }
        
        return nil
    }
    
    public func getUdcSentencePatternDataGroupValueForModel(udcDocumentGraphModel: UDCDocumentGraphModel, udcDocumentTypeIdName: String, documentLanguage: String, neuronRequest: NeuronRequest, neuronResponse: inout NeuronRequest) throws -> UDCSentencePatternDataGroupValue {
        let udcspdgv = UDCSentencePatternDataGroupValue()
        if udcDocumentGraphModel.getParentEdgeId(documentLanguage).count > 0 {
            let parentModel = try getDocumentModel(udcDocumentGraphModelId: udcDocumentGraphModel.getParentEdgeId(documentLanguage)[0], udcDocumentTypeIdName: udcDocumentTypeIdName, isLanguageChild: false, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
            if parentModel!.level > 1 {
                udcspdgv.endSubCategoryId = parentModel!._id
                udcspdgv.endSubCategoryIdName = parentModel!.idName
                if parentModel!.getParentEdgeId(documentLanguage).count > 0 {
                    let parentMoelParent = try getDocumentModel(udcDocumentGraphModelId: parentModel!.getParentEdgeId(documentLanguage)[0], udcDocumentTypeIdName: udcDocumentTypeIdName, isLanguageChild: false, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
                    udcspdgv.endCategoryId = parentMoelParent!._id
                    udcspdgv.endCategoryIdName = parentMoelParent!.idName
                }
            } else {
                udcspdgv.endCategoryId = udcDocumentGraphModel.getParentEdgeId(documentLanguage)[0]
                            udcspdgv.endCategoryIdName = udcDocumentGraphModel.idName
            }
        }
        udcspdgv.uvcViewItemType = "UVCViewItemType.Text"
        udcspdgv.category = "UDCGrammarCategory.CommonNoun"
        udcspdgv.item = udcDocumentGraphModel.name
        udcspdgv.itemId = udcDocumentGraphModel._id
        udcspdgv.itemIdName = udcDocumentGraphModel.idName
        return udcspdgv
    }
    
    public func isDocumentItemMap(documentId: String, udcDocumentTypeIdName: String, udcProfile: [UDCProfile], documentLanguage: String, titleIdName: inout String, neuronRequest: NeuronRequest, neuronResponse: inout NeuronRequest) throws -> Bool {
        let udcDocumentGraphModelDocumentItem = try getDocumentModelWithParent(udcDocumentId: documentId, idName: "", udcDocumentTypeIdName: udcDocumentTypeIdName, udcProfile: udcProfile, documentLanguage: documentLanguage, isLanguageChild: true, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        if udcDocumentGraphModelDocumentItem == nil {
            neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError?.removeAll()
            return false
        }
        titleIdName = udcDocumentGraphModelDocumentItem![0].idName
        if !(udcDocumentGraphModelDocumentItem![0].objectId.isEmpty) {
            let udcDocumentItemMap = try getDocumentModel(udcDocumentId: &udcDocumentGraphModelDocumentItem![0].objectId, idName: "", udcDocumentTypeIdName: "UDCDocumentType.DocumentItemConfiguration", udcProfile: udcProfile, documentLanguage: documentLanguage, isLanguageChild: true, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
            var fieldValueMap = [String: [UDCSentencePatternDataGroupValue]]()
            documentParser.getField(fieldidName: "UDCDocumentItem.IsDocumentItemMap?", childrenId: udcDocumentItemMap!.getChildrenEdgeId(documentLanguage), fieldValue: &fieldValueMap, udcDocumentTypeIdName: "UDCDocumentType.DocumentItemConfiguration", documentLanguage: documentLanguage)
            let fieldValueArray = fieldValueMap["UDCDocumentItem.IsDocumentItemMap?"]
            if (fieldValueArray != nil)  {
                for udcspdgv in fieldValueArray! {
                    if (udcspdgv.uvcViewItemType == "UVCViewItemType.Text" && udcspdgv.itemIdName == "UDCDocumentItem.Yes")  {
                        return true
                    }
                    break
                }
            }
        }
        
        return false
    }
    
    
    
    public func getCurrentTime(language: String, udcProfile: [UDCProfile], neuronRequest: NeuronRequest, neuronResponse: inout NeuronRequest) throws -> [UDCSentencePatternDataGroupValue] {
        var time = [UDCSentencePatternDataGroupValue]()
        
        // Get weekday, day, month, year, hour, minutes, seconds, timezone from system
        let date = Date()
        let calendar = Calendar.current
        let weekDay = calendar.component(.weekday, from: date)
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        let hour = calendar.component(.hour, from: date) - 12
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        let timeZone = calendar.component(.timeZone, from: date)
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        formatter.dateFormat = "a"
        let amOrPm = formatter.string(from: date)
        
        // Week day
        var pathIdName = [String]()
        let weekDayDi = try getDocumentItem(idName: "UDCDocument.GregorianCalendar", findPathIdName: "UDCDocumentItem.GregorianCalendar->UDCDocumentItem.Weekday", itemNumber: weekDay, pathIdName: &pathIdName, documentLanguage: language, udcProfile: udcProfile, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        let weekDayUdcspdgv = try getUdcSentencePatternDataGroupValueForModel(udcDocumentGraphModel: weekDayDi!, udcDocumentTypeIdName: "UDCDocumentType.DocumentItem", documentLanguage: language, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        weekDayUdcspdgv.item = weekDayUdcspdgv.item!.capitalized

        // Day
        var nextYear = year
        if month == 11 {
            nextYear += 1
        }
        var nextMonth = month
        if month == 11 {
            nextMonth = 0
        } else {
            nextMonth += 1
        }
        
        let date1 = DateComponents(calendar: .current, year: year, month: month, day: 1).date!
        let date2 = DateComponents(calendar: .current, year: nextYear, month: nextMonth, day: 1).date!
        let days = date2.days(from: date1)
        pathIdName = [String]()
        let dayDi = try getDocumentItem(idName: "UDCDocument.GregorianCalendar", findPathIdName: "UDCDocumentItem.GregorianCalendar->UDCDocumentItem.\(days)Days", findIdName: "UDCDocumentItem.\(String(day))", pathIdName: &pathIdName, documentLanguage: language, udcProfile: udcProfile, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        let dayUdcspdgv = try getUdcSentencePatternDataGroupValueForModel(udcDocumentGraphModel: dayDi!, udcDocumentTypeIdName: "UDCDocumentType.DocumentItem", documentLanguage: language, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        
        // Month
        pathIdName = [String]()
        let monthDi = try getDocumentItem(idName: "UDCDocument.GregorianCalendar", findPathIdName: "UDCDocumentItem.GregorianCalendar->UDCDocumentItem.Month", itemNumber: month - 1, pathIdName: &pathIdName, documentLanguage: language, udcProfile: udcProfile, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        let monthUdcspdgv = try getUdcSentencePatternDataGroupValueForModel(udcDocumentGraphModel: monthDi!, udcDocumentTypeIdName: "UDCDocumentType.DocumentItem", documentLanguage: language, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        monthUdcspdgv.item = monthUdcspdgv.item!.capitalized
        
        pathIdName = [String]()
        let yearDi = try getDocumentItem(idName: "UDCDocument.GregorianCalendar", findPathIdName: "UDCDocumentItem.GregorianCalendar->UDCDocumentItem.Year", findIdName: "UDCDocumentItem.\(String(year))", pathIdName: &pathIdName, documentLanguage: language, udcProfile: udcProfile, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        let yearUdcspdgv = try getUdcSentencePatternDataGroupValueForModel(udcDocumentGraphModel: yearDi!, udcDocumentTypeIdName: "UDCDocumentType.DocumentItem", documentLanguage: language, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        
        
        // Hour
        pathIdName = [String]()
        let hourDi = try getDocumentItem(idName: "UDCDocument.Time", findPathIdName: "UDCDocumentItem.Time->UDCDocumentItem.12Hour", findIdName: "UDCDocumentItem.\(String(hour))", pathIdName: &pathIdName, documentLanguage: language, udcProfile: udcProfile, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        let hourUdcspdgv = try getUdcSentencePatternDataGroupValueForModel(udcDocumentGraphModel: hourDi!, udcDocumentTypeIdName: "UDCDocumentType.DocumentItem", documentLanguage: language, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        
        // Comma (":")
        
        // Minute
        pathIdName = [String]()
        let minuteDi = try getDocumentItem(idName: "UDCDocument.Time", findPathIdName: "UDCDocumentItem.Time->UDCDocumentItem.Minute", findIdName: "UDCDocumentItem.\(String(minutes))", pathIdName: &pathIdName, documentLanguage: language, udcProfile: udcProfile, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        let minuteUdcspdgv = try getUdcSentencePatternDataGroupValueForModel(udcDocumentGraphModel: minuteDi!, udcDocumentTypeIdName: "UDCDocumentType.DocumentItem", documentLanguage: language, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        
        // Second
        pathIdName = [String]()
        let secondDi = try getDocumentItem(idName: "UDCDocument.Time", findPathIdName: "UDCDocumentItem.Time->UDCDocumentItem.Second", findIdName: "UDCDocumentItem.\(String(seconds))", pathIdName: &pathIdName, documentLanguage: language, udcProfile: udcProfile, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        let secondUdcspdgv = try getUdcSentencePatternDataGroupValueForModel(udcDocumentGraphModel: secondDi!, udcDocumentTypeIdName: "UDCDocumentType.DocumentItem", documentLanguage: language, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        
        // Time Zone
//        pathIdName = [String]()
//        let timeZoneDi = try getDocumentItem(idName: "UDCDocument.GregorianCalendar", findPathIdName: "UDCDocumentItem.GregorianCalendar->UDCDocumentItem.Second", findIdName: "UDCDocumentItem.\(timeZone)", pathIdName: &pathIdName, documentLanguage: language, udcProfile: udcProfile, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
//        let timeZoneUdcspdgv = try getUdcSentencePatternDataGroupValueForModel(udcDocumentGraphModel: timeZoneDi!, udcDocumentTypeIdName: "UDCDocumentType.DocumentItem", documentLanguage: language, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        
        let commmaUdcspdgv = getSentencePatternDataGroupValue(name: ",", category: "UDCGrammarCategory.Punctuation")
        let collonUdcspdgv = getSentencePatternDataGroupValue(name: ":", category: "UDCGrammarCategory.Punctuation")
        
        if language == "en" {
            
            time.append(weekDayUdcspdgv)
            time.append(commmaUdcspdgv)
            
            time.append(dayUdcspdgv)
            time.append(monthUdcspdgv)
            time.append(yearUdcspdgv)
            time.append(commmaUdcspdgv)
            
            time.append(hourUdcspdgv)
            time.append(collonUdcspdgv)
            time.append(minuteUdcspdgv)
            time.append(collonUdcspdgv)
            time.append(secondUdcspdgv)
            pathIdName = [String]()
            let amOrPmDi = try getDocumentItem(idName: "UDCDocument.12HourClockPeriod", findPathIdName: "UDCDocumentItem.12HourClockPeriod", findIdName: "UDCDocumentItem.\(amOrPm.capitalized)", pathIdName: &pathIdName, documentLanguage: language, udcProfile: udcProfile, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
            let amOrPmDiUdcspdgv = try getUdcSentencePatternDataGroupValueForModel(udcDocumentGraphModel: amOrPmDi!, udcDocumentTypeIdName: "UDCDocumentType.DocumentItem", documentLanguage: language, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
            time.append(amOrPmDiUdcspdgv)
//            time.append(commmaUdcspdgv)
//            time.append(timeZoneUdcspdgv)
            
        } else if language == "ta" {
            
            time.append(weekDayUdcspdgv)
            time.append(commmaUdcspdgv)
            
            time.append(dayUdcspdgv)
            time.append(monthUdcspdgv)
            time.append(yearUdcspdgv)
            time.append(commmaUdcspdgv)
            
            time.append(hourUdcspdgv)
            time.append(collonUdcspdgv)
            time.append(minuteUdcspdgv)
            time.append(collonUdcspdgv)
            time.append(secondUdcspdgv)
            var periodOfTime = ""
            if hour + 1 < 12 {
                periodOfTime = "Morning"
            } else if hour + 1 == 12 {
                periodOfTime = "Afternoon"
            } else if hour + 1 > 5 {
                periodOfTime = "Evening"
            } else if hour + 1 > 8 {
                periodOfTime = "Night"
            }
            pathIdName = [String]()
            let periodOfTimeDi = try getDocumentItem(idName: "UDCDocument.PeriodOfTime", findPathIdName: "UDCDocumentItem.PeriodOfTime", findIdName: "UDCDocumentItem.\(periodOfTime)", pathIdName: &pathIdName, documentLanguage: language, udcProfile: udcProfile, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
            let periodOfTimeDiUdcspdgv = try getUdcSentencePatternDataGroupValueForModel(udcDocumentGraphModel: periodOfTimeDi!, udcDocumentTypeIdName: "UDCDocumentType.DocumentItem", documentLanguage: language, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
            time.append(periodOfTimeDiUdcspdgv)
            pathIdName = [String]()
            let hoursDi = try getDocumentItem(idName: "UDCDocument.12HourClockPeriod", findPathIdName: "UDCDocumentItem.12HourClockPeriod", findIdName: "UDCDocumentItem.Hours", pathIdName: &pathIdName, documentLanguage: language, udcProfile: udcProfile, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
            let hoursDiUdcspdgv = try getUdcSentencePatternDataGroupValueForModel(udcDocumentGraphModel: hoursDi!, udcDocumentTypeIdName: "UDCDocumentType.DocumentItem", documentLanguage: language, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
            time.append(hoursDiUdcspdgv)
//            time.append(commmaUdcspdgv)
//            time.append(timeZoneUdcspdgv)
            
        }
        
        for i in time {
            print("Time: \(i.item)")
        }

        return time
    }
    
    
    public func getDocumentDetails(idName: String, udcDocumentTypeIdName: String, udcProfile: [UDCProfile], documentLanguage: String, documentId: inout String, documentGraphModelId: inout String, neuronRequest: NeuronRequest, neuronResponse: inout NeuronRequest) throws {
            // Get the root for the company and application
            let  databaseOrmResultUDCDocumentRoot = UDCDocumentRoot.get(udbcDatabaseOrm: udbcDatabaseOrm!, udcProfile: udcProfile, language: documentLanguage)
            let udcDocumentItemDocumentRoot = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm!, id: databaseOrmResultUDCDocumentRoot.object[0].rootId).object[0]
            if udcDocumentItemDocumentRoot.idName == idName {
                documentId = udcDocumentItemDocumentRoot._id
                return
            }
            let udcDocumentItemDocumentRootChild = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm!, id: udcDocumentItemDocumentRoot.getChildrenEdgeId(documentLanguage)[0]).object[0]
            // Get the document type related did language title id
            var doumentsId = ""
            let documentTypeName = udcDocumentTypeIdName.components(separatedBy: ".")[1]
            for child in udcDocumentItemDocumentRootChild.getChildrenEdgeId(documentLanguage) {
                let udcDocumentItemDocumentChild = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm!, id: child)
                if udcDocumentItemDocumentChild.object[0].idName == "UDCDocumentItem.\(documentTypeName)Documents" {
                    if documentLanguage == "en" {
                        doumentsId = udcDocumentItemDocumentChild.object[0].getSentencePatternGroupValue(wordIndex: 1).itemId!
                    } else {
                        doumentsId = udcDocumentItemDocumentChild.object[0].getSentencePatternGroupValue(wordIndex: 3).itemId!
                    }
                    break
                }
            }
            // Get the model id for the document id, based on documents id
            let datbaseOrmResultUdcDocumentItemDocument = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm!, id: doumentsId)
            for child in datbaseOrmResultUdcDocumentItemDocument.object[0].getChildrenEdgeId(documentLanguage) {
                let udcDocumentItemDocumentChild = try getDocumentModel(udcDocumentGraphModelId: child, udcDocumentTypeIdName: "UDCDocumentType.DocumentItem",  isLanguageChild: false, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
                if udcDocumentItemDocumentChild!.idName == idName {
                    documentId = udcDocumentItemDocumentChild!._id
                    if documentLanguage == "en" {
                        documentGraphModelId = udcDocumentItemDocumentChild!.getSentencePatternGroupValue(wordIndex: 1).itemId!
                    } else {
                        documentGraphModelId = udcDocumentItemDocumentChild!.getSentencePatternGroupValue(wordIndex: 3).itemId!
                    }
                    break
                }
            }
        }
    
    
    public func getDocumentDetails(id: String, udcDocumentTypeIdName: String, udcProfile: [UDCProfile], documentLanguage: String, documentGraphModelId: inout String, documentGraphModelIdName: inout String, neuronRequest: NeuronRequest, neuronResponse: inout NeuronRequest) throws {
        // Get the root for the company and application
        let  databaseOrmResultUDCDocumentRoot = UDCDocumentRoot.get(udbcDatabaseOrm: udbcDatabaseOrm!, udcProfile: udcProfile, language: documentLanguage)
        
        let udcDocumentItemDocumentRoot = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm!, id: databaseOrmResultUDCDocumentRoot.object[0].rootId).object[0]
        if databaseOrmResultUDCDocumentRoot.object[0].rootId == id {
            documentGraphModelId = id
            documentGraphModelIdName = udcDocumentItemDocumentRoot.idName
            return
        }
        let udcDocumentItemDocumentRootChild = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm!, id: udcDocumentItemDocumentRoot.getChildrenEdgeId(documentLanguage)[0]).object[0]
        // Get the document type related did language title id
        var doumentsId = ""
        let documentTypeName = udcDocumentTypeIdName.components(separatedBy: ".")[1]
        for child in udcDocumentItemDocumentRootChild.getChildrenEdgeId(documentLanguage) {
            let udcDocumentItemDocumentChild = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm!, id: child)
            if udcDocumentItemDocumentChild.object[0]._id == id {
                documentGraphModelId = udcDocumentItemDocumentChild.object[0].getSentencePatternGroupValue(wordIndex: 1).endCategoryId
                documentGraphModelIdName = udcDocumentItemDocumentChild.object[0].getSentencePatternGroupValue(wordIndex: 1).endCategoryIdName
                return
            }
            if udcDocumentItemDocumentChild.object[0].idName == "UDCDocumentItem.\(documentTypeName)Documents" {
                if documentLanguage == "en" {
                    doumentsId = udcDocumentItemDocumentChild.object[0].getSentencePatternGroupValue(wordIndex: 1).itemId!
                } else {
                    doumentsId = udcDocumentItemDocumentChild.object[0].getSentencePatternGroupValue(wordIndex: 3).itemId!
                }
                break
            }
        }
        // Get the model id for the document id, based on documents id
        let datbaseOrmResultUdcDocumentItemDocument = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm!, id: doumentsId)
        for child in datbaseOrmResultUdcDocumentItemDocument.object[0].getChildrenEdgeId(documentLanguage) {
            let datasbaseOrmResultUdcDocumentItemDocumentChild = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm!, id: child)
            let udcDocumentItemDocumentChild = datasbaseOrmResultUdcDocumentItemDocumentChild.object[0]
            if udcDocumentItemDocumentChild._id == id {
                if documentLanguage == "en" {
                    documentGraphModelId = udcDocumentItemDocumentChild.getSentencePatternGroupValue(wordIndex: 1).endCategoryId
                    documentGraphModelIdName = udcDocumentItemDocumentChild.getSentencePatternGroupValue(wordIndex: 1).endCategoryIdName
                } else {
                    documentGraphModelId = udcDocumentItemDocumentChild.getSentencePatternGroupValue(wordIndex: 3).endCategoryId
                    documentGraphModelIdName = udcDocumentItemDocumentChild.getSentencePatternGroupValue(wordIndex: 1).endCategoryIdName
                }
                break
            }
        }
    }
    
    public func getDocumentId(idName: String, udcDocumentTypeIdName: String, udcProfile: [UDCProfile], documentLanguage: String, documentId: inout String, neuronRequest: NeuronRequest, neuronResponse: inout NeuronRequest) throws {
               // Get the root for the company and application
               let  databaseOrmResultUDCDocumentRoot = UDCDocumentRoot.get(udbcDatabaseOrm: udbcDatabaseOrm!, udcProfile: udcProfile, language: documentLanguage)
               let udcDocumentItemDocumentRoot = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm!, id: databaseOrmResultUDCDocumentRoot.object[0].rootId).object[0]
               if udcDocumentItemDocumentRoot.idName == idName {
                   documentId = udcDocumentItemDocumentRoot._id
                   return
               }
               let udcDocumentItemDocumentRootChild = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm!, id: udcDocumentItemDocumentRoot.getChildrenEdgeId(documentLanguage)[0]).object[0]
               // Get the document type related did language title id
               var doumentsId = ""
               let documentTypeName = udcDocumentTypeIdName.components(separatedBy: ".")[1]
               for child in udcDocumentItemDocumentRootChild.getChildrenEdgeId(documentLanguage) {
                   let udcDocumentItemDocumentChild = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm!, id: child)
                   if udcDocumentItemDocumentChild.object[0].idName == "UDCDocumentItem.\(documentTypeName)Documents" {
                       if documentLanguage == "en" {
                           doumentsId = udcDocumentItemDocumentChild.object[0].getSentencePatternGroupValue(wordIndex: 1).itemId!
                       } else {
                           doumentsId = udcDocumentItemDocumentChild.object[0].getSentencePatternGroupValue(wordIndex: 3).itemId!
                       }
                    break
                   }
               }
               // Get the model id for the document id, based on documents id
               let datbaseOrmResultUdcDocumentItemDocument = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm!, id: doumentsId)
               for child in datbaseOrmResultUdcDocumentItemDocument.object[0].getChildrenEdgeId(documentLanguage) {
                   let udcDocumentItemDocumentChild = try getDocumentModel(udcDocumentGraphModelId: child, udcDocumentTypeIdName: "UDCDocumentType.DocumentItem",  isLanguageChild: false, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
                   if udcDocumentItemDocumentChild!.idName == idName {
                       documentId = udcDocumentItemDocumentChild!._id
                       break
                   }
               }
           }
       
    
    
    public func getModelIds(documentId: String, udcDocumentTypeIdName: String, documentLanguage: String, neuronRequest: NeuronRequest, neuronResponse: inout NeuronRequest) throws -> [String] {
        let databaseOrmResultudcDocument = UDCDocumentGraphModel.get(collectionName: "UDCDocumentItem", udbcDatabaseOrm: udbcDatabaseOrm!, id: documentId)
        var modelId = [String]()
        if documentLanguage == "en" {
            modelId.append(databaseOrmResultudcDocument.object[0].getSentencePatternGroupValue(wordIndex: 1).endCategoryId)
            modelId.append(databaseOrmResultudcDocument.object[0].getSentencePatternGroupValue(wordIndex: 1).itemId!)
        } else {
            modelId.append(databaseOrmResultudcDocument.object[0].getSentencePatternGroupValue(wordIndex: 3).endCategoryId)
            modelId.append(databaseOrmResultudcDocument.object[0].getSentencePatternGroupValue(wordIndex: 3).itemId!)
        }
        
        return modelId
    }
    
    
    public func getDocumentModel(udcDocumentId: inout String, idName: String, udcDocumentTypeIdName: String, udcProfile: [UDCProfile], documentLanguage: String, isLanguageChild: Bool, neuronRequest: NeuronRequest, neuronResponse: inout NeuronRequest) throws -> UDCDocumentGraphModel? {
        // Get the recent documents document
        var documentGraphModelId: String = ""
        var documentGraphModelIdName: String = ""
        if idName.isEmpty {
            let databaseOrmResultUDCDocument = UDCDocument.get(udbcDatabaseOrm: udbcDatabaseOrm!, id: udcDocumentId)
            if databaseOrmResultUDCDocument.databaseOrmError.count > 0 {
                neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError?.append(neuronUtility!.getNeuronOperationError(name: databaseOrmResultUDCDocument.databaseOrmError[0].name, description: databaseOrmResultUDCDocument.databaseOrmError[0].description))
                return nil
            }
            documentGraphModelId = databaseOrmResultUDCDocument.object[0].udcDocumentGraphModelId
            udcDocumentId = databaseOrmResultUDCDocument.object[0]._id
//            try getDocumentRootDetails(id: udcDocumentId, udcDocumentTypeIdName: udcDocumentTypeIdName, udcProfile: udcProfile, documentLanguage: documentLanguage, documentGraphModelId: &documentGraphModelId, documentGraphModelIdName: &documentGraphModelIdName, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        } else {
            let databaseOrmResultUDCDocument = UDCDocument.get(udbcDatabaseOrm: udbcDatabaseOrm!, udcProfile: udcProfile, idName: idName, udcDocumentTypeIdName: udcDocumentTypeIdName, language: documentLanguage)
            if databaseOrmResultUDCDocument.databaseOrmError.count > 0 {
                neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError?.append(neuronUtility!.getNeuronOperationError(name: databaseOrmResultUDCDocument.databaseOrmError[0].name, description: databaseOrmResultUDCDocument.databaseOrmError[0].description))
                return nil
            }
            documentGraphModelId = databaseOrmResultUDCDocument.object[0].udcDocumentGraphModelId
            udcDocumentId = databaseOrmResultUDCDocument.object[0]._id
//            try getDocumentRootDetails(idName: idName, udcDocumentTypeIdName: udcDocumentTypeIdName, udcProfile: udcProfile, documentLanguage: documentLanguage, documentId: &udcDocumentId, documentGraphModelId: &documentGraphModelId, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        }
        if neuronUtility!.isNeuronOperationError(neuronResponse: neuronResponse) {
            return nil
        }
        
        let udcDocumentItem = try getDocumentModel(udcDocumentGraphModelId: documentGraphModelId, udcDocumentTypeIdName: udcDocumentTypeIdName,  isLanguageChild: isLanguageChild, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        
        return udcDocumentItem
    }
    
    public func getDocumentModel(udcDocumentGraphModelIdName: String, language: String, udcDocumentTypeIdName: String, isLanguageChild: Bool, neuronRequest: NeuronRequest, neuronResponse: inout NeuronRequest) throws -> UDCDocumentGraphModel? {
        
        // Get the document item based on document
        let databaseOrmUDCDocumentItem = UDCDocumentGraphModel.get(collectionName: neuronUtility!.getCollectionName(udcDocumentTypeIdName: udcDocumentTypeIdName)!, udbcDatabaseOrm: udbcDatabaseOrm!, idName: udcDocumentGraphModelIdName, language: language)
        if databaseOrmUDCDocumentItem.databaseOrmError.count > 0 {
            neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError?.append(neuronUtility!.getNeuronOperationError(name: databaseOrmUDCDocumentItem.databaseOrmError[0].name, description: databaseOrmUDCDocumentItem.databaseOrmError[0].description))
            return nil
        }
        let udcDocumentItem = databaseOrmUDCDocumentItem.object[0]
        
        let returnDocumentItem = try getDocumentModel(udcDocumentGraphModelId: udcDocumentItem._id, udcDocumentTypeIdName: udcDocumentTypeIdName, isLanguageChild: isLanguageChild, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        
        return returnDocumentItem
    }
    
    public func getDocumentModel(udcDocumentGraphModelId: String, udcDocumentTypeIdName: String, isLanguageChild: Bool, neuronRequest: NeuronRequest, neuronResponse: inout NeuronRequest) throws -> UDCDocumentGraphModel? {
        
        // Get the document item based on document
        let databaseOrmUDCDocumentItem = UDCDocumentGraphModel.get(collectionName: neuronUtility!.getCollectionName(udcDocumentTypeIdName: udcDocumentTypeIdName)!, udbcDatabaseOrm: udbcDatabaseOrm!, id: udcDocumentGraphModelId)
        if databaseOrmUDCDocumentItem.databaseOrmError.count > 0 {
            neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError?.append(neuronUtility!.getNeuronOperationError(name: databaseOrmUDCDocumentItem.databaseOrmError[0].name, description: databaseOrmUDCDocumentItem.databaseOrmError[0].description))
            return nil
        }
        let udcDocumentItem = databaseOrmUDCDocumentItem.object[0]
        
        if isLanguageChild {
            // Get the document item child for language title
            let databaseOrmUDCDocumentItemChild = UDCDocumentGraphModel.get(collectionName: neuronUtility!.getCollectionName(udcDocumentTypeIdName: udcDocumentTypeIdName)!, udbcDatabaseOrm: udbcDatabaseOrm!, id: udcDocumentItem.getChildrenEdgeId(udcDocumentItem.language)[0])
            if databaseOrmUDCDocumentItemChild.databaseOrmError.count > 0 {
                neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError?.append(neuronUtility!.getNeuronOperationError(name: databaseOrmUDCDocumentItemChild.databaseOrmError[0].name, description: databaseOrmUDCDocumentItemChild.databaseOrmError[0].description))
                return nil
            }
            let udcDocumentItemChild = databaseOrmUDCDocumentItemChild.object[0]
            return udcDocumentItemChild
        }
        
        return udcDocumentItem
    }
    
    public func getDocumentModel(udcDocumentId: String, idName: String, udcDocumentTypeIdName: String, udcProfile: [UDCProfile], documentLanguage: String, isLanguageChild: Bool, neuronRequest: NeuronRequest, neuronResponse: inout NeuronRequest) throws -> UDCDocumentGraphModel? {
        var documentGraphModelId: String = ""
        var documentGraphModelIdName: String = ""
        var udcDocumentId: String = ""
        if idName.isEmpty {
            let databaseOrmResultUDCDocument = UDCDocument.get(udbcDatabaseOrm: udbcDatabaseOrm!, id: udcDocumentId)
                       if databaseOrmResultUDCDocument.databaseOrmError.count > 0 {
                           neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError?.append(neuronUtility!.getNeuronOperationError(name: databaseOrmResultUDCDocument.databaseOrmError[0].name, description: databaseOrmResultUDCDocument.databaseOrmError[0].description))
                           return nil
                       }
                       documentGraphModelId = databaseOrmResultUDCDocument.object[0].udcDocumentGraphModelId
                       udcDocumentId = databaseOrmResultUDCDocument.object[0]._id
//            try getDocumentRootDetails(id: udcDocumentId, udcDocumentTypeIdName: udcDocumentTypeIdName, udcProfile: udcProfile, documentLanguage: documentLanguage,documentGraphModelId: &documentGraphModelId,documentGraphModelIdName: &documentGraphModelIdName, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        } else {
            let databaseOrmResultUDCDocument = UDCDocument.get(udbcDatabaseOrm: udbcDatabaseOrm!, udcProfile: udcProfile, idName: idName, udcDocumentTypeIdName: udcDocumentTypeIdName, language: documentLanguage)
                        if databaseOrmResultUDCDocument.databaseOrmError.count > 0 {
                            neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError?.append(neuronUtility!.getNeuronOperationError(name: databaseOrmResultUDCDocument.databaseOrmError[0].name, description: databaseOrmResultUDCDocument.databaseOrmError[0].description))
                            return nil
                        }
                        documentGraphModelId = databaseOrmResultUDCDocument.object[0].udcDocumentGraphModelId
                        udcDocumentId = databaseOrmResultUDCDocument.object[0]._id
//            try getDocumentRootDetails(idName: idName, udcDocumentTypeIdName: udcDocumentTypeIdName, udcProfile: udcProfile, documentLanguage: documentLanguage, documentId: &udcDocumentId, documentGraphModelId: &documentGraphModelId, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        }
        if neuronUtility!.isNeuronOperationError(neuronResponse: neuronResponse) {
            return nil
        }
        
        return try getDocumentModel(udcDocumentGraphModelId: documentGraphModelId, udcDocumentTypeIdName: udcDocumentTypeIdName, isLanguageChild: isLanguageChild, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
    }
    
    public func getDocumentModelWithParent(udcDocumentId: String, idName: String, udcDocumentTypeIdName: String, udcProfile: [UDCProfile], documentLanguage: String, isLanguageChild: Bool, neuronRequest: NeuronRequest, neuronResponse: inout NeuronRequest) throws -> [UDCDocumentGraphModel]? {
        var databaseOrmResultUDCDocument: DatabaseOrmResult<UDCDocument>?
        if idName.isEmpty {
            databaseOrmResultUDCDocument = UDCDocument.get(udbcDatabaseOrm: udbcDatabaseOrm!, id: udcDocumentId)
        } else {
            databaseOrmResultUDCDocument = UDCDocument.get(udbcDatabaseOrm: udbcDatabaseOrm!, udcProfile: udcProfile, idName: idName, udcDocumentTypeIdName: udcDocumentTypeIdName, language: documentLanguage)
        }
        if databaseOrmResultUDCDocument!.databaseOrmError.count > 0 {
            neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError?.append(neuronUtility!.getNeuronOperationError(name: databaseOrmResultUDCDocument!.databaseOrmError[0].name, description: databaseOrmResultUDCDocument!.databaseOrmError[0].description))
            return nil
        }
        let udcDocument = databaseOrmResultUDCDocument!.object[0]
        
        return try getDocumentModelWithParent(udcDocumentGraphModelId: udcDocument.udcDocumentGraphModelId, udcDocumentTypeIdName: udcDocumentTypeIdName, isLanguageChild: isLanguageChild, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
    }
    
    public func getDocumentModelWithParent(udcDocumentGraphModelId: String, udcDocumentTypeIdName: String, isLanguageChild: Bool, neuronRequest: NeuronRequest, neuronResponse: inout NeuronRequest) throws -> [UDCDocumentGraphModel]? {
        var udcDocumentItemArray = [UDCDocumentGraphModel]()
        
        // Get the document item based on document
        let databaseOrmUDCDocumentItem = UDCDocumentGraphModel.get(collectionName: neuronUtility!.getCollectionName(udcDocumentTypeIdName: udcDocumentTypeIdName)!, udbcDatabaseOrm: udbcDatabaseOrm!, id: udcDocumentGraphModelId)
        if databaseOrmUDCDocumentItem.databaseOrmError.count > 0 {
            neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError?.append(neuronUtility!.getNeuronOperationError(name: databaseOrmUDCDocumentItem.databaseOrmError[0].name, description: databaseOrmUDCDocumentItem.databaseOrmError[0].description))
            return nil
        }
        let udcDocumentItem = databaseOrmUDCDocumentItem.object[0]
        
        if isLanguageChild && udcDocumentItem.getChildrenEdgeId(udcDocumentItem.language).count > 0 {
            udcDocumentItemArray.append(udcDocumentItem)
            
            // Get the document item child for language title
            let databaseOrmUDCDocumentItemChild = UDCDocumentGraphModel.get(collectionName: neuronUtility!.getCollectionName(udcDocumentTypeIdName: udcDocumentTypeIdName)!, udbcDatabaseOrm: udbcDatabaseOrm!, id: udcDocumentItem.getChildrenEdgeId(udcDocumentItem.language)[0])
            if databaseOrmUDCDocumentItemChild.databaseOrmError.count > 0 {
                neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError?.append(neuronUtility!.getNeuronOperationError(name: databaseOrmUDCDocumentItemChild.databaseOrmError[0].name, description: databaseOrmUDCDocumentItemChild.databaseOrmError[0].description))
                return nil
            }
            let udcDocumentItemChild = databaseOrmUDCDocumentItemChild.object[0]
            udcDocumentItemArray.append(udcDocumentItemChild)
            return udcDocumentItemArray
        }
        
        if udcDocumentItem.getParentEdgeId(udcDocumentItem.language).count > 0 {
            let databaseOrmUDCDocumentItemParent = UDCDocumentGraphModel.get(collectionName: neuronUtility!.getCollectionName(udcDocumentTypeIdName: udcDocumentTypeIdName)!, udbcDatabaseOrm: udbcDatabaseOrm!, id: udcDocumentGraphModelId)
            if databaseOrmUDCDocumentItemParent.databaseOrmError.count > 0 {
                neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError?.append(neuronUtility!.getNeuronOperationError(name: databaseOrmUDCDocumentItemParent.databaseOrmError[0].name, description: databaseOrmUDCDocumentItemParent.databaseOrmError[0].description))
                return nil
            }
            let udcDocumentItemParent = databaseOrmUDCDocumentItemParent.object[0]
            udcDocumentItemArray.append(udcDocumentItemParent)
        }
        
        udcDocumentItemArray.append(udcDocumentItem)
        
        return udcDocumentItemArray
    }
    
    
    public func getParentPathOfDocumentItem(id: String, documentLanguage: String, udcDocumentTypeIdName: String, pathIdName: inout [String], neuronRequest: NeuronRequest, neuronResponse: inout NeuronRequest) throws {
        let databaseOrmUDCDocumentGraphModel = UDCDocumentGraphModel.get(collectionName: neuronUtility!.getCollectionName(udcDocumentTypeIdName: udcDocumentTypeIdName)!, udbcDatabaseOrm: udbcDatabaseOrm!, id: id, language: documentLanguage) as DatabaseOrmResult<UDCDocumentGraphModel>
        if databaseOrmUDCDocumentGraphModel.databaseOrmError.count > 0 {
            neuronResponse.neuronOperation.neuronOperationStatus.neuronOperationError?.append(neuronUtility!.getNeuronOperationError(name: databaseOrmUDCDocumentGraphModel.databaseOrmError[0].name, description: databaseOrmUDCDocumentGraphModel.databaseOrmError[0].description))
            return
        }
        let udcDocumentGraphModel = databaseOrmUDCDocumentGraphModel.object[0]
        pathIdName.insert(udcDocumentGraphModel.idName, at: 0)
        if udcDocumentGraphModel.level > 1 && udcDocumentGraphModel.getParentEdgeId(documentLanguage).count > 0 {
            try getParentPathOfDocumentItem(id: udcDocumentGraphModel.getParentEdgeId(documentLanguage)[0], documentLanguage: documentLanguage, udcDocumentTypeIdName: udcDocumentTypeIdName, pathIdName: &pathIdName, neuronRequest: neuronRequest, neuronResponse: &neuronResponse)
        } else {
            return
        }
    }
}
