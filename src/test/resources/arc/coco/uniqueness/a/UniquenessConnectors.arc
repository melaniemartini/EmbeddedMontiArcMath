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

component UniquenessConnectors {
    
    port 
        in String s1,
        out String s2,
        out String s3,
        in String s4,
        out Integer intOut,
        out String strOut,
        in Integer intIn;
    
    component CorrectCompInB correctB [stringOut -> s2, s3];
    
    component CorrectCompInA correctA [stringOut -> s2];
    
    component TwoInTwoOut tito;
    
    
    connect s1 -> correctA.stringIn, correctB.stringIn, tito;
    
    connect s4 -> correctA.stringIn;
    
    connect intIn -> tito;
    
    connect tito -> intOut, strOut;
}
