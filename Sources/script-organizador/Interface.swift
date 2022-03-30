import Foundation
import ArgumentParser

struct Interface: ParsableCommand {
    
    @Argument(help: "Path do diretório a ser utilizado pelo programa")
    var path: String
    
    @Option(name: [.customShort("o"), .long], help: "Realizar backup")
    var doBackup: Bool
    
    mutating func run() throws {

        let pathURL = URL(fileURLWithPath: path)
        if doBackup {

            //TODO: refatorar feature de customizar diretório de backup
            // print("Digite o path para o diretório de backup!\nCaso nada seja digitado, será criado\nUm diretório no Documents\nPath: ", terminator: "")
            // guard let backupFolder = readLine() else {
            //     print("Digite um caminho válido. Aplicação finalizada.")
            //     return
            // }
            
            if Backup().RealizeBackup(pathToBackup: path) {
                return print("Backup Realizado!")
            } else {
                print("Erro ao realizar backup")
            }
            return

        } else {

            print("Funcionalidade a ser implementada.")

        }

    }
}


