//
//  ModelController.swift
//  CustomLaunchScreen
//
//  Created by iMac on 2/28/22.
//

import UIKit
import CoreData

struct ModelController {
    static private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static private var users:[User]?
    
    private static func fetchUsers() -> [User] {
        do {
            ModelController.users = try ModelController.context.fetch(User.fetchRequest())
        }
        catch {
            
        }
        return ModelController.users!
    }
    
    static func createUser(firstName: String?, lastName: String?, email: String, password: String) {
        let newUser = User(context: ModelController.context)
        
        // unwrap first name
        if let firstNameValue = firstName {
            newUser.firstName = firstNameValue
        } else { newUser.firstName = "" }
        // unwrap last name
        if let lastNameValue = lastName {
            newUser.lastName = lastNameValue
        } else { newUser.lastName = "" }
        
        newUser.email = email
        newUser.password = password
        
        do {
            try ModelController.context.save()
        }
        catch {
                    
        }
    }
    
    static func getUsersByEmail(email: String) -> [User]? {
        let request = User.fetchRequest() as NSFetchRequest<User>
        let predicate = NSPredicate(format: "email == %@", email)
        request.predicate = predicate
        
        let filteredUsers: [User]?
        do{
            filteredUsers = try context.fetch(request)
            
            return filteredUsers
        }
        catch {
            
        }
        return nil
    }
    /*
    static func deleteUser(User: User) {
        let userToRemove = User
        ModelController.context.delete(userToRemove)
        
        do {
            try ModelController.context.save()
        }
        catch {
            
        }
        ModelController.fetchUsers()
    }
     
    static func updateUser(User: User, newFirstName: String?, newLastName: String?, newEmail: String?, newPassword: String?) {
        let userToUpdate = User
        if let newFirstNameValue = newFirstName {
            userToUpdate.firstName = newFirstNameValue
        }  else {}
        
        if let newLastNameValue = newLastName {
            userToUpdate.lastName = newLastNameValue
        } else {}
        
        if let newEmailValue = newEmail {
            userToUpdate.email = newEmailValue
        } else {}
        
        if let newPasswordValue = newPassword {
            userToUpdate.password = newPasswordValue
        } else {}
        
        do {
            try ModelController.context.save()
        }
        catch {
         
        }
        ModelController.fetchUsers()
    }
    */
    
    // Supposing this is a CoreDataController/CoreDataStack class where you have access to `viewContext` and `persistantContainer`
    // Otherwise just pass the `persistantContainer` as a parameter, from which you can also retrieve the `viewContext`
    static func resetAllCoreData() {
        let fetchContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
         // get all entities and loop over them
        let entityNames = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.managedObjectModel.entities.map({ $0.name!})
         entityNames.forEach { entityName in
            let deleteFetch: NSFetchRequest<NSFetchRequestResult> = User.fetchRequest()
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)

            do {
                try fetchContext.execute(deleteRequest)
                try fetchContext.save()
            } catch {
                // error
            }
        }
    }
}
