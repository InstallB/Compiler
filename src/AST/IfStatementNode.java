package AST;

import utility.Position;

public class IfStatementNode extends ASTNode {
    public ExpressionNode Ex;
    public StatementNode thenSt,elseSt;

    public IfStatementNode (Position pos,ExpressionNode Ex_,StatementNode thenSt_,StatementNode elseSt_){
        super(pos);
        Ex = Ex_; thenSt = thenSt_; elseSt = elseSt_;
    }

    @Override
    public void accept (ASTvisitor visitor){
        visitor.visit(this);
    }
}
