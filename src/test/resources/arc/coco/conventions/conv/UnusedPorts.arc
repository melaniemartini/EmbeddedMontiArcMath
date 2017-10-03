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

package conv;

component UnusedPorts {
    autoinstantiate on;

    port
        in Integer usedInputInteger,
        in String usedInputString,
        in Boolean unusedInputBoolean, //not connected
        out Integer usedOutputInteger,
        out Short unusedOutputShort; //not connected
        
    component InnerComp {
        port
            in Integer innerInputInteger,
            in String innerInputString,
            out Integer innerOutputInteger, //not connected in InnerComp, only outside
            out String unusedInnerOutputString; //not connected outside, only in InnerComp 
            

        component InnerInnerComp {
            port
                in Integer innerInputInteger,
                in String innerInputString,
                out String innerOutputString;
        }
        
        component SimpleComp innerSimple [usedOutputInteger -> innerInnerComp.innerInputInteger]; //has one unconnected port
        
        connect innerInnerComp.innerOutputString -> unusedInnerOutputString;
        connect innerInputInteger -> innerSimple.usedInputInteger;
        connect innerInputString ->  innerInnerComp.innerInputString;
    }
    
    component SimpleComp innerRef [usedOutputInteger -> innerComp.innerInputInteger]; //has one unconnected port

    connect usedInputInteger -> innerRef.usedInputInteger;
    connect usedInputString -> innerComp.innerInputString;
    connect innerComp.innerOutputInteger -> usedOutputInteger;
}
