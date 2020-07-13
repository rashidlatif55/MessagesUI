//
//  MessageCell.swift
//  Message
//
//  Created by Rashid on 05/09/2018.
//  Copyright © 2018 GlobizServe. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    //    TestView.layer.cornerRadius = 40
    //    TestView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMinYCorner]
    
    let messageLable = UILabel()
    let bubbleBackgroundView = UIView()
    var leadingConstraint : NSLayoutConstraint!
    var trailingConstraint : NSLayoutConstraint!
    
    var message : ChatMessages! {
        didSet{
            bubbleBackgroundView.backgroundColor = message.isIncoming ? UIColor.lightGray.withAlphaComponent(0.2) : .systemYellow
            messageLable.textColor = message.isIncoming ? .black : .white
            
            messageLable.text = message.messageText
            if message.isIncoming {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
                bubbleBackgroundView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
            } else {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
                bubbleBackgroundView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner, .layerMinXMinYCorner]
            }
        }
    }
 
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        
        bubbleBackgroundView.backgroundColor = .red
        bubbleBackgroundView.layer.cornerRadius = 16
        
        //        bubbleBackgroundView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        bubbleBackgroundView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        addSubview(bubbleBackgroundView)
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(messageLable)
        
        
        messageLable.numberOfLines = 0
        messageLable.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = [
            messageLable.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            messageLable.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
             messageLable.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            //BubbleView constraints
            bubbleBackgroundView.topAnchor.constraint(equalTo: messageLable.topAnchor, constant: -16),
            bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLable.leadingAnchor, constant: -16),
            bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLable.bottomAnchor, constant: 16),
            bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLable.trailingAnchor, constant: 16)
            
        ]
        
        NSLayoutConstraint.activate(constraint)
         leadingConstraint = messageLable.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 32)
        leadingConstraint.isActive = false
        
          trailingConstraint = messageLable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        trailingConstraint.isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
