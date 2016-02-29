//
//  NSLocale+Helpers.swift
//  APSwiftHelpers
//
//  Created by Alex Plescan on 29/02/2016.
//  Copyright © 2016 Alex Plescan. All rights reserved.
//

import Foundation

extension NSLocale {

    /// The country code for this locale. An example could be `US`.
    public var countryCode: String? {
        return objectForKey(NSLocaleCountryCode) as? String
    }

    /// The country name for this locale. An example could be `United States`.
    public var countryName: String? {
        guard let countryCode = countryCode else { return nil }
        return displayNameForKey(NSLocaleCountryCode, value: countryCode)
    }

}
