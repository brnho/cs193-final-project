//
//  BookExcerpt.swift
//  Xcerpt
//
//  Created by Brian Ho on 5/30/23.
//

import SwiftUI

struct BookExcerpt: View {
    @Binding var book: Book
    private let excerptColor = Color(hue: 180.0/360, saturation: 45.0/100, lightness: 95.0/100, opacity: 1.0)
    
    var body: some View {
        ZStack {
            List {
                Section {
                    BookExcerptHeader(book: book)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color(UIColor.systemBackground)))
                }
                Section(header: Text("\(book.excerpts.count) excerpts")) {
                    ForEach(book.excerpts) { excerpt in
                        if let index = book.excerpts.firstIndex(where: { $0.id == excerpt.id}) {
                            ExcerptView(excerpt: $book.excerpts[index])
                        }
                    }
                }
            }
            .toolbar {
                addButton
            }
        }
    }
    
    struct ExcerptView: View {
        @Binding var excerpt: Excerpt
        
        var body: some View {
            VStack(alignment: .leading, spacing: 5) {
                Text(excerpt.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Text("Chapter \(excerpt.chapter)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("Page \(excerpt.page)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    bookmarkButton
                }
            }
            .padding(5)
        }
        
        private var bookmarkButton: some View {
            Button {
                excerpt.isBookmarked.toggle()
            } label: {
                Label("Bookmark", systemImage: excerpt.isBookmarked ? "bookmark.fill" : "bookmark")
                    .labelStyle(.iconOnly)
            }
        }
    }

    private var addButton: some View {
        Button {
            
        } label: {
            Label("Search", systemImage: "plus")
                .labelStyle(.iconOnly)
        }
    }
}

struct BookExcerpt_Previews: PreviewProvider {
    struct Preview: View {
        // Note that this needs to be @ObservedObject and not @State, probably because Excerpt is embedded too deeply
        @ObservedObject var bookStore = BookStore()
        var body: some View {
            BookExcerpt(book: $bookStore.books[0])
        }
    }
    static var previews: some View {
       Preview()
    }
}
