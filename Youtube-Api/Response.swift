//
//  Response.swift
//  Youtube-Api
//
//  Created by Fa Ainama Caldera S on 18/03/21.
//

import Foundation


// File sebelumny memakai Decodable maka file yang lain harus memakai Decodable

// struct Response untuk mentrigger hasil dari file Video.swift

struct Response : Decodable{
    var items : [Video]? // struct Video dijadikan string biar gampang
    
    enum CodingKeys: String , CodingKey {
        case items
    }
    
    init (form decoder: Decoder ) throws {
        let container = try
            decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try
            container.decode([Video].self, forKey: .items)
    }
}
