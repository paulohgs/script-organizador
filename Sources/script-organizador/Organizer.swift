import Foundation
import ArgumentParser

struct Organizer: ParsableCommand {
    
    @Argument(help: "path do diretorio com arquivos duplicados")
    var path: String!
    
    func run() throws {
        if path != nil, let url = URL(string: path) {
            print(url)
            
        } else {
            print("Digite um caminho válido")
        }
    }
}
