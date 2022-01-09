import Foundation

struct ProductPostRequester: Networkable {
    static var baseURLString: String = "https://market-training.yagom-academy.kr/api/products"
    static var httpMethod: HttpMethod = .POST
    let identifier: String
    let params: ProductPost.Request.Params
    let images: Data
    
    var url: URL? {
        return URL(string: Self.baseURLString)
    }
    
    var request: URLRequest? {
        guard let url = url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = Self.httpMethod.rawValue
        
        //TODO: need to add Body
        
        return request
    }
}
