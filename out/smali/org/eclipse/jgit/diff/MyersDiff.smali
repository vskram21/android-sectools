.class public Lorg/eclipse/jgit/diff/MyersDiff;
.super Ljava/lang/Object;
.source "MyersDiff.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Lorg/eclipse/jgit/diff/Sequence;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lorg/eclipse/jgit/diff/DiffAlgorithm;


# instance fields
.field protected a:Lorg/eclipse/jgit/diff/HashedSequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;"
        }
    .end annotation
.end field

.field protected b:Lorg/eclipse/jgit/diff/HashedSequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;"
        }
    .end annotation
.end field

.field protected cmp:Lorg/eclipse/jgit/diff/HashedSequenceComparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/diff/HashedSequenceComparator",
            "<TS;>;"
        }
    .end annotation
.end field

.field protected edits:Lorg/eclipse/jgit/diff/EditList;

.field middle:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/diff/MyersDiff",
            "<TS;>.MiddleEdit;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 114
    new-instance v0, Lorg/eclipse/jgit/diff/MyersDiff$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/diff/MyersDiff$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/diff/MyersDiff;->INSTANCE:Lorg/eclipse/jgit/diff/DiffAlgorithm;

    return-void
.end method

.method private constructor <init>(Lorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/diff/HashedSequenceComparator;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/Edit;)V
    .locals 1
    .parameter "edits"
    .parameter
    .parameter
    .parameter
    .parameter "region"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/diff/EditList;",
            "Lorg/eclipse/jgit/diff/HashedSequenceComparator",
            "<TS;>;",
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;",
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;",
            "Lorg/eclipse/jgit/diff/Edit;",
            ")V"
        }
    .end annotation

    .prologue
    .line 143
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>;"
    .local p2, cmp:Lorg/eclipse/jgit/diff/HashedSequenceComparator;,"Lorg/eclipse/jgit/diff/HashedSequenceComparator<TS;>;"
    .local p3, a:Lorg/eclipse/jgit/diff/HashedSequence;,"Lorg/eclipse/jgit/diff/HashedSequence<TS;>;"
    .local p4, b:Lorg/eclipse/jgit/diff/HashedSequence;,"Lorg/eclipse/jgit/diff/HashedSequence<TS;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 152
    new-instance v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;-><init>(Lorg/eclipse/jgit/diff/MyersDiff;)V

    iput-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff;->middle:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    .line 144
    iput-object p1, p0, Lorg/eclipse/jgit/diff/MyersDiff;->edits:Lorg/eclipse/jgit/diff/EditList;

    .line 145
    iput-object p2, p0, Lorg/eclipse/jgit/diff/MyersDiff;->cmp:Lorg/eclipse/jgit/diff/HashedSequenceComparator;

    .line 146
    iput-object p3, p0, Lorg/eclipse/jgit/diff/MyersDiff;->a:Lorg/eclipse/jgit/diff/HashedSequence;

    .line 147
    iput-object p4, p0, Lorg/eclipse/jgit/diff/MyersDiff;->b:Lorg/eclipse/jgit/diff/HashedSequence;

    .line 148
    invoke-direct {p0, p5}, Lorg/eclipse/jgit/diff/MyersDiff;->calculateEdits(Lorg/eclipse/jgit/diff/Edit;)V

    .line 149
    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/diff/HashedSequenceComparator;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/Edit;Lorg/eclipse/jgit/diff/MyersDiff$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .parameter "x5"

    .prologue
    .line 112
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>;"
    invoke-direct/range {p0 .. p5}, Lorg/eclipse/jgit/diff/MyersDiff;-><init>(Lorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/diff/HashedSequenceComparator;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/Edit;)V

    return-void
.end method

.method private calculateEdits(Lorg/eclipse/jgit/diff/Edit;)V
    .locals 5
    .parameter "r"

    .prologue
    .line 160
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff;->middle:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget v1, p1, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    iget v2, p1, Lorg/eclipse/jgit/diff/Edit;->endA:I

    iget v3, p1, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    iget v4, p1, Lorg/eclipse/jgit/diff/Edit;->endB:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->initialize(IIII)V

    .line 161
    iget-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff;->middle:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget v0, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->beginA:I

    iget-object v1, p0, Lorg/eclipse/jgit/diff/MyersDiff;->middle:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget v1, v1, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->endA:I

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff;->middle:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget v0, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->beginB:I

    iget-object v1, p0, Lorg/eclipse/jgit/diff/MyersDiff;->middle:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget v1, v1, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->endB:I

    if-lt v0, v1, :cond_0

    .line 167
    :goto_0
    return-void

    .line 165
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff;->middle:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget v0, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->beginA:I

    iget-object v1, p0, Lorg/eclipse/jgit/diff/MyersDiff;->middle:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget v1, v1, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->endA:I

    iget-object v2, p0, Lorg/eclipse/jgit/diff/MyersDiff;->middle:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget v2, v2, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->beginB:I

    iget-object v3, p0, Lorg/eclipse/jgit/diff/MyersDiff;->middle:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget v3, v3, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->endB:I

    invoke-virtual {p0, v0, v1, v2, v3}, Lorg/eclipse/jgit/diff/MyersDiff;->calculateEdits(IIII)V

    goto :goto_0
.end method

.method public static main([Ljava/lang/String;)V
    .locals 7
    .parameter "args"

    .prologue
    const/4 v6, 0x1

    .line 545
    array-length v4, p0

    const/4 v5, 0x2

    if-eq v4, v5, :cond_0

    .line 546
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->need2Arguments:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 547
    invoke-static {v6}, Ljava/lang/System;->exit(I)V

    .line 550
    :cond_0
    :try_start_0
    new-instance v0, Lorg/eclipse/jgit/diff/RawText;

    new-instance v4, Ljava/io/File;

    const/4 v5, 0x0

    aget-object v5, p0, v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v4}, Lorg/eclipse/jgit/diff/RawText;-><init>(Ljava/io/File;)V

    .line 551
    .local v0, a:Lorg/eclipse/jgit/diff/RawText;
    new-instance v1, Lorg/eclipse/jgit/diff/RawText;

    new-instance v4, Ljava/io/File;

    const/4 v5, 0x1

    aget-object v5, p0, v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v4}, Lorg/eclipse/jgit/diff/RawText;-><init>(Ljava/io/File;)V

    .line 552
    .local v1, b:Lorg/eclipse/jgit/diff/RawText;
    sget-object v4, Lorg/eclipse/jgit/diff/MyersDiff;->INSTANCE:Lorg/eclipse/jgit/diff/DiffAlgorithm;

    sget-object v5, Lorg/eclipse/jgit/diff/RawTextComparator;->DEFAULT:Lorg/eclipse/jgit/diff/RawTextComparator;

    invoke-virtual {v4, v5, v0, v1}, Lorg/eclipse/jgit/diff/DiffAlgorithm;->diff(Lorg/eclipse/jgit/diff/SequenceComparator;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;)Lorg/eclipse/jgit/diff/EditList;

    move-result-object v3

    .line 553
    .local v3, r:Lorg/eclipse/jgit/diff/EditList;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v3}, Lorg/eclipse/jgit/diff/EditList;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 557
    .end local v0           #a:Lorg/eclipse/jgit/diff/RawText;
    .end local v1           #b:Lorg/eclipse/jgit/diff/RawText;
    .end local v3           #r:Lorg/eclipse/jgit/diff/EditList;
    :goto_0
    return-void

    .line 554
    :catch_0
    move-exception v2

    .line 555
    .local v2, e:Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method protected calculateEdits(IIII)V
    .locals 5
    .parameter "beginA"
    .parameter "endA"
    .parameter "beginB"
    .parameter "endB"

    .prologue
    .line 188
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>;"
    iget-object v3, p0, Lorg/eclipse/jgit/diff/MyersDiff;->middle:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    invoke-virtual {v3, p1, p2, p3, p4}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->calculate(IIII)Lorg/eclipse/jgit/diff/Edit;

    move-result-object v0

    .line 190
    .local v0, edit:Lorg/eclipse/jgit/diff/Edit;
    iget v3, v0, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    if-lt p1, v3, :cond_0

    iget v3, v0, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    if-ge p3, v3, :cond_1

    .line 191
    :cond_0
    iget v3, v0, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    iget v4, v0, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    sub-int v1, v3, v4

    .line 192
    .local v1, k:I
    iget-object v3, p0, Lorg/eclipse/jgit/diff/MyersDiff;->middle:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget-object v3, v3, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->backward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;

    iget v4, v0, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    invoke-virtual {v3, v1, v4}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->snake(II)I

    move-result v2

    .line 193
    .local v2, x:I
    add-int v3, v1, v2

    invoke-virtual {p0, p1, v2, p3, v3}, Lorg/eclipse/jgit/diff/MyersDiff;->calculateEdits(IIII)V

    .line 196
    .end local v1           #k:I
    .end local v2           #x:I
    :cond_1
    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/Edit;->getType()Lorg/eclipse/jgit/diff/Edit$Type;

    move-result-object v3

    sget-object v4, Lorg/eclipse/jgit/diff/Edit$Type;->EMPTY:Lorg/eclipse/jgit/diff/Edit$Type;

    if-eq v3, v4, :cond_2

    .line 197
    iget-object v3, p0, Lorg/eclipse/jgit/diff/MyersDiff;->edits:Lorg/eclipse/jgit/diff/EditList;

    iget-object v4, p0, Lorg/eclipse/jgit/diff/MyersDiff;->edits:Lorg/eclipse/jgit/diff/EditList;

    invoke-virtual {v4}, Lorg/eclipse/jgit/diff/EditList;->size()I

    move-result v4

    invoke-virtual {v3, v4, v0}, Lorg/eclipse/jgit/diff/EditList;->add(ILjava/lang/Object;)V

    .line 200
    :cond_2
    iget v3, v0, Lorg/eclipse/jgit/diff/Edit;->endA:I

    if-gt p2, v3, :cond_3

    iget v3, v0, Lorg/eclipse/jgit/diff/Edit;->endB:I

    if-le p4, v3, :cond_4

    .line 201
    :cond_3
    iget v3, v0, Lorg/eclipse/jgit/diff/Edit;->endB:I

    iget v4, v0, Lorg/eclipse/jgit/diff/Edit;->endA:I

    sub-int v1, v3, v4

    .line 202
    .restart local v1       #k:I
    iget-object v3, p0, Lorg/eclipse/jgit/diff/MyersDiff;->middle:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    iget-object v3, v3, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->forward:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;

    iget v4, v0, Lorg/eclipse/jgit/diff/Edit;->endA:I

    invoke-virtual {v3, v1, v4}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->snake(II)I

    move-result v2

    .line 203
    .restart local v2       #x:I
    add-int v3, v1, v2

    invoke-virtual {p0, v2, p2, v3, p4}, Lorg/eclipse/jgit/diff/MyersDiff;->calculateEdits(IIII)V

    .line 205
    .end local v1           #k:I
    .end local v2           #x:I
    :cond_4
    return-void
.end method
