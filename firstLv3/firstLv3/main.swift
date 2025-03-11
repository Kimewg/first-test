class Calculator{
   var inputA: Double
    var inputB: Double
    
    init(inputA:Double, inputB:Double){
        self.inputA = inputA
        self.inputB = inputB
    }
    func result() -> Double? {
        return 0
    }
}
    

class AddOperation: Calculator {
    // 나눗셈에서 예외처리 nil 반환해야해서 옵셔널 사용
        override func result() -> Double? {
           let sum = inputA + inputB
            print("덧셈 결과: \(sum)")
            return sum
        }
    }
class SubtractOperation: Calculator {
    override func result() -> Double? {
        let diff = inputA - inputB
        print("뺄셈 결과: \(diff)")
        return diff
    }
}

class MultiplyOperation: Calculator {
    override func result() -> Double? {
        let mul = inputA * inputB
        print("곱셈 결과: \(mul)")
        return mul
    }
}

class DivideOperation: Calculator {
    override func result() -> Double? {
        if inputB == 0{
            print("0으로 나눌 수 없습니다.")
            return nil
        }
        let div = inputA / inputB
        print("나눗셈 결과: \(div)")
        return div
    }
}

let add = AddOperation(inputA: 3.2, inputB: 2)
add.result() // 덧셈 결과: 5.2

let subtract = SubtractOperation(inputA: 3.2, inputB: 2)
subtract.result() //뺄셈 결과: 1.2

let multiply = MultiplyOperation(inputA: 3.2, inputB: 2)
multiply.result() // 곱셈 결과: 6.4

let divide = DivideOperation(inputA: 3.2, inputB: 2)
divide.result() // 나눗셈 결과: 1.6

let divide0 = DivideOperation(inputA: 3.2, inputB: 0)
divide0.result() // 0으로 나눌 수 없습니다.
