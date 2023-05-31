//
//  BooksSearchForm.swift
//  Xcerpt
//
//  Created by Brian Ho on 5/27/23.
//

import SwiftUI

struct BookAddForm: View {
    typealias GoogleBook = GoogleBooks.GoogleBook
    private let GOOGLE_API_KEY = "AIzaSyADRN5e9ZW61-sHZm0f-XKkQluTI4kvOI8"
    private let maxResults = 10
    
    @State private var searchText = ""
    @State private var books: [GoogleBook] = GoogleBooks.builtins
    
    var body: some View {
        Form {
            Section {
                HStack {
                    TextField("Search for books to add", text: $searchText)
                    searchButton
                }
            }
            Section {
                ForEach(books) { book in
                    BookRow(book: book.volumeInfo)
                }
            }
        }
    }
    
    private var searchButton: some View {
        Button {
            withAnimation {
                if searchText.count > 0 {
                    searchForBooks()
                }
            }
        } label : {
            Label("Search", systemImage: "magnifyingglass")
                .labelStyle(.iconOnly)
        }
    }
    
    private func searchForBooks() {
        let baseUrl = URL(string: "https://www.googleapis.com/books/v1/volumes?")!
        let url = baseUrl.appending(queryItems: [
            URLQueryItem(name: "q", value: searchText),
            URLQueryItem(name: "key", value: GOOGLE_API_KEY),
            URLQueryItem(name: "maxResults", value: String(maxResults))
        ])
        URLSession.shared.fetchData(for: url) { (result: Result<GoogleBooks, Error>) in
            switch result {
            case .success(let googleBooks):
                print(googleBooks.items)
                books = googleBooks.items
            case .failure(let error):
                // change this to an alert
                print(error)
            }
        }
    }
}

struct BookAddForm_Previews: PreviewProvider {
    static var previews: some View {
        BookAddForm()
    }
}
