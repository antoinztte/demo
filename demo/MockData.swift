//
//  MockData.swift
//  demo
//
//  Created by Antoinette Marie Torres on 2/28/25.
//

import Foundation

struct MockData {
    
    static let users: [User] = [
        .init(
            id: NSUUID().uuidString,
            fullName: "Antoinette Torres",
            major: "Computer Science",
            grade: "Junior",
            age: 20,
            profileImageURL: "antoinette"
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "Lauren Jun",
            major: "Information Science",
            grade: "Junior",
            age: 20,
            profileImageURL: "lauren"
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "Monica Lee",
            major: "Hotelie",
            grade: "Junior",
            age: 21,
            profileImageURL: "monica"
        )
    ]
}
