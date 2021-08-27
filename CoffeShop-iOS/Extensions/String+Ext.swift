//
//  String+Ext.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 27/08/21.
//

import UIKit

extension String {
    
    // formatea un string con el formato de html
    // util para formatear el texto de textviews utilizando formato html
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

