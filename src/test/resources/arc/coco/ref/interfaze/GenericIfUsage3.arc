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

package interfaze;

component GenericIfUsage3 {
    
    component GenericIfProvider<String> p1, p2;
    
    component GenericIfRequired<Integer> r1, r2;
    
    // all same type
    connect p1.implOut -> r1.implIn;
    connect p1.ifOut -> r1.ifIn;
    
    // correct
    connect p2.implOut -> r2.ifIn;
    // invalid
    connect p2.ifOut -> r2.implIn;

}
