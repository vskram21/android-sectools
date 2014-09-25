.class public abstract Lorg/eclipse/jgit/diff/DiffAlgorithm;
.super Ljava/lang/Object;
.source "DiffAlgorithm.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/diff/DiffAlgorithm$1;,
        Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    return-void
.end method

.method private static coverEdit(Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;)Lorg/eclipse/jgit/diff/Edit;
    .locals 4
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Lorg/eclipse/jgit/diff/Sequence;",
            ">(TS;TS;)",
            "Lorg/eclipse/jgit/diff/Edit;"
        }
    .end annotation

    .prologue
    .local p0, a:Lorg/eclipse/jgit/diff/Sequence;,"TS;"
    .local p1, b:Lorg/eclipse/jgit/diff/Sequence;,"TS;"
    const/4 v3, 0x0

    .line 152
    new-instance v0, Lorg/eclipse/jgit/diff/Edit;

    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/Sequence;->size()I

    move-result v1

    invoke-virtual {p1}, Lorg/eclipse/jgit/diff/Sequence;->size()I

    move-result v2

    invoke-direct {v0, v3, v1, v3, v2}, Lorg/eclipse/jgit/diff/Edit;-><init>(IIII)V

    return-object v0
.end method

.method public static getAlgorithm(Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;)Lorg/eclipse/jgit/diff/DiffAlgorithm;
    .locals 2
    .parameter "alg"

    .prologue
    .line 78
    sget-object v0, Lorg/eclipse/jgit/diff/DiffAlgorithm$1;->$SwitchMap$org$eclipse$jgit$diff$DiffAlgorithm$SupportedAlgorithm:[I

    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 84
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 80
    :pswitch_0
    sget-object v0, Lorg/eclipse/jgit/diff/MyersDiff;->INSTANCE:Lorg/eclipse/jgit/diff/DiffAlgorithm;

    .line 82
    :goto_0
    return-object v0

    :pswitch_1
    new-instance v0, Lorg/eclipse/jgit/diff/HistogramDiff;

    invoke-direct {v0}, Lorg/eclipse/jgit/diff/HistogramDiff;-><init>()V

    goto :goto_0

    .line 78
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public diff(Lorg/eclipse/jgit/diff/SequenceComparator;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;)Lorg/eclipse/jgit/diff/EditList;
    .locals 9
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Lorg/eclipse/jgit/diff/Sequence;",
            ">(",
            "Lorg/eclipse/jgit/diff/SequenceComparator",
            "<-TS;>;TS;TS;)",
            "Lorg/eclipse/jgit/diff/EditList;"
        }
    .end annotation

    .prologue
    .local p1, cmp:Lorg/eclipse/jgit/diff/SequenceComparator;,"Lorg/eclipse/jgit/diff/SequenceComparator<-TS;>;"
    .local p2, a:Lorg/eclipse/jgit/diff/Sequence;,"TS;"
    .local p3, b:Lorg/eclipse/jgit/diff/Sequence;,"TS;"
    const/4 v8, 0x1

    .line 109
    invoke-static {p2, p3}, Lorg/eclipse/jgit/diff/DiffAlgorithm;->coverEdit(Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;)Lorg/eclipse/jgit/diff/Edit;

    move-result-object v6

    invoke-virtual {p1, p2, p3, v6}, Lorg/eclipse/jgit/diff/SequenceComparator;->reduceCommonStartEnd(Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/Edit;

    move-result-object v5

    .line 111
    .local v5, region:Lorg/eclipse/jgit/diff/Edit;
    sget-object v6, Lorg/eclipse/jgit/diff/DiffAlgorithm$1;->$SwitchMap$org$eclipse$jgit$diff$Edit$Type:[I

    invoke-virtual {v5}, Lorg/eclipse/jgit/diff/Edit;->getType()Lorg/eclipse/jgit/diff/Edit$Type;

    move-result-object v7

    invoke-virtual {v7}, Lorg/eclipse/jgit/diff/Edit$Type;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    .line 147
    new-instance v6, Ljava/lang/IllegalStateException;

    invoke-direct {v6}, Ljava/lang/IllegalStateException;-><init>()V

    throw v6

    .line 114
    :pswitch_0
    invoke-static {v5}, Lorg/eclipse/jgit/diff/EditList;->singleton(Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/EditList;

    move-result-object v3

    .line 144
    :cond_0
    :goto_0
    return-object v3

    .line 117
    :pswitch_1
    invoke-virtual {v5}, Lorg/eclipse/jgit/diff/Edit;->getLengthA()I

    move-result v6

    if-ne v6, v8, :cond_1

    invoke-virtual {v5}, Lorg/eclipse/jgit/diff/Edit;->getLengthB()I

    move-result v6

    if-ne v6, v8, :cond_1

    .line 118
    invoke-static {v5}, Lorg/eclipse/jgit/diff/EditList;->singleton(Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/EditList;

    move-result-object v3

    goto :goto_0

    .line 120
    :cond_1
    new-instance v2, Lorg/eclipse/jgit/diff/SubsequenceComparator;

    invoke-direct {v2, p1}, Lorg/eclipse/jgit/diff/SubsequenceComparator;-><init>(Lorg/eclipse/jgit/diff/SequenceComparator;)V

    .line 121
    .local v2, cs:Lorg/eclipse/jgit/diff/SubsequenceComparator;,"Lorg/eclipse/jgit/diff/SubsequenceComparator<TS;>;"
    invoke-static {p2, v5}, Lorg/eclipse/jgit/diff/Subsequence;->a(Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/Subsequence;

    move-result-object v0

    .line 122
    .local v0, as:Lorg/eclipse/jgit/diff/Subsequence;,"Lorg/eclipse/jgit/diff/Subsequence<TS;>;"
    invoke-static {p3, v5}, Lorg/eclipse/jgit/diff/Subsequence;->b(Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/Subsequence;

    move-result-object v1

    .line 123
    .local v1, bs:Lorg/eclipse/jgit/diff/Subsequence;,"Lorg/eclipse/jgit/diff/Subsequence<TS;>;"
    invoke-virtual {p0, v2, v0, v1}, Lorg/eclipse/jgit/diff/DiffAlgorithm;->diffNonCommon(Lorg/eclipse/jgit/diff/SequenceComparator;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;)Lorg/eclipse/jgit/diff/EditList;

    move-result-object v6

    invoke-static {v6, v0, v1}, Lorg/eclipse/jgit/diff/Subsequence;->toBase(Lorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/diff/Subsequence;Lorg/eclipse/jgit/diff/Subsequence;)Lorg/eclipse/jgit/diff/EditList;

    move-result-object v3

    .line 129
    .local v3, e:Lorg/eclipse/jgit/diff/EditList;
    invoke-virtual {v3}, Lorg/eclipse/jgit/diff/EditList;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v3, v6}, Lorg/eclipse/jgit/diff/EditList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/diff/Edit;

    .line 130
    .local v4, last:Lorg/eclipse/jgit/diff/Edit;
    invoke-virtual {v4}, Lorg/eclipse/jgit/diff/Edit;->getType()Lorg/eclipse/jgit/diff/Edit$Type;

    move-result-object v6

    sget-object v7, Lorg/eclipse/jgit/diff/Edit$Type;->INSERT:Lorg/eclipse/jgit/diff/Edit$Type;

    if-ne v6, v7, :cond_0

    .line 131
    :goto_1
    iget v6, v4, Lorg/eclipse/jgit/diff/Edit;->endB:I

    invoke-virtual {p3}, Lorg/eclipse/jgit/diff/Sequence;->size()I

    move-result v7

    if-ge v6, v7, :cond_0

    iget v6, v4, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    iget v7, v4, Lorg/eclipse/jgit/diff/Edit;->endB:I

    invoke-virtual {p1, p3, v6, p3, v7}, Lorg/eclipse/jgit/diff/SequenceComparator;->equals(Lorg/eclipse/jgit/diff/Sequence;ILorg/eclipse/jgit/diff/Sequence;I)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 133
    iget v6, v4, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v4, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    .line 134
    iget v6, v4, Lorg/eclipse/jgit/diff/Edit;->endA:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v4, Lorg/eclipse/jgit/diff/Edit;->endA:I

    .line 135
    iget v6, v4, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v4, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    .line 136
    iget v6, v4, Lorg/eclipse/jgit/diff/Edit;->endB:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v4, Lorg/eclipse/jgit/diff/Edit;->endB:I

    goto :goto_1

    .line 144
    .end local v0           #as:Lorg/eclipse/jgit/diff/Subsequence;,"Lorg/eclipse/jgit/diff/Subsequence<TS;>;"
    .end local v1           #bs:Lorg/eclipse/jgit/diff/Subsequence;,"Lorg/eclipse/jgit/diff/Subsequence<TS;>;"
    .end local v2           #cs:Lorg/eclipse/jgit/diff/SubsequenceComparator;,"Lorg/eclipse/jgit/diff/SubsequenceComparator<TS;>;"
    .end local v3           #e:Lorg/eclipse/jgit/diff/EditList;
    .end local v4           #last:Lorg/eclipse/jgit/diff/Edit;
    :pswitch_2
    new-instance v3, Lorg/eclipse/jgit/diff/EditList;

    const/4 v6, 0x0

    invoke-direct {v3, v6}, Lorg/eclipse/jgit/diff/EditList;-><init>(I)V

    goto :goto_0

    .line 111
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public abstract diffNonCommon(Lorg/eclipse/jgit/diff/SequenceComparator;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;)Lorg/eclipse/jgit/diff/EditList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Lorg/eclipse/jgit/diff/Sequence;",
            ">(",
            "Lorg/eclipse/jgit/diff/SequenceComparator",
            "<-TS;>;TS;TS;)",
            "Lorg/eclipse/jgit/diff/EditList;"
        }
    .end annotation
.end method
