.class final Lorg/eclipse/jgit/diff/RawTextComparator$5;
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
    .line 208
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

    .line 211
    add-int/lit8 p2, p2, 0x1

    .line 212
    add-int/lit8 p4, p4, 0x1

    .line 214
    iget-object v7, p1, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    invoke-virtual {v7, p2}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v2

    .line 215
    .local v2, as:I
    iget-object v7, p3, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    invoke-virtual {v7, p4}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v5

    .line 216
    .local v5, bs:I
    iget-object v7, p1, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    add-int/lit8 v8, p2, 0x1

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v1

    .line 217
    .local v1, ae:I
    iget-object v7, p3, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    add-int/lit8 v8, p4, 0x1

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v4

    .line 219
    .local v4, be:I
    iget-object v7, p1, Lorg/eclipse/jgit/diff/RawText;->content:[B

    invoke-static {v7, v2, v1}, Lorg/eclipse/jgit/util/RawCharUtil;->trimTrailingWhitespace([BII)I

    move-result v1

    .line 220
    iget-object v7, p3, Lorg/eclipse/jgit/diff/RawText;->content:[B

    invoke-static {v7, v5, v4}, Lorg/eclipse/jgit/util/RawCharUtil;->trimTrailingWhitespace([BII)I

    move-result v4

    .line 222
    :goto_0
    if-ge v2, v1, :cond_4

    if-ge v5, v4, :cond_4

    .line 223
    iget-object v7, p1, Lorg/eclipse/jgit/diff/RawText;->content:[B

    aget-byte v0, v7, v2

    .line 224
    .local v0, ac:B
    iget-object v7, p3, Lorg/eclipse/jgit/diff/RawText;->content:[B

    aget-byte v3, v7, v5

    .line 226
    .local v3, bc:B
    if-eq v0, v3, :cond_1

    .line 239
    .end local v0           #ac:B
    .end local v3           #bc:B
    :cond_0
    :goto_1
    return v6

    .line 229
    .restart local v0       #ac:B
    .restart local v3       #bc:B
    :cond_1
    invoke-static {v0}, Lorg/eclipse/jgit/util/RawCharUtil;->isWhitespace(B)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 230
    iget-object v7, p1, Lorg/eclipse/jgit/diff/RawText;->content:[B

    invoke-static {v7, v2, v1}, Lorg/eclipse/jgit/util/RawCharUtil;->trimLeadingWhitespace([BII)I

    move-result v2

    .line 234
    :goto_2
    invoke-static {v3}, Lorg/eclipse/jgit/util/RawCharUtil;->isWhitespace(B)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 235
    iget-object v7, p3, Lorg/eclipse/jgit/diff/RawText;->content:[B

    invoke-static {v7, v5, v4}, Lorg/eclipse/jgit/util/RawCharUtil;->trimLeadingWhitespace([BII)I

    move-result v5

    goto :goto_0

    .line 232
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 237
    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 239
    .end local v0           #ac:B
    .end local v3           #bc:B
    :cond_4
    if-ne v2, v1, :cond_0

    if-ne v5, v4, :cond_0

    const/4 v6, 0x1

    goto :goto_1
.end method

.method public bridge synthetic equals(Lorg/eclipse/jgit/diff/Sequence;ILorg/eclipse/jgit/diff/Sequence;I)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 208
    check-cast p1, Lorg/eclipse/jgit/diff/RawText;

    .end local p1
    check-cast p3, Lorg/eclipse/jgit/diff/RawText;

    .end local p3
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/eclipse/jgit/diff/RawTextComparator$5;->equals(Lorg/eclipse/jgit/diff/RawText;ILorg/eclipse/jgit/diff/RawText;I)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic hash(Lorg/eclipse/jgit/diff/Sequence;I)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 208
    check-cast p1, Lorg/eclipse/jgit/diff/RawText;

    .end local p1
    invoke-super {p0, p1, p2}, Lorg/eclipse/jgit/diff/RawTextComparator;->hash(Lorg/eclipse/jgit/diff/RawText;I)I

    move-result v0

    return v0
.end method

.method protected hashRegion([BII)I
    .locals 4
    .parameter "raw"
    .parameter "ptr"
    .parameter "end"

    .prologue
    .line 244
    const/16 v1, 0x1505

    .line 245
    .local v1, hash:I
    invoke-static {p1, p2, p3}, Lorg/eclipse/jgit/util/RawCharUtil;->trimTrailingWhitespace([BII)I

    move-result p3

    .line 246
    :goto_0
    if-ge p2, p3, :cond_1

    .line 247
    aget-byte v0, p1, p2

    .line 248
    .local v0, c:B
    shl-int/lit8 v2, v1, 0x5

    add-int/2addr v2, v1

    and-int/lit16 v3, v0, 0xff

    add-int v1, v2, v3

    .line 249
    invoke-static {v0}, Lorg/eclipse/jgit/util/RawCharUtil;->isWhitespace(B)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 250
    invoke-static {p1, p2, p3}, Lorg/eclipse/jgit/util/RawCharUtil;->trimLeadingWhitespace([BII)I

    move-result p2

    goto :goto_0

    .line 252
    :cond_0
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 254
    .end local v0           #c:B
    :cond_1
    return v1
.end method

.method public bridge synthetic reduceCommonStartEnd(Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/Edit;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 208
    check-cast p1, Lorg/eclipse/jgit/diff/RawText;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/diff/RawText;

    .end local p2
    invoke-super {p0, p1, p2, p3}, Lorg/eclipse/jgit/diff/RawTextComparator;->reduceCommonStartEnd(Lorg/eclipse/jgit/diff/RawText;Lorg/eclipse/jgit/diff/RawText;Lorg/eclipse/jgit/diff/Edit;)Lorg/eclipse/jgit/diff/Edit;

    move-result-object v0

    return-object v0
.end method
