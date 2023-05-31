//
//  Books.swift
//  Xcerpt
//
//  Created by Brian Ho on 5/29/23.
//

import SwiftUI

class BookStore: ObservableObject {
    @Published var books: [Book] = Book.builtins
    
    init() {
        sort(as: Order.ascending)
    }
    
    var sortOrder: Order = .ascending {
        didSet {
            sort(as: sortOrder)
        }
    }
    enum Order {
        case ascending
        case descending
    }
    
    // MARK: -Intents
    
    func sort(as order: Order) {
        switch(order) {
        case .ascending:
            books.sort { ascendingComparison(lhs: $0.title, rhs: $1.title) }
        case .descending:
            books.sort { descendingComparison(lhs: $0.title, rhs: $1.title) }
        }
    }
    
    private func ascendingComparison(lhs: String?, rhs: String?) -> Bool {
        if let lhs, let rhs {
            return lhs < rhs
        } else if lhs != nil {
            return true
        } else {
            return false
        }
    }
    
    private func descendingComparison(lhs: String?, rhs: String?) -> Bool {
        if let lhs, let rhs {
            return lhs > rhs
        } else if lhs != nil {
            return true
        } else {
            return false
        }
    }
}

