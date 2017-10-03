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

import java.lang.String;
import java.lang.Integer;
import y.R6GenericPartner;
component R8 {
  port
    in String in1,
    in String in2, 
    out Integer out1;
    
  component R6GenericPartner<String> p1;
  component R6GenericPartner<Integer> p2;
  component R6GenericPartner<Integer> p3;
  component R6GenericPartner<Integer> p4;
  
  // correct
  connect in1 -> p1.tIn;
  connect p2.tOut -> out1;
  connect p2.tOut -> p4.tIn;
  
  // wrong, added a sender twice or more
  connect in2 -> p1.tIn;
  connect p3.tOut -> out1;
  connect p4.tOut -> out1;
  connect p3.tOut -> p4.tIn;
}
