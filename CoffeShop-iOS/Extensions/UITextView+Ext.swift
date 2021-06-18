//
//  UITextView+Ext.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 18/06/21.
//

import UIKit

extension UITextView {
    
    func addLinkAtEndOfText(_ originalText: String, link: String, linkColor: UIColor) {
        let regularText = NSMutableAttributedString(string: originalText + " ", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.gray])
        
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        
        let tappableText = NSMutableAttributedString(string: link)
        tappableText.addAttribute(.font, value: UIFont.systemFont(ofSize: 14), range: NSMakeRange(0, tappableText.length))
        tappableText.addAttribute(.link, value: link, range: NSMakeRange(0, tappableText.length))
        tappableText.addAttribute(.link, value: link, range: NSMakeRange(0, tappableText.length))
        
        regularText.append(tappableText)
        self.linkTextAttributes = [.foregroundColor: linkColor, .paragraphStyle: style]
        
        self.attributedText = regularText
        removeGesturesExceptTap()
    }
    
    func removeGesturesExceptTap() {
        for recognizer in self.gestureRecognizers ?? [] {
            if !recognizer.isKind(of: UITapGestureRecognizer.self) {
                self.removeGestureRecognizer(recognizer)
            }
        }
    }
    
    func addMultipleLinksToText(_ originalText: String, links: [String], linkColor: UIColor) {
        let style = NSMutableParagraphStyle()
        style.alignment = textAlignment
        
        let attributedOriginalText = NSMutableAttributedString(string: originalText)
        attributedOriginalText.addAttribute(.foregroundColor, value: textColor ?? .gray , range: NSRange(location: 0, length: attributedOriginalText.length))
        
        for hyperLink in links {
            let linkRange = attributedOriginalText.mutableString.range(of: hyperLink)
            let fullRange = NSRange(location: 0, length: attributedOriginalText.length)
            attributedOriginalText.addAttribute(.link, value: hyperLink, range: linkRange)
            attributedOriginalText.addAttribute(.paragraphStyle, value: style, range: fullRange)
            attributedOriginalText.addAttribute(.font, value: UIFont.systemFont(ofSize: 14), range: fullRange)
        }
        
        self.linkTextAttributes = [
            .foregroundColor: linkColor,
            //.underlineStyle: NSUnderlineStyle.single.rawValue,
        ]
        self.attributedText = attributedOriginalText
        self.isEditable = false
        self.isScrollEnabled = false
        self.textDragInteraction?.isEnabled = false
        removeGesturesExceptTap()
    }
}

