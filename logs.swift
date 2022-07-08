//
//  logs.swift
//  blocker
//
//

import Foundation
import os

public func applog(file: String = #file, function: String = #function, line: Int = #line, _ items: Any...) {
    _applog(file: file, function: function, line: line, items)
}

public func extlog(file: String = #file, function: String = #function, line: Int = #line, _ items: Any...) {
    _applog(file: file, function: function, line: line, items)
    _oslog(file: file, function: function, line: line, items)
}

func prepareOutput(file: String, function: String, line: Int, _ items: [Any]) -> String {
    var file = file
    if file.hasSuffix(".swift") {
        file = file.components(separatedBy: "/").last ?? ""
    }
    let lineStr = line == 0 ? "" : "[\(line)]"
    let items_ = items.map{"\($0)"}.joined(separator: ", ")
    let parts: [String] = [file, function, lineStr, items_].compactMap{ return $0.isEmpty ? nil : $0 }
//    let x = ["", String?.none].compactMap{ $0}
    return parts.joined(separator: " ")
}

func _applog(file: String = #file, function: String = #function, line: Int = #line, _ items: [Any]) {
    Swift.print(prepareOutput(file: file, function: function, line: line, items))
}

func _oslog(file: String = #file, function: String = #function, line: Int = #line, _ items: [Any]) {
    let output = prepareOutput(file: file, function: function, line: line, items)
    let logger = OSLog(subsystem: "x", category: "main")
    
    if #available(iOS 14.0, *) {
        os_log(.fault, log: logger, "[DEBUG] \(output, privacy: .public)")
    }
}
