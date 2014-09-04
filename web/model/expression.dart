part of dgs.models;


abstract class ExpressionR<A> {
}
abstract class Inquiry<A> extends ExpressionR<A> {
}
abstract class ExpressionArrow2<A,B,C> extends ExpressionR<C> {
}
abstract class ExpressionArrow1<A,B> extends ExpressionR<B> {
}

