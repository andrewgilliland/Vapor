import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "Vapor is running!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    app.get("hello", ":name") { req async -> String in
        let name = req.parameters.get("name")
        return "Hello \(name ?? "Biff")!"
    }
}
