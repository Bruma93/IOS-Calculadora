//
//  ViewController.swift
//  calculadora
//
//  Created by estech on 21/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    var recogerNum = ""
    var accion = ""
    var almacenadoFloat : Float = 0.0
    var puntoActivo = false
    var signo = ""
    
    @IBOutlet weak var textValorAlmacenado: UILabel!
    @IBOutlet weak var textMostrarResultado: UILabel!
    @IBOutlet weak var textSigno: UILabel!
    
    @IBOutlet weak var numero0: UIButton!
    @IBOutlet weak var numero1: UIButton!
    @IBOutlet weak var numero2: UIButton!
    @IBOutlet weak var numero3: UIButton!
    @IBOutlet weak var numero4: UIButton!
    @IBOutlet weak var numero5: UIButton!
    @IBOutlet weak var numero6: UIButton!
    @IBOutlet weak var numero7: UIButton!
    @IBOutlet weak var numero8: UIButton!
    @IBOutlet weak var numero9: UIButton!
    @IBOutlet weak var botonPunto: UIButton!
    @IBOutlet weak var botonMas: UIButton!
    @IBOutlet weak var botonRestar: UIButton!
    @IBOutlet weak var botonMultiplicar: UIButton!
    @IBOutlet weak var botonDividir: UIButton!
    @IBOutlet weak var BotonPorcentaje: UIButton!
    @IBOutlet weak var botonBorrar: UIButton!
    @IBOutlet weak var botonBorrarTodo: UIButton!
    @IBOutlet weak var botonResultado: UIButton!
    
    @IBOutlet weak var stackViewResultado: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let outlets : [UIButton] = [numero0, numero1, numero2, numero3 ,numero4, numero5, numero6, numero7, numero8, numero9, botonPunto, botonMas, botonRestar, botonMultiplicar, botonDividir, BotonPorcentaje, botonBorrar ,botonBorrarTodo, botonResultado]
        
        for outlet in outlets{
            outlet.round()
        }
        
        stackViewResultado.round()
        
    }
    
    //Números
    @IBAction func num0Funct(_ sender: Any) {
        añadirNum("0")
    }
    
    @IBAction func num1Funct(_ sender: Any) {
        añadirNum("1")
    }
    
    @IBAction func num2Funct(_ sender: Any) {
        añadirNum("2")
    }
    
    @IBAction func num3Funct(_ sender: Any) {
        añadirNum("3")
    }
    
    @IBAction func num4Funct(_ sender: Any) {
        añadirNum("4")
    }
    
    @IBAction func num5Funct(_ sender: Any) {
        añadirNum("5")
    }
    
    @IBAction func num6Funct(_ sender: Any) {
        añadirNum("6")
    }
    
    @IBAction func num7Funct(_ sender: Any) {
        añadirNum("7")
    }
    
    @IBAction func num8Funct(_ sender: Any) {
        añadirNum("8")
    }
    
    @IBAction func num9Funct(_ sender: Any) {
        añadirNum("9")
    }
    
    @IBAction func punto(_ sender: Any) {
        if puntoActivo == false{
            recogerNum += "."
            textMostrarResultado.text = recogerNum
            puntoActivo = true
        }
    }
    
    // Operaciones
    
    @IBAction func sumar(_ sender: Any) {
        
        acciones(accion,operador: "+")
        
    }
    
    @IBAction func restar(_ sender: Any) {
            acciones(accion,operador: "-")
        
    }
    
    @IBAction func multiplicar(_ sender: Any) {
            acciones(accion,operador: "*")
    }
    
    @IBAction func dividir(_ sender: Any) {
            acciones(accion,operador: "/")
    }
    
    @IBAction func porcentaje(_ sender: Any) {
            acciones(accion, operador: "%")
    }
    
    @IBAction func igual(_ sender: Any) {
        if recogerNum != ""{
            if almacenadoFloat != 0.0 || accion == ""{
                acciones(accion,operador: "=")
            }
        }
    }
    
    // Otros Botones
    @IBAction func borrar(_ sender: Any) {
        if textMostrarResultado.text != "" && textMostrarResultado.text != "0" && textMostrarResultado.text != "1" && textMostrarResultado.text != "2" && textMostrarResultado.text != "3" && textMostrarResultado.text != "4" && textMostrarResultado.text != "5" && textMostrarResultado.text != "6" && textMostrarResultado.text != "7" && textMostrarResultado.text != "8" && textMostrarResultado.text != "9"{
            print(textMostrarResultado.text)
            if recogerNum[recogerNum.index(recogerNum.endIndex, offsetBy: -1)] == "." {
                puntoActivo = false
            }
            
            textMostrarResultado.text?.removeLast()
            
            if textMostrarResultado.text == "0"{
                textMostrarResultado.text = "0"
            }
            
        } else {
            textMostrarResultado.text = "0"
        }
        
        recogerNum = textMostrarResultado.text!
    }
    
    @IBAction func borrarTodo(_ sender: Any) {
        accion = ""
        recogerNum = ""
        textSigno.text = ""
        almacenadoFloat = 0.0
        textMostrarResultado.text = "0"
        textValorAlmacenado.text = "0"
        puntoActivo = false
    }
    
    func añadirNum(_ valor : String){
        recogerNum += valor
        textMostrarResultado.text = recogerNum
    }
    
    func acciones(_ accionX: String , operador : String) {
        if almacenadoFloat == 0.0 || accion == "" {
            almacenadoFloat = Float(textMostrarResultado.text!)!
        }
        else{
            if recogerNum != "0" && recogerNum != "" {
                switch(accionX){
                case "+":
                    almacenadoFloat += Float(recogerNum)!
                case "-":
                    almacenadoFloat -= Float(recogerNum)!
                case "*":
                    almacenadoFloat = almacenadoFloat * Float(recogerNum)!
                case "/":
                    almacenadoFloat = almacenadoFloat / Float(recogerNum)!
                case "%":
                    almacenadoFloat = almacenadoFloat / 100 * Float(recogerNum)!
                default:
                    textMostrarResultado.text = "Error"
                }
            }
        }
        textMostrarResultado.text = String(almacenadoFloat)
        textValorAlmacenado.text = String(almacenadoFloat)
        accion = operador
        textSigno.text = accion
        recogerNum = ""
        puntoActivo = false
    }
}

