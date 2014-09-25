.class public Lorg/eclipse/jgit/revwalk/RevCommitList;
.super Lorg/eclipse/jgit/revwalk/RevObjectList;
.source "RevCommitList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Lorg/eclipse/jgit/revwalk/RevCommit;",
        ">",
        "Lorg/eclipse/jgit/revwalk/RevObjectList",
        "<TE;>;"
    }
.end annotation


# instance fields
.field private walker:Lorg/eclipse/jgit/revwalk/RevWalk;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 58
    .local p0, this:Lorg/eclipse/jgit/revwalk/RevCommitList;,"Lorg/eclipse/jgit/revwalk/RevCommitList<TE;>;"
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/RevObjectList;-><init>()V

    return-void
.end method


# virtual methods
.method public applyFlag(Lorg/eclipse/jgit/revwalk/filter/RevFilter;Lorg/eclipse/jgit/revwalk/RevFlag;)V
    .locals 2
    .parameter "matching"
    .parameter "flag"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 96
    .local p0, this:Lorg/eclipse/jgit/revwalk/RevCommitList;,"Lorg/eclipse/jgit/revwalk/RevCommitList<TE;>;"
    const/4 v0, 0x0

    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevCommitList;->size()I

    move-result v1

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/eclipse/jgit/revwalk/RevCommitList;->applyFlag(Lorg/eclipse/jgit/revwalk/filter/RevFilter;Lorg/eclipse/jgit/revwalk/RevFlag;II)V

    .line 97
    return-void
.end method

.method public applyFlag(Lorg/eclipse/jgit/revwalk/filter/RevFilter;Lorg/eclipse/jgit/revwalk/RevFlag;II)V
    .locals 8
    .parameter "matching"
    .parameter "flag"
    .parameter "rangeBegin"
    .parameter "rangeEnd"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 136
    .local p0, this:Lorg/eclipse/jgit/revwalk/RevCommitList;,"Lorg/eclipse/jgit/revwalk/RevCommitList<TE;>;"
    invoke-virtual {p2}, Lorg/eclipse/jgit/revwalk/RevFlag;->getRevWalk()Lorg/eclipse/jgit/revwalk/RevWalk;

    move-result-object v6

    .line 137
    .local v6, w:Lorg/eclipse/jgit/revwalk/RevWalk;
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevCommitList;->size()I

    move-result v7

    invoke-static {p4, v7}, Ljava/lang/Math;->min(II)I

    move-result p4

    .line 138
    :cond_0
    if-ge p3, p4, :cond_2

    .line 139
    move v2, p3

    .line 140
    .local v2, index:I
    iget-object v5, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->contents:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    .line 141
    .local v5, s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    :goto_0
    iget v7, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    if-lez v7, :cond_3

    .line 142
    iget v7, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    shr-int v1, v2, v7

    .line 143
    .local v1, i:I
    iget v7, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    shl-int v7, v1, v7

    sub-int/2addr v2, v7

    .line 144
    iget-object v7, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    aget-object v5, v7, v1

    .end local v5           #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    check-cast v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    .line 145
    .restart local v5       #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    goto :goto_0

    .line 147
    .end local v1           #i:I
    .end local v2           #index:I
    .end local p3
    .local v3, index:I
    .local v4, rangeBegin:I
    :goto_1
    add-int/lit8 p3, v4, 0x1

    .end local v4           #rangeBegin:I
    .restart local p3
    if-ge v4, p4, :cond_0

    const/16 v7, 0x100

    if-ge v3, v7, :cond_0

    .line 148
    iget-object v7, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    add-int/lit8 v2, v3, 0x1

    .end local v3           #index:I
    .restart local v2       #index:I
    aget-object v0, v7, v3

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 149
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {p1, v6, v0}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->include(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 150
    invoke-virtual {v0, p2}, Lorg/eclipse/jgit/revwalk/RevCommit;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    :goto_2
    move v3, v2

    .end local v2           #index:I
    .restart local v3       #index:I
    move v4, p3

    .line 153
    .end local p3
    .restart local v4       #rangeBegin:I
    goto :goto_1

    .line 152
    .end local v3           #index:I
    .end local v4           #rangeBegin:I
    .restart local v2       #index:I
    .restart local p3
    :cond_1
    invoke-virtual {v0, p2}, Lorg/eclipse/jgit/revwalk/RevCommit;->remove(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    goto :goto_2

    .line 155
    .end local v0           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v2           #index:I
    .end local v5           #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    :cond_2
    return-void

    .restart local v2       #index:I
    .restart local v5       #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    :cond_3
    move v3, v2

    .end local v2           #index:I
    .restart local v3       #index:I
    move v4, p3

    .end local p3
    .restart local v4       #rangeBegin:I
    goto :goto_1
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 63
    .local p0, this:Lorg/eclipse/jgit/revwalk/RevCommitList;,"Lorg/eclipse/jgit/revwalk/RevCommitList<TE;>;"
    invoke-super {p0}, Lorg/eclipse/jgit/revwalk/RevObjectList;->clear()V

    .line 64
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 65
    return-void
.end method

.method public clearFlag(Lorg/eclipse/jgit/revwalk/RevFlag;)V
    .locals 2
    .parameter "flag"

    .prologue
    .line 168
    .local p0, this:Lorg/eclipse/jgit/revwalk/RevCommitList;,"Lorg/eclipse/jgit/revwalk/RevCommitList<TE;>;"
    const/4 v0, 0x0

    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevCommitList;->size()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lorg/eclipse/jgit/revwalk/RevCommitList;->clearFlag(Lorg/eclipse/jgit/revwalk/RevFlag;II)V

    .line 169
    return-void
.end method

.method public clearFlag(Lorg/eclipse/jgit/revwalk/RevFlag;II)V
    .locals 1
    .parameter "flag"
    .parameter "rangeBegin"
    .parameter "rangeEnd"

    .prologue
    .line 191
    .local p0, this:Lorg/eclipse/jgit/revwalk/RevCommitList;,"Lorg/eclipse/jgit/revwalk/RevCommitList<TE;>;"
    :try_start_0
    sget-object v0, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->NONE:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    invoke-virtual {p0, v0, p1, p2, p3}, Lorg/eclipse/jgit/revwalk/RevCommitList;->applyFlag(Lorg/eclipse/jgit/revwalk/filter/RevFilter;Lorg/eclipse/jgit/revwalk/RevFlag;II)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 196
    :goto_0
    return-void

    .line 192
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method protected enter(ILorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 0
    .parameter "index"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)V"
        }
    .end annotation

    .prologue
    .line 421
    .local p0, this:Lorg/eclipse/jgit/revwalk/RevCommitList;,"Lorg/eclipse/jgit/revwalk/RevCommitList<TE;>;"
    .local p2, e:Lorg/eclipse/jgit/revwalk/RevCommit;,"TE;"
    return-void
.end method

.method public fillTo(I)V
    .locals 12
    .parameter "highMark"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p0, this:Lorg/eclipse/jgit/revwalk/RevCommitList;,"Lorg/eclipse/jgit/revwalk/RevCommitList<TE;>;"
    const/4 v11, 0x0

    const/16 v10, 0x100

    .line 302
    iget-object v7, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    if-eqz v7, :cond_0

    iget v7, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->size:I

    if-le v7, p1, :cond_1

    .line 340
    :cond_0
    :goto_0
    return-void

    .line 305
    :cond_1
    iget-object v7, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v7}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 306
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v0, :cond_2

    .line 307
    iput-object v11, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    goto :goto_0

    .line 310
    :cond_2
    iget v7, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->size:I

    invoke-virtual {p0, v7, v0}, Lorg/eclipse/jgit/revwalk/RevCommitList;->enter(ILorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 311
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/RevCommitList;->add(Ljava/lang/Object;)Z

    .line 313
    :cond_3
    iget v7, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->size:I

    if-gt v7, p1, :cond_0

    .line 314
    iget v3, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->size:I

    .line 315
    .local v3, index:I
    iget-object v5, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->contents:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    .line 316
    .local v5, s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    :goto_1
    iget v7, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    shr-int v7, v3, v7

    if-lt v7, v10, :cond_4

    .line 317
    new-instance v6, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    iget v7, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    add-int/lit8 v7, v7, 0x8

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;-><init>(I)V

    .line 318
    .end local v5           #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    .local v6, s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    iget-object v7, v6, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->contents:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    aput-object v9, v7, v8

    .line 319
    iput-object v6, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->contents:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    move-object v5, v6

    .end local v6           #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    .restart local v5       #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    goto :goto_1

    .line 321
    :cond_4
    :goto_2
    iget v7, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    if-lez v7, :cond_6

    .line 322
    iget v7, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    shr-int v2, v3, v7

    .line 323
    .local v2, i:I
    iget v7, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    shl-int v7, v2, v7

    sub-int/2addr v3, v7

    .line 324
    iget-object v7, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    aget-object v7, v7, v2

    if-nez v7, :cond_5

    .line 325
    iget-object v7, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    new-instance v8, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    iget v9, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    add-int/lit8 v9, v9, -0x8

    invoke-direct {v8, v9}, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;-><init>(I)V

    aput-object v8, v7, v2

    .line 326
    :cond_5
    iget-object v7, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    aget-object v5, v7, v2

    .end local v5           #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    check-cast v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    .line 327
    .restart local v5       #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    goto :goto_2

    .line 329
    .end local v2           #i:I
    :cond_6
    iget-object v1, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    .line 330
    .local v1, dst:[Ljava/lang/Object;
    :goto_3
    iget v7, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->size:I

    if-gt v7, p1, :cond_3

    if-ge v3, v10, :cond_3

    .line 331
    iget-object v7, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v7}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 332
    if-nez v0, :cond_7

    .line 333
    iput-object v11, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    goto :goto_0

    .line 336
    :cond_7
    iget v7, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->size:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->size:I

    invoke-virtual {p0, v7, v0}, Lorg/eclipse/jgit/revwalk/RevCommitList;->enter(ILorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 337
    add-int/lit8 v4, v3, 0x1

    .end local v3           #index:I
    .local v4, index:I
    aput-object v0, v1, v3

    move v3, v4

    .end local v4           #index:I
    .restart local v3       #index:I
    goto :goto_3
.end method

.method public fillTo(Lorg/eclipse/jgit/revwalk/RevCommit;I)V
    .locals 12
    .parameter "commitToLoad"
    .parameter "highMark"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p0, this:Lorg/eclipse/jgit/revwalk/RevCommitList;,"Lorg/eclipse/jgit/revwalk/RevCommitList<TE;>;"
    const/4 v11, 0x0

    const/16 v10, 0x100

    .line 367
    iget-object v7, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    if-eqz v7, :cond_0

    if-eqz p1, :cond_0

    if-lez p2, :cond_1

    iget v7, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->size:I

    if-le v7, p2, :cond_1

    .line 407
    :cond_0
    :goto_0
    return-void

    .line 371
    :cond_1
    iget-object v7, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v7}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 372
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v0, :cond_2

    .line 373
    iput-object v11, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    goto :goto_0

    .line 376
    :cond_2
    iget v7, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->size:I

    invoke-virtual {p0, v7, v0}, Lorg/eclipse/jgit/revwalk/RevCommitList;->enter(ILorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 377
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/RevCommitList;->add(Ljava/lang/Object;)Z

    .line 379
    :cond_3
    if-eqz p2, :cond_4

    iget v7, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->size:I

    if-gt v7, p2, :cond_0

    :cond_4
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 380
    iget v3, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->size:I

    .line 381
    .local v3, index:I
    iget-object v5, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->contents:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    .line 382
    .local v5, s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    :goto_1
    iget v7, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    shr-int v7, v3, v7

    if-lt v7, v10, :cond_5

    .line 383
    new-instance v6, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    iget v7, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    add-int/lit8 v7, v7, 0x8

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;-><init>(I)V

    .line 384
    .end local v5           #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    .local v6, s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    iget-object v7, v6, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->contents:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    aput-object v9, v7, v8

    .line 385
    iput-object v6, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->contents:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    move-object v5, v6

    .end local v6           #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    .restart local v5       #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    goto :goto_1

    .line 387
    :cond_5
    :goto_2
    iget v7, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    if-lez v7, :cond_7

    .line 388
    iget v7, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    shr-int v2, v3, v7

    .line 389
    .local v2, i:I
    iget v7, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    shl-int v7, v2, v7

    sub-int/2addr v3, v7

    .line 390
    iget-object v7, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    aget-object v7, v7, v2

    if-nez v7, :cond_6

    .line 391
    iget-object v7, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    new-instance v8, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    iget v9, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    add-int/lit8 v9, v9, -0x8

    invoke-direct {v8, v9}, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;-><init>(I)V

    aput-object v8, v7, v2

    .line 392
    :cond_6
    iget-object v7, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    aget-object v5, v7, v2

    .end local v5           #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    check-cast v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    .line 393
    .restart local v5       #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    goto :goto_2

    .line 395
    .end local v2           #i:I
    :cond_7
    iget-object v1, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    .local v1, dst:[Ljava/lang/Object;
    move v4, v3

    .line 396
    .end local v3           #index:I
    .local v4, index:I
    :goto_3
    if-eqz p2, :cond_8

    iget v7, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->size:I

    if-gt v7, p2, :cond_3

    :cond_8
    if-ge v4, v10, :cond_3

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 398
    iget-object v7, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v7}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 399
    if-nez v0, :cond_9

    .line 400
    iput-object v11, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    goto :goto_0

    .line 403
    :cond_9
    iget v7, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->size:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->size:I

    invoke-virtual {p0, v7, v0}, Lorg/eclipse/jgit/revwalk/RevCommitList;->enter(ILorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 404
    add-int/lit8 v3, v4, 0x1

    .end local v4           #index:I
    .restart local v3       #index:I
    aput-object v0, v1, v4

    move v4, v3

    .end local v3           #index:I
    .restart local v4       #index:I
    goto :goto_3
.end method

.method public indexOf(Lorg/eclipse/jgit/revwalk/RevFlag;I)I
    .locals 7
    .parameter "flag"
    .parameter "begin"

    .prologue
    .line 210
    .local p0, this:Lorg/eclipse/jgit/revwalk/RevCommitList;,"Lorg/eclipse/jgit/revwalk/RevCommitList<TE;>;"
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevCommitList;->size()I

    move-result v6

    if-ge p2, v6, :cond_3

    .line 211
    move v3, p2

    .line 212
    .local v3, index:I
    iget-object v5, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->contents:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    .line 213
    .local v5, s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    :goto_1
    iget v6, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    if-lez v6, :cond_1

    .line 214
    iget v6, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    shr-int v2, v3, v6

    .line 215
    .local v2, i:I
    iget v6, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    shl-int v6, v2, v6

    sub-int/2addr v3, v6

    .line 216
    iget-object v6, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    aget-object v5, v6, v2

    .end local v5           #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    check-cast v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    .line 217
    .restart local v5       #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    goto :goto_1

    .end local v2           #i:I
    .end local v3           #index:I
    .end local p2
    .local v0, begin:I
    .local v1, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    .local v4, index:I
    :cond_0
    move v3, v4

    .end local v4           #index:I
    .restart local v3       #index:I
    move p2, v0

    .line 219
    .end local v0           #begin:I
    .end local v1           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local p2
    :cond_1
    add-int/lit8 v0, p2, 0x1

    .end local p2
    .restart local v0       #begin:I
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevCommitList;->size()I

    move-result v6

    if-ge p2, v6, :cond_2

    const/16 v6, 0x100

    if-ge v3, v6, :cond_2

    .line 220
    iget-object v6, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    add-int/lit8 v4, v3, 0x1

    .end local v3           #index:I
    .restart local v4       #index:I
    aget-object v1, v6, v3

    check-cast v1, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 221
    .restart local v1       #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v6

    if-eqz v6, :cond_0

    move p2, v0

    .line 225
    .end local v0           #begin:I
    .end local v1           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v4           #index:I
    .end local v5           #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    .restart local p2
    :goto_2
    return v0

    .end local p2
    .restart local v0       #begin:I
    .restart local v3       #index:I
    .restart local v5       #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    :cond_2
    move p2, v0

    .line 224
    .end local v0           #begin:I
    .restart local p2
    goto :goto_0

    .line 225
    .end local v3           #index:I
    .end local v5           #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    :cond_3
    const/4 v0, -0x1

    goto :goto_2
.end method

.method public isPending()Z
    .locals 1

    .prologue
    .line 278
    .local p0, this:Lorg/eclipse/jgit/revwalk/RevCommitList;,"Lorg/eclipse/jgit/revwalk/RevCommitList<TE;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public lastIndexOf(Lorg/eclipse/jgit/revwalk/RevFlag;I)I
    .locals 7
    .parameter "flag"
    .parameter "begin"

    .prologue
    .line 241
    .local p0, this:Lorg/eclipse/jgit/revwalk/RevCommitList;,"Lorg/eclipse/jgit/revwalk/RevCommitList<TE;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevCommitList;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-static {p2, v6}, Ljava/lang/Math;->min(II)I

    move-result p2

    .line 242
    :cond_0
    if-ltz p2, :cond_2

    .line 243
    move v3, p2

    .line 244
    .local v3, index:I
    iget-object v5, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->contents:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    .line 245
    .local v5, s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    :goto_0
    iget v6, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    if-lez v6, :cond_3

    .line 246
    iget v6, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    shr-int v2, v3, v6

    .line 247
    .local v2, i:I
    iget v6, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    shl-int v6, v2, v6

    sub-int/2addr v3, v6

    .line 248
    iget-object v6, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    aget-object v5, v6, v2

    .end local v5           #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    check-cast v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;

    .line 249
    .restart local v5       #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    goto :goto_0

    .end local v2           #i:I
    .local v1, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_1
    move v4, v3

    .end local v3           #index:I
    .local v4, index:I
    move v0, p2

    .line 251
    .end local v1           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local p2
    .local v0, begin:I
    :goto_1
    add-int/lit8 p2, v0, -0x1

    .end local v0           #begin:I
    .restart local p2
    if-ltz v0, :cond_0

    if-ltz v4, :cond_0

    .line 252
    iget-object v6, v5, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    add-int/lit8 v3, v4, -0x1

    .end local v4           #index:I
    .restart local v3       #index:I
    aget-object v1, v6, v4

    check-cast v1, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 253
    .restart local v1       #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v6

    if-eqz v6, :cond_1

    move v6, p2

    .line 257
    .end local v1           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v3           #index:I
    .end local v5           #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    :goto_2
    return v6

    :cond_2
    const/4 v6, -0x1

    goto :goto_2

    .restart local v3       #index:I
    .restart local v5       #s:Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
    :cond_3
    move v4, v3

    .end local v3           #index:I
    .restart local v4       #index:I
    move v0, p2

    .end local p2
    .restart local v0       #begin:I
    goto :goto_1
.end method

.method public source(Lorg/eclipse/jgit/revwalk/RevWalk;)V
    .locals 0
    .parameter "w"

    .prologue
    .line 268
    .local p0, this:Lorg/eclipse/jgit/revwalk/RevCommitList;,"Lorg/eclipse/jgit/revwalk/RevCommitList<TE;>;"
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/RevCommitList;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 269
    return-void
.end method
