//
//  ViewController.swift
//  Message
//
//  Created by Rashid on 05/09/2018.
//  Copyright © 2018 . All rights reserved.
//

import UIKit

struct ChatMessages {
    let messageText : String
    let isIncoming : Bool
    let date : Date
}

class MessageViewController: UITableViewController {
    
    let cellId = "cell"
    
    //    var messagesArray = [ChatMessages]()
    
    
    let chatMessages = [
        [
            ChatMessages(messageText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", isIncoming: false, date: Date.formateDate(customString: "11/09/2018")),
            ChatMessages(messageText: "ctetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", isIncoming: true, date: Date.formateDate(customString: "18/09/2018")),
            
            ],
        [
            ChatMessages(messageText: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", isIncoming: true, date: Date.formateDate(customString: "1/19/2018")),
            ChatMessages(messageText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", isIncoming: false, date: Date.formateDate(customString: "09/09/2018")),
            ChatMessages(messageText: "Hi buddy", isIncoming: false, date: Date.formateDate(customString: "05/06/2018"))
        ],
        [
            ChatMessages(messageText: "A", isIncoming: false, date: Date.formateDate(customString: "01/01/2018"))
        ],
        [
            ChatMessages(messageText: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", isIncoming: false, date: Date.formateDate(customString: "9/12/2018")),
            ChatMessages(messageText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", isIncoming: false, date: Date.formateDate(customString: "4/09/2018")),
            ChatMessages(messageText: "Hi buddy", isIncoming: true, date: Date.formateDate(customString: "2/12/2018"))
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigation setup
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //tableview Setup
        tableView.register(MessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        tableView.allowsSelection = false
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MessageCell
        let message = chatMessages[indexPath.section][indexPath.row]
        cell.message = message
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstMessageInSection = chatMessages[section].first {
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "MM/dd/yyyy"
            let dateString = dateFormater.string(from: firstMessageInSection.date)
            let label = DateHeaderLabel()
            label.backgroundColor = UIColor(red: 0/255, green: 216/255, blue: 85/255, alpha: 1.0)
            label.textAlignment = .center
            label.textColor = .white
            label.font = UIFont.boldSystemFont(ofSize: 14)
            
            label.text = dateString
            label.translatesAutoresizingMaskIntoConstraints = false
            
            
            let containerView = UIView()
            containerView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            
            return containerView
            
        }
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
     
}

  class DateHeaderLabel: UILabel {
        override var intrinsicContentSize: CGSize{
            let orignalSize = super.intrinsicContentSize
            let height = orignalSize.height + 12
            layer.cornerRadius = height/2
            layer.masksToBounds = true
            return CGSize(width: orignalSize.width + 20, height: height)
        }
    }


extension Date {
    static func formateDate(customString: String) -> Date {
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MM/dd/yyyy"
        return dateFormater.date(from: customString) ?? Date()
    }
}



