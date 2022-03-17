import Foundation

class Interface {
    
    func main() {
        menu()
    }
    
    func menu() {
        print("Digite seu nome,, ou apelido, para utilização: ", terminator: "")
        guard let name = readLine() else {
            return
        }
        if name != "" {
            print("Seu nome é: \(name), deseja realizar a exclusão dos\nitens duplicados em qual diretório?")
            print("Caso haja dúvidas sobre o funcionamento,\ndigite 'help' para o menu de ajuda: ", terminator: "")
        } else {
            print("Digite um nome válido ou apelido")
            return
        }
        guard let option = readLine() else {
            return
        }
        if option.lowercased() == "help" {
            menuHelp()
        } else {
            print(option)
        }
    }
    
    func menuHelp() {
        print("Instruções de uso do programa:")
        print("\n\n")
        print("")
                                                           
    }
    
}
