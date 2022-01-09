import Foundation


protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSessionProtocol {
    func request(urlRequest: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        let task = dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                }
               
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            
            guard (200...299) ~= response.statusCode else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            
            completion(.success(data))
        }
        task.resume()
    }
}

