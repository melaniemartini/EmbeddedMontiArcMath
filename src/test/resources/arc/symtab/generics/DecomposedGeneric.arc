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

package generics;

import java.io.Serializable;

component DecomposedGeneric<K, V extends Serializable> {

    port
        in K sIn1,
        in V sIn2,
        out K sOut1,
        out V sOut2;

    component SubGeneric<K> s1;
    component SubGeneric<V> s2;
    
    connect sIn1 -> s1.sIn1, s1.sIn2;
    connect sIn2 -> s2.sIn1, s2.sIn2;
    
    connect s1.sOut -> sOut1;
    connect s2.sOut -> sOut2; 

}
