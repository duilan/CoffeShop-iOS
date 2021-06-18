//
//  CSTextField.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 16/06/21.
//

import UIKit

class CSTextField: UITextField {
    
    // MARK: -  Properties
    private let label = UILabel()
    private let border = UIView()
    
    private let animation250ms: TimeInterval = 0.25
    private let borderMaxHeight: CGFloat = 2
    private let borderMinHeight: CGFloat = 0.5
    private let colorAccent: UIColor = CustomColors.primaryColor
    private let textPadding = UIEdgeInsets( top: 10, left: 0, bottom: 0, right: 0 )
    
    private var isEmpty: Bool {
        text?.isEmpty ?? true
    }
    
    private var labelHeight: CGFloat {
        font?.withSize(14).lineHeight ?? 0
    }
    
    // MARK: -  Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  UITextField
    override var placeholder: String? {
        didSet {
            label.text = placeholder
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateBorder(animated: false)
        updateLabel(animated: false)
    }
    
    // MARK: -  Private Methods
    private func setup() {
        addSubview(border)
        addSubview(label)
        
        self.addTarget(self, action: #selector(editingEvent), for: .allEditingEvents)
        self.tintColor = colorAccent
        //label
        label.textColor = colorAccent
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.isUserInteractionEnabled = false
        //border
        border.backgroundColor = .gray
    }
    
    @objc private func editingEvent() {
        updateBorder()
        updateLabel()
    }
    
    private func updateBorder(animated: Bool = true) {
        let borderColor = isFirstResponder ? tintColor : .gray
        let borderHeight: CGFloat = isFirstResponder ? borderMaxHeight : borderMinHeight
        let borderFrame = CGRect(x: 0, y: bounds.height - borderHeight, width: bounds.width, height: borderHeight)
        
        guard animated else {
            border.backgroundColor = borderColor
            border.frame = borderFrame
            return
        }
        
        UIView.animate(withDuration: animation250ms ) {
            self.border.backgroundColor = borderColor
            self.border.frame = borderFrame
        }
    }
    
    private func updateLabel(animated: Bool = true) {
        let alpha: CGFloat = isEmpty ? 0 : 1
        let positionY = isEmpty ? labelHeight * 0.8 : 0
        let labelFrame = CGRect(x: 0, y: positionY, width: bounds.width, height: labelHeight)
        
        guard animated else {
            label.frame = labelFrame
            label.alpha = alpha
            return
        }
        
        UIView.animate(withDuration: animation250ms) {
            self.label.frame = labelFrame
            self.label.alpha = alpha
        }
    }
    
}
