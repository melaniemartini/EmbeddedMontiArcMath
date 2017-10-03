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

// created by Michael von Wenckstern




package de.monticore.lang.embeddedmontiarc.embeddedmontiarcmath._symboltable;

import java.util.Deque;

import de.monticore.lang.embeddedmontiarc.embeddedmontiarc._symboltable.EmbeddedMontiArcSymbolTableCreator;
import de.monticore.lang.embeddedmontiarc.embeddedmontiarcbehavior._symboltable.EmbeddedMontiArcBehaviorSymbolTableCreator;
import de.monticore.lang.embeddedmontiarc.embeddedmontiarcmath._visitor.CommonEmbeddedMontiArcMathDelegatorVisitor;
import de.monticore.lang.embeddedmontiarc.embeddedmontiarcmath._visitor.EmbeddedMontiArcMathVisitor;
import de.monticore.lang.math.math._symboltable.MathSymbolTableCreator;
import de.monticore.symboltable.MutableScope;
import de.monticore.symboltable.ResolvingConfiguration;
import de.monticore.symboltable.Scope;
import de.se_rwth.commons.logging.Log;

public class EmbeddedMontiArcMathSymbolTableCreator extends de.monticore.symboltable.CommonSymbolTableCreator
        implements EmbeddedMontiArcMathVisitor {

    // TODO doc
    private final CommonEmbeddedMontiArcMathDelegatorVisitor visitor = new CommonEmbeddedMontiArcMathDelegatorVisitor();

    private EmbeddedMontiArcSymbolTableCreator emaSTC;

    public EmbeddedMontiArcMathSymbolTableCreator(
            final ResolvingConfiguration resolvingConfig, final MutableScope enclosingScope) {
        super(resolvingConfig, enclosingScope);
        initSuperSTC(resolvingConfig);
    }

    public EmbeddedMontiArcMathSymbolTableCreator(final ResolvingConfiguration resolvingConfig, final Deque<MutableScope> scopeStack) {
        super(resolvingConfig, scopeStack);
        initSuperSTC(resolvingConfig);
    }

    private void initSuperSTC(final ResolvingConfiguration resolvingConfig) {
        this.emaSTC = new EmbeddedMontiArcSymbolTableCreator(resolvingConfig, scopeStack);

        visitor.set_de_monticore_lang_embeddedmontiarc_embeddedmontiarcmath__visitor_EmbeddedMontiArcMathVisitor(new EmbeddedMontiArcMathSymbolTableCreatorTOP(resolvingConfig, scopeStack));
        visitor.set_de_monticore_lang_embeddedmontiarc_embeddedmontiarc__visitor_EmbeddedMontiArcVisitor(emaSTC);
        visitor.set_de_monticore_lang_embeddedmontiarc_embeddedmontiarcbehavior__visitor_EmbeddedMontiArcBehaviorVisitor(
                new EmbeddedMontiArcBehaviorSymbolTableCreator(resolvingConfig, scopeStack));
        visitor.set_de_monticore_lang_math_math__visitor_MathVisitor(new MathSymbolTableCreator(resolvingConfig, scopeStack));
        //visitor.set_de_monticore_java_javadsl__visitor_JavaDSLVisitor(new JavaSymbolTableCreator(resolvingConfig, scopeStack));
     }

    /**
     * Creates the symbol table starting from the <code>rootNode</code> and
     * returns the first scope that was created.
     *
     * @param rootNode the root node
     * @return the first scope that was created
     */
    public Scope createFromAST(de.monticore.lang.embeddedmontiarc.embeddedmontiarcmath._ast.ASTEMAMCompilationUnit rootNode) {
        Log.errorIfNull(rootNode, "0xA7004_184 Error by creating of the EmbeddedMontiArcMathSymbolTableCreatorTOP symbol table: top ast node is null");
        rootNode.accept(visitor);
        return getFirstCreatedScope();
    }

    @Override
    public MutableScope getFirstCreatedScope() {
        return emaSTC.getFirstCreatedScope();
    }

    private EmbeddedMontiArcMathVisitor realThis = this;

    public EmbeddedMontiArcMathVisitor getRealThis() {
        return realThis;
    }

    @Override
    public void setRealThis(EmbeddedMontiArcMathVisitor realThis) {
        if (this.realThis != realThis) {
            this.realThis = realThis;
            visitor.setRealThis(realThis);
        }
    }

}
