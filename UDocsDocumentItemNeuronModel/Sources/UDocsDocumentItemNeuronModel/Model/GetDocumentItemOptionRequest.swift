//
//  TypeRequest.swift
//  UniversalBrainController
//
//  Created by Kumar Muthaiah on 19/11/18.
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


public class GetDocumentItemOptionRequest : Codable {
    public var _id: String = ""
    public var text: String = ""
    public var type: String = ""
    public var category: String = ""
    public var fromText: String = ""
    public var limitedTo: Int = 0
    public var sortedBy: String = ""
    public var language: String = ""
    public var isAll: Bool = false
    public var searchText: String = ""
    public var documentLanguage: String = ""
    public var interfaceLanguage: String = ""
    public var uvcViewItemType: String = ""
    public var udcProfile = [UDCProfile]()
    
    public init() {
        
    }
}