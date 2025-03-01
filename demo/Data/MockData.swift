//
//  MockData.swift
//  demo
//
//  Created by Antoinette Marie Torres on 2/28/25.
//

import Foundation

struct MockData {
    
    static let users: [UserModel] = [
        .init(
            id: NSUUID().uuidString,
            fullName: "Antoinette Torres",
            major: "Computer Science",
            grade: "Junior",
            email: "act238@cornell.edu",
            age: 20,
            profileImageURL: "antoinette"
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "Lauren Jun",
            major: "Information Science",
            grade: "Junior",
            email: "lj295@cornell.edu",
            age: 20,
            profileImageURL: "lauren"
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "Monica Lee",
            major: "Hotel Administration",
            grade: "Junior",
            email: "myl42@cornell.edu",
            age: 21,
            profileImageURL: "monica"
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "Funmi Olukanmi",
            major: "Information Science",
            grade: "Junior",
            email: "omo8@cornell.edu",
            age: 20,
            profileImageURL: "funmi"
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "Izabella Tandlmayer",
            major: "Psychology",
            grade: "Junior",
            email: "iat24@cornell.edu",
            age: 21,
            profileImageURL: "izabella"
        )
    ]
}
