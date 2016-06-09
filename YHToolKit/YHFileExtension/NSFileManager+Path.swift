//
//  NSFileManager+Path.swift
//  YHToolKit
//
//  Created by Jeff Lin on 5/28/16.
//  Copyright © 2016 JeffLin. All rights reserved.
//

import Foundation

extension NSFileManager {
    class func documentPath() -> String {
        let docPathArray:[String] = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        
        return docPathArray.minElement()!
    }
    
    class func cachePath() -> String{
        let cachePathArray:[String] = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true)
        
        return cachePathArray.minElement()!
    }
}

extension NSFileManager {
    class func addSkipBackupAttributeToItemAtURL(url: NSURL) -> Bool {
        do {
            try url.setResourceValue(NSNumber(bool: true), forKey: NSURLIsExecutableKey)
            return true
        } catch {
            print("Error excluding %@ from backup", url.lastPathComponent)
            return false
        }
    }
}

extension NSFileManager {
    class func fileSizeForPath(filePath: String) -> CUnsignedLongLong {
        var fileSize: CUnsignedLongLong = 0;
        let fileManager = NSFileManager()   // default is not thread safe
        if (fileManager.fileExistsAtPath(filePath)) {
            var fileInfo: NSDictionary
            do {
                fileInfo = try fileManager.attributesOfItemAtPath(filePath)
                fileSize = fileInfo.fileSize()
            } catch {
                
            }
        }
        
        return fileSize
    }
}
