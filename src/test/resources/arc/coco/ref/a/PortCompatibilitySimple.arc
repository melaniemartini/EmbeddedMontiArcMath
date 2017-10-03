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

component PortCompatibilitySimple {
    
    port 
        in Integer intIn,
        out Integer intOut1,
        out Integer intOut2;

    component CorrectCompInA ccia [stringOut -> intOut1]; // incompatible (String -> Integer)
    
    component CorrectCompInA ccia2;
    
    connect intIn -> ccia.stringIn, ccia2.stringIn; // incompatible (Integer -> String) 2x
    
    connect ccia2.stringOut -> intOut2; // incompatible (String -> Integer)
}
