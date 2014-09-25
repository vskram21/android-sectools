.class Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;
.super Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
.source "PathFilterGroup.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Group"
.end annotation


# instance fields
.field private fullpaths:Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;

.field private max:[B

.field private prefixes:Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;


# direct methods
.method private constructor <init>([Lorg/eclipse/jgit/treewalk/filter/PathFilter;)V
    .locals 13
    .parameter "pathFilters"

    .prologue
    const/4 v10, 0x0

    const/16 v12, 0x2f

    .line 189
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;-><init>()V

    .line 190
    new-instance v8, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;

    array-length v9, p1

    invoke-direct {v8, v9}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;-><init>(I)V

    iput-object v8, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;->fullpaths:Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;

    .line 191
    new-instance v8, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;

    array-length v9, p1

    div-int/lit8 v9, v9, 0x5

    invoke-direct {v8, v9}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;-><init>(I)V

    iput-object v8, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;->prefixes:Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;

    .line 197
    aget-object v8, p1, v10

    iget-object v8, v8, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->pathRaw:[B

    iput-object v8, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;->max:[B

    .line 198
    new-instance v2, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;

    const/4 v8, 0x0

    invoke-direct {v2, v8, v10}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;-><init>([BI)V

    .line 199
    .local v2, hasher:Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;
    move-object v0, p1

    .local v0, arr$:[Lorg/eclipse/jgit/treewalk/filter/PathFilter;
    array-length v5, v0

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_3

    aget-object v7, v0, v4

    .line 200
    .local v7, pf:Lorg/eclipse/jgit/treewalk/filter/PathFilter;
    iget-object v8, v7, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->pathRaw:[B

    iget-object v9, v7, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->pathRaw:[B

    array-length v9, v9

    invoke-virtual {v2, v8, v9}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->init([BI)V

    .line 201
    :cond_0
    :goto_1
    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 202
    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->nextHash()I

    move-result v1

    .line 203
    .local v1, hash:I
    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 204
    iget-object v8, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;->prefixes:Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;

    iget-object v9, v7, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->pathRaw:[B

    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->length()I

    move-result v10

    invoke-virtual {v8, v9, v10, v1}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->addIfAbsent([BII)[B

    goto :goto_1

    .line 206
    .end local v1           #hash:I
    :cond_1
    iget-object v8, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;->fullpaths:Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;

    iget-object v9, v7, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->pathRaw:[B

    iget-object v10, v7, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->pathRaw:[B

    array-length v10, v10

    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->getHash()I

    move-result v11

    invoke-virtual {v8, v9, v10, v11}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->addIfAbsent([BII)[B

    .line 208
    iget-object v8, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;->max:[B

    iget-object v9, v7, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->pathRaw:[B

    invoke-static {v8, v9}, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;->compare([B[B)I

    move-result v8

    if-gez v8, :cond_2

    .line 209
    iget-object v8, v7, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->pathRaw:[B

    iput-object v8, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;->max:[B

    .line 199
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 216
    .end local v7           #pf:Lorg/eclipse/jgit/treewalk/filter/PathFilter;
    :cond_3
    iget-object v8, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;->max:[B

    array-length v8, v8

    add-int/lit8 v8, v8, 0x1

    new-array v6, v8, [B

    .line 217
    .local v6, newMax:[B
    const/4 v3, 0x0

    .local v3, i:I
    :goto_2
    iget-object v8, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;->max:[B

    array-length v8, v8

    if-ge v3, v8, :cond_5

    .line 218
    iget-object v8, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;->max:[B

    aget-byte v8, v8, v3

    and-int/lit16 v8, v8, 0xff

    if-ge v8, v12, :cond_4

    .line 219
    aput-byte v12, v6, v3

    .line 217
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 221
    :cond_4
    iget-object v8, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;->max:[B

    aget-byte v8, v8, v3

    aput-byte v8, v6, v3

    goto :goto_3

    .line 222
    :cond_5
    array-length v8, v6

    add-int/lit8 v8, v8, -0x1

    aput-byte v12, v6, v8

    .line 223
    iput-object v6, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;->max:[B

    .line 224
    return-void
.end method

.method synthetic constructor <init>([Lorg/eclipse/jgit/treewalk/filter/PathFilter;Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 181
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;-><init>([Lorg/eclipse/jgit/treewalk/filter/PathFilter;)V

    return-void
.end method

.method private static compare([B[B)I
    .locals 6
    .parameter "a"
    .parameter "b"

    .prologue
    .line 227
    const/4 v3, 0x0

    .line 228
    .local v3, i:I
    :goto_0
    array-length v4, p0

    if-ge v3, v4, :cond_1

    array-length v4, p1

    if-ge v3, v4, :cond_1

    .line 229
    aget-byte v4, p0, v3

    and-int/lit16 v0, v4, 0xff

    .line 230
    .local v0, ba:I
    aget-byte v4, p1, v3

    and-int/lit16 v1, v4, 0xff

    .line 231
    .local v1, bb:I
    sub-int v2, v0, v1

    .line 232
    .local v2, cmp:I
    if-eqz v2, :cond_0

    .line 236
    .end local v0           #ba:I
    .end local v1           #bb:I
    .end local v2           #cmp:I
    :goto_1
    return v2

    .line 234
    .restart local v0       #ba:I
    .restart local v1       #bb:I
    .restart local v2       #cmp:I
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 235
    goto :goto_0

    .line 236
    .end local v0           #ba:I
    .end local v1           #bb:I
    .end local v2           #cmp:I
    :cond_1
    array-length v4, p0

    array-length v5, p1

    sub-int v2, v4, v5

    goto :goto_1
.end method


# virtual methods
.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 181
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;->clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 0

    .prologue
    .line 267
    return-object p0
.end method

.method public include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z
    .locals 7
    .parameter "walker"

    .prologue
    const/4 v4, 0x1

    .line 242
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawPath()[B

    move-result-object v3

    .line 243
    .local v3, rp:[B
    new-instance v2, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;

    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathLength()I

    move-result v5

    invoke-direct {v2, v3, v5}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;-><init>([BI)V

    .line 244
    .local v2, hasher:Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;
    :cond_0
    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 245
    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->nextHash()I

    move-result v1

    .line 246
    .local v1, hash:I
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;->fullpaths:Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;

    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->length()I

    move-result v6

    invoke-virtual {v5, v3, v6, v1}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->contains([BII)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 257
    .end local v1           #hash:I
    :goto_0
    return v4

    .line 248
    .restart local v1       #hash:I
    :cond_1
    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->hasNext()Z

    move-result v5

    if-nez v5, :cond_0

    .line 249
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;->prefixes:Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;

    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->length()I

    move-result v6

    invoke-virtual {v5, v3, v6, v1}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->contains([BII)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    .line 253
    .end local v1           #hash:I
    :cond_2
    iget-object v4, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;->max:[B

    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;->max:[B

    array-length v5, v5

    invoke-virtual {p1, v4, v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->isPathPrefix([BI)I

    move-result v0

    .line 254
    .local v0, cmp:I
    if-lez v0, :cond_3

    .line 255
    sget-object v4, Lorg/eclipse/jgit/errors/StopWalkException;->INSTANCE:Lorg/eclipse/jgit/errors/StopWalkException;

    throw v4

    .line 257
    :cond_3
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public shouldBeRecursive()Z
    .locals 1

    .prologue
    .line 262
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;->prefixes:Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 7

    .prologue
    .line 271
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 272
    .local v5, r:Ljava/lang/StringBuilder;
    const-string v6, "FAST("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    const/4 v1, 0x1

    .line 274
    .local v1, first:Z
    iget-object v6, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;->fullpaths:Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;

    invoke-virtual {v6}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->toArray()[[B

    move-result-object v0

    .local v0, arr$:[[B
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v4, v0, v2

    .line 275
    .local v4, p:[B
    if-nez v1, :cond_0

    .line 276
    const-string v6, " OR "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 278
    :cond_0
    invoke-static {v4}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([B)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    const/4 v1, 0x0

    .line 274
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 281
    .end local v4           #p:[B
    :cond_1
    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 282
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method
