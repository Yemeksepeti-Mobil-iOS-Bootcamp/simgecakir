import UIKit


// Girilen sayının asal olup olmadığını bulan bir extension yazınız

extension Int {

    func isPrime() -> Bool {

        for i in 2 ..< self {
            if (self % i == 0){ return false }
        }
        return true
    }
}

print(13.isPrime())


// İki parametreli ve FARKLI tipli bir generic örneği yapınız... (T, U) ???

func append<T: Numeric, U: Comparable >(number: T, element: U) {
    
    print(number + 3)
    print(element)
    
}
append(number: 4.5, element: "hello")

/* Project Euler 6. Soru
 
 Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

*/

func sumSquareDifference(upper : Int){

    let array = Array(1 ... upper)
    let sumOfSquare = array.map{ $0 * $0 }.reduce(0,+)

    var squareOfSum = array.reduce(0, +)
    squareOfSum *= squareOfSum

    print( squareOfSum - sumOfSquare)       // 25164150
}

sumSquareDifference(upper: 100)



/* Project Euler 7. Soru:

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?

 */

func findPrime(order: Int) {
    
    var iteration = 1       // iteration will start from 1 because of skipping prime 2
    var prime = 3
    
    while iteration < order {
        
        if isPrime(prime){ iteration += 1 }
        prime += 2
    }
    print(prime - 2)        //  2 is subtracted because 2 is added to the result end of the while loop
}

func isPrime(_ number: Int) -> Bool {

    for i in 2 ..< number {
        if (number % i == 0){ return false }
    }
    return true
}

findPrime(order: 10_001)
