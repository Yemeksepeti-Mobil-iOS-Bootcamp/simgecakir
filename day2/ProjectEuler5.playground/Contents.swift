/*
 
 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

 What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
 
*/

func myFunc(){
    
    var number = 2520
    var flag = true
    
    while true {

        for i in 2 ... 20 {
            
            if number % i != 0 {
                
                number += 10
                flag = false
                break
            }
        }
        if flag { break }
    }
    print(number)
}

myFunc()
