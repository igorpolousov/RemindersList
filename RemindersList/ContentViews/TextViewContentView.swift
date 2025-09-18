//
//  TextViewContentView.swift
//  RemindersList
//
//  Created by Igor Polousov on 18.09.2025.
//

import UIKit

class TextViewContentView: UIView, UIContentView {

    struct Configuration: UIContentConfiguration {
        
        var text: String? = ""
        
        func makeContentView() -> any UIView & UIContentView {
            return TextViewContentView(self)
        }
    }
    
    let textView = UITextView()
    
    var configuration: UIContentConfiguration {
        didSet {
            configure(configuration: configuration)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 0, height: 44)
    }
    
    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        addPinnedSubview(textView, height: 200)
        textView.backgroundColor = nil
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(configuration: UIContentConfiguration) {
        guard let configuraton = configuration as? Configuration else {return}
        textView.text = configuraton.text
        textView.font = UIFont.preferredFont(forTextStyle: .body)
    }
    
}

extension UICollectionViewListCell {
    func textViewConfiguration() -> TextViewContentView.Configuration {
        TextViewContentView.Configuration()
    }
}
