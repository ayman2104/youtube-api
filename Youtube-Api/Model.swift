//
//  Model.swift
//  Youtube-Api
//
//  Created by Fa Ainama Caldera S on 15/03/21.
//

import Foundation

class Model {
    
    func getVideos() {
        let url = URL(string: Constants.API_URL) // Tipe data Json adalah String
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared // Jika url sudah dapat dan siap dibagikan untuk diberitahui ke program
        
        let dataTask = session.dataTask(with: url!) {(data, response , error) in
            if error != nil || data == nil {
                return
                
                /* Cara pembaca :
                 
                 Jika eror sama dengan kosong dan jika erorrnya ada dia akan mereturn sampai datanya dapat
                 
                 */
            }
            
            do {
                // Memanggil data ke video object
                let decoder = JSONDecoder() // memprosess hasil Decodable 
                decoder.dateDecodingStrategy = .iso8601
                
                
                let response = try decoder.decode(Response.self, from: data!)
                
                dump(response)
            }
            
            catch{
                
            }
            
        }
        
        dataTask.resume()
    }
}



// Tahap2 memanggil Data JSON

/*
 - Tahap2 memanggil Data JSON
 
 1. Membuat Let untuk memanggil alamat APi dari JSon berbentuk URL dan didefinisasikan tipe data String
 2. Memanggil url Session
 3. Memberikan URL sebuah tugas ( dataTask )
 4. data dijalankan menggunakan resume()
 */


/*
 Note :
 
 - guard sama saja dengan if
 
 - Udah wajib untuk memanggil untuk pengeceken menggunakan 3 response yaitu : (data, response , error) di dalam pengecekan
 */
