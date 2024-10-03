//
//  ContentView.swift
//  21_JSON
//
//  Created by ms k on 7/7/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State var loans : [Loan] = []
    let jsonURL = "https://api.kivaws.org/v1/loans/newest.json"
    let decoder = JSONDecoder()
//    if let jsonData = json.data(using: .utf8){
//        do{
//            let loan = try decoder.decode(Loan.self, from: jsonData)
//            print(loan)
//        } catch{
//            print(error)
//        }
//    }
    
    var body: some View {
        NavigationStack{
            List(loans, id: \.id){ loan in
                
                VStack{
                    HStack(spacing: 20){
                        Text("id : \(loan.id)")
                        Text("name: \(loan.name)")
                    }
                    Text("languages: \(loan.description)")
                    
                }
            }
            .navigationTitle("Loans")
        }
        .onAppear{
            Task{
                loans = try await loadData(url: URL(string: jsonURL)!)
                
            }
        }
        
    }
    func loadData(url : URL) async throws -> [Loan]{
        let (data, error) = try await URLSession.shared.data(from: url)
        print("Error : \(error)")
        return try JSONDecoder().decode([Loan].self, from: data)
    }
    
    
}

