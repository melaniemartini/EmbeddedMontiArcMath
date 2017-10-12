package de.monticore.lang.embeddedmontiarc.embeddedmontiarcmath.cocos;

import de.monticore.lang.embeddedmontiarc.embeddedmontiarc._ast.ASTComponent;
import de.monticore.lang.embeddedmontiarc.embeddedmontiarc._ast.ASTElement;
import de.monticore.lang.embeddedmontiarc.embeddedmontiarc._ast.ASTSubComponent;
import de.monticore.lang.embeddedmontiarc.embeddedmontiarc._cocos.EmbeddedMontiArcASTComponentCoCo;
import de.monticore.lang.math.math._ast.ASTMathStatements;
import de.se_rwth.commons.logging.Log;

/**
 * @author Sascha Schneiders
 */
public class AtomicComponentCoCo implements EmbeddedMontiArcASTComponentCoCo {
    /**
     * @see EmbeddedMontiArcASTComponentCoCo#check(ASTComponent)
     */
    @Override
    public void check(ASTComponent node) {
        boolean hasSubComponent = false;
        boolean hasImplementationMath = false;
        for (ASTElement element : node.getBody().getElements()) {
            if (element instanceof ASTMathStatements) {
                hasImplementationMath = true;
            } else if (element instanceof ASTSubComponent) {
                hasSubComponent = true;
            }
        }
        if (hasImplementationMath && hasSubComponent) {
            Log.error("0x00000AE1 Implementation Math section in non atomic component " + node.getName() + " detected");
        }
    }

}
