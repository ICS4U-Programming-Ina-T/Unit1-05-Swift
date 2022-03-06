//
// BoardFoot.swift
//
// Created by Ina Tolo
// Created on 2022-3-1
// Version 1.0
// Copyright (c) 2022 Ina Tolo. All rights reserved.
//
// The BoardFoot program implements an application that
// calculates the length, equal to one board foot, and
// accepts two parameters: width and height.

// calculates length of board
func calculateBoardFoot(width: Double, height: Double) -> Double {
  let length = oneBoardFoot / (width * height)

  return length
}

// stores exception at runtime
enum MyError: Error {
    case runtimeError(String)
}

// function that throws exception
func catchString() throws {
    throw MyError.runtimeError("Only numbers are valid!")
}

// declaring constants
let oneBoardFoot = Double(144)

// declaring variables
var widthUserString: String
var heightUserString: String
var widthUserDouble: Double
var heightUserDouble: Double
var userBoardLength: Double

// displays opening message
print("This program figures out the length of a wooden board that is 1 board foot")
print("in dimension. (1 board foot is 144^3 inches of wood)")
print()

// gets width from user
print("Enter the width (inches): ", terminator: "")
widthUserString = readLine()!

do {
  widthUserDouble = Double(widthUserString) ?? 0

  // checks if value cannot be casted
  if widthUserDouble != Double(widthUserString) {
    try catchString()
  }

  if widthUserDouble > 0 && widthUserDouble < 145 {

    // gets height from user
    print("Enter the height (inches): ", terminator: "")
    heightUserString = readLine()!

    do {
      heightUserDouble = Double(heightUserString) ?? 0

      // checks if value cannot be casted
      if heightUserDouble != Double(heightUserString) {
        try catchString()
      }

      if heightUserDouble > 0 && heightUserDouble < 145 {
        userBoardLength = calculateBoardFoot(width: widthUserDouble, height: heightUserDouble)

        // displays length to user
        print()
        print("The wood should be \(userBoardLength) inch(es) long.")
      } else {
        print("Positive numbers only!")
      }
    } catch MyError.runtimeError(let errorMessage) {
      // catches invalid strings
      print(errorMessage)
      print()
    }
  } else {
    print("Positive numbers only!")
  }
} catch MyError.runtimeError(let errorMessage) {
  // catches invalid strings
  print(errorMessage)
  print()
}
