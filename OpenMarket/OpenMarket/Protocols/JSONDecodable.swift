//
//  MockJSONParser.swift
//  OpenMarket
//
//  Created by Jost, 잼킹 on 2021/08/10.
//

import Foundation

enum ParsingError: Error {
    case invalidFileName
    case decodingError
}

protocol JSONDecodable {}

extension JSONDecodable {
    func readLocalFile(for name: String) throws -> Data {
        guard let url = Bundle.main.url(forResource: name, withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            throw ParsingError.invalidFileName
        }
        return data
    }
    
    func decodeJSON<T: Decodable>(from jsonData: Data) throws -> T {
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(T.self, from: jsonData) else {
            throw ParsingError.decodingError
        }
        return result
    }
}
