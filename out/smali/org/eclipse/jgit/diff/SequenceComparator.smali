.class public abstract Lorg/eclipse/jgit/diff/SequenceComparator;
.super Ljava/lang/Object;
.source "SequenceComparator.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Lorg/eclipse/jgit/diff/Sequence;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 58
    .local p0, this:Lorg/eclipse/jgit/diff/SequenceComparator;,"Lorg/eclipse/jgit/diff/SequenceComparator<TS;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract equals(Lorg/eclipse/jgit/diff/Sequence;ILorg/eclipse/jgit/diff/Sequence;I)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;ITS;I)Z"
        }
    .end annotation
.end method

.method public abstract hash(Lorg/eclipse/jgit/diff/Sequence;I)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;I)I"
        }
    .end annotation
.end method

.method public reduceCommonStartEnd(Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/Edit;
    .locals 2
    .parameter
    .parameter
    .parameter "e"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;TS;",
            "Lorg/eclipse/jgit/diff/Edit;",
            ")",
            "Lorg/eclipse/jgit/diff/Edit;"
        }
    .end annotation

    .prologue
    .line 116
    .local p0, this:Lorg/eclipse/jgit/diff/SequenceComparator;,"Lorg/eclipse/jgit/diff/SequenceComparator<TS;>;"
    .local p1, a:Lorg/eclipse/jgit/diff/Sequence;,"TS;"
    .local p2, b:Lorg/eclipse/jgit/diff/Sequence;,"TS;"
    :goto_0
    iget v0, p3, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    iget v1, p3, Lorg/eclipse/jgit/diff/Edit;->endA:I

    if-ge v0, v1, :cond_0

    iget v0, p3, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    iget v1, p3, Lorg/eclipse/jgit/diff/Edit;->endB:I

    if-ge v0, v1, :cond_0

    iget v0, p3, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    iget v1, p3, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    invoke-virtual {p0, p1, v0, p2, v1}, Lorg/eclipse/jgit/diff/SequenceComparator;->equals(Lorg/eclipse/jgit/diff/Sequence;ILorg/eclipse/jgit/diff/Sequence;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 118
    iget v0, p3, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p3, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    .line 119
    iget v0, p3, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p3, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    goto :goto_0

    .line 124
    :cond_0
    :goto_1
    iget v0, p3, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    iget v1, p3, Lorg/eclipse/jgit/diff/Edit;->endA:I

    if-ge v0, v1, :cond_1

    iget v0, p3, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    iget v1, p3, Lorg/eclipse/jgit/diff/Edit;->endB:I

    if-ge v0, v1, :cond_1

    iget v0, p3, Lorg/eclipse/jgit/diff/Edit;->endA:I

    add-int/lit8 v0, v0, -0x1

    iget v1, p3, Lorg/eclipse/jgit/diff/Edit;->endB:I

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, p1, v0, p2, v1}, Lorg/eclipse/jgit/diff/SequenceComparator;->equals(Lorg/eclipse/jgit/diff/Sequence;ILorg/eclipse/jgit/diff/Sequence;I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 126
    iget v0, p3, Lorg/eclipse/jgit/diff/Edit;->endA:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p3, Lorg/eclipse/jgit/diff/Edit;->endA:I

    .line 127
    iget v0, p3, Lorg/eclipse/jgit/diff/Edit;->endB:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p3, Lorg/eclipse/jgit/diff/Edit;->endB:I

    goto :goto_1

    .line 130
    :cond_1
    return-object p3
.end method
