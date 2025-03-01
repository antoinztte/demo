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

extension CardModel: Equatable {
    static func == (lhs: CardModel, rhs: CardModel) -> Bool {
        return lhs.user.id == rhs.user.id
    }
}

extension CardModel: Identifiable {
    var id: String {
        return user.id
    }
}
