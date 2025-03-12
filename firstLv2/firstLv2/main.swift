//
//  main.swift
//  firstLv2
//
//  Created by 김은서 on 3/11/25.
//
class Calculator {
    var inputA : Double
    var inputB : Double
    
    // 초기값 설정
    init(inputA:Double, inputB:Double){
        self.inputA = inputA
        self.inputB = inputB
    }
    
    // 사칙연산 계산
    func calculate(cal: String) -> Double? {
        switch cal{
        case "+":
            return inputA + inputB
        case "-":
            return inputA - inputB
        case "*":
            return inputA * inputB
            
        case "/":
            if inputB == 0{
                print("0으로 나눌 수 없습니다.") // 0으로 나눴을 때 경고를 해줄 수 있는 예외처리
                return nil
            }
            let reminder = inputA.truncatingRemainder(dividingBy:inputB)
            print ("나머지는 \(reminder)입니다.") // %는 Int 타입에서만 사용 가능 truncatingRemainder(dividingBy:)함수 사용
        
            return inputA / inputB
                
        default:
            
            return nil
        }
    }
}

print("첫 번째 숫자를 입력하세요: ")
// readLine은 String타입이라 Double로 변환해줘야함
if let numA = readLine(), let inputA = Double(numA){
    print("두 번째 숫자를 입력하세요: ")
    // readLine은 String타입이라 Double로 변환해줘야함
    if let numB = readLine(), let inputB = Double(numB){
        print("연산자를 입력하세요: ")
        if let op = readLine(){
            //Calculator 클래스의 인스턴스 생성 calc
            let calc = Calculator(inputA: inputA, inputB: inputB)
            // 연산 결과
            if let result = calc.calculate(cal: op){
                print("결과: \(result)")
            }
        } else {
            print("올바른 연산자를 입력하세요")
        }
    } else {
        print("올바른 숫자를 입력하세요")
    }
} else {
    print("올바른 숫자를 입력하세요")
}

