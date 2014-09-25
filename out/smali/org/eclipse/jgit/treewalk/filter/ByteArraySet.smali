.class Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;
.super Ljava/lang/Object;
.source "ByteArraySet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;
    }
.end annotation


# instance fields
.field private grow:I

.field private hasher:Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;

.field private mask:I

.field private size:I

.field private table:[[B


# direct methods
.method constructor <init>(I)V
    .locals 3
    .parameter "capacity"

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 192
    new-instance v0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;-><init>([BI)V

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->hasher:Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;

    .line 77
    const/4 v0, 0x1

    mul-int/lit8 v1, p1, 0x2

    add-int/lit8 v1, v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result v1

    shl-int/2addr v0, v1

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->initTable(I)V

    .line 78
    return-void
.end method

.method private chainlength([B)I
    .locals 8
    .parameter "b"

    .prologue
    .line 237
    new-instance v0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;

    array-length v7, p1

    invoke-direct {v0, p1, v7}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;-><init>([BI)V

    .line 238
    .local v0, h:Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;
    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->hash()I

    move-result v1

    .line 239
    .local v1, hash:I
    iget v3, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->mask:I

    .line 240
    .local v3, msk:I
    and-int v2, v1, v3

    .line 241
    .local v2, i:I
    iget-object v6, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->table:[[B

    .line 244
    .local v6, tbl:[[B
    const/4 v4, 0x0

    .line 245
    .local v4, n:I
    :goto_0
    aget-object v5, v6, v2

    .local v5, obj:[B
    if-eqz v5, :cond_1

    .line 246
    array-length v7, p1

    invoke-static {v5, p1, v7}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->equals([B[BI)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 251
    .end local v4           #n:I
    :goto_1
    return v4

    .line 248
    .restart local v4       #n:I
    :cond_0
    add-int/lit8 v7, v2, 0x1

    and-int v2, v7, v3

    .line 249
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 251
    :cond_1
    const/4 v4, -0x1

    goto :goto_1
.end method

.method private static copyIfNotSameSize([BI)[B
    .locals 3
    .parameter "newValue"
    .parameter "length"

    .prologue
    const/4 v2, 0x0

    .line 164
    array-length v1, p0

    if-ne v1, p1, :cond_0

    .line 168
    .end local p0
    :goto_0
    return-object p0

    .line 166
    .restart local p0
    :cond_0
    new-array v0, p1, [B

    .line 167
    .local v0, ret:[B
    invoke-static {p0, v2, v0, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object p0, v0

    .line 168
    goto :goto_0
.end method

.method private static equals([B[BI)Z
    .locals 4
    .parameter "storedObj"
    .parameter "toFind"
    .parameter "length"

    .prologue
    const/4 v1, 0x0

    .line 95
    array-length v2, p0

    if-ne v2, p2, :cond_0

    array-length v2, p1

    if-ge v2, p2, :cond_1

    .line 101
    :cond_0
    :goto_0
    return v1

    .line 97
    :cond_1
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-ge v0, p2, :cond_2

    .line 98
    aget-byte v2, p0, v0

    aget-byte v3, p1, v0

    if-ne v2, v3, :cond_0

    .line 97
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 101
    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private get([BII)[B
    .locals 5
    .parameter "toFind"
    .parameter "length"
    .parameter "hash"

    .prologue
    .line 81
    iget v1, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->mask:I

    .line 82
    .local v1, msk:I
    and-int v0, p3, v1

    .line 83
    .local v0, i:I
    iget-object v3, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->table:[[B

    .line 86
    .local v3, tbl:[[B
    :goto_0
    aget-object v2, v3, v0

    .local v2, obj:[B
    if-eqz v2, :cond_1

    .line 87
    invoke-static {v2, p1, p2}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->equals([B[BI)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 91
    .end local v2           #obj:[B
    :goto_1
    return-object v2

    .line 89
    .restart local v2       #obj:[B
    :cond_0
    add-int/lit8 v4, v0, 0x1

    and-int v0, v4, v1

    goto :goto_0

    .line 91
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private grow()V
    .locals 6

    .prologue
    .line 195
    iget-object v3, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->table:[[B

    .line 196
    .local v3, oldTable:[[B
    iget-object v4, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->table:[[B

    array-length v2, v4

    .line 198
    .local v2, oldSize:I
    shl-int/lit8 v4, v2, 0x1

    invoke-direct {p0, v4}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->initTable(I)V

    .line 199
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v2, :cond_1

    .line 200
    aget-object v1, v3, v0

    .line 201
    .local v1, obj:[B
    if-eqz v1, :cond_0

    .line 202
    iget-object v4, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->hasher:Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;

    array-length v5, v1

    invoke-virtual {v4, v1, v5}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->init([BI)V

    .line 203
    iget-object v4, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->hasher:Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->hash()I

    move-result v4

    invoke-direct {p0, v1, v4}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->insert([BI)V

    .line 199
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 206
    .end local v1           #obj:[B
    :cond_1
    return-void
.end method

.method private initTable(I)V
    .locals 1
    .parameter "sz"

    .prologue
    .line 209
    const/4 v0, 0x2

    if-ge p1, v0, :cond_0

    .line 210
    const/4 p1, 0x2

    .line 211
    :cond_0
    shr-int/lit8 v0, p1, 0x1

    iput v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->grow:I

    .line 212
    add-int/lit8 v0, p1, -0x1

    iput v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->mask:I

    .line 213
    new-array v0, p1, [[B

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->table:[[B

    .line 214
    return-void
.end method

.method private insert([BI)V
    .locals 4
    .parameter "newValue"
    .parameter "hash"

    .prologue
    .line 184
    iget v1, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->mask:I

    .line 185
    .local v1, msk:I
    and-int v0, p2, v1

    .line 186
    .local v0, j:I
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->table:[[B

    .line 187
    .local v2, tbl:[[B
    :goto_0
    aget-object v3, v2, v0

    if-eqz v3, :cond_0

    .line 188
    add-int/lit8 v3, v0, 0x1

    and-int v0, v3, v1

    goto :goto_0

    .line 189
    :cond_0
    aput-object p1, v2, v0

    .line 190
    return-void
.end method


# virtual methods
.method addIfAbsent([BII)[B
    .locals 7
    .parameter "newValue"
    .parameter "length"
    .parameter "hash"

    .prologue
    .line 143
    iget v1, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->mask:I

    .line 144
    .local v1, msk:I
    and-int v0, p3, v1

    .line 145
    .local v0, i:I
    iget-object v3, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->table:[[B

    .line 148
    .local v3, tbl:[[B
    :goto_0
    aget-object v2, v3, v0

    .local v2, obj:[B
    if-eqz v2, :cond_1

    .line 149
    invoke-static {v2, p1, p2}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->equals([B[BI)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 160
    .end local v2           #obj:[B
    :goto_1
    return-object v2

    .line 151
    .restart local v2       #obj:[B
    :cond_0
    add-int/lit8 v5, v0, 0x1

    and-int v0, v5, v1

    goto :goto_0

    .line 154
    :cond_1
    invoke-static {p1, p2}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->copyIfNotSameSize([BI)[B

    move-result-object v4

    .line 155
    .local v4, valueToInsert:[B
    iget v5, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->size:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->size:I

    iget v6, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->grow:I

    if-ne v5, v6, :cond_2

    .line 156
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->grow()V

    .line 157
    invoke-direct {p0, v4, p3}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->insert([BI)V

    :goto_2
    move-object v2, v4

    .line 160
    goto :goto_1

    .line 159
    :cond_2
    aput-object v4, v3, v0

    goto :goto_2
.end method

.method contains([BII)Z
    .locals 1
    .parameter "toFind"
    .parameter "length"
    .parameter "hash"

    .prologue
    .line 116
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->get([BII)[B

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isEmpty()Z
    .locals 1

    .prologue
    .line 180
    iget v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method size()I
    .locals 1

    .prologue
    .line 175
    iget v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->size:I

    return v0
.end method

.method toArray()[[B
    .locals 8

    .prologue
    .line 317
    iget v7, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->size:I

    new-array v6, v7, [[B

    .line 318
    .local v6, ret:[[B
    const/4 v2, 0x0

    .line 319
    .local v2, i:I
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->table:[[B

    .local v0, arr$:[[B
    array-length v5, v0

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    move v3, v2

    .end local v2           #i:I
    .local v3, i:I
    :goto_0
    if-ge v4, v5, :cond_0

    aget-object v1, v0, v4

    .line 320
    .local v1, entry:[B
    if-eqz v1, :cond_1

    .line 321
    add-int/lit8 v2, v3, 0x1

    .end local v3           #i:I
    .restart local v2       #i:I
    aput-object v1, v6, v3

    .line 319
    :goto_1
    add-int/lit8 v4, v4, 0x1

    move v3, v2

    .end local v2           #i:I
    .restart local v3       #i:I
    goto :goto_0

    .line 323
    .end local v1           #entry:[B
    :cond_0
    return-object v6

    .restart local v1       #entry:[B
    :cond_1
    move v2, v3

    .end local v3           #i:I
    .restart local v2       #i:I
    goto :goto_1
.end method

.method public toString()Ljava/lang/String;
    .locals 8

    .prologue
    const/16 v7, 0x22

    .line 218
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 219
    .local v4, sb:Ljava/lang/StringBuilder;
    const/16 v5, 0x5b

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 220
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->table:[[B

    .local v0, arr$:[[B
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_2

    aget-object v1, v0, v2

    .line 221
    .local v1, b:[B
    if-nez v1, :cond_0

    .line 220
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 223
    :cond_0
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_1

    .line 224
    const-string v5, " , "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    :cond_1
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 226
    invoke-static {v1}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([B)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 228
    const/16 v5, 0x28

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 229
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;->chainlength([B)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 230
    const/16 v5, 0x29

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 232
    .end local v1           #b:[B
    :cond_2
    const/16 v5, 0x5d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 233
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method
