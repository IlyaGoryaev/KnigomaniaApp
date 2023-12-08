//
//  Dictionary+Ext.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 08.12.2023.
//

import Foundation

extension Dictionary where Key: ExpressibleByStringLiteral {
	mutating func convertKeysToSnakeCase() {
		for key in self.keys {
			self[String(describing: key).camelCaseToSnakeCase() as! Key] = self.removeValue(forKey: key)
		}
	}
}
