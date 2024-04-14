//
//  String+Ext.swift
//  CryproProfile
//
//  Created by dmitri kolesov on 12.04.2024.
//

import Foundation

extension String {
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
