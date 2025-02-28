//
//  Card.swift
//  demo
//
//  Created by Antoinette Marie Torres on 2/28/25.
//

import Foundation

struct CardModel {
    let user: UserModel
}

extension CardModel: Identifiable {
    var id: String {
        return user.id
    }
}
