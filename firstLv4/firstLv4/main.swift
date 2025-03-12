// 연산을 위한 프로토콜
protocol AbstractOperation {
    // 두 개의 입력 값을 받아 결과를 반환하는 함수
    func result(inputA: Double, inputB: Double) -> Double?
}

// 계산기 클래스
class Calculator {
    // 옵셔널로 선언하여 초기화 생략, 클래스 변수 operation (프로퍼티)
    var operation: AbstractOperation?
    
    // 연산을 설정하는 함수(연산을 동적으로 변경하는 함수)
    // 매개변수 operation (함수에서만 사용)
    func setOperation(_ operation: AbstractOperation) {
        self.operation = operation //클래스 변수(`self.operation`)에 매개변수(`operation`) 값을 넣음
    }
    
    // 설정된 연산을 실행하는 메서드
    @discardableResult
    func calculate(_ inputA: Double, _ inputB: Double) -> Double? {
        return operation?.result(inputA: inputA, inputB: inputB)
    }
}

// 덧셈
class AddOperation: AbstractOperation {
    // 덧셈 연산 수행 후 결과 반환
    func result(inputA: Double, inputB: Double) -> Double? {
        let sum = inputA + inputB
        print("덧셈 결과: \(sum)")  // 결과 출력
        return sum
    }
} 

// 뺄셈
class SubtractOperation: AbstractOperation {
    // 뺄셈 연산 수행 후 결과 반환
    func result(inputA: Double, inputB: Double) -> Double? {
        let diff = inputA - inputB
        print("뺄셈 결과: \(diff)")  // 결과 출력
        return diff
    }
}

// 곱셈
class MultiplyOperation: AbstractOperation {
    
    func result(inputA: Double, inputB: Double) -> Double? {
        let mul = inputA * inputB
        print("곱셈 결과: \(mul)")
        return mul
    }
}

// 나눗셈
class DivideOperation: AbstractOperation {
    // 나눗셈 수행 (0으로 나눌 경우 예외 처리)
    func result(inputA: Double, inputB: Double) -> Double? {
        if inputB == 0 {
            print("0으로 나눌 수 없습니다.")
            return nil  // nil 반환하여 오류 처리
        }
        let div = inputA / inputB
        print("나눗셈 결과: \(div)")
        return div
    }
}

// 계산기 객체 생성
let calculator = Calculator()

calculator.setOperation(AddOperation())
calculator.calculate(10, 20)

calculator.setOperation(SubtractOperation())
calculator.calculate(10, 20)

calculator.setOperation(MultiplyOperation())
calculator.calculate(10, 20)

calculator.setOperation(DivideOperation())
calculator.calculate(10, 20)


calculator.setOperation(DivideOperation())
calculator.calculate(10, 0)
