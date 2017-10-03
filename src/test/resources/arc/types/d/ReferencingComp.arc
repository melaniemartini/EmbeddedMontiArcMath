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

package d;

import b.*;

component ReferencingComp (int[] configIntArray, String[][] configStringArray){
    
    port
        in int[] intArrayIn,
        in String[] stringArrayIn,
        in int intNoArrayIn,
        in GenericClassType<String>[][][] enumArrayIn,
        out short[] shortArrayOut;
        
    component CompWithArrays(configIntArray, configStringArray) ref;
    
    connect intArrayIn -> ref.intArrayIn;
    connect stringArrayIn -> ref.stringArrayIn; //=> ports not compatible because of different array dimensions
    connect intNoArrayIn -> ref.intNoArrayIn;
    connect enumArrayIn -> ref.enumArrayIn;
    connect ref.shortArrayOut -> shortArrayOut;
}
