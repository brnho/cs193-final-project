//
//  BookGridItem.swift
//  Xcerpt
//
//  Created by Brian Ho on 5/29/23.
//

import SwiftUI

struct BookGridItem: View {
    let book: Book
    
    private let imageWidth = 50.0
    private let imageAspectRatio = 1.5
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 100, height: 100)
                .foregroundColor(.orange)
                .overlay(bookImage)
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
            .background(RoundedRectangle(cornerRadius: 5))
        }
    }
    
    @ViewBuilder
    private var bookText: some View {
        Text(book.title)
            .lineLimit(1)
    }
    
    @ViewBuilder
    private var authorText: some View {
        Text(book.authors.joined(separator: ", "))
            .lineLimit(1)
            .font(.subheadline)
            .foregroundColor(.secondary)
    }
}

struct BookGridItem_Previews: PreviewProvider {
    static var previews: some View {
        BookGridItem(book: Book.builtins[0])
    }
}
