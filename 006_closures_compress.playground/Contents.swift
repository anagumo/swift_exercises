import Foundation

// MARK: - Exercise 1: sumAll
/// Calcula la suma de todos los elementos en un array de números enteros
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a sumar
///
/// - Returns: Un entero (`Int`) que representa la suma de todos los elementos del array.
/// Si el array está vacío, retorna 0 ya que es el elemento neutro de la suma.
///
/// # Implementación
/// Utiliza un bucle for para iterar sobre cada elemento y mantiene un acumulador
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4, 5]
/// let result = sumAll(sequence: numbers)
/// print(result) // Output: 15
///
/// let empty = [Int]()
/// let resultEmpty = sumAll(sequence: empty)
/// print(resultEmpty) // Output: 0
/// ```
func sumAll(sequence: [Int]) -> Int {
    var accum = 0
    
    for number in sequence {
        accum = accum + number
    }
    
    return accum
}

// MARK: - Exercise 2: multiplyAll
/// Calcula el producto de todos los elementos en un array de números enteros
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a multiplicar
///
/// - Returns: Un entero (`Int`) que representa el producto de todos los elementos del array.
/// Si el array está vacío, retorna 1 ya que es el elemento neutro de la multiplicación.
///
/// # Implementación
/// Utiliza un bucle for para iterar sobre cada elemento y mantiene un acumulador del producto
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [2, 3, 4]
/// let result = multiplyAll(sequence: numbers)
/// print(result) // Output: 24
///
/// let empty = [Int]()
/// let resultEmpty = multiplyAll(sequence: empty)
/// print(resultEmpty) // Output: 1
/// ```
func multiplyAll(sequence: [Int]) -> Int {
    var accum = 1
    
    for number in sequence {
        accum = accum * number
    }
    
    return accum
}

// MARK: - Exercise 3: compress
/// Tipo alias que representa una función que combina dos enteros y produce un resultado entero. Debe llamarse IntCombiner
typealias IntCombiner = (Int, Int) -> Int

/// Reduce un array de enteros a un único valor mediante una operación de combinación especificada como último parámetro
///
/// - Parameters:
///   - sequence: Un array de enteros (`[Int]`) que se desea comprimir
///   - initialValue: El valor inicial (`Int`) que se usará como punto de partida para la combinación
///   - combinationOperation: Una función del tipo `IntCombiner` que define cómo combinar dos enteros.
///     Esta función toma dos parámetros enteros y devuelve un entero como resultado
///
/// - Returns: Un entero (`Int`) que representa el resultado de aplicar secuencialmente
///   la operación de combinación a todos los elementos del array
///
/// # Implementación
/// La función utiliza un acumulador que comienza con el valor inicial y aplica
/// la operación de combinación con cada elemento del array secuencialmente
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4]
///
/// // Ejemplo de suma
/// let sum = compress(sequence: numbers,
///                   initialValue: 0,
///                   combinationOperation: { $0 + $1 })
/// print(sum) // Output: 10
///
/// // Ejemplo de multiplicación
/// let product = compress(sequence: numbers,
///                       initialValue: 1,
///                       combinationOperation: { $0 * $1 })
/// print(product) // Output: 24
///
/// // Ejemplo con función nombrada
/// func max(_ a: Int, _ b: Int) -> Int { return a > b ? a : b }
/// let maximum = compress(sequence: numbers,
///                       initialValue: Int.min,
///                       combinationOperation: max)
/// print(maximum) // Output: 4
/// ```
func compress(sequence: [Int], initialValue: Int, combinationOperation: IntCombiner) -> Int {
    var accum = initialValue
    
    sequence.forEach {
        accum = combinationOperation(accum, $0)
    }
    
    return accum
}

// MARK: Exercise 4: sumWithCompress
/// Calcula la suma de todos los elementos en un array de enteros utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a sumar
///
/// - Returns: Un entero (`Int`) que representa la suma de todos los elementos del array.
/// Si el array está vacío, retorna 0 (el valor inicial)
///
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4, 5]
/// let result = sumWithCompress(sequence: numbers)
/// print(result) // Output: 15
///
/// let empty = [Int]()
/// let resultEmpty = sumWithCompress(sequence: empty)
/// print(resultEmpty) // Output: 0
/// ```
func sumWithCompress(sequence: [Int]) -> Int {
    compress(sequence: sequence, initialValue: 0) {
        $0 + $1
    }
}

// MARK: Exercise 5: multiplyWithCompress
/// Calcula el producto de todos los elementos en un array de enteros utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a multiplicar
///
/// - Returns: Un entero (`Int`) que representa el producto de todos los elementos del array.
/// Si el array está vacío, retorna 1 (el valor inicial, elemento neutro de la multiplicación)
///
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [2, 3, 4]
/// let result = multiplyWithCompress(sequence: numbers)
/// print(result) // Output: 24
///
/// let empty = [Int]()
/// let resultEmpty = multiplyWithCompress(sequence: empty)
/// print(resultEmpty) // Output: 1
/// ```
func multiplyWithCompress(sequence: [Int]) -> Int {
    compress(sequence: sequence, initialValue: 1) {
        $0 * $1
    }
}

// MARK: Exercise 6: sumEvenWithCompress
/// Calcula la suma de todos los números pares en un array de enteros utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Un entero (`Int`) que representa la suma de todos los números pares del array.
/// Si el array está vacío o no contiene números pares, retorna 0
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4, 5, 6]
/// let result = sumEvenWithCompress(sequence: numbers)
/// print(result) // Output: 12 (2 + 4 + 6)
///
/// let noEvens = [1, 3, 5, 7]
/// let resultNoEvens = sumEvenWithCompress(sequence: noEvens)
/// print(resultNoEvens) // Output: 0
///
/// let empty = [Int]()
/// let resultEmpty = sumEvenWithCompress(sequence: empty)
/// print(resultEmpty) // Output: 0
/// ```
func sumEvenWithCompress(sequence: [Int]) -> Int {
    compress(sequence: sequence, initialValue: 0) {
        $1 % 2 == 0 ? ($0 + $1) : $0
    }
}

// MARK: Exercise 7: sumEvensSubtractOddsWithCompress
/// Calcula la diferencia entre la suma de números pares y la suma de números impares en un array de enteros
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Un entero (`Int`) que representa el resultado de sumar todos los números pares
/// y restar todos los números impares del array. Si el array está vacío, retorna 0
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4]
/// let result = sumEvensSubtractOddsWithCompress(sequence: numbers)
/// print(result) // Output: 2 ((2 + 4) - (1 + 3))
///
/// let onlyEvens = [2, 4, 6]
/// let resultEvens = sumEvensSubtractOddsWithCompress(sequence: onlyEvens)
/// print(resultEvens) // Output: 12
///
/// let onlyOdds = [1, 3, 5]
/// let resultOdds = sumEvensSubtractOddsWithCompress(sequence: onlyOdds)
/// print(resultOdds) // Output: -9
///
/// let empty = [Int]()
/// let resultEmpty = sumEvensSubtractOddsWithCompress(sequence: empty)
/// print(resultEmpty) // Output: 0
/// ```
func sumEvensSubtractOddsWithCompress(sequence: [Int]) -> Int {
    compress(sequence: sequence, initialValue: 0) {
        $1 % 2 == 0 ? ($0 + $1) : ($0 - $1)
    }
}

// MARK: Exercise 8: maxElementWithCompress
/// Encuentra el elemento más grande en un array de enteros utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Un entero (`Int`) que representa el valor máximo encontrado en el array.
/// Si el array está vacío, retorna `Int.min` (el valor mínimo posible para un Int)
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 5, 2, 8, 3]
/// let result = maxElementWithCompress(sequence: numbers)
/// print(result) // Output: 8
///
/// let negatives = [-5, -2, -8, -1]
/// let resultNeg = maxElementWithCompress(sequence: negatives)
/// print(resultNeg) // Output: -1
///
/// let empty = [Int]()
/// let resultEmpty = maxElementWithCompress(sequence: empty)
/// print(resultEmpty) // Output: Int.min
///
/// let singleElement = [42]
/// let resultSingle = maxElementWithCompress(sequence: singleElement)
/// print(resultSingle) // Output: 42
/// ```
func maxElementWithCompress(sequence: [Int]) -> Int {
    guard !sequence.isEmpty else {
        return Int.min
    }
    
    return compress(sequence: sequence, initialValue: sequence[0]) {
        $0 > $1 ? $0 : $1
    }
}

// MARK: Exercise 9: minElementWithCompress
/// Encuentra el elemento más pequeño en un array de enteros utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Un entero (`Int`) que representa el valor mínimo encontrado en el array.
/// Si el array está vacío, retorna `Int.max` (el valor máximo posible para un Int)
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [3, 1, 5, 2, 8]
/// let result = minElementWithCompress(sequence: numbers)
/// print(result) // Output: 1
///
/// let negatives = [-5, -2, -8, -1]
/// let resultNeg = minElementWithCompress(sequence: negatives)
/// print(resultNeg) // Output: -8
///
/// let empty = [Int]()
/// let resultEmpty = minElementWithCompress(sequence: empty)
/// print(resultEmpty) // Output: Int.max
///
/// let singleElement = [42]
/// let resultSingle = minElementWithCompress(sequence: singleElement)
/// print(resultSingle) // Output: 42
/// ```
func minElementWithCompress(sequence: [Int]) -> Int {
    guard !sequence.isEmpty else {
        return Int.max
    }
    
    return compress(sequence: sequence, initialValue: sequence[0]) {
        $0 < $1 ? $0 : $1
    }
}

// MARK: - Exercise 10: positiveNumbersCountWithCompress
/// Cuenta la cantidad de números positivos en un array de enteros utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Un entero (`Int`) que representa la cantidad de números positivos (mayores que 0)
/// encontrados en el array. Si el array está vacío, retorna 0
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [-1, 0, 3, -4, 5, 6]
/// let result = positiveNumbersCountWithCompress(sequence: numbers)
/// print(result) // Output: 3 (cuenta 3, 5, 6)
///
/// let allNegative = [-1, -2, -3]
/// let resultNeg = positiveNumbersCountWithCompress(sequence: allNegative)
/// print(resultNeg) // Output: 0
///
/// let withZero = [0, 0, 0]
/// let resultZero = positiveNumbersCountWithCompress(sequence: withZero)
/// print(resultZero) // Output: 0 (el cero no se considera positivo)
///
/// let empty = [Int]()
/// let resultEmpty = positiveNumbersCountWithCompress(sequence: empty)
/// print(resultEmpty) // Output: 0
/// ```
func positiveNumbersCountWithCompress(sequence: [Int]) -> Int {
    compress(sequence: sequence, initialValue: 0) {
        $1 > 0 ? $0 + 1 : $0
    }
}

// MARK: - Exercise 11: allEvensWithCompress
/// Verifica si todos los números en un array de enteros son pares utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Un booleano (`Bool`) que indica:
///   - `true` si todos los números en el array son pares
///   - `false` si hay al menos un número impar o si el array está vacío
///
/// La función funciona contando los números pares y comparando este contador
/// con el tamaño total del array. Si son iguales, significa que todos son pares.
///
/// Ejemplo de uso:
/// ```swift
/// let allEven = [2, 4, 6, 8]
/// let result1 = allEvensWithCompress(sequence: allEven)
/// print(result1) // Output: true
///
/// let someOdd = [2, 4, 5, 6]
/// let result2 = allEvensWithCompress(sequence: someOdd)
/// print(result2) // Output: false
///
/// let empty = [Int]()
/// let result3 = allEvensWithCompress(sequence: empty)
/// print(result3) // Output: false
///
/// let singleOdd = [3]
/// let result4 = allEvensWithCompress(sequence: singleOdd)
/// print(result4) // Output: false
///
/// let singleEven = [2]
/// let result5 = allEvensWithCompress(sequence: singleEven)
/// print(result5) // Output: true
/// ```
func allEvensWithCompress(sequence: [Int]) -> Bool {
    guard !sequence.isEmpty else {
        return false
    }
    
    let evensCount = compress(sequence: sequence, initialValue: 0) {
        $1 % 2 == 0 ? $0 + 1 : $0
    }
    
    return evensCount == sequence.count
}

// MARK: - Exercise 12: allMultiplesOfThreeWithCompress
/// Verifica si todos los números en un array de enteros son múltiplos de 3 utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Un booleano (`Bool`) que indica:
///   - `true` si todos los números en el array son múltiplos de 3
///   - `false` si hay al menos un número que no es múltiplo de 3 o si el array está vacío
///
/// La función funciona contando los números que son múltiplos de 3 y comparando este contador
/// con el tamaño total del array. Si son iguales, significa que todos son múltiplos de 3.
///
/// Ejemplo de uso:
/// ```swift
/// let allMultiples = [3, 6, 9, 12]
/// let result1 = allMultiplesOfThreeWithCompress(sequence: allMultiples)
/// print(result1) // Output: true
///
/// let someNotMultiples = [3, 6, 7, 9]
/// let result2 = allMultiplesOfThreeWithCompress(sequence: someNotMultiples)
/// print(result2) // Output: false
///
/// let empty = [Int]()
/// let result3 = allMultiplesOfThreeWithCompress(sequence: empty)
/// print(result3) // Output: false
///
/// let singleNotMultiple = [4]
/// let result4 = allMultiplesOfThreeWithCompress(sequence: singleNotMultiple)
/// print(result4) // Output: false
///
/// let singleMultiple = [6]
/// let result5 = allMultiplesOfThreeWithCompress(sequence: singleMultiple)
/// print(result5) // Output: true
/// ```

func allMultiplesOfThreeWithCompress(sequence: [Int]) -> Bool {
    guard !sequence.isEmpty else {
        return false
    }
    
    let evensCount = compress(sequence: sequence, initialValue: 0) {
        $1 % 3 == 0 ? $0 + 1 : $0
    }
    
    return evensCount == sequence.count
}


// MARK: - Exercise 13: sumAllEvensAndOddsWithCompress
/// Calcula simultáneamente la suma de los números pares e impares en un array de enteros
/// utilizando dos llamadas a la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Una tupla de dos enteros donde:
///   - `evens`: La suma de todos los números pares
///   - `odds`: La suma de todos los números impares
///   Si el array está vacío, retorna (0, 0)
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4, 5, 6]
/// let result = sumAllEvensAndOddsWithCompress(sequence: numbers)
/// print(result.evens) // Output: 12 (2 + 4 + 6)
/// print(result.odds)  // Output: 9 (1 + 3 + 5)
///
/// let onlyEvens = [2, 4, 6]
/// let resultEvens = sumAllEvensAndOddsWithCompress(sequence: onlyEvens)
/// print(resultEvens) // Output: (evens: 12, odds: 0)
///
/// let onlyOdds = [1, 3, 5]
/// let resultOdds = sumAllEvensAndOddsWithCompress(sequence: onlyOdds)
/// print(resultOdds) // Output: (evens: 0, odds: 9)
///
/// let empty = [Int]()
/// let resultEmpty = sumAllEvensAndOddsWithCompress(sequence: empty)
/// print(resultEmpty) // Output: (evens: 0, odds: 0)
/// ```
func sumAllEvensAndOddsWithCompress(sequence: [Int]) -> (sumOfEvens: Int, sumOfOdds: Int){
    let sumOfEvens = sumEvenWithCompress(sequence: sequence)
    let sumOfOdds = compress(sequence: sequence, initialValue: 0) {
        $1 % 2 != 0 ? ($0 + $1) : $0
    }
    
    return (sumOfEvens, sumOfOdds)
}

// MARK: - Exercise 14: compress without initial value
/// Modificación de la función compress sin valor inicial que combina los elementos de un array de enteros usando una operación específica
///
/// - Parameters:
///   - sequence: Un array de enteros (`[Int]`) que contiene los números a combinar
///   - combinationOperation: Una función que toma dos enteros y retorna un entero,
///     definiendo cómo se combinarán los elementos
///
/// - Returns: Un entero opcional (`Int?`) que representa:
///   - El resultado de combinar todos los elementos según la operación especificada
///   - `nil` si el array está vacío
///
/// - Warning: Esta versión de `compress` difiere de la original en que no requiere un valor inicial
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4]
///
/// // Suma todos los elementos
/// let sum = compress(sequence: numbers) { $0 + $1 }
/// print(sum) // Output: Optional(10)
///
/// // Encuentra el máximo
/// let maximum = compress(sequence: numbers) { max($0, $1) }
/// print(maximum) // Output: Optional(4)
///
/// // Multiplica todos los elementos
/// let product = compress(sequence: numbers) { $0 * $1 }
/// print(product) // Output: Optional(24)
///
/// let empty = [Int]()
/// let resultEmpty = compress(sequence: empty) { $0 + $1 }
/// print(resultEmpty) // Output: nil
///
/// let singleElement = [5]
/// let resultSingle = compress(sequence: singleElement) { $0 + $1 }
/// print(resultSingle) // Output: Optional(5)
/// ```
func compress(sequence: [Int], combinationOperation: IntCombiner) -> Int? {
    guard !sequence.isEmpty else {
        return nil
    }
    
    // ? Needs a diferent value according operation, maybe add an enum to specify the operation type
    var accum = 0
    
    sequence.forEach {
        accum = combinationOperation($0, accum)
    }
    
    return accum
}


// MARK: - Closures Compress Tests
func testSumAll() {
    let numbers = [1, 2, 3, 4, 5]
    let result = sumAll(sequence: numbers)
    assert(result == 15, "La suma es incorrecta")
    
    let empty = [Int]()
    let resultEmpty = sumAll(sequence: empty)
    assert(resultEmpty == 0, "El resultado es incorrecto")
}

func testMultiplyAll() {
    let numbers = [2, 3, 4]
    let result = multiplyAll(sequence: numbers)
    assert(result == 24, "El producto es incorrecto")
    
    let empty = [Int]()
    let resultEmpty = multiplyAll(sequence: empty)
    assert(result == 1, "El resultado es incorrecto")
}

func testCompress() {
    let numbers = [1, 2, 3, 4]
    
    let sum = compress(sequence: numbers,
                       initialValue: 0,
                       combinationOperation: { $0 + $1 })
    assert(sum == 10, "La suma es incorrecta")
    
    let product = compress(sequence: numbers,
                           initialValue: 1,
                           combinationOperation: { $0 * $1 })
    assert(product == 24, "El producto es incorrecto")
    
    func max(_ a: Int, _ b: Int) -> Int { return a > b ? a : b }
    let maximum = compress(sequence: numbers,
                           initialValue: Int.min,
                           combinationOperation: max)
    assert(maximum == 4)
}

func testSumWithCompress() {
    let numbers = [1, 2, 3, 4, 5]
    let result = sumWithCompress(sequence: numbers)
    assert(result == 15, "La suma es incorrecta")
}

func testMultiplyWithCompress() {
    let numbers = [2, 3, 4]
    let result = multiplyWithCompress(sequence: numbers)
    assert(result == 24, "El producto es incorrecto")
    
    let empty = [Int]()
    let resultEmpty = multiplyWithCompress(sequence: empty)
    assert(resultEmpty == 1, "El producto para un array vacío debe ser 1")
}

func testSumEvenWithCompress() {
    let numbers = [1, 2, 3, 4, 5, 6]
    let result = sumEvenWithCompress(sequence: numbers)
    assert(result == 12, "La suma es incorrecta")
    
    let noEvens = [1, 3, 5, 7]
    let resultNoEvens = sumEvenWithCompress(sequence: noEvens)
    assert(resultNoEvens == 0, "La suma es incorrecta")
    
    let empty = [Int]()
    let resultEmpty = sumEvenWithCompress(sequence: empty)
    assert(resultEmpty == 0, "La suma es incorrecta")
}

func testSumEvensSubtractOddsWithCompress() {
    let numbers = [1, 2, 3, 4]
    let result = sumEvensSubtractOddsWithCompress(sequence: numbers)
    assert(result == 2, "El resultado es incorrecto")
    
    let onlyEvens = [2, 4, 6]
    let resultEvens = sumEvensSubtractOddsWithCompress(sequence: onlyEvens)
    assert(result == 2, "El resultado es incorrecto")
    
    let onlyOdds = [1, 3, 5]
    let resultOdds = sumEvensSubtractOddsWithCompress(sequence: onlyOdds)
    assert(result == -9, "El resultado es incorrecto")
    
    let empty = [Int]()
    let resultEmpty = sumEvensSubtractOddsWithCompress(sequence: empty)
    assert(result == 0, "El resultado es incorrecto")
}

func testMaxElementWithCompress() {
    let numbers = [1, 5, 2, 8, 3]
    let result = maxElementWithCompress(sequence: numbers)
    assert(result == 8, "El resultado es incorrecto")
    
    let negatives = [-5, -2, -8, -1]
    let resultNeg = maxElementWithCompress(sequence: negatives)
    assert(result == -1, "El resultado es incorrecto")
    ///
    let empty = [Int]()
    let resultEmpty = maxElementWithCompress(sequence: empty)
    assert(result == Int.min, "El resultado es incorrecto")
    
    let singleElement = [42]
    let resultSingle = maxElementWithCompress(sequence: singleElement)
    assert(result == 42, "El resultado es incorrecto")
}

func testMinElementWithCompress() {
    let numbers = [3, 1, 5, 2, 8]
    let result = minElementWithCompress(sequence: numbers)
    assert(result == 1, "El resultado es incorrecto")
    
    let negatives = [-5, -2, -8, -1]
    let resultNeg = minElementWithCompress(sequence: negatives)
    assert(resultNeg == -8, "El resultado es incorrecto")
    
    let empty = [Int]()
    let resultEmpty = minElementWithCompress(sequence: empty)
    assert(resultEmpty == Int.max, "El resultado es incorrecto")
    
    let singleElement = [42]
    let resultSingle = minElementWithCompress(sequence: singleElement)
    assert(resultSingle == 42, "El resultado es incorrecto")
}

func testPositiveNumbersCountWithCompress() {
    let numbers = [-1, 0, 3, -4, 5, 6]
    let result = positiveNumbersCountWithCompress(sequence: numbers)
    assert(result == 3, "El resultado es incorrecto")
    
    let allNegative = [-1, -2, -3]
    let resultNeg = positiveNumbersCountWithCompress(sequence: allNegative)
    assert(result == 0, "El resultado es incorrecto")
    
    let withZero = [0, 0, 0]
    let resultZero = positiveNumbersCountWithCompress(sequence: withZero)
    assert(result == 0, "El resultado es incorrecto")
    
    let empty = [Int]()
    let resultEmpty = positiveNumbersCountWithCompress(sequence: empty)
    assert(result == 0, "El resultado es incorrecto")
}

func testAllEvensWithCompress() {
    let allEven = [2, 4, 6, 8]
    let result1 = allEvensWithCompress(sequence: allEven)
    assert(result1, "El resultado es incorrecto")
    
    let someOdd = [2, 4, 5, 6]
    let result2 = allEvensWithCompress(sequence: someOdd)
    assert(result2, "El resultado es incorrecto")
    
    let empty = [Int]()
    let result3 = allEvensWithCompress(sequence: empty)
    assert(result3, "El resultado es incorrecto")
    
    let singleOdd = [3]
    let result4 = allEvensWithCompress(sequence: singleOdd)
    assert(result4, "El resultado es incorrecto")
    
    let singleEven = [2]
    let result5 = allEvensWithCompress(sequence: singleEven)
    assert(result5, "El resultado es incorrecto")
}

func testAllMultiplesOfThreeWithCompress() {
    let allMultiples = [3, 6, 9, 12]
    let result1 = allMultiplesOfThreeWithCompress(sequence: allMultiples)
    assert(result1 == true, "El resultado es incorrecto")
    
    let someNotMultiples = [3, 6, 7, 9]
    let result2 = allMultiplesOfThreeWithCompress(sequence: someNotMultiples)
    assert(result1 == true, "El resultado es incorrecto")
    
    let empty = [Int]()
    let result3 = allMultiplesOfThreeWithCompress(sequence: empty)
    assert(result1 == false, "El resultado es incorrecto")
    
    let singleNotMultiple = [4]
    let result4 = allMultiplesOfThreeWithCompress(sequence: singleNotMultiple)
    assert(result1 == false, "El resultado es incorrecto")
    
    let singleMultiple = [6]
    let result5 = allMultiplesOfThreeWithCompress(sequence: singleMultiple)
    assert(result1 == true, "El resultado es incorrecto")
}

func testSumAllEvensAndOddsWithCompress() {
    let numbers = [1, 2, 3, 4, 5, 6]
    let result = sumAllEvensAndOddsWithCompress(sequence: numbers)
    assert(result.sumOfEvens == 12, "El resultado es incorrecto")
    assert(result.sumOfOdds == 9, "El resultado es incorrecto")
    
    let onlyEvens = [2, 4, 6]
    let resultEvens = sumAllEvensAndOddsWithCompress(sequence: onlyEvens)
    assert(resultEvens == (sumOfEvens: 12, sumOfOdds: 0), "El resultado es incorrecto")
    
    let onlyOdds = [1, 3, 5]
    let resultOdds = sumAllEvensAndOddsWithCompress(sequence: onlyOdds)
    assert(resultOdds == (sumOfEvens: 0, sumOfOdds: 9), "El resultado es incorrecto")
    
    let empty = [Int]()
    let resultEmpty = sumAllEvensAndOddsWithCompress(sequence: empty)
    assert(resultOdds == (sumOfEvens: 0, sumOfOdds: 0), "El resultado es incorrecto")
}

func testCompressModified() {
    let numbers = [1, 2, 3, 4]
    let sum = compress(sequence: numbers) { $0 + $1 }
    assert(sum == Optional(10), "El resultado es incorrecto")
    
    let maximum = compress(sequence: numbers) { max($0, $1) }
    assert(maximum == Optional(4), "El resultado es incorrecto")
    
    let product = compress(sequence: numbers) { $0 * $1 }
    assert(product == Optional(24), "El resultado es incorrecto")
    
    let empty = [Int]()
    let resultEmpty = compress(sequence: empty) { $0 + $1 }
    assert(resultEmpty == nil, "El resultado es incorrecto")
    
    let singleElement = [5]
    let resultSingle = compress(sequence: singleElement) { $0 + $1 }
    assert(resultSingle == Optional(5), "El resultado es incorrecto")
}

func runAllTests() {
    testSumAll()
    testMultiplyAll()
    testCompress()
    testSumWithCompress()
    testMultiplyWithCompress()
    testSumEvenWithCompress()
    testSumEvensSubtractOddsWithCompress()
    testMaxElementWithCompress()
    testMinElementWithCompress()
    testPositiveNumbersCountWithCompress()
    testAllEvensWithCompress()
    testAllMultiplesOfThreeWithCompress()
    testSumAllEvensAndOddsWithCompress()
    testCompressModified()
}
