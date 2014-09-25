.class Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;
.super Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;
.source "MyersDiff.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "BackwardEditPaths"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/diff/MyersDiff",
        "<TS;>.MiddleEdit.EditPaths;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;)V
    .locals 0
    .parameter

    .prologue
    .line 498
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.BackwardEditPaths;"
    iput-object p1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;-><init>(Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;)V

    return-void
.end method


# virtual methods
.method final adjustMinMaxK(II)V
    .locals 2
    .parameter "k"
    .parameter "x"

    .prologue
    .line 519
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.BackwardEditPaths;"
    iget-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget v0, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->beginA:I

    if-le p2, v0, :cond_0

    add-int v0, p1, p2

    iget-object v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget v1, v1, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->beginB:I

    if-gt v0, v1, :cond_1

    .line 520
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget-object v0, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->forward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;

    iget v0, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->middleK:I

    if-le p1, v0, :cond_2

    .line 521
    iput p1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;->maxK:I

    .line 525
    :cond_1
    :goto_0
    return-void

    .line 523
    :cond_2
    iput p1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;->minK:I

    goto :goto_0
.end method

.method final getLeft(I)I
    .locals 1
    .parameter "x"

    .prologue
    .line 507
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.BackwardEditPaths;"
    add-int/lit8 v0, p1, -0x1

    return v0
.end method

.method final getRight(I)I
    .locals 0
    .parameter "x"

    .prologue
    .line 511
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.BackwardEditPaths;"
    return p1
.end method

.method final isBetter(II)Z
    .locals 1
    .parameter "left"
    .parameter "right"

    .prologue
    .line 515
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.BackwardEditPaths;"
    if-ge p1, p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method final meets(IIIJ)Z
    .locals 3
    .parameter "d"
    .parameter "k"
    .parameter "x"
    .parameter "snake"

    .prologue
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.BackwardEditPaths;"
    const/4 v0, 0x0

    .line 528
    iget-object v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget-object v1, v1, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->forward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;

    iget v1, v1, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->beginK:I

    if-lt p2, v1, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget-object v1, v1, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->forward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;

    iget v1, v1, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->endK:I

    if-le p2, v1, :cond_1

    .line 536
    :cond_0
    :goto_0
    return v0

    .line 531
    :cond_1
    add-int v1, p1, p2

    iget-object v2, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget-object v2, v2, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->forward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;

    iget v2, v2, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->middleK:I

    sub-int/2addr v1, v2

    rem-int/lit8 v1, v1, 0x2

    if-nez v1, :cond_0

    .line 533
    iget-object v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget-object v1, v1, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->forward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;

    invoke-virtual {v1, p1, p2}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->getX(II)I

    move-result v1

    if-gt p3, v1, :cond_0

    .line 535
    iget-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget-object v0, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->forward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->getSnake(II)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1, p4, p5}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;->makeEdit(JJ)Z

    .line 536
    const/4 v0, 0x1

    goto :goto_0
.end method

.method final snake(II)I
    .locals 5
    .parameter "k"
    .parameter "x"

    .prologue
    .line 500
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.BackwardEditPaths;"
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget v0, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->beginA:I

    if-le p2, v0, :cond_0

    add-int v0, p1, p2

    iget-object v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget v1, v1, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->beginB:I

    if-le v0, v1, :cond_0

    .line 501
    iget-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget-object v0, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->this$0:Lorg/eclipse/jgit/diff/MyersDiff;

    iget-object v0, v0, Lorg/eclipse/jgit/diff/MyersDiff;->cmp:Lorg/eclipse/jgit/diff/HashedSequenceComparator;

    iget-object v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget-object v1, v1, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->this$0:Lorg/eclipse/jgit/diff/MyersDiff;

    iget-object v1, v1, Lorg/eclipse/jgit/diff/MyersDiff;->a:Lorg/eclipse/jgit/diff/HashedSequence;

    add-int/lit8 v2, p2, -0x1

    iget-object v3, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$BackwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget-object v3, v3, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->this$0:Lorg/eclipse/jgit/diff/MyersDiff;

    iget-object v3, v3, Lorg/eclipse/jgit/diff/MyersDiff;->b:Lorg/eclipse/jgit/diff/HashedSequence;

    add-int v4, p1, p2

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/diff/HashedSequenceComparator;->equals(Lorg/eclipse/jgit/diff/HashedSequence;ILorg/eclipse/jgit/diff/HashedSequence;I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 503
    :cond_0
    return p2

    .line 500
    :cond_1
    add-int/lit8 p2, p2, -0x1

    goto :goto_0
.end method
