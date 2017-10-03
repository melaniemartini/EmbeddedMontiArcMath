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

component ExistingPortInConnector {
    port 
        in String strIn,
        out String strOut1,
        out String strOut2,
        out String strOut3,
        out String strOut4;
        
    component CorrectCompInA ccia [stringOutWrong -> strOut1];
    
    component CorrectCompInB ccib;
    
    connect strIn -> ccib.stringInWrong, ccia.stringIn;
    
    connect ccib.stringOutWrong -> strOut2;
    
    // correct connectors
    connect ccia.stringOut -> strOut3;
    connect ccib.stringOut -> strOut4;
    connect strIn -> ccib.stringIn;
}
