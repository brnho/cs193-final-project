//
//  BookExcerptHeader.swift
//  Xcerpt
//
//  Created by Brian Ho on 5/30/23.
//

import SwiftUI

struct BookExcerptHeader: View {
    let book: Book
    
    private let imageWidth = 50.0
    private let imageAspectRatio = 1.5
    
    var body: some View {
        HStack {
            bookImage
            VStack(alignment: .leading) {
                bookText
                authorText
            }
        }
    }
    
    @ViewBuilder
    private var bookImage: some View {
        if let bookUrl = book.imageLinks?.smallThumbnail, let url = URL(string: bookUrl) {
            AsyncImage(url: url) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: imageWidth, height: imageWidth * imageAspectRatio)
        }
    }
    
    @ViewBuilder
    private var bookText: some View {
        if let title = book.title {
            Text(title)
                .font(.title2)
                .bold()
                .lineLimit(1)
        }
    }
    
    @ViewBuilder
    private var authorText: some View {
        if let authors = book.authors {
            Text(authors.joined(separator: ", "))
                .lineLimit(1)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

struct BookExcerptHeader_Previews: PreviewProvider {
    static var previews: some View {
        BookExcerptHeader(book: Book.builtins[0])
    }
}
