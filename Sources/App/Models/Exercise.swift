import Foundation
import Fluent
import Vapor
import MongoKitten

final class Exercise: Model {
    
    static let schema: String = "exercises"
    
    @ID(custom: .id)
    var id: ObjectId?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "difficulty")
    var difficulty: String
    
    @Field(key: "equipment")
    var equipment: String
    
    @Field(key: "exerciseType")
    var exerciseType: String
    
    @Field(key: "forceType")
    var forceType: String
    
    @Field(key: "mechanics")
    var mechanics: String
    
    @Field(key: "secondaryMuscles")
    var secondaryMuscles: [String]
    
    @Field(key: "targetMuscleGroup")
    var targetMuscleGroup: String
    
    init() { }
    
    init(id: ObjectId? = nil, name: String, difficulty: String, equipment: String, exerciseType: String, forceType: String, mechanics: String, secondaryMuscles: [String], targetMuscleGroup: String) {
        self.id = id
        self.name = name
        self.equipment = equipment
        self.exerciseType = exerciseType
        self.forceType = forceType
        self.mechanics = mechanics
        self.secondaryMuscles = secondaryMuscles
    }
}
