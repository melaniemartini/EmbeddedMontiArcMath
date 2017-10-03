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

import y.R6GenericPartner;
import ma.sim.FixDelay;
import java.lang.String;

component CG2 {

  port 
    in String strIn,
    out String strOut; 

  component x.CG2Partner<String> p1;
  component R6GenericPartner<String> p2;
  component R6GenericPartner<String> p3;
  component R6GenericPartner<String> p4;
  component R6GenericPartner<String> p5;
  component R6GenericPartner<String> p6;
  component FixDelay<String>(1) delay;
  
  connect p1.tOut -> p2.tIn, p3.tIn;
  connect p2.tOut -> p1.tIn1, p4.tIn;
  connect p3.tOut -> p5.tIn;
  connect p5.tOut -> p6.tIn;
  connect p6.tOut -> p1.tIn2;
  
  // correct loop
  connect p4.tOut -> delay.portIn;
  connect delay.portOut -> p1.tIn3;
  
  // self loop
  connect strIn -> strOut;
  
    

}
