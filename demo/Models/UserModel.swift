//
//  User.swift
//  demo
//
//  Created by Antoinette Marie Torres on 2/28/25.
//

import Foundation

struct UserModel: Identifiable {
    let id: String
    let fullName: String
    let major: String
    let grade: String
    let email: String
    var age: Int
    var profileImageURL: String
}
