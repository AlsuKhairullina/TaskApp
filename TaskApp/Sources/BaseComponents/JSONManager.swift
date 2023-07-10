//
//  JSONManager.swift
//  TaskApp
//
//  Created by Алсу Хайруллина on 07.07.2023.
//

import Foundation

class JSONManager {
    static let shared = JSONManager()
    
    func loadJson(filename: String) -> [Task] {
        guard let file = Bundle.main.url(forResource: filename, withExtension: "json")
               else {
                   fatalError("Unable to locate file \"\(filename)\" in main bundle.")
           }
           do {
               let data = try Data(contentsOf: file)
               let decoder = JSONDecoder()
               let jsonData = try decoder.decode(TaskData.self, from: data)
               return jsonData.task
           } catch {
               fatalError("Unable to load \"\(filename)\" from main bundle:\n\(error)")
           }
       }
}
