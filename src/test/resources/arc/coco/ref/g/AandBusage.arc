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

package g;

component AandBusage {
    
    port
        in GenericType<byte[]> genIn,
        in GenericType<CType[]> getCTypeIn,
        out GenericType<byte[]> genOut,
        out GenericType<CType[]> getCTypeOut;
        
    component A a1, a2;
    
    connect genIn -> a1.genIn;
    connect getCTypeIn -> a1.getCTypeIn;
    
    connect a1.genOut -> a2.genIn;
    connect a1.getCTypeOut -> a2.getCTypeIn;
    
    connect a2.genOut -> genOut;
    connect a2.getCTypeOut -> getCTypeOut;

}
