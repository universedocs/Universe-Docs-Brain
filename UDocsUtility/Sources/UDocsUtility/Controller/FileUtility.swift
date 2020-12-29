//
//  FileUtility.swift
//  Universe Docs Brain
//
//  Created by Kumar Muthaiah on 24/07/19.
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

#if targetEnvironment(macCatalyst)
    import AppKit
#endif

public class FileUtility {
    
    public func writeFile(fileName: String, contents: String)
    {
        #if targetEnvironment(macCatalyst)
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(fileName)
            
            //writing
            do {
                try contents.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {
                print("FileUtility: \(error)")
            }
        }
        #endif
    }
    
    /**
     
     
     //reading
     do {
     let text2 = try String(contentsOf: fileURL, encoding: .utf8)
     }
     catch {/* error handling here */}
     
     */
    
}
