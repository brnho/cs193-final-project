//
//  ContentView.swift
//  Xcerpt
//
//  Created by Brian Ho on 5/27/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var bookStore: BookStore
    @State private var searchText = ""
    @State private var showFilterForm = false
    @State private var showAddForm = false
    
    var body: some View {
        NavigationStack {
            List {
                books()
            }
            .navigationDestination(for: Book.self) { book in
                if let index = $bookStore.books.firstIndex(where: { $0.id == book.id }) {
                    BookExcerpt(book: $bookStore.books[index])
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            .navigationTitle("Xcerpt")
            .toolbar {
                filterButton
                addButton
            }
            .sheet(isPresented: $showFilterForm) {
                BookFilterForm(sortOrder: $bookStore.sortOrder)
            }
            .sheet(isPresented: $showAddForm) {
                BookAddForm()
            }
        }
        .searchable(text: $searchText, prompt: "Search for a book")
    }
    
    private var searchBar: some View {
        HStack {
            TextField("Search for Books", text: $searchText)
            Button {
                
            } label: {
                Label("Search", systemImage: "magnifyingglass")
                    .labelStyle(.iconOnly)
            }
        }
    }
    
    private var addButton: some View {
        Button {
            showAddForm = true
        } label: {
            Label("Search", systemImage: "plus")
                .labelStyle(.iconOnly)
        }
    }
    
    private var filterButton: some View {
        Button {
            showFilterForm = true
        } label: {
            Label("Search", systemImage: "line.3.horizontal.decrease.circle")
                .labelStyle(.iconOnly)
        }
    }
    
    private func books() -> some View {
        var filteredBooks: [Book] = []
        if searchText.isEmpty {
            filteredBooks = bookStore.books
        } else {
            filteredBooks = bookStore.books.filter { ($0.title?.localizedCaseInsensitiveContains(searchText) ?? false) || ($0.authors?.joined(separator: "").localizedCaseInsensitiveContains(searchText) ?? false)}
        }
        return ForEach(filteredBooks) { book in
            NavigationLink(value: book) {
                BookRow(book: book)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(bookStore: BookStore())
    }
}
