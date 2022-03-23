import Foundation
import ArgumentParser

struct Interface: ParsableCommand {
    
    @Argument(help: "Path do diretório a ser utilizado pelo programa")
    var path: String
    
    @Option(name: [.customShort("o"), .long], help: "Realizar backup")
    var doBackup: Bool
    
    mutating func run() throws {
        if doBackup {
            return
        }
        let fileManager = FileManager.default
        let pathURL = URL(fileURLWithPath: path)
        
        let result = try fileManager.contentsOfDirectory(at: pathURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
        for url in result {
            if url.absoluteString.hasSuffix("/"){
                print(url)
            }
            
        }
    }
}



//class Interface {
//
//    func main() {
//        menu()
//    }
//
//    func menu() {
//        print("Digite seu nome,, ou apelido, para utilização: ", terminator: "")
//        guard let name = readLine() else {
//            return
//        }
//        if name != "" {
//            print("Seu nome é: \(name), deseja realizar a exclusão dos\nitens duplicados em qual diretório?")
//            print("Caso haja dúvidas sobre o funcionamento,\ndigite 'help' para o menu de ajuda: ", terminator: "")
//        } else {
//            print("Digite um nome válido ou apelido")
//            return
//        }
//        guard let option = readLine() else {
//            return
//        }
//        if option.lowercased() == "help" {
//            menuHelp()
//        } else {
//            print(option)
//        }
//    }
//
//    func menuHelp() {
//        print("Instruções de uso do programa:")
//        print("\n\n")
//        print("")
//
//    }
//}
