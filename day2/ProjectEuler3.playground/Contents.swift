import UIKit

/*
 
 The prime factors of 13195 are 5, 7, 13 and 29.

 What is the largest prime factor of the number 600851475143 ?
 
 */

func myFunc(number : Int){
    
    var results = [Int]()
    let newNumber = Int( sqrt(Double(number)) )
    
    for i in 2 ..< newNumber {
        
        if number % i == 0{
            if isPrime(i){
                results.append(i)
            }
        }
    }
    print( results.max() ?? 0 )
}

func isPrime(_ num: Int) -> Bool {
    
    for i in 2 ..< num{
        
        if (num % i == 0) && (num != i){
            return false
        }
    }
    return true
}

myFunc(number: 600851475143)
