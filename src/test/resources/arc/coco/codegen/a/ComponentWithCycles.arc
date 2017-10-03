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
import ma.sim.*;

component ComponentWithCycles {
    
    port 
        in String strIn,
        in Integer intIn,
        out String strOut,
        out String strOut2,
        out Integer intOut;
        
    component Inner1 {
        port 
            in String iString1,
            in String iString2,
            out String iStringout; 
    }
    
    component Inner2 {
        port
            in String iStrIn1,
            in String iStrIn2,
            out String iStrOut1,
            out String iStrOut2;
    }
    
    // self loop
    connect intOut -> intIn;
    
    // direct loop
    connect inner2.iStrOut1 -> inner2.iStrIn1;
    
    connect strIn -> inner1.iString1;
    connect inner1.iStringout -> strOut, inner2.iStrIn2;
    connect inner2.iStrOut2 -> inner1.iString2;
    
    component Inner3 {
        port 
            in String sIn,
            in Boolean bIn,
            out Boolean bOut,
            out String sOut;
    }
    
    component FixDelay<Boolean>(1) fd; 
    
    // loop including a fix delay
    connect strIn -> inner3.sIn;
    connect inner3.bOut -> fd.portIn;
    connect fd.portOut -> inner3.bIn;
    connect inner3.sOut -> strOut2;
    
    component Inner4 {
        port 
            in String sIn2,
            in Boolean bIn2,
            out Boolean bOut2;
    }
    
    component RandomDelay<Boolean>(1,2) rd; 
    
    // loop including a random delay
    connect strIn -> inner4.sIn2;
    connect inner4.bOut2 -> rd.portIn;
    connect rd.portOut -> inner4.bIn2;

}
