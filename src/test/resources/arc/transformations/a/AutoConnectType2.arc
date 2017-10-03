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

component AutoConnectType2 {
    autoinstantiate on;
    autoconnect type;
    
    port 
        in String strIn,
        in String strIn2,
        in Integer intIn,
        out Boolean boolOut1,
        out Boolean boolOut2,
        out Double doubleOut;
    
    component Inner {
        port 
            in String myString,
            in Integer myInteger,
            out Boolean myBoolean,
            out Double myDouble;
    }
    
    /**
    expected connectors:
    intIn -> Inner.myInteger;
    Inner.myBoolean -> boolOut1;
    Inner.myBoolean -> boolOut2;
    Inner.myDouble -> doubleOut; 
    */
    
}
