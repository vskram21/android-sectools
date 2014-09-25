.class final Lorg/eclipse/jgit/diff/RawTextComparator$1;
.super Lorg/eclipse/jgit/diff/RawTextComparator;
.source "RawTextComparator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/diff/RawTextComparator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0}, Lorg/eclipse/jgit/diff/RawTextComparator;-><init>()V

    return-void
.end method


# virtual methods
.method public equals(Lorg/eclipse/jgit/diff/RawText;ILorg/eclipse/jgit/diff/RawText;I)Z
    .locals 9
    .parameter "a"
    .parameter "ai"
    .parameter "b"
    .parameter "bi"

    .prologue
    const/4 v6, 0x0

    .line 59
    add-int/lit8 p2, p2, 0x1

    .line 60
    add-int/lit8 p4, p4, 0x1

    .line 62
    iget-object v7, p1, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    invoke-virtual {v7, p2}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v1

    .line 63
    .local v1, as:I
    iget-object v7, p3, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    invoke-virtual {v7, p4}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v4

    .line 64
    .local v4, bs:I
    iget-object v7, p1, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    add-int/lit8 v8, p2, 0x1

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v0

    .line 65
    .local v0, ae:I
    iget-object v7, p3, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    add-int/lit8 v8, p4, 0x1

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v3

    .line 67
    .local v3, be:I
    sub-int v7, v0, v1

    sub-int v8, v3, v4

    if-eq v7, v8, :cond_0

    .line 74
    :goto_0
    return v6

    :cond_0
    move v5, v4

    .end local v4           #bs:I
    .local v5, bs:I
    move v2, v1

    .line 70
    .end local v1           #as:I
    .local v2, as:I
    if-ge v2, v0, :cond_1

    .line 71
    iget-object v7, p1, Lorg/eclipse/jgit/diff/RawText;->content:[B

    add-int/lit8 v1, v2, 0x1

    .end local v2           #as:I
    .restart local v1       #as:I
    aget-byte v7, v7, v2

    iget-object v8, p3, Lorg/eclipse/jgit/diff/RawText;->content:[B

    add-int/lit8 v4, v5, 0x1

    .end local v5           #bs:I
    .restart local v4       #bs:I
    aget-byte v8, v8, v5

    if-eq v7, v8, :cond_0

    goto :goto_0

    .line 74
    .end local v1           #as:I
    .end local v4           #bs:I
    .restart local v2       #as:I
    .restart local v5       #bs:I
    :cond_1
    const/4 v6, 0x1

    move v4, v5

    .end local v5           #bs:I
    .restart local v4       #bs:I
    move v1, v2

    .end local v2           #as:I
    .restart local v1       #as:I
    goto :goto_0
.end method

.method public bridge synthetic equals(Lorg/eclipse/jgit/diff/Sequence;ILorg/eclipse/jgit/diff/Sequence;I)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 56
    check-cast p1, Lorg/eclipse/jgit/diff/RawText;

    .end local p1
    check-cast p3, Lorg/eclipse/jgit/diff/RawText;

    .end local p3
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/eclipse/jgit/diff/RawTextComparator$1;->equals(Lorg/eclipse/jgit/diff/RawText;ILorg/eclipse/jgit/diff/RawText;I)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic hash(Lorg/eclipse/jgit/diff/Sequence;I)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 56
    check-cast p1, Lorg/eclipse/jgit/diff/RawText;

    .end local p1
    invoke-super {p0, p1, p2}, Lorg/eclipse/jgit/diff/RawTextComparator;->hash(Lorg/eclipse/jgit/diff/RawText;I)I

    move-result v0

    return v0
.end method

.method protected hashRegion([BII)I
    .locals 3
    .parameter "raw"
    .parameter "ptr"
    .parameter "end"

    .prologue
    .line 79
    const/16 v0, 0x1505

    .line 80
    .local v0, hash:I
    :goto_0
    if-ge p2, p3, :cond_0

    .line 81
    shl-int/lit8 v1, v0, 0x5

    add-int/2addr v1, v0

    aget-byte v2, p1, p2

    and-int/lit16 v2, v2, 0xff

    add-int v0, v1, v2

    .line 80
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 82
    :cond_0
    return v0
.end method

.method public bridge synthetic reduceCommonStartEnd(Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/Edit;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 56
    check-cast p1, Lorg/eclipse/jgit/diff/RawText;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/diff/RawText;

    .end local p2
    invoke-super {p0, p1, p2, p3}, Lorg/eclipse/jgit/diff/RawTextComparator;->reduceCommonStartEnd(Lorg/eclipse/jgit/diff/RawText;Lorg/eclipse/jgit/diff/RawText;Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/Edit;

    move-result-object v0

    return-object v0
.end method
