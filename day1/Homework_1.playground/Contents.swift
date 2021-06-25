import UIKit

/*
 
 Elimizde sadece harflerden oluşan (noktalama işareti veya sayılar yok) uzun karakterler olsun. Bu karekterlerin içinde bazı hafrflerin tekrar edeceğini düşünün.
 Mesela 'a ' harfi 20 farklı yerde geçiyor. Bir fonksiyon ile verilen parametre değerine eşit ve daha fazla bulunan harfler silinecektir. Sonra geriye kalan string
 ekrana yazdırılacaktır. Not boşluklar sayılmayacak:)
  
  Örnek string: "aaba kouq bux"
  Tekrar sayısı 2 verildiğinde : a,b,u silinmeli ve ekrana "koq x" yazmalı
  Tekrar sayısı 3 verildiğinde : a silinmeli ve ekrana "b kouq bux"
  tekrar sayısı 4 verildiğinde  :  hiç bir harf silinmemeli aynı stringi yazmalı
  
  Not: String ve tekrar sayısını parametre olarak alsın. func (myString, count)
  
*/

func myFunc(str: String, num: Int) -> String {
    
    var strArray = Array(str)
    var counter : Int
    
    for ch in strArray {
        
        if ch != " " {
            counter = 0
            
            for character in strArray {
                
                if character == ch { counter += 1 }
            }
            
            if counter >= num {
                strArray = strArray.filter{ $0 != ch }
            }
        }
    }
    return String(strArray)
}


var example = "aaba kouq bux"
print(myFunc(str: example, num: 2))
