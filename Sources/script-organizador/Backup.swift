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

    func RealizeBackup(pathToBackup: String) -> Bool {
        let formatterData = DateFormatter()
        formatterData.dateStyle = .medium
        formatterData.timeStyle = .none

        let formattedData = Date()
        formatterData.locale = Locale(identifier: "pt_BR")

        let backupDirectory: URL
        let userFolder = fileManager.homeDirectoryForCurrentUser
        let pathToBackupURL = URL(fileURLWithPath: pathToBackup)
        // let pathReceiveBackupURL = URL(fileURLWithPath: pathReceiveBackup)
        let finalFolder = URL(fileURLWithPath: userFolder.path + "/" + pathToBackupURL.lastPathComponent)
        // print(userFolder, pathToBackupURL, pathReceiveBackupURL, finalFolder)

        // Parte responsável por determinar diretório de onde será realizado o backup
        // TODO: tratar formato de data para que fique apenas a data e horário de forma organizada
        backupDirectory = URL(fileURLWithPath: userFolder.path + "/Documents/Backup")
        print("\nDiretório de Backup será: \(backupDirectory)")

        do {
            
            print("\nCriando diretório de backup...")
            if !(fileManager.fileExists(atPath: backupDirectory.path)) {
                
                try fileManager.createDirectory(atPath: userFolder.path + "/Documents/Backup", withIntermediateDirectories: false)    
                
            }
            try fileManager.createDirectory(atPath: backupDirectory.path + "/\(formattedData)", withIntermediateDirectories: false)
            print("\nDiretório criado!")
            return true


        } catch {
            print(error)
            return false
        }
        
        //TODO: bug apresentado na parte seguinte do codigo
        // do {

        //     if let _ = try finalFolder.resourceValues(forKeys: [.isDirectoryKey]).isDirectory {
        //         backupDirectory = finalFolder.appendingPathComponent("Documents/Backup\(Date())")
        //         print("\nDiretório para Backup não existe\nDiretório de backup será: \(backupDirectory)")
        //     }

        // } catch {
        //     backupDirectory = finalFolder.appendingPathComponent("Documents/Backup\(Date())")
        //     print("\nDiretório para backup será: \(backupDirectory)\n")
        // }

        // do {
            
        //     print("\nCriando pasta de backup...")
        //     // try fileManager.createDirectory(at: pathReceiveBackupURL, withIntermediateDirectories: false)
        //     print("Criou a pasta de backup!\n")
        //     print("\nMovendo itens para pasta de Backup...\n")
        //     // TODO Existe um erro e ainda está em análise, operação falha no processo!
            
        //     let folderDest = pathReceiveBackupURL.path + "/" + finalFolder.lastPathComponent
        //     // try fileManager.copyItem(atPath: finalFolder.path, toPath: folderDest)
        //     return true

        // } catch {
        //     print(error)
        //     return false
        // }
        return true
    }

}