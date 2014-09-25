.class Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;
.super Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;
.source "MyersDiff.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ForwardEditPaths"
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
    .line 456
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.ForwardEditPaths;"
    iput-object p1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;-><init>(Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;)V

    return-void
.end method


# virtual methods
.method final adjustMinMaxK(II)V
    .locals 2
    .parameter "k"
    .parameter "x"

    .prologue
    .line 477
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.ForwardEditPaths;"
    iget-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget v0, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->endA:I

    if-ge p2, v0, :cond_0

    add-int v0, p1, p2

    iget-object v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget v1, v1, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->endB:I

    if-lt v0, v1, :cond_1

    .line 478
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget-object v0, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->backward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;

    iget v0, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->middleK:I

    if-le p1, v0, :cond_2

    .line 479
    iput p1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;->maxK:I

    .line 483
    :cond_1
    :goto_0
    return-void

    .line 481
    :cond_2
    iput p1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;->minK:I

    goto :goto_0
.end method

.method final getLeft(I)I
    .locals 0
    .parameter "x"

    .prologue
    .line 465
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.ForwardEditPaths;"
    return p1
.end method

.method final getRight(I)I
    .locals 1
    .parameter "x"

    .prologue
    .line 469
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.ForwardEditPaths;"
    add-int/lit8 v0, p1, 0x1

    return v0
.end method

.method final isBetter(II)Z
    .locals 1
    .parameter "left"
    .parameter "right"

    .prologue
    .line 473
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.ForwardEditPaths;"
    if-le p1, p2, :cond_0

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
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.ForwardEditPaths;"
    const/4 v0, 0x0

    .line 486
    iget-object v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget-object v1, v1, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->backward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;

    iget v1, v1, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->beginK:I

    if-lt p2, v1, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget-object v1, v1, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->backward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;

    iget v1, v1, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->endK:I

    if-le p2, v1, :cond_1

    .line 494
    :cond_0
    :goto_0
    return v0

    .line 489
    :cond_1
    add-int/lit8 v1, p1, -0x1

    add-int/2addr v1, p2

    iget-object v2, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget-object v2, v2, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->backward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;

    iget v2, v2, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->middleK:I

    sub-int/2addr v1, v2

    rem-int/lit8 v1, v1, 0x2

    if-nez v1, :cond_0

    .line 491
    iget-object v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget-object v1, v1, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->backward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;

    add-int/lit8 v2, p1, -0x1

    invoke-virtual {v1, v2, p2}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->getX(II)I

    move-result v1

    if-lt p3, v1, :cond_0

    .line 493
    iget-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget-object v0, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->backward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;

    add-int/lit8 v1, p1, -0x1

    invoke-virtual {v0, v1, p2}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->getSnake(II)J

    move-result-wide v0

    invoke-virtual {p0, p4, p5, v0, v1}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;->makeEdit(JJ)Z

    .line 494
    const/4 v0, 0x1

    goto :goto_0
.end method

.method final snake(II)I
    .locals 4
    .parameter "k"
    .parameter "x"

    .prologue
    .line 458
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.ForwardEditPaths;"
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget v0, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->endA:I

    if-ge p2, v0, :cond_0

    add-int v0, p1, p2

    iget-object v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget v1, v1, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->endB:I

    if-ge v0, v1, :cond_0

    .line 459
    iget-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget-object v0, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->this$0:Lorg/eclipse/jgit/diff/MyersDiff;

    iget-object v0, v0, Lorg/eclipse/jgit/diff/MyersDiff;->cmp:Lorg/eclipse/jgit/diff/HashedSequenceComparator;

    iget-object v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget-object v1, v1, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->this$0:Lorg/eclipse/jgit/diff/MyersDiff;

    iget-object v1, v1, Lorg/eclipse/jgit/diff/MyersDiff;->a:Lorg/eclipse/jgit/diff/HashedSequence;

    iget-object v2, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$ForwardEditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget-object v2, v2, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->this$0:Lorg/eclipse/jgit/diff/MyersDiff;

    iget-object v2, v2, Lorg/eclipse/jgit/diff/MyersDiff;->b:Lorg/eclipse/jgit/diff/HashedSequence;

    add-int v3, p1, p2

    invoke-virtual {v0, v1, p2, v2, v3}, Lorg/eclipse/jgit/diff/HashedSequenceComparator;->equals(Lorg/eclipse/jgit/diff/HashedSequence;ILorg/eclipse/jgit/diff/HashedSequence;I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 461
    :cond_0
    return p2

    .line 458
    :cond_1
    add-int/lit8 p2, p2, 0x1

    goto :goto_0
.end method
