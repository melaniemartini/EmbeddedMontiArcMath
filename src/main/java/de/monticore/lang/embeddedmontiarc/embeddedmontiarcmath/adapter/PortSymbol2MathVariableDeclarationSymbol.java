package de.monticore.lang.embeddedmontiarc.embeddedmontiarcmath.adapter;

import de.monticore.lang.embeddedmontiarc.embeddedmontiarc._symboltable.PortArraySymbol;
import de.monticore.lang.embeddedmontiarc.embeddedmontiarc._symboltable.PortSymbol;
import de.monticore.lang.math.math._symboltable.MathVariableDeclarationSymbol;
import de.monticore.lang.monticar.ranges._ast.ASTRange;
import de.monticore.lang.monticar.si._symboltable.SIUnitRangesSymbol;
import de.monticore.symboltable.resolving.SymbolAdapter;

import java.util.Arrays;
import java.util.Collections;

/**
 * @author Sascha Schneiders
 */
public class PortSymbol2MathVariableDeclarationSymbol extends MathVariableDeclarationSymbol
        implements SymbolAdapter<PortSymbol> {

    private final PortSymbol adaptee;

    public PortSymbol2MathVariableDeclarationSymbol(PortSymbol ps) {
        super(ps.getName(),
                new ASTRange(),
                Arrays.asList(1, 1),
                Collections.EMPTY_LIST);

        this.adaptee = ps;
    }

    public PortSymbol2MathVariableDeclarationSymbol(PortSymbol ps, SIUnitRangesSymbol rangesSymbol) {
        super(ps.getName(),
                rangesSymbol.getRange(0),
                Arrays.asList(1, 1),
                Collections.EMPTY_LIST);

        this.adaptee = ps;
    }

    @Override
    public PortSymbol getAdaptee() {
        return adaptee;
    }
}
