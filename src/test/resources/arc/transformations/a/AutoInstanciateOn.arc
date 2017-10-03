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

component AutoInstanciateOn {
	
	
	port 
        in String strIn;
        
	// create
	component InnerNotInstanciated {
	   port 
        in String strIn1;
	}
	
	// do not create 
	component InnerInstanciated {
		port 
            in String strIn2;
		// create
		component InnerInnerNotInstanciated {
		  port 
            in String strIn3;
		}
		
		// do not create
		component InnerInnerInstanciated {
		  port 
            in String strIn4;
		}
		
		component InnerInnerInstanciated myInnerInnerInstanciated;
		
		connect strIn2 -> myInnerInnerInstanciated.strIn4, innerInnerNotInstanciated.strIn3;
	}
	
	component InnerInstanciated myInnerInstanciated;
	
	// do not create
	component InnerWithGenerics<K> {
	   port 
        in String strIn5;
	}
	
	// do not create
	component InnerWithConfig(int i) {
	   port 
        in String strIn6;
	}
	
	// do not create
	component InnerWithGenericsAndConfig<K>(int i) {
	   port 
        in String strIn7;
	}
	
	connect strIn -> myInnerInstanciated.strIn2, innerNotInstanciated.strIn1;
	
}
