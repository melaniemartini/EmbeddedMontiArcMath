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

import java.util.*;

component TestComp<K,V>(List<K> liskK, List<Map<K,V>> listMapKV) {
  port 
    in GenericPort<Map<String, Boolean>, List<Map<Integer, Integer>>> portOne,
    in GenericPort<Integer, Double> portTwo,
    in List<List<String>> portThree;
    
  component GenericComp<List<List<String>>, GenericPort<Integer, Double>> refToGenericComp;
  
  component GenericComp<GenericPort<Map<String, Boolean>, List<Map<Integer, Integer>>>, String> refToGenericComp2;
  component GenericComp<GenericPort<Integer, Double>, String> refToGenericComp3;
  
  connect portOne -> refToGenericComp2.portIn;
  connect portTwo -> refToGenericComp3.portIn;
  connect portThree -> refToGenericComp.portIn;
  
}
