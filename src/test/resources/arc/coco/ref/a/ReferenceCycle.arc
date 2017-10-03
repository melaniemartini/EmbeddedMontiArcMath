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

component ReferenceCycle {

    port
        in Integer portIn;
    
    component Inner1 {
        port 
            in Integer portIn;
            
        // cycle 1
        component ReferenceCycle refCycle1;
        connect portIn -> refCycle1.portIn;
    }
    
    component Inner2 {
        port 
            in Integer portIn;
        
        //cycle 2
        component Inner1 refCycle2;
        connect portIn -> refCycle2.portIn;
    }
    
    component Inner3 {
        port
            in Integer portIn;

        //cycle 3
        component ReferenceCycle2 myComp2;
        connect portIn -> myComp2.portIn;
    }
    
    // cycle 4
    component Inner1 myInner1;
    // cycle 5
    component ReferenceCycle2 myComp2;
    
    connect portIn -> myInner1.portIn, myComp2.portIn;
}
