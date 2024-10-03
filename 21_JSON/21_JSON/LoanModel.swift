//
//  LoanModel.swift
//  21_JSON
//
//  Created by ms k on 7/7/24.
//

import Foundation

struct Base : Codable {
    var paging : Paging
    var loans : [Loans]
}
//Base
struct Paging : Codable{
    let page : Int
    let total : Int
    let page_size : Int
    let pages : Int
}
//Base
struct Loan : Codable, Identifiable{
    
    let id: Int
    let name : String
    let description : [LoanDescription]
    let status : String
    let funded_amount : Int
    let basket_amount : Int
    let image : Image
    let activity : String
    let sector : String
    let themes : [String]
    let use : String
    let location : Location
    let partner_id : Int
    let posted_date : String
    let planned_expiration_date : String
    let loan_amount : Int
    let borrower_count : Int
    let lender_count : Int
    let bonus_credit_eligibility : Bool
    let tags : [Tag]
}
//loans
struct LoanDescription : Codable{
    let languages : [String]
}
//loans
struct Image : Codable{
    let id : Int
    let template_id : Int
}

//loans
struct Location : Codable {
    let country_code : String
    let country : String
    let town : String
    let geo : Location_Geo
}
//loans/location
struct Location_Geo: Codable{
    let level : String
    let pairs : String
    let type : String
}
//loans
struct Tag : Codable{
    let name : String
    let id : Int
}

extension Loan : Hashable{
    static func == (lhs: Loan, rhs: Loan) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

let json = """
{
    "name": "John Davis",
    "location": {
        "country": "Peru"
    },
    "use": "to buy a new collection of clothes to stock her shop before the holidays.",
    "loan_amount": 150
}
"""

