//
//  ContentView.swift
//  Xcerpt
//
//  Created by Brian Ho on 5/27/23.
//

import SwiftUI

struct BookHome: View {
    @EnvironmentObject var bookStore: BookStore
    @State private var searchText = ""
    @State private var showFilterForm = false
    @State private var showAddForm = false
    @State private var showOnlyFavorites = false
    @State private var indexOfBookToEdit: Int?
    @State private var showBookEditForm = false
    
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
                BookFilterForm(sortOrder: $bookStore.sortOrder, showOnlyFavorites: $showOnlyFavorites)
            }
            .sheet(isPresented: $showAddForm) {
                BookAddForm()
            }
            .sheet(isPresented: $showBookEditForm) {
                let _ = print("yo")
                if let indexOfBookToEdit {
                    let _ = print($bookStore.books[indexOfBookToEdit].title)
                    BookEditForm(book: $bookStore.books[indexOfBookToEdit])
                }
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
        let filteredBooks: [Book] = filterBooks()
        return ForEach(filteredBooks) { book in
            if let index = $bookStore.books.firstIndex(where: { $0.id == book.id }) {
                NavigationLink(value: book) {
                    HStack {
                        BookRow(book: book)
                        Spacer()
                        if book.isFavorited {
                            Image(systemName: "star.fill")
                                .foregroundColor(.red)
                        }
                    }
                }
                .contextMenu {
                    contextMenu(index: index)
                }
            }
        }
    }
    
    private func contextMenu(index: Int) -> some View {
        Group {
            Button {
                print(index)
                indexOfBookToEdit = index
                print(indexOfBookToEdit!)
                showBookEditForm = true
            } label: {
                Label("Edit", systemImage: "pencil")
            }
            Button(role: .destructive) {
                
            } label: {
                Label("Delete", systemImage: "minus.circle")
            }
        }
    }
    
    private func filterBooks() -> [Book] {
        var filteredBooks: [Book] = []
        if searchText.isEmpty {
            filteredBooks = bookStore.books
        } else {
            filteredBooks = bookStore.books.filter { $0.title.localizedCaseInsensitiveContains(searchText) || $0.authors.joined(separator: "").localizedCaseInsensitiveContains(searchText)}
        }
        if showOnlyFavorites {
            filteredBooks = filteredBooks.filter({ $0.isFavorited })
        }
        return filteredBooks
    }
}

struct BookHome_Previews: PreviewProvider {
    static var previews: some View {
        BookHome()
            .environmentObject(BookStore())
    }
}
