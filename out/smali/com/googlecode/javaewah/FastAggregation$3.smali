.class final Lcom/googlecode/javaewah/FastAggregation$3;
.super Ljava/lang/Object;
.source "FastAggregation.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/googlecode/javaewah/FastAggregation;->or([Lcom/googlecode/javaewah/LogicalElement;)Lcom/googlecode/javaewah/LogicalElement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<TT;>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 199
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/googlecode/javaewah/LogicalElement;Lcom/googlecode/javaewah/LogicalElement;)I
    .locals 2
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)I"
        }
    .end annotation

    .prologue
    .line 202
    .local p1, a:Lcom/googlecode/javaewah/LogicalElement;,"TT;"
    .local p2, b:Lcom/googlecode/javaewah/LogicalElement;,"TT;"
    invoke-interface {p1}, Lcom/googlecode/javaewah/LogicalElement;->sizeInBytes()I

    move-result v0

    invoke-interface {p2}, Lcom/googlecode/javaewah/LogicalElement;->sizeInBytes()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 199
    check-cast p1, Lcom/googlecode/javaewah/LogicalElement;

    .end local p1
    check-cast p2, Lcom/googlecode/javaewah/LogicalElement;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/googlecode/javaewah/FastAggregation$3;->compare(Lcom/googlecode/javaewah/LogicalElement;Lcom/googlecode/javaewah/LogicalElement;)I

    move-result v0

    return v0
.end method
