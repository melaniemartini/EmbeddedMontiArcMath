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

import b.*;

component CorrectReferences<T>(int myInt, String myString) {
    port 
        in String s1;
        
    component SimpleGenericComponent gcWrong1;
    
    // need two type parameters
    component SimpleGenericComponent<T> gcWrong2;
    
    component SimpleGenericComponent<T, String> gcCorrect1;
    
    component SimpleGenericComponent<Integer, String> gcCorrect2;
    
    component ConfigurableComponent ccWrong1;
    
    component ConfigurableComponent(1) ccWrong2;
    
    component ConfigurableComponent(1, "Hallo") ccCorrect1;
    
    component ConfigurableComponent(myInt, myString) ccCorrect2;
    
    
    
    component GenericConfigurableComponent gccWrong1;
    
    component GenericConfigurableComponent<T> gccWrong2;
   
    component GenericConfigurableComponent(1, "Hallo") gccWrong4;
    
    component GenericConfigurableComponent<T, String>(1) gccWrong5;
    
    component GenericConfigurableComponent<T>(123, "Test") gccWrong3;
    
    component GenericConfigurableComponent<T, String>(1, "Hallo") gccCorrect1;
    
    component GenericConfigurableComponent<Integer, String>(myInt, myString) gccCorrect2;
    
    connect s1 -> gcWrong1.stringIn; 
    connect s1 -> gcWrong2.stringIn;
    connect s1 -> gcCorrect1.stringIn;
    connect s1 -> gcCorrect2.stringIn; 
    connect s1 -> ccWrong1.s1; 
    connect s1 -> ccWrong2.s1; 
    connect s1 -> ccCorrect1.s1; 
    connect s1 -> ccCorrect2.s1; 
    connect s1 -> gccWrong1.s1;
    connect s1 -> gccWrong2.s1; 
    connect s1 -> gccWrong3.s1;
    connect s1 -> gccWrong4.s1;
    connect s1 -> gccWrong5.s1;
    connect s1 -> gccCorrect1.s1;
    connect s1 -> gccCorrect2.s1;

}
