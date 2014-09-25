.class public interface abstract Lcom/googlecode/javaewah/IteratingRLW;
.super Ljava/lang/Object;
.source "IteratingRLW.java"


# virtual methods
.method public abstract clone()Lcom/googlecode/javaewah/IteratingRLW;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation
.end method

.method public abstract discardFirstWords(J)V
.end method

.method public abstract getLiteralWordAt(I)J
.end method

.method public abstract getNumberOfLiteralWords()I
.end method

.method public abstract getRunningBit()Z
.end method

.method public abstract getRunningLength()J
.end method

.method public abstract next()Z
.end method

.method public abstract size()J
.end method
