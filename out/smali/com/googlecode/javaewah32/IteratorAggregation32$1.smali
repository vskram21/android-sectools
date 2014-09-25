.class final Lcom/googlecode/javaewah32/IteratorAggregation32$1;
.super Ljava/lang/Object;
.source "IteratorAggregation32.java"

# interfaces
.implements Lcom/googlecode/javaewah32/IteratingRLW32;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/googlecode/javaewah32/IteratorAggregation32;->not(Lcom/googlecode/javaewah32/IteratingRLW32;)Lcom/googlecode/javaewah32/IteratingRLW32;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$x:Lcom/googlecode/javaewah32/IteratingRLW32;


# direct methods
.method constructor <init>(Lcom/googlecode/javaewah32/IteratingRLW32;)V
    .locals 0
    .parameter

    .prologue
    .line 26
    iput-object p1, p0, Lcom/googlecode/javaewah32/IteratorAggregation32$1;->val$x:Lcom/googlecode/javaewah32/IteratingRLW32;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public discardFirstWords(I)V
    .locals 1
    .parameter "y"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/googlecode/javaewah32/IteratorAggregation32$1;->val$x:Lcom/googlecode/javaewah32/IteratingRLW32;

    invoke-interface {v0, p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    .line 61
    return-void
.end method

.method public getLiteralWordAt(I)I
    .locals 1
    .parameter "index"

    .prologue
    .line 35
    iget-object v0, p0, Lcom/googlecode/javaewah32/IteratorAggregation32$1;->val$x:Lcom/googlecode/javaewah32/IteratingRLW32;

    invoke-interface {v0, p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getLiteralWordAt(I)I

    move-result v0

    xor-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public getNumberOfLiteralWords()I
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/googlecode/javaewah32/IteratorAggregation32$1;->val$x:Lcom/googlecode/javaewah32/IteratingRLW32;

    invoke-interface {v0}, Lcom/googlecode/javaewah32/IteratingRLW32;->getNumberOfLiteralWords()I

    move-result v0

    return v0
.end method

.method public getRunningBit()Z
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/googlecode/javaewah32/IteratorAggregation32$1;->val$x:Lcom/googlecode/javaewah32/IteratingRLW32;

    invoke-interface {v0}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningBit()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getRunningLength()I
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/googlecode/javaewah32/IteratorAggregation32$1;->val$x:Lcom/googlecode/javaewah32/IteratingRLW32;

    invoke-interface {v0}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v0

    return v0
.end method

.method public next()Z
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/googlecode/javaewah32/IteratorAggregation32$1;->val$x:Lcom/googlecode/javaewah32/IteratingRLW32;

    invoke-interface {v0}, Lcom/googlecode/javaewah32/IteratingRLW32;->next()Z

    move-result v0

    return v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/googlecode/javaewah32/IteratorAggregation32$1;->val$x:Lcom/googlecode/javaewah32/IteratingRLW32;

    invoke-interface {v0}, Lcom/googlecode/javaewah32/IteratingRLW32;->size()I

    move-result v0

    return v0
.end method
