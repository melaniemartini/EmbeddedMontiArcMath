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

package componentTest;

import java.lang.String;
import java.lang.Integer;

component ArchOuter {
  
  port
    in String str1,
    in String str2,
    out Integer int1,
    out Integer int2,
    out Integer int3;
    
  component Simple;
  component SimpleOut;
  component ArchInner;
  component SimpleOutGeneric<Integer>;
  
  connect str1 -> simpleOut.str1, simple.string, simpleOutGeneric.string;
  connect str2 -> archInner.string, simpleOut.str2;
  connect simple.integer -> simpleOutGeneric.input1;
  connect simpleOut.integer -> simpleOutGeneric.input2;
  connect simpleOutGeneric.output -> int3;
  connect archInner.intOut1 -> int1;
  connect archInner.intOut2 -> int2;
  
}
