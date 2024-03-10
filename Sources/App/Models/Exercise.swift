import Foundation
import Fluent
import Vapor
import MongoKitten

final class Exercise: Model, Content {
    
    static let schema: String = "exercises"
    
    @ID(custom: .id)
    var id: ObjectId?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "difficulty")
    var difficulty: Difficulty
    
    @Field(key: "equipment")
    var equipment: Equipment
    
    @Field(key: "exerciseType")
    var exerciseType: ExerciseType
    
    @Field(key: "forceType")
    var forceType: ForceType
    
    @Field(key: "mechanics")
    var mechanics: Mechanics
    
    @Field(key: "secondaryMuscles")
    var secondaryMuscles: [MuscleGroup]
    
    @Field(key: "targetMuscleGroup")
    var targetMuscleGroup: MuscleGroup
    
    init() { }
    
    init(id: ObjectId? = nil, name: String, difficulty: Difficulty, equipment: Equipment, exerciseType: ExerciseType, forceType: ForceType, mechanics: Mechanics, secondaryMuscles: [MuscleGroup], targetMuscleGroup: MuscleGroup) {
        self.id = id
        self.name = name
        self.equipment = equipment
        self.exerciseType = exerciseType
        self.forceType = forceType
        self.mechanics = mechanics
        self.secondaryMuscles = secondaryMuscles
    }
}
