/*
 * ******************************************************************************
 * MontiCore Language Workbench, www.monticore.de
 * Copyright (c) 2017, MontiCore, All rights reserved.
 *
 * This project is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3.0 of the License, or (at your option) any later version.
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this project. If not, see <http://www.gnu.org/licenses/>.
 * ******************************************************************************
 */

package a;

import b.*;
import c.CComp;
import java.io.*;
import java.lang.System;
<<stereo1 = "someValue", stereo2>> component Sub1 extends SuperSamePackage {

  port  
    in String stringIn, 
    <<disabled="held", initialOutput = "1", ignoreWarning>> in Integer integerIn,
    <<disabled="reset", initialOutput = "0">> out String stringOut,
    <<portStereo1>> out Number,
    <<portStereo2>> out Integer integerOut,
    out System,
    out PrintStream ps;
  
  component b.SuperSamePackage super1;
  component Sub2;
  <<refStereo>> component SuperOtherPackage super2;
  component CComp;
  component SuperOtherPackage super3, super4;
  
  
  <<conStereo>> connect Sub2.String -> stringOut;
  connect sub2.Integer -> integerOut;
  connect stringIn -> super1.input, super2.input;
  connect sub2.String -> super3.input;
}
