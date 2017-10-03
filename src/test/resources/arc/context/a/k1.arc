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

import java.lang.String;

component k1 {
  
  port
    in String BigName,
    out String smallName,
    out String out2;
  
  
  component x.EmptyReference BigRef, smallRef;
  
  connect bigName -> bigRef.pIn, smallRef.pIn;
  connect bigRef.pOut -> smallName;
  connect smallRef.pOut -> out2;
  
  java inv BigLetterInvariant: {
    1 == 1;
  };
    
  java inv smallLetterInvariant: {
    1 == 1;
  };
}
