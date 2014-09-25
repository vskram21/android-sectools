.class public final Lorg/eclipse/jgit/diff/Subsequence;
.super Lorg/eclipse/jgit/diff/Sequence;
.source "Subsequence.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Lorg/eclipse/jgit/diff/Sequence;",
        ">",
        "Lorg/eclipse/jgit/diff/Sequence;"
    }
.end annotation


# instance fields
.field final base:Lorg/eclipse/jgit/diff/Sequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TS;"
        }
    .end annotation
.end field

.field final begin:I

.field private final size:I


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/diff/Sequence;II)V
    .locals 1
    .parameter
    .parameter "begin"
    .parameter "end"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;II)V"
        }
    .end annotation

    .prologue
    .line 153
    .local p0, this:Lorg/eclipse/jgit/diff/Subsequence;,"Lorg/eclipse/jgit/diff/Subsequence<TS;>;"
    .local p1, base:Lorg/eclipse/jgit/diff/Sequence;,"TS;"
    invoke-direct {p0}, Lorg/eclipse/jgit/diff/Sequence;-><init>()V

    .line 154
    iput-object p1, p0, Lorg/eclipse/jgit/diff/Subsequence;->base:Lorg/eclipse/jgit/diff/Sequence;

    .line 155
    iput p2, p0, Lorg/eclipse/jgit/diff/Subsequence;->begin:I

    .line 156
    sub-int v0, p3, p2

    iput v0, p0, Lorg/eclipse/jgit/diff/Subsequence;->size:I

    .line 157
    return-void
.end method

.method public static a(Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/Subsequence;
    .locals 3
    .parameter
    .parameter "region"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Lorg/eclipse/jgit/diff/Sequence;",
            ">(TS;",
            "Lorg/eclipse/jgit/diff/Edit;",
            ")",
            "Lorg/eclipse/jgit/diff/Subsequence",
            "<TS;>;"
        }
    .end annotation

    .prologue
    .line 69
    .local p0, a:Lorg/eclipse/jgit/diff/Sequence;,"TS;"
    new-instance v0, Lorg/eclipse/jgit/diff/Subsequence;

    iget v1, p1, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    iget v2, p1, Lorg/eclipse/jgit/diff/Edit;->endA:I

    invoke-direct {v0, p0, v1, v2}, Lorg/eclipse/jgit/diff/Subsequence;-><init>(Lorg/eclipse/jgit/diff/Sequence;II)V

    return-object v0
.end method

.method public static b(Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/Subsequence;
    .locals 3
    .parameter
    .parameter "region"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Lorg/eclipse/jgit/diff/Sequence;",
            ">(TS;",
            "Lorg/eclipse/jgit/diff/Edit;",
            ")",
            "Lorg/eclipse/jgit/diff/Subsequence",
            "<TS;>;"
        }
    .end annotation

    .prologue
    .line 84
    .local p0, b:Lorg/eclipse/jgit/diff/Sequence;,"TS;"
    new-instance v0, Lorg/eclipse/jgit/diff/Subsequence;

    iget v1, p1, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    iget v2, p1, Lorg/eclipse/jgit/diff/Edit;->endB:I

    invoke-direct {v0, p0, v1, v2}, Lorg/eclipse/jgit/diff/Subsequence;-><init>(Lorg/eclipse/jgit/diff/Sequence;II)V

    return-object v0
.end method

.method public static toBase(Lorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/diff/Subsequence;Lorg/eclipse/jgit/diff/Subsequence;)Lorg/eclipse/jgit/diff/EditList;
    .locals 3
    .parameter "edits"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Lorg/eclipse/jgit/diff/Sequence;",
            ">(",
            "Lorg/eclipse/jgit/diff/EditList;",
            "Lorg/eclipse/jgit/diff/Subsequence",
            "<TS;>;",
            "Lorg/eclipse/jgit/diff/Subsequence",
            "<TS;>;)",
            "Lorg/eclipse/jgit/diff/EditList;"
        }
    .end annotation

    .prologue
    .line 127
    .local p1, a:Lorg/eclipse/jgit/diff/Subsequence;,"Lorg/eclipse/jgit/diff/Subsequence<TS;>;"
    .local p2, b:Lorg/eclipse/jgit/diff/Subsequence;,"Lorg/eclipse/jgit/diff/Subsequence<TS;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/EditList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/Edit;

    .line 128
    .local v0, e:Lorg/eclipse/jgit/diff/Edit;
    invoke-static {v0, p1, p2}, Lorg/eclipse/jgit/diff/Subsequence;->toBase(Lorg/eclipse/jgit/diff/Edit;Lorg/eclipse/jgit/diff/Subsequence;Lorg/eclipse/jgit/diff/Subsequence;)V

    goto :goto_0

    .line 129
    .end local v0           #e:Lorg/eclipse/jgit/diff/Edit;
    :cond_0
    return-object p0
.end method

.method public static toBase(Lorg/eclipse/jgit/diff/Edit;Lorg/eclipse/jgit/diff/Subsequence;Lorg/eclipse/jgit/diff/Subsequence;)V
    .locals 2
    .parameter "e"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Lorg/eclipse/jgit/diff/Sequence;",
            ">(",
            "Lorg/eclipse/jgit/diff/Edit;",
            "Lorg/eclipse/jgit/diff/Subsequence",
            "<TS;>;",
            "Lorg/eclipse/jgit/diff/Subsequence",
            "<TS;>;)V"
        }
    .end annotation

    .prologue
    .line 103
    .local p1, a:Lorg/eclipse/jgit/diff/Subsequence;,"Lorg/eclipse/jgit/diff/Subsequence<TS;>;"
    .local p2, b:Lorg/eclipse/jgit/diff/Subsequence;,"Lorg/eclipse/jgit/diff/Subsequence<TS;>;"
    iget v0, p0, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    iget v1, p1, Lorg/eclipse/jgit/diff/Subsequence;->begin:I

    add-int/2addr v0, v1

    iput v0, p0, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    .line 104
    iget v0, p0, Lorg/eclipse/jgit/diff/Edit;->endA:I

    iget v1, p1, Lorg/eclipse/jgit/diff/Subsequence;->begin:I

    add-int/2addr v0, v1

    iput v0, p0, Lorg/eclipse/jgit/diff/Edit;->endA:I

    .line 106
    iget v0, p0, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    iget v1, p2, Lorg/eclipse/jgit/diff/Subsequence;->begin:I

    add-int/2addr v0, v1

    iput v0, p0, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    .line 107
    iget v0, p0, Lorg/eclipse/jgit/diff/Edit;->endB:I

    iget v1, p2, Lorg/eclipse/jgit/diff/Subsequence;->begin:I

    add-int/2addr v0, v1

    iput v0, p0, Lorg/eclipse/jgit/diff/Edit;->endB:I

    .line 108
    return-void
.end method


# virtual methods
.method public size()I
    .locals 1

    .prologue
    .line 161
    .local p0, this:Lorg/eclipse/jgit/diff/Subsequence;,"Lorg/eclipse/jgit/diff/Subsequence<TS;>;"
    iget v0, p0, Lorg/eclipse/jgit/diff/Subsequence;->size:I

    return v0
.end method
