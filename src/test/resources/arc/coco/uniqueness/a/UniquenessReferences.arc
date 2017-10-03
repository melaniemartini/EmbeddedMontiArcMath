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
import b.CorrectCompInB;

component UniquenessReferences {
    port 
        in String s1,
        out String sOut1,
        out String sOut2,
        out String sOut3,
        out String sOut4,
        out String sOut5;

    component CorrectCompInB;
    
    component CorrectCompInB anotherInB;
    
    component CorrectCompInB correctCompInB;
    
    component CorrectCompInA;
    
    component CorrectCompInA anotherInA;
    
    connect s1 -> anotherInB.stringIn, correctCompInB.stringIn, anotherInA.stringIn, correctCompInA.stringIn;
    connect correctCompInB.stringOut -> sOut1;
    connect anotherInB.stringOut -> sOut2;
    connect correctCompInB.stringOut -> sOut3;
    connect correctCompInA.stringOut -> sOut4;
    connect anotherInA.stringOut -> sOut5;

}
