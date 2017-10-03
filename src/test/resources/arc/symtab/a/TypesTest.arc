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
import java.lang.Integer;
import a.myTypes.List;
import a.myTypes.NewType;
import z.GenericPartner;

component TypesTest {
  
  port 
    in NewType<String, Integer> nt;
  
  port 
    in String incoming,
    out Integer outgoing,
    out String strOut;
    
  port
    in List<NewType<String, List<String>>> complexIn,
    out List<NewType<String, List<String>>> complexOut;
  
  component GenericComp<String, Integer> gen;
  component GenericPartner<List<NewType<String, List<String>>>> complexPartner;
  
  connect incoming -> gen.incoming;
  connect nt -> gen.nt;
  connect gen.outgoing -> outgoing;
  connect gen.outK -> strOut;
  
  connect complexIn -> complexPartner.tIn;
  connect complexPartner.tOut -> complexOut;
}
