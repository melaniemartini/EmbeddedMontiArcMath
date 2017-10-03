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

package componentTest;

import java.lang.String;
import java.lang.Integer;

component ArchInner {
  port 
   in String,
   out Integer intOut1,
   out Integer intOut2;
 
  component SimpleIn;
  component Complex;
  component Merge<Integer>("ISO-8859-1");
  
  connect string -> simpleIn.string, complex.str1, complex.str2;
  connect simpleIn.int1 -> merge.input1;
  connect simpleIn.int2 -> merge.input2;
  connect complex.int1 -> merge.input3;
  connect complex.int2 -> merge.input4;
  
  connect merge.output1 -> intOut1;
  connect merge.output2 -> intOut2;
  

}
