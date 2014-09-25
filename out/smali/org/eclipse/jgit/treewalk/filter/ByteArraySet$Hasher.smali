.class Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;
.super Ljava/lang/Object;
.source "ByteArraySet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/treewalk/filter/ByteArraySet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Hasher"
.end annotation


# instance fields
.field private data:[B

.field private hash:I

.field private length:I

.field private pos:I


# direct methods
.method constructor <init>([BI)V
    .locals 0
    .parameter "data"
    .parameter "length"

    .prologue
    .line 266
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 267
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->init([BI)V

    .line 268
    return-void
.end method


# virtual methods
.method getHash()I
    .locals 1

    .prologue
    .line 293
    iget v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->hash:I

    return v0
.end method

.method hasNext()Z
    .locals 2

    .prologue
    .line 297
    iget v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->pos:I

    iget v1, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->length:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method hash()I
    .locals 4

    .prologue
    .line 278
    :goto_0
    iget v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->pos:I

    iget v1, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->length:I

    if-ge v0, v1, :cond_0

    .line 279
    iget v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->hash:I

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->data:[B

    iget v2, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->pos:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->pos:I

    aget-byte v1, v1, v2

    add-int/2addr v0, v1

    iput v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->hash:I

    goto :goto_0

    .line 280
    :cond_0
    iget v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->hash:I

    return v0
.end method

.method init([BI)V
    .locals 1
    .parameter "d"
    .parameter "l"

    .prologue
    const/4 v0, 0x0

    .line 271
    iput-object p1, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->data:[B

    .line 272
    iput p2, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->length:I

    .line 273
    iput v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->pos:I

    .line 274
    iput v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->hash:I

    .line 275
    return-void
.end method

.method public length()I
    .locals 1

    .prologue
    .line 301
    iget v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->pos:I

    return v0
.end method

.method nextHash()I
    .locals 3

    .prologue
    .line 285
    :cond_0
    iget v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->hash:I

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->data:[B

    iget v2, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->pos:I

    aget-byte v1, v1, v2

    add-int/2addr v0, v1

    iput v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->hash:I

    .line 286
    iget v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->pos:I

    .line 287
    iget v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->pos:I

    iget v1, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->length:I

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->data:[B

    iget v1, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->pos:I

    aget-byte v0, v0, v1

    const/16 v1, 0x2f

    if-ne v0, v1, :cond_0

    .line 288
    :cond_1
    iget v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->hash:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 306
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 307
    .local v1, sb:Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v2, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->pos:I

    if-ge v0, v2, :cond_0

    .line 308
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->data:[B

    aget-byte v2, v2, v0

    int-to-char v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 307
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 309
    :cond_0
    const-string v2, " | "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    iget v0, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->pos:I

    :goto_1
    iget v2, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->length:I

    if-ge v0, v2, :cond_1

    .line 311
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/filter/ByteArraySet$Hasher;->data:[B

    aget-byte v2, v2, v0

    int-to-char v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 310
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 312
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
