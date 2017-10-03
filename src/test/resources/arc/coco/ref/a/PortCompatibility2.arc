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

component PortCompatibility2<K, V> {
    port 
        in K input,
        out K output,
        out K output2,
        out K output3;
    
    component Inner<T> {
        port 
            in T kInput,
            out T kOutput; 
    }
    
    component Inner<K> myInner1;
    connect input -> myInner1.kInput;
    connect myInner1.kOutput -> output;
    
    component Inner<String> myInner2;
    connect input -> myInner2.kInput;
    connect myInner2.kOutput -> output2;
    
    component Inner<V> myInner3;
    connect input -> myInner3.kInput;
    connect myInner3.kOutput -> output3;

}
