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
import c.*;
import b.NotExistentToo;

component ExistingReferencedComponents {
    port 
        in String s1,
        out String sout1,
        out String sout2,
        out String sout3;
        
    component CorrectCompInA ccia;
    
    component b.CorrectCompInB ccib;
    
    component CorrectCompInC ccic;
    
    component NotExistent ne;
    
    component NotExistentToo;
    
    connect s1 -> ccia.stringIn, ccib.stringIn, ccic.stringIn;
    connect ccia.stringOut -> sout1;
    connect ccib.stringOut -> sout2;
    connect ccic.stringOut -> sout3;
    
}
