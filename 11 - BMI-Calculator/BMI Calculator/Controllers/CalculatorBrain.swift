//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Fahad Mansuri on 28.05.23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight / pow(height, 2)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more peis", color: UIColor.systemTeal)
        } else if bmiValue > 24.9 {
            bmi = BMI(value: bmiValue, advice: "Eat some Salad", color: UIColor.systemRed)
        } else {
            bmi = BMI(value: bmiValue, advice: "You're doing great", color: UIColor.systemGreen)
        }
    }
    
    func getBMI() -> String{
        return String(format:"%.1f", bmi?.value ?? 0.0)
    }
    func getAdvice() -> String{
        return bmi?.advice ?? "bruh"
    }
    func getColor() -> UIColor{
        return bmi?.color ?? UIColor.black
    }
}
