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

// unused imports
import a.CorrectCompInA;
import b.GenericComponent;
import c.CorrectCompInC;
import java.math.BigDecimal;
import java.io.Serializable;
import java.io.IOException;
import java.util.List;
import java.util.Set;

// used imports
import b.CorrectCompInB;
import b.CorrectCompInB2;
import java.math.BigInteger;
import java.io.PrintStream;
import java.util.Date;
import java.util.Map;
import java.util.Random;

component UnusedImports(Map m, java.util.Set s) extends b.GenericComponent<java.math.BigDecimal, java.util.Set<java.io.Serializable>> {

    port 
        in BigInteger bigInt,
        in Map<java.util.Set<Random>, Date> mapIn,
        in String strIn,
        out java.math.BigDecimal bigDec,
        out String strOut,
        out String strOut2;
    
    component CorrectCompInB ccib;
    component a.CorrectCompInA ccia;
    
    component b.SimpleGenericComponent<PrintStream, BigInteger> generic1;
    component b.SimpleGenericComponent<java.io.IOException, BigInteger> generic2;
    
    component InnerComponent extends CorrectCompInB2 {
        port
	        in BigInteger bigInt,
	        in Map<java.util.Set<Random>, Date> mapIn,
	        out java.math.BigDecimal bigDec;
    }
    
    component InnerComponent myInner;
    
    connect bigInt -> myInner.bigInt;
    connect mapIn -> myInner.mapIn;
    connect myInner.bigDec -> bigDec;
    
    connect strIn -> ccib.stringIn, ccia.stringIn, generic1.stringIn, generic2.stringIn;
    connect ccib.stringOut -> strOut;
    connect ccia.stringOut -> strOut2;
}
