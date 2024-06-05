//
//  ParseUserData.swift
//  CareMinder
//
//  Created by Darko Krstevski on 10.02.2023.
//
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct UserData: Codable {
    let goals: [Goal]

    enum CodingKeys: String, CodingKey {
        case goals = "Goals"
    }
}

// MARK: - Goal
struct Goal: Codable {
    let goal, habits: String
}
