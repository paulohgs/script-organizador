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

            print("Digite o path para o diretório de backup!\nCaso nada seja digitado, será criado\nUm diretório no Documents\nPath: ", terminator: "")
            guard let backupFolder = readLine(), let backupURL = URL(string: backupFolder) else {
                print("Digite um caminho válido. Aplicação finalizada.")
                return
            }
            
            if Backup().RealizeBackup(pathBackup: pathURL) {
                return print("Backup Realizado!")
            } else {
                print("Erro ao realizar backup")
            }
            print("\n\(backupURL)\n")
            return

        } else {

            let result = Backup().listFolders(url: pathURL)
        
            print(result.count)

        }


    }
}


