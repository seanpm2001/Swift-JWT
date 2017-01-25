/**
 * Copyright IBM Corporation 2017
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation

public struct Header {
    var headers: [String:Any]
    
    public init(_ header: [HeaderKeys:Any]) {
        self.headers = [String:Any]()
        for (key, value) in header {
            self.headers[key.rawValue] = value
        }
    }
    
    init(_ header: [String:Any]) {
        headers = header
    }
    
    public subscript(key: HeaderKeys) -> Any? {
        get {
            return headers[key.rawValue]
        }
        
        set(newValue) {
            headers[key.rawValue] = newValue
        }
    }
    
    func encode() throws -> String? {
        let data = try JSONSerialization.data(withJSONObject: headers)
        return Base64URL.encode(data)
    }
}

public enum HeaderKeys: String {
    case alg
    case jku
    case jwk
    case kid
    case x5u
    case x5c
    case x5t
    case x5tS256 = "x5t#S256"
    case typ
    case cty
    case crit
}