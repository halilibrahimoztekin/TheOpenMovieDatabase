//
//  Logger.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 23.09.2022.
//

import Foundation
import UIKit

enum LoggerType {
    case info
    case error
    case warning
    
    var icon: String {
        switch self {
        case .info:
            return "ℹ️"
        case .error:
            return "❌"
        case .warning:
            return "⚠️"
        }
    }
}

struct Logger {
    static let topAndBottom = "\n####################################\n"
    static let linesString = "\n------------------------------------\n"
    static func log(type: LoggerType = .info, text: String, file: String = #file, function: String = #function, line: Int = #line) {
        let nameAndIcon =  type.icon + " - " + "OMBD"
        let lineNumber = "Line: " + line.toString
        let fileText = "File : " + file
        let logT = topAndBottom + nameAndIcon + linesString + lineNumber + "\n" + fileText + linesString + text + topAndBottom
        print(logT)
    }
   
}
