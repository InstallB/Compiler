package AST;

import utility.Type;
import utility.Position;

abstract public class ASTNode {
    public Position pos;
    public Type type;

    public ASTNode (Position _pos){
        pos = _pos;
    }

    abstract public void accept (ASTvisitor visitor);
}
