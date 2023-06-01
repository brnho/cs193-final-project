//
//  BookExcerptHeader.swift
//  Xcerpt
//
//  Created by Brian Ho on 5/30/23.
//

import SwiftUI

struct BookExcerptHeader: View {
    @Binding var book: Book
    
    private let imageWidth = 50.0
    private let imageAspectRatio = 1.5
    
    var body: some View {
        HStack {
            bookImage
            VStack(alignment: .leading) {
                HStack{
                    bookText
                    Spacer()
                    bookmarkButton
                }
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
            .font(.title2)
            .bold()
            .lineLimit(1)
    }
    
    private var authorText: some View {
        Text(book.authors.joined(separator: ", "))
            .lineLimit(1)
            .font(.subheadline)
            .foregroundColor(.secondary)
        
    }
    
    private var bookmarkButton: some View {
        Button {
            book.isFavorited.toggle()
        } label: {
            Label("Bookmark", systemImage: book.isFavorited ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(book.isFavorited ? .red : .gray)
        }
    }
}

struct BookExcerptHeader_Previews: PreviewProvider {
    struct Preview: View {
        @State var book = Book.builtins[0]
        var body: some View {
            BookExcerptHeader(book: $book)
        }
    }
    static var previews: some View {
        Preview()
    }
}
