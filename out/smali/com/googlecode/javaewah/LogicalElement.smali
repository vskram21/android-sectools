.class public interface abstract Lcom/googlecode/javaewah/LogicalElement;
.super Ljava/lang/Object;
.source "LogicalElement.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract and(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation
.end method

.method public abstract andNot(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation
.end method

.method public abstract not()V
.end method

.method public abstract or(Ljava/lang/Object;)Lcom/googlecode/javaewah/LogicalElement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/googlecode/javaewah/LogicalElement;"
        }
    .end annotation
.end method

.method public abstract sizeInBits()I
.end method

.method public abstract sizeInBytes()I
.end method

.method public abstract xor(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation
.end method
