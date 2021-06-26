import UIKit

/*
 
 A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

 Find the largest palindrome made from the product of two 3-digit numbers.
 
 */

func myFunc() -> Int{
    
    var result = 0
    var max = 0

    for num1 in (500 ... 999).reversed() {
        for num2 in (500 ... 999).reversed() {
            
            result = num1 * num2
            
            if (max < result) {
                if isPalindrom(result) {
                    max = result
                    break
                }
            }
        }
    }
    return max
}

func isPalindrom(_ number : Int) -> Bool {
    
    let temp = Array(String(number))
    
    return temp == temp.reversed()
}

print(myFunc())
