//
//  main.swift
//  Lab3swift
//
//  Created by Albina Choi on 18.02.2024.
//

import Foundation

////Task 1

//struct Student {
//    var name: String
//    var averageGrade: Double
//}
//
//class StudentJournal {
//    private var students: [Student] = []
//    
//    func addStudent(_ student: Student) {
//        students.append(student)
//    }
//    
//    func removeStudent(named name: String) {
//          if let index = students.firstIndex(where: { $0.name == name }) {
//              students.remove(at: index)
//          } else {
//              print("Студент с именем \(name) не найден.")
//          }
//      }
//  
//    
//    func displayStudents() {
//        for student in students {
//            print("\(student.name), средний балл: \(student.averageGrade)")
//        }
//    }
//    
//    func sortStudentsByGrade() {
//        students.sort { $0.averageGrade > $1.averageGrade }
//    }
//    
//    func averageGrade() -> Double {
//        let totalGrade = students.reduce(0) { $0 + $1.averageGrade }
//        return totalGrade / Double(students.count)
//    }
//    
//    func topStudent() -> Student? {
//        return students.max(by: { $0.averageGrade < $1.averageGrade })
//    }
//}
//
//var journal = StudentJournal()
//
//
//journal.addStudent(Student(name: "Иван Иванов", averageGrade: 4.5))
//journal.addStudent(Student(name: "Петр Петров", averageGrade: 3.8))
//journal.addStudent(Student(name: "Алексей Алексеев", averageGrade: 4.2))
//journal.addStudent(Student(name: "Мария Маринина", averageGrade: 5.0))
//journal.addStudent(Student(name: "Ольга Олеговна", averageGrade: 4.8))
//
//
//print("Информация о студентах:")
//journal.displayStudents()
//
//
//journal.sortStudentsByGrade()
//print("\nСтуденты, отсортированные по среднему баллу:")
//journal.displayStudents()
//
//
//let average = journal.averageGrade()
//print("\nСредний балл всех студентов: \(average)")
//
//
//if let topStudent = journal.topStudent() {
//    print("\nСтудент с наивысшим средним баллом: \(topStudent.name), средний балл: \(topStudent.averageGrade)")
//}
//
//
//journal.removeStudent(named: "Иван Иванов")
//print("\nПосле удаления Ивана Иванова:")
//journal.displayStudents() 

////Task2
///
///
struct Task {
var title: String
var isCompleted: Bool
}

class TaskManager {
private var tasks: [Task] = []

func addTask(_ task: Task) {
    tasks.append(task)
}

func removeTask(at index: Int) {
    if tasks.indices.contains(index) {
        tasks.remove(at: index)
    } else {
        print("Invalid index.")
    }
}

func markTaskAsCompleted(at index: Int) {
    if tasks.indices.contains(index) {
        tasks[index].isCompleted = true
    } else {
        print("Invalid index.")
    }
}

func displayTasks() {
    for task in tasks {
        print("\(task.title), выполнена: \(task.isCompleted ? "Да" : "Нет")")
    }
}

func completedTasks() -> [Task] {
    return tasks.filter { $0.isCompleted }
}

func pendingTasks() -> [Task] {
    return tasks.filter { !$0.isCompleted }
}

func clearCompletedTasks() {
    tasks = tasks.filter { !$0.isCompleted }
}
}

var taskManager = TaskManager()

taskManager.addTask(Task(title: "Прочитать книгу", isCompleted: false))
taskManager.addTask(Task(title: "Записаться в спортзал", isCompleted: false))
taskManager.addTask(Task(title: "Сходить на курсы английского", isCompleted: true))
taskManager.addTask(Task(title: "Купить продукты", isCompleted: false))
taskManager.addTask(Task(title: "Позвонить другу", isCompleted: true))

print("Все задачи:")
taskManager.displayTasks()

taskManager.markTaskAsCompleted(at: 0)
print("\nПосле отметки задачи 'Прочитать книгу' как выполненной:")
taskManager.displayTasks()

let completedTasks = taskManager.completedTasks()
print("\nВыполненные задачи:")
for task in completedTasks {
    print(task.title)
}

let pendingTasks = taskManager.pendingTasks()
print("\nНевыполненные задачи:")
for task in pendingTasks {
    print(task.title)
}

taskManager.clearCompletedTasks()
print("\nПосле удаления выполненных задач:")
taskManager.displayTasks()
