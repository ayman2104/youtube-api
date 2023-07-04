//
//  Video.swift
//  Youtube-Api
//
//  Created by Fa Ainama Caldera S on 15/03/21.
//

import Foundation

// Struct untuk memanggil data dari JSON untuk ditampilkan
struct Video : Decodable{
    // Decodable = menerjemahkan json ke dalam aplikasi
    
    // var untuk menampung data dari Api Youtube
    
    var videoId = ""  // Untuk menampung id dari Video
    var title = ""  // Untuk menampung jdul suatu video yt
    var description = "" // Untuk menampng deskripsi suatu video yt
    var thumbnail = "" // Untuk menampung gambar thumbnail
    var published = Date() // Untuk menampung tanggal upload
    
    
    // Perubahan nama variabel dari jSon
    enum CodingKeys: String, CodingKey {
        
        // fungsi enum adalah melakukan perubahan (pesan) sekaligus menjaga perubahan
        
        
        // Coding key fungsi agar penamaan variabel yg ada di Xcode sama dengan di Data JSON (Khusus JSON)
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
        
        
        
    }
    
    init (from decoder: Decoder) throws {
        
        // Decoder adalah anak dari Decodable
        
        
        // let container untuk menampung data dari CodingKeys (enum)
        
        // .self adalah untuk memanggil data dari satu struct yg sama
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // container adalah nama lain dari jSON object
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // Parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // Parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // Parse the publish date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        // Parse thumbnails (Json Object)
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        // Parse Video ID (Json Object)
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
}



/*
 
 
 /*
 
 
 Urutan dari Decodable (jSon)
 
 Decodable -> Decoder -> decode
 
 dari jSon Object [Decodable] -> data (isi dari jSon object) [Decoder] -> Array [decode]
 
 
 */
 
 
 /*
 
 forKey adalah kata kunci
 
 
 */
 
 /*
 
    Kegunaan CodingKeys adalah untuk memanggil JSon object bersarang
 
    nah untuk memakai CodingKeys dgn menggunakan enum dan isinya case
    
    
    
 
 */
 
 
 */
