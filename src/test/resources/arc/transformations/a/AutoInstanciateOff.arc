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

component AutoInstanciateOff {
	
	port 
        in String strIn;
	
	component InnerNotInstanciated {
	   port 
        in String strIn1;
	}
	
	component InnerInstanciated {
	    port 
            in String strIn10;
		component InnerInnerNotInstanciated {
		  port 
            in String strIn2;
		}
		
		component InnerInnerInstanciated {
		  port 
            in String strIn3;
		}
		
		component InnerInnerInstanciated myInnerInnerInstanciated;
		
		connect strIn10 -> myInnerInnerInstanciated.strIn3;
	}
	
	component InnerWithGenerics<K> {
	   port 
        in String strIn4;
	}
	
	component InnerWithConfig(int i) {
	   port 
        in String strIn5;
	}
	
	component InnerWithGenericsAndConfig<K>(int i) {
	   port 
        in String strIn6;
	}
	
	component InnerInstanciated myInnerInstanciated;
	
	connect strIn -> myInnerInstanciated.strIn10;
}
