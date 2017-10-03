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

package conv;

component WrongConnector {
    port 
        in String sIn,
        out String sOut,
        out String sOut2; 
    
    component Inner {
        port 
            in String sInInner,
            out String sOutInner;
    }
    
    component Inner 
        myInner [myInner.sOutInner -> sOut];
    
    component Inner
        myInner2 [sOutInner -> myInner.sth.sInInner],
        myInner3,
        myInner4;

    connect myInner3.bla.sOutInner -> myInner2.sInInner;
    
    connect myInner4.sOutInner -> myInner3.bla.sInInner;
    
    connect sIn -> myInner4.sInInner;
    
    connect sIn -> myInner.sInInner;
    connect sIn -> myInner3.sInInner;
    connect myInner3.sOutInner -> sOut2;
    
}
