//
//  BookRow.swift
//  Xcerpt
//
//  Created by Brian Ho on 5/29/23.
//

import SwiftUI

struct BookRow: View {
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
    

    private var bookText: some View {
        Text(book.title)
            .lineLimit(1)
    }
    
    private var authorText: some View {
        Text(book.authors.joined(separator: ", "))
            .lineLimit(1)
            .font(.subheadline)
            .foregroundColor(.secondary)
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookRow(book: Book.builtins[0])
    }
}
