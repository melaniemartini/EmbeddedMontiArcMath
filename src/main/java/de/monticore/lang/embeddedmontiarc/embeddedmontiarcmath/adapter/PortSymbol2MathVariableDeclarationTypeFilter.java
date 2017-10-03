package de.monticore.lang.embeddedmontiarc.embeddedmontiarcmath.adapter;

import de.monticore.java.symboltable.JavaTypeSymbol;
import de.monticore.lang.embeddedmontiarc.embeddedmontiarc._symboltable.PortArraySymbol;
import de.monticore.lang.embeddedmontiarc.embeddedmontiarc._symboltable.PortSymbol;
import de.monticore.lang.math.math._symboltable.MathVariableDeclarationSymbol;
import de.monticore.lang.monticar.si._symboltable.ResolutionDeclarationSymbol;
import de.monticore.lang.monticar.si._symboltable.SIUnitRangesSymbol;
import de.monticore.symboltable.Symbol;
import de.monticore.symboltable.resolving.TransitiveAdaptedResolvingFilter;

/**
 * Created by Sascha on 15.08.2017.
 */
public class PortSymbol2MathVariableDeclarationTypeFilter extends TransitiveAdaptedResolvingFilter<MathVariableDeclarationSymbol> {

    public PortSymbol2MathVariableDeclarationTypeFilter() {
        super(PortSymbol.KIND,
                MathVariableDeclarationSymbol.class,
                MathVariableDeclarationSymbol.KIND);
    }

    @Override
    public Symbol translate(Symbol adaptee) {
        assert adaptee instanceof PortSymbol;
        if (((PortSymbol) adaptee).getTypeReference().getReferencedSymbol() instanceof SIUnitRangesSymbol)
            return new PortSymbol2MathVariableDeclarationSymbol((PortSymbol) adaptee, (SIUnitRangesSymbol) ((PortSymbol) adaptee).getTypeReference().getReferencedSymbol());
        else {
            JavaTypeSymbol jTypeSymbol = (JavaTypeSymbol) ((PortSymbol) adaptee).getTypeReference().getReferencedSymbol();
            System.out.println("Adaption of: " + jTypeSymbol.toString());
            return new PortSymbol2MathVariableDeclarationSymbol((PortSymbol) adaptee);
        }

    }
}
