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

import d.*;

component PortCompatibilityTypeInheritance {
    
    port
        in SuperType supIn,
        in SubType subIn,
        out SuperType supOut1,
        out SubType subOut1,
        out SuperType supOut2,
        out SubType subOut2;

    component CompWithJavaTypes 
        cwjt [supOut -> subOut1, supOut1;  // incompatible (SuperType -> SubType)
               subOut -> subOut2, supOut2];
    
    connect supIn -> cwjt.supIn1; // compatible 
    connect subIn -> cwjt.supIn2, cwjt.subIn2; // compatible
    
    connect supIn -> cwjt.subIn1; // incompatible
   
}
