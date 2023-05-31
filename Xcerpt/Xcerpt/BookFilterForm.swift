//
//  BookFilterForm.swift
//  Xcerpt
//
//  Created by Brian Ho on 5/30/23.
//

import SwiftUI

struct BookFilterForm: View {
    typealias Order = BookStore.Order
    @Binding var sortOrder: Order
    @State private var showOnlyFavorites = false
    
    var body: some View {
        List {
            Picker("Sort", selection: $sortOrder) {
                Text("Ascending").tag(Order.ascending)
                Text("Descending").tag(Order.descending)
            }
            Toggle(isOn: $showOnlyFavorites) {
                Text("Show Favorites")
            }
        }
    }
}

struct BookFilterForm_Previews: PreviewProvider {
    struct Preview: View {
        @State var bookStore = BookStore()
        var body: some View {
            BookFilterForm(sortOrder: $bookStore.sortOrder)
        }
    }
    static var previews: some View {
        Preview()
    }
}
