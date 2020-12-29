//
//  UVCButton.swift
//  Universe_Docs_View
//
//  Created by Kumar Muthaiah on 31/10/18.
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

public class UVCButton : Codable {
    public var _id: String = ""
    public var name: String = ""
    public var value: String = ""
    public var description: String = ""
    public var uvcViewItemType: String = "UVCViewItemType.Text"
    public var optionObjectCategoryIdName: String = ""
    public var optionObjectIdName: String = ""
    public var optionObjectName: String = ""
    public var isEditable: Bool = false
    public var isOptionAvailable: Bool = false
    public var groupId: String? = ""
    public var isSelected: Bool? = false
    public var isSelectable: Bool? = false
    public var isSingleChoice: Bool? = false
    public var isMultipleChoice: Bool? = false
    public var uvcTextSize = UVCTextSize()
    public var uvcTextStyle = UVCTextStyle()
    public var uvcMeasurement = [UVCMeasurement]()
    public var uvcButtonStatus = UVCButtonStatus()
    public var memoryObject: String? = ""
    public var uvcPhoto: UVCPhoto?
    public var uvcPhotoSelected: UVCPhoto?
    public var parentId = [String]()
    public var childrenId = [String]()
    public var path = [String]()
    
    public init() {
        
    }
}
