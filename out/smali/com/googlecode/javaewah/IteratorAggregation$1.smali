.class final Lcom/googlecode/javaewah/IteratorAggregation$1;
.super Ljava/lang/Object;
.source "IteratorAggregation.java"

# interfaces
.implements Lcom/googlecode/javaewah/IteratingRLW;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/googlecode/javaewah/IteratorAggregation;->not(Lcom/googlecode/javaewah/IteratingRLW;)Lcom/googlecode/javaewah/IteratingRLW;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$x:Lcom/googlecode/javaewah/IteratingRLW;


# direct methods
.method constructor <init>(Lcom/googlecode/javaewah/IteratingRLW;)V
    .locals 0
    .parameter

    .prologue
    .line 23
    iput-object p1, p0, Lcom/googlecode/javaewah/IteratorAggregation$1;->val$x:Lcom/googlecode/javaewah/IteratingRLW;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public clone()Lcom/googlecode/javaewah/IteratingRLW;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 62
    new-instance v0, Ljava/lang/CloneNotSupportedException;

    invoke-direct {v0}, Ljava/lang/CloneNotSupportedException;-><init>()V

    throw v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 23
    invoke-virtual {p0}, Lcom/googlecode/javaewah/IteratorAggregation$1;->clone()Lcom/googlecode/javaewah/IteratingRLW;

    move-result-object v0

    return-object v0
.end method

.method public discardFirstWords(J)V
    .locals 1
    .parameter "y"

    .prologue
    .line 57
    iget-object v0, p0, Lcom/googlecode/javaewah/IteratorAggregation$1;->val$x:Lcom/googlecode/javaewah/IteratingRLW;

    invoke-interface {v0, p1, p2}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    .line 58
    return-void
.end method

.method public getLiteralWordAt(I)J
    .locals 4
    .parameter "index"

    .prologue
    .line 32
    iget-object v0, p0, Lcom/googlecode/javaewah/IteratorAggregation$1;->val$x:Lcom/googlecode/javaewah/IteratingRLW;

    invoke-interface {v0, p1}, Lcom/googlecode/javaewah/IteratingRLW;->getLiteralWordAt(I)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    xor-long/2addr v0, v2

    return-wide v0
.end method

.method public getNumberOfLiteralWords()I
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/googlecode/javaewah/IteratorAggregation$1;->val$x:Lcom/googlecode/javaewah/IteratingRLW;

    invoke-interface {v0}, Lcom/googlecode/javaewah/IteratingRLW;->getNumberOfLiteralWords()I

    move-result v0

    return v0
.end method

.method public getRunningBit()Z
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/googlecode/javaewah/IteratorAggregation$1;->val$x:Lcom/googlecode/javaewah/IteratingRLW;

    invoke-interface {v0}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningBit()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getRunningLength()J
    .locals 2

    .prologue
    .line 52
    iget-object v0, p0, Lcom/googlecode/javaewah/IteratorAggregation$1;->val$x:Lcom/googlecode/javaewah/IteratingRLW;

    invoke-interface {v0}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v0

    return-wide v0
.end method

.method public next()Z
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/googlecode/javaewah/IteratorAggregation$1;->val$x:Lcom/googlecode/javaewah/IteratingRLW;

    invoke-interface {v0}, Lcom/googlecode/javaewah/IteratingRLW;->next()Z

    move-result v0

    return v0
.end method

.method public size()J
    .locals 2

    .prologue
    .line 47
    iget-object v0, p0, Lcom/googlecode/javaewah/IteratorAggregation$1;->val$x:Lcom/googlecode/javaewah/IteratingRLW;

    invoke-interface {v0}, Lcom/googlecode/javaewah/IteratingRLW;->size()J

    move-result-wide v0

    return-wide v0
.end method
