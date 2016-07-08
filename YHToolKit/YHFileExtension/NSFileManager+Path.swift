//
//  NSFileManager+Path.swift
//  YHToolKit
//
//  Created by Jeff Lin on 5/28/16.
//  Copyright © 2016 JeffLin. All rights reserved.
//

import Foundation

extension FileManager {
    class func documentPath() -> String {
        let docPathArray:[String] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        return docPathArray.min()!
    }
    
    class func cachePath() -> String{
        let cachePathArray:[String] = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        
        return cachePathArray.min()!
    }
}

extension FileManager {
    class func addSkipBackupAttributeToItemAtURL(_ url: URL) -> Bool {
        do {
            try (url as NSURL).setResourceValue(NSNumber(value: true), forKey: URLResourceKey.isExecutableKey)
            return true
        } catch {
            print("Error excluding %@ from backup", url.lastPathComponent)
            return false
        }
    }
}

extension FileManager {
    class func fileSizeForPath(_ filePath: String) -> CUnsignedLongLong {
        var fileSize: CUnsignedLongLong = 0;
        let fileManager = FileManager()   // default is not thread safe
        if (fileManager.fileExists(atPath: filePath)) {
            var fileInfo: NSDictionary
            do {
                fileInfo = try fileManager.attributesOfItem(atPath: filePath)
                fileSize = fileInfo.fileSize()
            } catch {
                
            }
        }
        
        return fileSize
    }
}
