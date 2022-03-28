import Foundation

class Backup {

    let fileManager = FileManager.default

    func ReadArchives(url: URL) -> [URL] {
        
        do {
            
            let archives = try fileManager.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            return archives

        } catch {

            print(error)
            return []

        }
    }

    func listFolders(url: URL) -> [String] {

        let data = ReadArchives(url: url)
        var resultData: [String] = []

        for url in data {
            resultData.append(url.absoluteString)
        } 
        return resultData
    }

    func RealizeBackup(pathBackup: URL) -> Bool {
        
        let backupDirectory: URL
        let isDir = try? pathBackup.resourceValues(forKeys: [.isDirectoryKey]).isDirectory

        if isDir! {

            let  userHomeDirectory = fileManager.homeDirectoryForCurrentUser
            backupDirectory = userHomeDirectory.appendingPathComponent("Documents/Backup\(Date())")
            print("\nDiretório de Backup não existe\nDiretório de backup será: \(backupDirectory)")

        } else {

            backupDirectory = pathBackup.appendingPathComponent("Documents/Backup\(Date())")
            print("\nDiretório de backup será: \(backupDirectory)\n")

        }

        do {
            
            print("\nCriando pasta de backup...")
            // try fileManager.createDirectory(at: backupDirectory, withIntermediateDirectories: false)
            print("Criou a pasta de backup!\n")
            print("\nMovendo itens para pasta de Backup...\n")
            // TODO Existe um erro e ainda está em análise, operação falha no processo!
            let testFolder = fileManager.homeDirectoryForCurrentUser.appendingPathComponent("dev/teste-script/images-1/teste.png")
            let folderDest = backupDirectory.path + "/" + testFolder.lastPathComponent
            try fileManager.copyItem(atPath: testFolder.path, toPath: folderDest)
            return true

        } catch {
            print(error)
            return false
        }
    }

}