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

import d.*;

component AutoConnectPorts {
	autoconnect port;
	
	port 
		in String strIn,
		in Integer intIn,
		out String strOut,
		out String strOut2,
		out Integer intOut;
	
	component A;
	
	component B;
	
	component C;
	
	component D;
	
	connect strIn -> a.strIn;
	connect c.bb -> d.bool;
	connect d.intOut -> intOut;
	
	/** expected additional connectors:
	intIn -> c.intIn;
	intIn -> b.intIn
	strIn -> b.strIn;
	
	d.strOut -> strOut;
	b.myInt -> d.myInt;
    	
	*/
}
