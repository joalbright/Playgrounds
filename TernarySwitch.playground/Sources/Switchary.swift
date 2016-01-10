//
//  Switchary.swift
//  Switchary
//
//  Created by Jo Albright on 01/05/2016.
//  Copyright (c) 2016 Jo Albright. All rights reserved.
//


import Foundation

// ??? loops array and returns first element where lhs == element.0
infix operator ??? { associativity left precedence 200 }

// ||| merges values into an array
infix operator ||| { associativity left precedence 210 }

// *** default value if not in array
infix operator *** { associativity left precedence 210 }

// --> convert lhs & rhs to tuple (lhs,rhs)
infix operator --> { associativity left precedence 220 }
