//
//  CardViewModel.swift
//  demo
//
//  Created by Antoinette Marie Torres on 2/28/25.
//

import Foundation

class CardViewModel: ObservableObject {

    // Where our data source exists (i.e., providing our cards)
    @Published var cards = [CardModel]()
    @Published var buttonSwipeAction: SwipeModel?
    
    private let service: CardService
    
    init(service: CardService) {
        self.service = service
        Task { await fetchCards() }
    }
    
    func fetchCards() async {
        do {
            self.cards = try await service.fetchCard()
        } catch {
            print("DEBUG: Failed to fetch cards w/ error: \(error)")
        }
    }
    
    func removeCard(_ card: CardModel) {
        guard let idx = cards.firstIndex(where: { $0.id == card.id }
        ) else {
            return
        }
        cards.remove(at: idx)
    }
}
