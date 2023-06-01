//
//  Book.swift
//  Xcerpt
//
//  Created by Brian Ho on 5/27/23.
//

import Foundation

struct GoogleBooks: Codable {
    static var builtins: [GoogleBook] = [Xcerpt.GoogleBooks.GoogleBook(volumeInfo: Xcerpt.Book(title: "The Myth of Normal", authors: ["Gabor Maté, MD"], imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=beE2EAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")))), Xcerpt.GoogleBooks.GoogleBook(volumeInfo: Xcerpt.Book(title: "In the Realm of Hungry Ghosts", authors: ["Gabor Maté, MD"], imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=EivUaonC2TcC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")))), Xcerpt.GoogleBooks.GoogleBook(volumeInfo: Xcerpt.Book(title: "When the Body Says No", authors: ["Gabor Maté, MD"], imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=8hjoyCFTu6IC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")))), Xcerpt.GoogleBooks.GoogleBook(volumeInfo: Xcerpt.Book(title: "Scattered Minds", authors: ["Gabor Maté, MD"], imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=_FoNmxfSPAUC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")))), Xcerpt.GoogleBooks.GoogleBook(volumeInfo: Xcerpt.Book(title: "Scattered", authors: ["Gabor Maté, MD"], imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=N-LOzAUy1E0C&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")))), Xcerpt.GoogleBooks.GoogleBook(volumeInfo: Xcerpt.Book(title: "Hold On to Your Kids", authors: ["Gordon Neufeld", "Gabor Maté, MD"], imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=2Qr98PzAKTkC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")))), Xcerpt.GoogleBooks.GoogleBook(volumeInfo: Xcerpt.Book(title: "Scattered Minds", authors: ["Gabor Maté, MD"], imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=Nv2hEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")))), Xcerpt.GoogleBooks.GoogleBook(volumeInfo: Xcerpt.Book(title: "When the Body Says No", authors: ["Gabor Mate"], imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=BBWorCaG_zUC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")))), Xcerpt.GoogleBooks.GoogleBook(volumeInfo: Xcerpt.Book(title: "The Scourge of the Swastika", authors: ["Edward Frederick Langley Russell Baron Russell of Liverpool"], imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=qeKbPwAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api")))), Xcerpt.GoogleBooks.GoogleBook(volumeInfo: Xcerpt.Book(title: "Psychedelics and Psychotherapy", authors: ["Tim Read", "Maria Papaspyrou"], imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=VZgfEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"))))]
    
    let items: [GoogleBook]
    
    struct GoogleBook: Codable, Identifiable {
        var id = UUID()
        let volumeInfo: Book
        
        enum CodingKeys: CodingKey {
            case volumeInfo
        }
    }
}

struct Book: Codable, Identifiable, Hashable {
    static var builtins: [Book] = [Xcerpt.Book(title: "The Myth of Normal", authors: ["Gabor Maté, MD"], imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=beE2EAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")), excerpts: Excerpt.builtins), Xcerpt.Book(title: "In the Realm of Hungry Ghosts", authors: ["Gabor Maté, MD"], imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=EivUaonC2TcC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")), excerpts: Excerpt.builtins), Xcerpt.Book(title: "When the Body Says No", authors: ["Gabor Maté, MD"], imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=8hjoyCFTu6IC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")), excerpts: Excerpt.builtins), Xcerpt.Book(title: "Scattered Minds", authors: ["Gabor Maté, MD"], imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=_FoNmxfSPAUC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")), excerpts: Excerpt.builtins), Xcerpt.Book(title: "Scattered", authors: ["Gabor Maté, MD"], imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=N-LOzAUy1E0C&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")), excerpts: Excerpt.builtins), Xcerpt.Book(title: "Hold On to Your Kids", authors: ["Gordon Neufeld", "Gabor Maté, MD"] , imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=2Qr98PzAKTkC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")), excerpts: Excerpt.builtins)]
    
    var id = UUID()
    var title: String = ""
    var authors: [String] = [""]
    var imageLinks: ImageLinks?
    struct ImageLinks: Codable, Hashable {
        let smallThumbnail: String
    }
    var excerpts: [Excerpt] = []
    var isFavorited = false
    var useCustomImage = false
    var color1: RGBA = RGBA(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255, alpha: 1.0)
    var color2: RGBA = RGBA(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255, alpha: 1.0)
    
    enum CodingKeys: CodingKey {
        case title, authors, imageLinks
    }
}


