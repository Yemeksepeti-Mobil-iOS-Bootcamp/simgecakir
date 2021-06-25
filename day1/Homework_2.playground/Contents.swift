import UIKit

/*
 
  Elimizde uzun bir cümle olsun, Bazı kelimeler tekrar edecek bir cümle düşünün. İstediğimiz ise, hangi kelimeden kaç tane kullanıldığını bulmanız.
  string = "merhaba nasılsınız . iyiyim siz nasılsınız . bende iyiyim. "
 
*/

func myFunc(_ string: inout String) -> [String : Int] {
    
    var dict = [String : Int]()
    
    if string != "" {
        
        string = string.replacingOccurrences(of: ".", with: "")
        let arrString = string.components(separatedBy: " ")
        
        for word in arrString{
            
            if word != ""{
                dict[word, default:0] += 1
            }
        }
    }
    return dict
}
var example = "merhaba nasılsınız . iyiyim siz nasılsınız . bende iyiyim. "
print( myFunc(&example) )
