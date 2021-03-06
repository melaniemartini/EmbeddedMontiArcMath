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

component R6 {
  port
    in Integer portIn,
    in Integer portIn2,
    out String portOut,
    out String portOut2;
  
  component x.R5Partner p1;
  component x.R5Partner p2;
  component x.R5PartnerTwo p3;
  
  component x.R6PartnerOne p4;
  component x.R6PartnerOne p5;
  
  component y.R6GenericPartner<String> p6;
  
  component y.R6GenericPartner<String> p7;
  component y.R6GenericPartner<Integer> p8;
  component y.R6GenericPartner<String> p9;
  
  // correct
  connect p4.subTypeOut -> p5.superTypeIn;
    // correct String -> String
  connect p6.tOut -> portOut2;
  // correct Integer -> Integer
  connect portIn2 -> p9.tIn;  
  
  
  // wrong, Integer -> String
  connect p1.portOut -> portOut;
  
  // wrong, Integer -> String
  connect portIn -> p1.portIn;
  
    // wrong Integer -> String
  connect portIn2 -> p6.tIn;  
  
  // wrong, Boolean -> String
  connect p3.Boolean -> p2.portIn;
  
  // wrong
  connect p4.superTypeOut -> p5.subTypeIn;
  
  // wrong String -> Integer
  connect p7.tOut -> p8.tIn;
}
