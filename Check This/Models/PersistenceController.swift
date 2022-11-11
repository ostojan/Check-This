//
//  PersistenceController.swift
//  Check This
//
//  Created by ostojan on 28/08/2022.
//

import CoreData

struct PersistenceController {
    private static var instance: PersistenceController?
    private static var previewInstance: PersistenceController?

    static var shared: PersistenceController {
        if previewInstance != nil {
            return previewInstance!
        }

        if instance == nil {
            instance = PersistenceController()
        }

        return instance!
    }

    static func initPreviewController() {
        previewInstance = PersistenceController(inMemory: true)
        guard let previewInstance = previewInstance else {
            fatalError("Couldn't initialize preview persistence controller")
        }
        let viewContext = previewInstance.viewContext

        for number in 1 ... 6 {
            let newItem = Item(context: viewContext)
            newItem.id = UUID()
            newItem.name = "Task \(number)"
            newItem.done = (number % 2) == 0 ? true : false
            newItem.created = Date()
        }

        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }

    private let container: NSPersistentContainer

    var viewContext: NSManagedObjectContext {
        container.viewContext
    }

    private init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "CheckThis")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
