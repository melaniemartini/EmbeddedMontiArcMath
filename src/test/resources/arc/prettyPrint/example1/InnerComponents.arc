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

package example1;

import example1.*;

component InnerComponents {
  
    component InnerSimpleComponent {
        
        component InnerInnerComponent {
        
        }
        
        component InnerInnerGenericComponent<K, V> {
        
        }
        
        component InnerInnerConfigurableComponent(int x, String z, U v) {
        
        }
        
        component InnerInnerGenericAndConfigurableComponent<K, V>(String s, int i) {
        
        }
    
    }
    
    component InnerGenericComponent<K, V> {
    
    }
    
    component InnerConfigurableComponent(int x, String z, U v) {
        
    }
        
    component InnerGenericAndConfigurableComponent<K, V>(String s, int i) {
        
    }
    
    component BlaBla myBla {
    
    }
  
  
  

}
