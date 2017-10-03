package de.monticore.lang.embeddedmontiarc.embeddedmontiarcmath.adapter;

import de.monticore.lang.math.math._symboltable.JSValue;
import de.monticore.lang.math.math._symboltable.MathVariableDeclarationSymbol;
import de.monticore.lang.monticar.si._symboltable.ResolutionDeclarationSymbol;
import de.monticore.lang.monticar.types2._ast.ASTUnitNumberResolution;
import de.monticore.symboltable.resolving.SymbolAdapter;

import java.util.Arrays;
import java.util.Collections;

/**
 * @author Sascha Schneiders
 */
public class ResolutionDeclarationSymbol2MathVariableDeclarationSymbol extends MathVariableDeclarationSymbol
        implements SymbolAdapter<ResolutionDeclarationSymbol> {

    private final ResolutionDeclarationSymbol adaptee;

    public ResolutionDeclarationSymbol2MathVariableDeclarationSymbol(ResolutionDeclarationSymbol ps, ASTUnitNumberResolution unitNumberResolution) {
        super(ps.getName(),
                new JSValue(unitNumberResolution.getNumber().get()));

        this.adaptee = ps;
    }

    @Override
    public ResolutionDeclarationSymbol getAdaptee() {
        return adaptee;
    }

}
