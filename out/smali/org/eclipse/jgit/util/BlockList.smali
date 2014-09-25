.class public Lorg/eclipse/jgit/util/BlockList;
.super Ljava/util/AbstractList;
.source "BlockList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/util/BlockList$1;,
        Lorg/eclipse/jgit/util/BlockList$MyIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractList",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final BLOCK_BITS:I = 0xa

.field private static final BLOCK_MASK:I = 0x3ff

.field static final BLOCK_SIZE:I = 0x400


# instance fields
.field private directory:[[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[[TT;"
        }
    .end annotation
.end field

.field private size:I

.field private tailBlkIdx:I

.field private tailBlock:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field

.field private tailDirIdx:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .local p0, this:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<TT;>;"
    const/4 v2, 0x0

    .line 88
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 89
    const/16 v0, 0x100

    invoke-static {v0}, Lorg/eclipse/jgit/util/BlockList;->newDirectory(I)[[Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;

    .line 90
    iget-object v0, p0, Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;

    invoke-static {}, Lorg/eclipse/jgit/util/BlockList;->newBlock()[Ljava/lang/Object;

    move-result-object v1

    aput-object v1, v0, v2

    .line 91
    iget-object v0, p0, Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;

    aget-object v0, v0, v2

    iput-object v0, p0, Lorg/eclipse/jgit/util/BlockList;->tailBlock:[Ljava/lang/Object;

    .line 92
    return-void
.end method

.method public constructor <init>(I)V
    .locals 4
    .parameter "capacity"

    .prologue
    .local p0, this:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<TT;>;"
    const/4 v3, 0x0

    .line 100
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 101
    invoke-static {p1}, Lorg/eclipse/jgit/util/BlockList;->toDirectoryIndex(I)I

    move-result v0

    .line 102
    .local v0, dirSize:I
    and-int/lit16 v1, p1, 0x3ff

    if-nez v1, :cond_0

    if-nez v0, :cond_1

    .line 103
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 104
    :cond_1
    invoke-static {v0}, Lorg/eclipse/jgit/util/BlockList;->newDirectory(I)[[Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;

    .line 105
    iget-object v1, p0, Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;

    invoke-static {}, Lorg/eclipse/jgit/util/BlockList;->newBlock()[Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v1, v3

    .line 106
    iget-object v1, p0, Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;

    aget-object v1, v1, v3

    iput-object v1, p0, Lorg/eclipse/jgit/util/BlockList;->tailBlock:[Ljava/lang/Object;

    .line 107
    return-void
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/util/BlockList;)[[Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    iget-object v0, p0, Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$200(Lorg/eclipse/jgit/util/BlockList;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    iget v0, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    return v0
.end method

.method static synthetic access$300(I)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    invoke-static {p0}, Lorg/eclipse/jgit/util/BlockList;->toDirectoryIndex(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$400(I)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    invoke-static {p0}, Lorg/eclipse/jgit/util/BlockList;->toBlockIndex(I)I

    move-result v0

    return v0
.end method

.method private static newBlock()[Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()[TT;"
        }
    .end annotation

    .prologue
    .line 300
    const/16 v0, 0x400

    new-array v0, v0, [Ljava/lang/Object;

    check-cast v0, [Ljava/lang/Object;

    return-object v0
.end method

.method private static newDirectory(I)[[Ljava/lang/Object;
    .locals 1
    .parameter "size"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I)[[TT;"
        }
    .end annotation

    .prologue
    .line 295
    new-array v0, p0, [[Ljava/lang/Object;

    check-cast v0, [[Ljava/lang/Object;

    return-object v0
.end method

.method private resetTailBlock()V
    .locals 2

    .prologue
    .line 275
    .local p0, this:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<TT;>;"
    iget v0, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    invoke-static {v0}, Lorg/eclipse/jgit/util/BlockList;->toDirectoryIndex(I)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/util/BlockList;->tailDirIdx:I

    .line 276
    iget v0, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    invoke-static {v0}, Lorg/eclipse/jgit/util/BlockList;->toBlockIndex(I)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/util/BlockList;->tailBlkIdx:I

    .line 277
    iget-object v0, p0, Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;

    iget v1, p0, Lorg/eclipse/jgit/util/BlockList;->tailDirIdx:I

    aget-object v0, v0, v1

    iput-object v0, p0, Lorg/eclipse/jgit/util/BlockList;->tailBlock:[Ljava/lang/Object;

    .line 278
    return-void
.end method

.method private static final toBlockIndex(I)I
    .locals 1
    .parameter "index"

    .prologue
    .line 290
    and-int/lit16 v0, p0, 0x3ff

    return v0
.end method

.method private static final toDirectoryIndex(I)I
    .locals 1
    .parameter "index"

    .prologue
    .line 286
    ushr-int/lit8 v0, p0, 0xa

    return v0
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .locals 3
    .parameter "index"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .prologue
    .line 222
    .local p0, this:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<TT;>;"
    .local p2, element:Ljava/lang/Object;,"TT;"
    iget v1, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    if-ne p1, v1, :cond_0

    .line 224
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/util/BlockList;->add(Ljava/lang/Object;)Z

    .line 239
    :goto_0
    return-void

    .line 226
    :cond_0
    if-ltz p1, :cond_1

    iget v1, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    if-ge v1, p1, :cond_2

    .line 227
    :cond_1
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 234
    :cond_2
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/util/BlockList;->add(Ljava/lang/Object;)Z

    .line 235
    iget v1, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    add-int/lit8 v0, v1, -0x2

    .local v0, oldIdx:I
    :goto_1
    if-gt p1, v0, :cond_3

    .line 236
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/util/BlockList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/eclipse/jgit/util/BlockList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 235
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 237
    :cond_3
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/util/BlockList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public add(Ljava/lang/Object;)Z
    .locals 7
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, this:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<TT;>;"
    .local p1, element:Ljava/lang/Object;,"TT;"
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 192
    iget v1, p0, Lorg/eclipse/jgit/util/BlockList;->tailBlkIdx:I

    .line 193
    .local v1, i:I
    const/16 v3, 0x400

    if-ge v1, v3, :cond_0

    .line 195
    iget-object v3, p0, Lorg/eclipse/jgit/util/BlockList;->tailBlock:[Ljava/lang/Object;

    aput-object p1, v3, v1

    .line 196
    add-int/lit8 v3, v1, 0x1

    iput v3, p0, Lorg/eclipse/jgit/util/BlockList;->tailBlkIdx:I

    .line 197
    iget v3, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    .line 217
    :goto_0
    return v6

    .line 202
    :cond_0
    iget v3, p0, Lorg/eclipse/jgit/util/BlockList;->tailDirIdx:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/eclipse/jgit/util/BlockList;->tailDirIdx:I

    iget-object v4, p0, Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;

    array-length v4, v4

    if-ne v3, v4, :cond_1

    .line 203
    iget-object v3, p0, Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;

    array-length v3, v3

    shl-int/lit8 v3, v3, 0x1

    invoke-static {v3}, Lorg/eclipse/jgit/util/BlockList;->newDirectory(I)[[Ljava/lang/Object;

    move-result-object v2

    .line 204
    .local v2, newDir:[[Ljava/lang/Object;,"[[TT;"
    iget-object v3, p0, Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;

    iget-object v4, p0, Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;

    array-length v4, v4

    invoke-static {v3, v5, v2, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 205
    iput-object v2, p0, Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;

    .line 208
    .end local v2           #newDir:[[Ljava/lang/Object;,"[[TT;"
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;

    iget v4, p0, Lorg/eclipse/jgit/util/BlockList;->tailDirIdx:I

    aget-object v0, v3, v4

    .line 209
    .local v0, blockRef:[Ljava/lang/Object;,"[TT;"
    if-nez v0, :cond_2

    .line 210
    invoke-static {}, Lorg/eclipse/jgit/util/BlockList;->newBlock()[Ljava/lang/Object;

    move-result-object v0

    .line 211
    iget-object v3, p0, Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;

    iget v4, p0, Lorg/eclipse/jgit/util/BlockList;->tailDirIdx:I

    aput-object v0, v3, v4

    .line 213
    :cond_2
    aput-object p1, v0, v5

    .line 214
    iput-object v0, p0, Lorg/eclipse/jgit/util/BlockList;->tailBlock:[Ljava/lang/Object;

    .line 215
    iput v6, p0, Lorg/eclipse/jgit/util/BlockList;->tailBlkIdx:I

    .line 216
    iget v3, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    goto :goto_0
.end method

.method public addAll(Lorg/eclipse/jgit/util/BlockList;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/util/BlockList",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, this:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<TT;>;"
    .local p1, src:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<TT;>;"
    const/4 v3, 0x0

    .line 151
    iget v1, p1, Lorg/eclipse/jgit/util/BlockList;->size:I

    if-nez v1, :cond_1

    .line 159
    :cond_0
    :goto_0
    return-void

    .line 154
    :cond_1
    const/4 v0, 0x0

    .line 155
    .local v0, srcDirIdx:I
    :goto_1
    iget v1, p1, Lorg/eclipse/jgit/util/BlockList;->tailDirIdx:I

    if-ge v0, v1, :cond_2

    .line 156
    iget-object v1, p1, Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;

    aget-object v1, v1, v0

    const/16 v2, 0x400

    invoke-virtual {p0, v1, v3, v2}, Lorg/eclipse/jgit/util/BlockList;->addAll([Ljava/lang/Object;II)V

    .line 155
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 157
    :cond_2
    iget v1, p1, Lorg/eclipse/jgit/util/BlockList;->tailBlkIdx:I

    if-eqz v1, :cond_0

    .line 158
    iget-object v1, p1, Lorg/eclipse/jgit/util/BlockList;->tailBlock:[Ljava/lang/Object;

    iget v2, p1, Lorg/eclipse/jgit/util/BlockList;->tailBlkIdx:I

    invoke-virtual {p0, v1, v3, v2}, Lorg/eclipse/jgit/util/BlockList;->addAll([Ljava/lang/Object;II)V

    goto :goto_0
.end method

.method public addAll([Ljava/lang/Object;II)V
    .locals 4
    .parameter
    .parameter "srcIdx"
    .parameter "srcCnt"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;II)V"
        }
    .end annotation

    .prologue
    .line 172
    .local p0, this:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<TT;>;"
    .local p1, src:[Ljava/lang/Object;,"[TT;"
    move v2, p2

    .end local p2
    .local v2, srcIdx:I
    :goto_0
    if-lez p3, :cond_1

    .line 173
    iget v0, p0, Lorg/eclipse/jgit/util/BlockList;->tailBlkIdx:I

    .line 174
    .local v0, i:I
    rsub-int v3, v0, 0x400

    invoke-static {p3, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 175
    .local v1, n:I
    if-nez v1, :cond_0

    .line 177
    add-int/lit8 p2, v2, 0x1

    .end local v2           #srcIdx:I
    .restart local p2
    aget-object v3, p1, v2

    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/util/BlockList;->add(Ljava/lang/Object;)Z

    .line 178
    add-int/lit8 p3, p3, -0x1

    move v2, p2

    .line 179
    .end local p2
    .restart local v2       #srcIdx:I
    goto :goto_0

    .line 182
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/util/BlockList;->tailBlock:[Ljava/lang/Object;

    invoke-static {p1, v2, v3, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 183
    iget v3, p0, Lorg/eclipse/jgit/util/BlockList;->tailBlkIdx:I

    add-int/2addr v3, v1

    iput v3, p0, Lorg/eclipse/jgit/util/BlockList;->tailBlkIdx:I

    .line 184
    iget v3, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    add-int/2addr v3, v1

    iput v3, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    .line 185
    add-int p2, v2, v1

    .line 186
    .end local v2           #srcIdx:I
    .restart local p2
    sub-int/2addr p3, v1

    move v2, p2

    .line 187
    .end local p2
    .restart local v2       #srcIdx:I
    goto :goto_0

    .line 188
    .end local v0           #i:I
    .end local v1           #n:I
    :cond_1
    return-void
.end method

.method public clear()V
    .locals 6

    .prologue
    .local p0, this:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<TT;>;"
    const/4 v5, 0x0

    .line 116
    iget-object v0, p0, Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;

    .local v0, arr$:[[Ljava/lang/Object;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 117
    .local v1, block:[Ljava/lang/Object;,"[TT;"
    if-eqz v1, :cond_0

    .line 118
    const/4 v4, 0x0

    invoke-static {v1, v4}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 116
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 120
    .end local v1           #block:[Ljava/lang/Object;,"[TT;"
    :cond_1
    iput v5, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    .line 121
    iput v5, p0, Lorg/eclipse/jgit/util/BlockList;->tailDirIdx:I

    .line 122
    iput v5, p0, Lorg/eclipse/jgit/util/BlockList;->tailBlkIdx:I

    .line 123
    iget-object v4, p0, Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;

    aget-object v4, v4, v5

    iput-object v4, p0, Lorg/eclipse/jgit/util/BlockList;->tailBlock:[Ljava/lang/Object;

    .line 124
    return-void
.end method

.method public get(I)Ljava/lang/Object;
    .locals 2
    .parameter "index"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 128
    .local p0, this:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<TT;>;"
    if-ltz p1, :cond_0

    iget v0, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    if-gt v0, p1, :cond_1

    .line 129
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 130
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;

    invoke-static {p1}, Lorg/eclipse/jgit/util/BlockList;->toDirectoryIndex(I)I

    move-result v1

    aget-object v0, v0, v1

    invoke-static {p1}, Lorg/eclipse/jgit/util/BlockList;->toBlockIndex(I)I

    move-result v1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 282
    .local p0, this:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<TT;>;"
    new-instance v0, Lorg/eclipse/jgit/util/BlockList$MyIterator;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/eclipse/jgit/util/BlockList$MyIterator;-><init>(Lorg/eclipse/jgit/util/BlockList;Lorg/eclipse/jgit/util/BlockList$1;)V

    return-object v0
.end method

.method public remove(I)Ljava/lang/Object;
    .locals 6
    .parameter "index"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .local p0, this:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<TT;>;"
    const/4 v5, 0x0

    .line 243
    iget v3, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    add-int/lit8 v3, v3, -0x1

    if-ne p1, v3, :cond_1

    .line 245
    iget-object v3, p0, Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;

    invoke-static {p1}, Lorg/eclipse/jgit/util/BlockList;->toDirectoryIndex(I)I

    move-result v4

    aget-object v1, v3, v4

    .line 246
    .local v1, blockRef:[Ljava/lang/Object;,"[TT;"
    invoke-static {p1}, Lorg/eclipse/jgit/util/BlockList;->toBlockIndex(I)I

    move-result v0

    .line 247
    .local v0, blockIdx:I
    aget-object v2, v1, v0

    .line 248
    .local v2, old:Ljava/lang/Object;,"TT;"
    aput-object v5, v1, v0

    .line 249
    iget v3, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    .line 250
    iget v3, p0, Lorg/eclipse/jgit/util/BlockList;->tailBlkIdx:I

    if-lez v3, :cond_0

    .line 251
    iget v3, p0, Lorg/eclipse/jgit/util/BlockList;->tailBlkIdx:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lorg/eclipse/jgit/util/BlockList;->tailBlkIdx:I

    .line 270
    .end local v0           #blockIdx:I
    .end local v1           #blockRef:[Ljava/lang/Object;,"[TT;"
    :goto_0
    return-object v2

    .line 253
    .restart local v0       #blockIdx:I
    .restart local v1       #blockRef:[Ljava/lang/Object;,"[TT;"
    :cond_0
    invoke-direct {p0}, Lorg/eclipse/jgit/util/BlockList;->resetTailBlock()V

    goto :goto_0

    .line 256
    .end local v0           #blockIdx:I
    .end local v1           #blockRef:[Ljava/lang/Object;,"[TT;"
    .end local v2           #old:Ljava/lang/Object;,"TT;"
    :cond_1
    if-ltz p1, :cond_2

    iget v3, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    if-gt v3, p1, :cond_3

    .line 257
    :cond_2
    new-instance v3, Ljava/lang/IndexOutOfBoundsException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 264
    :cond_3
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/util/BlockList;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 265
    .restart local v2       #old:Ljava/lang/Object;,"TT;"
    :goto_1
    iget v3, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    add-int/lit8 v3, v3, -0x1

    if-ge p1, v3, :cond_4

    .line 266
    add-int/lit8 v3, p1, 0x1

    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/util/BlockList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, p1, v3}, Lorg/eclipse/jgit/util/BlockList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 265
    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    .line 267
    :cond_4
    iget v3, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {p0, v3, v5}, Lorg/eclipse/jgit/util/BlockList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 268
    iget v3, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    .line 269
    invoke-direct {p0}, Lorg/eclipse/jgit/util/BlockList;->resetTailBlock()V

    goto :goto_0
.end method

.method public set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .parameter "index"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)TT;"
        }
    .end annotation

    .prologue
    .line 135
    .local p0, this:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<TT;>;"
    .local p2, element:Ljava/lang/Object;,"TT;"
    if-ltz p1, :cond_0

    iget v3, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    if-gt v3, p1, :cond_1

    .line 136
    :cond_0
    new-instance v3, Ljava/lang/IndexOutOfBoundsException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 137
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;

    invoke-static {p1}, Lorg/eclipse/jgit/util/BlockList;->toDirectoryIndex(I)I

    move-result v4

    aget-object v1, v3, v4

    .line 138
    .local v1, blockRef:[Ljava/lang/Object;,"[TT;"
    invoke-static {p1}, Lorg/eclipse/jgit/util/BlockList;->toBlockIndex(I)I

    move-result v0

    .line 139
    .local v0, blockIdx:I
    aget-object v2, v1, v0

    .line 140
    .local v2, old:Ljava/lang/Object;,"TT;"
    aput-object p2, v1, v0

    .line 141
    return-object v2
.end method

.method public size()I
    .locals 1

    .prologue
    .line 111
    .local p0, this:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<TT;>;"
    iget v0, p0, Lorg/eclipse/jgit/util/BlockList;->size:I

    return v0
.end method
