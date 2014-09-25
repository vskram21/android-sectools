.class public Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;
.super Ljava/lang/Object;
.source "ObjectIdOwnerMap.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<TV;>;"
    }
.end annotation


# static fields
.field private static final INITIAL_DIRECTORY:I = 0x400

.field private static final SEGMENT_BITS:I = 0xb

.field private static final SEGMENT_SHIFT:I = 0x15


# instance fields
.field private bits:I

.field private directory:[[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[[TV;"
        }
    .end annotation
.end field

.field private grow:I

.field private mask:I

.field private size:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap<TV;>;"
    const/4 v2, 0x0

    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 103
    iput v2, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->bits:I

    .line 104
    iput v2, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->mask:I

    .line 105
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->bits:I

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->computeGrowAt(I)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->grow:I

    .line 107
    const/16 v0, 0x400

    new-array v0, v0, [[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    check-cast v0, [[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    iput-object v0, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->directory:[[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    .line 108
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->directory:[[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->newSegment()[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v1

    aput-object v1, v0, v2

    .line 109
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->size:I

    return v0
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;)[[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->directory:[[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    return-object v0
.end method

.method static synthetic access$200(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->bits:I

    return v0
.end method

.method private static final computeGrowAt(I)I
    .locals 2
    .parameter "bits"

    .prologue
    .line 330
    const/4 v0, 0x1

    add-int/lit8 v1, p0, 0xb

    shl-int/2addr v0, v1

    return v0
.end method

.method private static final equals(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 2
    .parameter "firstObjectId"
    .parameter "secondObjectId"

    .prologue
    .line 335
    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w2:I

    iget v1, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w2:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w3:I

    iget v1, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w3:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w4:I

    iget v1, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w4:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w5:I

    iget v1, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w5:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    iget v1, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private grow()V
    .locals 15

    .prologue
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap<TV;>;"
    const/4 v14, 0x0

    const/4 v13, 0x1

    .line 272
    iget v12, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->bits:I

    shl-int v9, v13, v12

    .line 273
    .local v9, oldDirLen:I
    iget v12, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->bits:I

    shl-int v11, v13, v12

    .line 275
    .local v11, s:I
    iget v12, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->bits:I

    add-int/lit8 v12, v12, 0x1

    iput v12, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->bits:I

    .line 276
    iget v12, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->bits:I

    shl-int v12, v13, v12

    add-int/lit8 v12, v12, -0x1

    iput v12, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->mask:I

    .line 277
    iget v12, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->bits:I

    invoke-static {v12}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->computeGrowAt(I)I

    move-result v12

    iput v12, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->grow:I

    .line 283
    iget v12, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->bits:I

    shl-int v5, v13, v12

    .line 284
    .local v5, newDirLen:I
    iget-object v12, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->directory:[[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    array-length v12, v12

    if-ge v12, v5, :cond_0

    .line 285
    shl-int/lit8 v12, v5, 0x1

    new-array v4, v12, [[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    check-cast v4, [[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    .line 286
    .local v4, newDir:[[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"[[TV;"
    iget-object v12, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->directory:[[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    invoke-static {v12, v14, v4, v14, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 287
    iput-object v4, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->directory:[[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    .line 295
    .end local v4           #newDir:[[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"[[TV;"
    :cond_0
    const/4 v2, 0x0

    .local v2, dirIdx:I
    :goto_0
    if-ge v2, v9, :cond_4

    .line 296
    iget-object v12, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->directory:[[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    aget-object v10, v12, v2

    .line 297
    .local v10, oldTable:[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"[TV;"
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->newSegment()[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v6

    .line 299
    .local v6, newTable:[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"[TV;"
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    array-length v12, v10

    if-ge v3, v12, :cond_3

    .line 300
    const/4 v0, 0x0

    .line 301
    .local v0, chain0:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"TV;"
    const/4 v1, 0x0

    .line 304
    .local v1, chain1:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"TV;"
    aget-object v8, v10, v3

    .local v8, obj:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"TV;"
    :goto_2
    if-eqz v8, :cond_2

    .line 305
    iget-object v7, v8, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;->next:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    .line 307
    .local v7, next:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"TV;"
    iget v12, v8, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;->w1:I

    and-int/2addr v12, v11

    if-nez v12, :cond_1

    .line 308
    iput-object v0, v8, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;->next:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    .line 309
    move-object v0, v8

    .line 304
    :goto_3
    move-object v8, v7

    goto :goto_2

    .line 311
    :cond_1
    iput-object v1, v8, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;->next:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    .line 312
    move-object v1, v8

    goto :goto_3

    .line 316
    .end local v7           #next:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"TV;"
    :cond_2
    aput-object v0, v10, v3

    .line 317
    aput-object v1, v6, v3

    .line 299
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 320
    .end local v0           #chain0:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"TV;"
    .end local v1           #chain1:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"TV;"
    .end local v8           #obj:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"TV;"
    :cond_3
    iget-object v12, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->directory:[[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    add-int v13, v9, v2

    aput-object v6, v12, v13

    .line 295
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 322
    .end local v3           #i:I
    .end local v6           #newTable:[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"[TV;"
    .end local v10           #oldTable:[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"[TV;"
    :cond_4
    return-void
.end method

.method private final newSegment()[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[TV;"
        }
    .end annotation

    .prologue
    .line 326
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap<TV;>;"
    const/16 v0, 0x800

    new-array v0, v0, [Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    check-cast v0, [Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    return-object v0
.end method


# virtual methods
.method public add(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Q:TV;>(TQ;)V"
        }
    .end annotation

    .prologue
    .line 163
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap<TV;>;"
    .local p1, newValue:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"TQ;"
    iget v2, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->size:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->size:I

    iget v3, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->grow:I

    if-ne v2, v3, :cond_0

    .line 164
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->grow()V

    .line 166
    :cond_0
    iget v0, p1, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;->w1:I

    .line 167
    .local v0, h:I
    iget-object v2, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->directory:[[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    iget v3, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->mask:I

    and-int/2addr v3, v0

    aget-object v1, v2, v3

    .line 168
    .local v1, table:[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"[TV;"
    ushr-int/lit8 v0, v0, 0x15

    .line 170
    aget-object v2, v1, v0

    iput-object v2, p1, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;->next:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    .line 171
    aput-object p1, v1, v0

    .line 172
    return-void
.end method

.method public addIfAbsent(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Q:TV;>(TQ;)TV;"
        }
    .end annotation

    .prologue
    .line 196
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap<TV;>;"
    .local p1, newValue:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"TQ;"
    iget v0, p1, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;->w1:I

    .line 197
    .local v0, h:I
    iget-object v3, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->directory:[[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    iget v4, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->mask:I

    and-int/2addr v4, v0

    aget-object v2, v3, v4

    .line 198
    .local v2, table:[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"[TV;"
    ushr-int/lit8 v0, v0, 0x15

    .line 200
    aget-object v1, v2, v0

    .local v1, obj:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"TV;"
    :goto_0
    if-eqz v1, :cond_1

    .line 201
    invoke-static {v1, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 209
    .end local v1           #obj:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"TV;"
    :goto_1
    return-object v1

    .line 200
    .restart local v1       #obj:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"TV;"
    :cond_0
    iget-object v1, v1, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;->next:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    goto :goto_0

    .line 204
    :cond_1
    aget-object v3, v2, v0

    iput-object v3, p1, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;->next:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    .line 205
    aput-object p1, v2, v0

    .line 207
    iget v3, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->size:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->size:I

    iget v4, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->grow:I

    if-ne v3, v4, :cond_2

    .line 208
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->grow()V

    :cond_2
    move-object v1, p1

    .line 209
    goto :goto_1
.end method

.method public clear()V
    .locals 5

    .prologue
    .line 113
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap<TV;>;"
    const/4 v4, 0x0

    iput v4, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->size:I

    .line 115
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->directory:[[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    .local v0, arr$:[[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 116
    .local v3, tbl:[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"[TV;"
    if-nez v3, :cond_1

    .line 120
    .end local v3           #tbl:[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"[TV;"
    :cond_0
    return-void

    .line 118
    .restart local v3       #tbl:[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"[TV;"
    :cond_1
    const/4 v4, 0x0

    invoke-static {v3, v4}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 115
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 1
    .parameter "toFind"

    .prologue
    .line 147
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap<TV;>;"
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;
    .locals 4
    .parameter "toFind"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/AnyObjectId;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 131
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap<TV;>;"
    iget v0, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    .line 132
    .local v0, h:I
    iget-object v2, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->directory:[[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    iget v3, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->mask:I

    and-int/2addr v3, v0

    aget-object v2, v2, v3

    ushr-int/lit8 v3, v0, 0x15

    aget-object v1, v2, v3

    .line 133
    .local v1, obj:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"TV;"
    :goto_0
    if-eqz v1, :cond_1

    .line 134
    invoke-static {v1, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 136
    .end local v1           #obj:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"TV;"
    :goto_1
    return-object v1

    .line 133
    .restart local v1       #obj:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"TV;"
    :cond_0
    iget-object v1, v1, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;->next:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    goto :goto_0

    .line 136
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 219
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap<TV;>;"
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 223
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap<TV;>;"
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;-><init>(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;)V

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 214
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap<TV;>;"
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->size:I

    return v0
.end method
