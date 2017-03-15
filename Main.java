/**
 * Copyright (c) 2007, .
 * All rights reserved.
 *
 * Please read the LICENSE file for license information.
 *
 * This is a driver program for the iota compiler. This file is similar
 * to the one provided in the calculator example found in the thesis
 * report of SableCC.
 */

package iota.compiler;

import iota.node.*;


import java.io.*;
import iota.lexer.*;
import iota.parser.*;

public class Main {
  public static void main(String[] args) {
    System.out.println("This is iota compiler, a test compiler (c) 2007.");
    System.out.println("It illustrates how to write a compiler in SableCC and Java.");
    System.out.println();

    // check the number of arguments
    if (args.length != 1 || !args[0].endsWith(".iota")) {
      System.out.println("Usage: ");
      System.out.println("   java iota.compiler.Main filename.iota");
      System.exit(0);
    } 

    try {
      // parse the program and assign the generated AST to node root
      System.out.println("Parsing " + args[0] + "...");
      Lexer lexer = new Lexer(new PushbackReader(new BufferedReader(new FileReader(args[0])), 1024));
      Parser parser = new Parser(lexer);
      Node root = parser.parse();      

      // process semantic analysis
//      System.out.println("Checking identifiers...");
//      root.apply(new SemanticAnalyser());

      // process code generation
      System.out.println("Generating " +
              args[0].substring(0, args[0].length() - 5) + ".x");
      root.apply(new CodeGenerator(args[0]));

      // finished compilation
      System.out.println("done.");
    }
    catch(Exception exc) {
      System.out.println(exc);  // output the exception                            
    }
  }
}
