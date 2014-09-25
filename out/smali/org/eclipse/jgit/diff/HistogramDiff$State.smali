.class Lorg/eclipse/jgit/diff/HistogramDiff$State;
.super Ljava/lang/Object;
.source "HistogramDiff.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/diff/HistogramDiff;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Lorg/eclipse/jgit/diff/Sequence;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final a:Lorg/eclipse/jgit/diff/HashedSequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;"
        }
    .end annotation
.end field

.field private final b:Lorg/eclipse/jgit/diff/HashedSequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;"
        }
    .end annotation
.end field

.field private final cmp:Lorg/eclipse/jgit/diff/HashedSequenceComparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/diff/HashedSequenceComparator",
            "<TS;>;"
        }
    .end annotation
.end field

.field final edits:Lorg/eclipse/jgit/diff/EditList;

.field final synthetic this$0:Lorg/eclipse/jgit/diff/HistogramDiff;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/diff/HistogramDiff;Lorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/diff/HashedSequenceComparator;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/HashedSequence;)V
    .locals 0
    .parameter
    .parameter "edits"
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/diff/EditList;",
            "Lorg/eclipse/jgit/diff/HashedSequenceComparator",
            "<TS;>;",
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;",
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;)V"
        }
    .end annotation

    .prologue
    .line 147
    .local p0, this:Lorg/eclipse/jgit/diff/HistogramDiff$State;,"Lorg/eclipse/jgit/diff/HistogramDiff$State<TS;>;"
    .local p3, cmp:Lorg/eclipse/jgit/diff/HashedSequenceComparator;,"Lorg/eclipse/jgit/diff/HashedSequenceComparator<TS;>;"
    .local p4, a:Lorg/eclipse/jgit/diff/HashedSequence;,"Lorg/eclipse/jgit/diff/HashedSequence<TS;>;"
    .local p5, b:Lorg/eclipse/jgit/diff/HashedSequence;,"Lorg/eclipse/jgit/diff/HashedSequence<TS;>;"
    iput-object p1, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->this$0:Lorg/eclipse/jgit/diff/HistogramDiff;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 148
    iput-object p3, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->cmp:Lorg/eclipse/jgit/diff/HashedSequenceComparator;

    .line 149
    iput-object p4, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->a:Lorg/eclipse/jgit/diff/HashedSequence;

    .line 150
    iput-object p5, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->b:Lorg/eclipse/jgit/diff/HashedSequence;

    .line 151
    iput-object p2, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->edits:Lorg/eclipse/jgit/diff/EditList;

    .line 152
    return-void
.end method

.method private diff(Lorg/eclipse/jgit/diff/Edit;)V
    .locals 3
    .parameter "r"

    .prologue
    .local p0, this:Lorg/eclipse/jgit/diff/HistogramDiff$State;,"Lorg/eclipse/jgit/diff/HistogramDiff$State<TS;>;"
    const/4 v2, 0x1

    .line 188
    sget-object v0, Lorg/eclipse/jgit/diff/HistogramDiff$1;->$SwitchMap$org$eclipse$jgit$diff$Edit$Type:[I

    invoke-virtual {p1}, Lorg/eclipse/jgit/diff/Edit;->getType()Lorg/eclipse/jgit/diff/Edit$Type;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/Edit$Type;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 203
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 191
    :pswitch_0
    iget-object v0, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->edits:Lorg/eclipse/jgit/diff/EditList;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/diff/EditList;->add(Ljava/lang/Object;)Z

    .line 205
    :goto_0
    return-void

    .line 195
    :pswitch_1
    invoke-virtual {p1}, Lorg/eclipse/jgit/diff/Edit;->getLengthA()I

    move-result v0

    if-ne v0, v2, :cond_0

    invoke-virtual {p1}, Lorg/eclipse/jgit/diff/Edit;->getLengthB()I

    move-result v0

    if-ne v0, v2, :cond_0

    .line 196
    iget-object v0, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->edits:Lorg/eclipse/jgit/diff/EditList;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/diff/EditList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 198
    :cond_0
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/diff/HistogramDiff$State;->diffReplace(Lorg/eclipse/jgit/diff/Edit;)V

    goto :goto_0

    .line 188
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private subcmp()Lorg/eclipse/jgit/diff/SubsequenceComparator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/eclipse/jgit/diff/SubsequenceComparator",
            "<",
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;>;"
        }
    .end annotation

    .prologue
    .line 208
    .local p0, this:Lorg/eclipse/jgit/diff/HistogramDiff$State;,"Lorg/eclipse/jgit/diff/HistogramDiff$State<TS;>;"
    new-instance v0, Lorg/eclipse/jgit/diff/SubsequenceComparator;

    iget-object v1, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->cmp:Lorg/eclipse/jgit/diff/HashedSequenceComparator;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/diff/SubsequenceComparator;-><init>(Lorg/eclipse/jgit/diff/SequenceComparator;)V

    return-object v0
.end method


# virtual methods
.method diffReplace(Lorg/eclipse/jgit/diff/Edit;)V
    .locals 11
    .parameter "r"

    .prologue
    .line 155
    .local p0, this:Lorg/eclipse/jgit/diff/HistogramDiff$State;,"Lorg/eclipse/jgit/diff/HistogramDiff$State<TS;>;"
    new-instance v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;

    iget-object v1, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->this$0:Lorg/eclipse/jgit/diff/HistogramDiff;

    #getter for: Lorg/eclipse/jgit/diff/HistogramDiff;->maxChainLength:I
    invoke-static {v1}, Lorg/eclipse/jgit/diff/HistogramDiff;->access$000(Lorg/eclipse/jgit/diff/HistogramDiff;)I

    move-result v1

    iget-object v2, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->cmp:Lorg/eclipse/jgit/diff/HashedSequenceComparator;

    iget-object v3, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->a:Lorg/eclipse/jgit/diff/HashedSequence;

    iget-object v4, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->b:Lorg/eclipse/jgit/diff/HashedSequence;

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/diff/HistogramDiffIndex;-><init>(ILorg/eclipse/jgit/diff/HashedSequenceComparator;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/Edit;)V

    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->findLongestCommonSequence()Lorg/eclipse/jgit/diff/Edit;

    move-result-object v9

    .line 157
    .local v9, lcs:Lorg/eclipse/jgit/diff/Edit;
    if-eqz v9, :cond_1

    .line 160
    invoke-virtual {v9}, Lorg/eclipse/jgit/diff/Edit;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 164
    iget-object v1, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->edits:Lorg/eclipse/jgit/diff/EditList;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/diff/EditList;->add(Ljava/lang/Object;)Z

    .line 185
    :goto_0
    return-void

    .line 166
    :cond_0
    invoke-virtual {p1, v9}, Lorg/eclipse/jgit/diff/Edit;->before(Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/Edit;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/eclipse/jgit/diff/HistogramDiff$State;->diff(Lorg/eclipse/jgit/diff/Edit;)V

    .line 167
    invoke-virtual {p1, v9}, Lorg/eclipse/jgit/diff/Edit;->after(Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/Edit;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/eclipse/jgit/diff/HistogramDiff$State;->diff(Lorg/eclipse/jgit/diff/Edit;)V

    goto :goto_0

    .line 170
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->this$0:Lorg/eclipse/jgit/diff/HistogramDiff;

    #getter for: Lorg/eclipse/jgit/diff/HistogramDiff;->fallback:Lorg/eclipse/jgit/diff/DiffAlgorithm;
    invoke-static {v1}, Lorg/eclipse/jgit/diff/HistogramDiff;->access$100(Lorg/eclipse/jgit/diff/HistogramDiff;)Lorg/eclipse/jgit/diff/DiffAlgorithm;

    move-result-object v1

    instance-of v1, v1, Lorg/eclipse/jgit/diff/LowLevelDiffAlgorithm;

    if-eqz v1, :cond_2

    .line 171
    iget-object v1, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->this$0:Lorg/eclipse/jgit/diff/HistogramDiff;

    #getter for: Lorg/eclipse/jgit/diff/HistogramDiff;->fallback:Lorg/eclipse/jgit/diff/DiffAlgorithm;
    invoke-static {v1}, Lorg/eclipse/jgit/diff/HistogramDiff;->access$100(Lorg/eclipse/jgit/diff/HistogramDiff;)Lorg/eclipse/jgit/diff/DiffAlgorithm;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/LowLevelDiffAlgorithm;

    .line 172
    .local v0, fb:Lorg/eclipse/jgit/diff/LowLevelDiffAlgorithm;
    iget-object v1, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->edits:Lorg/eclipse/jgit/diff/EditList;

    iget-object v2, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->cmp:Lorg/eclipse/jgit/diff/HashedSequenceComparator;

    iget-object v3, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->a:Lorg/eclipse/jgit/diff/HashedSequence;

    iget-object v4, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->b:Lorg/eclipse/jgit/diff/HashedSequence;

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/diff/LowLevelDiffAlgorithm;->diffNonCommon(Lorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/diff/HashedSequenceComparator;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/Edit;)V

    goto :goto_0

    .line 174
    .end local v0           #fb:Lorg/eclipse/jgit/diff/LowLevelDiffAlgorithm;
    :cond_2
    iget-object v1, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->this$0:Lorg/eclipse/jgit/diff/HistogramDiff;

    #getter for: Lorg/eclipse/jgit/diff/HistogramDiff;->fallback:Lorg/eclipse/jgit/diff/DiffAlgorithm;
    invoke-static {v1}, Lorg/eclipse/jgit/diff/HistogramDiff;->access$100(Lorg/eclipse/jgit/diff/HistogramDiff;)Lorg/eclipse/jgit/diff/DiffAlgorithm;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 175
    invoke-direct {p0}, Lorg/eclipse/jgit/diff/HistogramDiff$State;->subcmp()Lorg/eclipse/jgit/diff/SubsequenceComparator;

    move-result-object v8

    .line 176
    .local v8, cs:Lorg/eclipse/jgit/diff/SubsequenceComparator;,"Lorg/eclipse/jgit/diff/SubsequenceComparator<Lorg/eclipse/jgit/diff/HashedSequence<TS;>;>;"
    iget-object v1, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->a:Lorg/eclipse/jgit/diff/HashedSequence;

    invoke-static {v1, p1}, Lorg/eclipse/jgit/diff/Subsequence;->a(Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/Subsequence;

    move-result-object v6

    .line 177
    .local v6, as:Lorg/eclipse/jgit/diff/Subsequence;,"Lorg/eclipse/jgit/diff/Subsequence<Lorg/eclipse/jgit/diff/HashedSequence<TS;>;>;"
    iget-object v1, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->b:Lorg/eclipse/jgit/diff/HashedSequence;

    invoke-static {v1, p1}, Lorg/eclipse/jgit/diff/Subsequence;->b(Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/Subsequence;

    move-result-object v7

    .line 179
    .local v7, bs:Lorg/eclipse/jgit/diff/Subsequence;,"Lorg/eclipse/jgit/diff/Subsequence<Lorg/eclipse/jgit/diff/HashedSequence<TS;>;>;"
    iget-object v1, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->this$0:Lorg/eclipse/jgit/diff/HistogramDiff;

    #getter for: Lorg/eclipse/jgit/diff/HistogramDiff;->fallback:Lorg/eclipse/jgit/diff/DiffAlgorithm;
    invoke-static {v1}, Lorg/eclipse/jgit/diff/HistogramDiff;->access$100(Lorg/eclipse/jgit/diff/HistogramDiff;)Lorg/eclipse/jgit/diff/DiffAlgorithm;

    move-result-object v1

    invoke-virtual {v1, v8, v6, v7}, Lorg/eclipse/jgit/diff/DiffAlgorithm;->diffNonCommon(Lorg/eclipse/jgit/diff/SequenceComparator;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;)Lorg/eclipse/jgit/diff/EditList;

    move-result-object v10

    .line 180
    .local v10, res:Lorg/eclipse/jgit/diff/EditList;
    iget-object v1, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->edits:Lorg/eclipse/jgit/diff/EditList;

    invoke-static {v10, v6, v7}, Lorg/eclipse/jgit/diff/Subsequence;->toBase(Lorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/diff/Subsequence;Lorg/eclipse/jgit/diff/Subsequence;)Lorg/eclipse/jgit/diff/EditList;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/diff/EditList;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 183
    .end local v6           #as:Lorg/eclipse/jgit/diff/Subsequence;,"Lorg/eclipse/jgit/diff/Subsequence<Lorg/eclipse/jgit/diff/HashedSequence<TS;>;>;"
    .end local v7           #bs:Lorg/eclipse/jgit/diff/Subsequence;,"Lorg/eclipse/jgit/diff/Subsequence<Lorg/eclipse/jgit/diff/HashedSequence<TS;>;>;"
    .end local v8           #cs:Lorg/eclipse/jgit/diff/SubsequenceComparator;,"Lorg/eclipse/jgit/diff/SubsequenceComparator<Lorg/eclipse/jgit/diff/HashedSequence<TS;>;>;"
    .end local v10           #res:Lorg/eclipse/jgit/diff/EditList;
    :cond_3
    iget-object v1, p0, Lorg/eclipse/jgit/diff/HistogramDiff$State;->edits:Lorg/eclipse/jgit/diff/EditList;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/diff/EditList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method
