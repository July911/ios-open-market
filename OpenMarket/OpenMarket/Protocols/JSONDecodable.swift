//
//  MockJSONParser.swift
//  OpenMarket
//
//  Created by Jost, 잼킹 on 2021/08/10.
//

import Foundation

enum ParsingError: LocalizedError {
    case invalidFileName
    case decodingError
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidFileName:
            return "Invalide File Name"
        case .decodingError:
            return "Decoding Error"
        case .unknown:
            return "Parsing Unknown Error"
        }
    }
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
    
    func decodeJSON<T: Decodable>(_ type: T.Type, from jsonData: Data) throws -> T {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        guard let result = try? decoder.decode(T.self, from: jsonData) else {
            throw ParsingError.decodingError
        }
        return result
    }
}