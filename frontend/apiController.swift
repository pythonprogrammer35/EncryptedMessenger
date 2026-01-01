//
//  SwiftUIView.swift
//  WheelTest
//
//  Created by Braedon Collett on 1/1/26.
//

import SwiftUI

struct Post: Codable {
    let id: Int?
    let title: String
    let body: String
    let userId: Int
}



struct apiController: View {
    func getPost() {
        guard let url = URL(string: "https://5bb8b20eee0b.ngrok-free.app/testing/?input=Hey") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let error = error else {
                print("oops")
                print(error)
                return
            }
            guard let data = data else {
                print("no data")
                return
            }
            print(data)
            return
        }.resume()
        
    }
    
    func sendPost(newPost: String) {
        guard let url = URL(string: "https://5bb8b20eee0b.ngrok-free.app/sendmessage") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        
        let bodyData = ["message": newPost]
        
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: bodyData)
            request.httpBody = jsonData
        } catch {
            print("Error encoding JSON: \(error)")
            return
        }


        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    print("Response: \(responseString)")
                }
            }
        }.resume()
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

