.class public Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
.super Lorg/eclipse/jgit/transport/PackedObjectInfo;
.source "ObjectToPack.java"


# static fields
.field private static final ATTEMPT_DELTA_MASK:I = 0x3

.field private static final DELTA_ATTEMPTED:I = 0x2

.field private static final DELTA_SHIFT:I = 0xc

.field private static final DO_NOT_DELTA:I = 0x4

.field private static final EDGE:I = 0x8

.field private static final EXT_MASK:I = 0xf

.field private static final EXT_SHIFT:I = 0x8

.field private static final NON_DELTA_MASK:I = 0xfff

.field private static final NON_EXT_MASK:I = -0xf01

.field private static final REUSE_AS_IS:I = 0x1

.field private static final TYPE_SHIFT:I = 0x5


# instance fields
.field private cachedDelta:Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;

.field private deltaBase:Lorg/eclipse/jgit/lib/ObjectId;

.field private flags:I

.field private pathHash:I


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;I)V
    .locals 1
    .parameter "src"
    .parameter "type"

    .prologue
    .line 106
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/PackedObjectInfo;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 107
    shl-int/lit8 v0, p2, 0x5

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    .line 108
    return-void
.end method


# virtual methods
.method final clearChainLength()V
    .locals 1

    .prologue
    .line 206
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    and-int/lit16 v0, v0, 0xfff

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    .line 207
    return-void
.end method

.method final clearDeltaBase()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 157
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->deltaBase:Lorg/eclipse/jgit/lib/ObjectId;

    .line 159
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->cachedDelta:Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;

    if-eqz v0, :cond_0

    .line 160
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->cachedDelta:Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;->clear()V

    .line 161
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->cachedDelta:Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;->enqueue()Z

    .line 162
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->cachedDelta:Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;

    .line 164
    :cond_0
    return-void
.end method

.method protected final clearExtendedFlag(I)V
    .locals 2
    .parameter "flag"

    .prologue
    .line 310
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    and-int/lit8 v1, p1, 0xf

    shl-int/lit8 v1, v1, 0x8

    xor-int/lit8 v1, v1, -0x1

    and-int/2addr v0, v1

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    .line 311
    return-void
.end method

.method protected clearReuseAsIs()V
    .locals 1

    .prologue
    .line 237
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    .line 238
    return-void
.end method

.method final doNotAttemptDelta()Z
    .locals 2

    .prologue
    .line 258
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    and-int/lit8 v0, v0, 0x3

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method final getCachedSize()I
    .locals 1

    .prologue
    .line 354
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->pathHash:I

    return v0
.end method

.method final getChainLength()I
    .locals 1

    .prologue
    .line 198
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getDeltaDepth()I

    move-result v0

    return v0
.end method

.method public final getDeltaBase()Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    .locals 1

    .prologue
    .line 126
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->deltaBase:Lorg/eclipse/jgit/lib/ObjectId;

    instance-of v0, v0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    if-eqz v0, :cond_0

    .line 127
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->deltaBase:Lorg/eclipse/jgit/lib/ObjectId;

    check-cast v0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 128
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final getDeltaBaseId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->deltaBase:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method final getDeltaDepth()I
    .locals 1

    .prologue
    .line 190
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    ushr-int/lit8 v0, v0, 0xc

    return v0
.end method

.method protected final getExtendedFlags()I
    .locals 1

    .prologue
    .line 270
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    ushr-int/lit8 v0, v0, 0x8

    and-int/lit8 v0, v0, 0xf

    return v0
.end method

.method final getFormat()I
    .locals 1

    .prologue
    .line 328
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isReuseAsIs()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 329
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isDeltaRepresentation()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 330
    const/4 v0, 0x0

    .line 333
    :goto_0
    return v0

    .line 331
    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    .line 333
    :cond_1
    const/4 v0, 0x2

    goto :goto_0
.end method

.method final getPathHash()I
    .locals 1

    .prologue
    .line 346
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->pathHash:I

    return v0
.end method

.method public final getType()I
    .locals 1

    .prologue
    .line 186
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    shr-int/lit8 v0, v0, 0x5

    and-int/lit8 v0, v0, 0x7

    return v0
.end method

.method final getWeight()I
    .locals 1

    .prologue
    .line 338
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getCRC()I

    move-result v0

    return v0
.end method

.method public final isDeltaRepresentation()Z
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->deltaBase:Lorg/eclipse/jgit/lib/ObjectId;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method final isDoNotDelta()Z
    .locals 1

    .prologue
    .line 241
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method final isEdge()Z
    .locals 1

    .prologue
    .line 249
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected final isExtendedFlag(I)Z
    .locals 2
    .parameter "flag"

    .prologue
    .line 284
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    shl-int/lit8 v1, p1, 0x8

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final isReuseAsIs()Z
    .locals 1

    .prologue
    .line 222
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final isWritten()Z
    .locals 4

    .prologue
    .line 181
    const-wide/16 v0, 0x1

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getOffset()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method final markWantWrite()V
    .locals 2

    .prologue
    .line 214
    const-wide/16 v0, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setOffset(J)V

    .line 215
    return-void
.end method

.method final popCachedDelta()Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;
    .locals 2

    .prologue
    .line 150
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->cachedDelta:Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;

    .line 151
    .local v0, r:Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;
    if-eqz v0, :cond_0

    .line 152
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->cachedDelta:Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;

    .line 153
    :cond_0
    return-object v0
.end method

.method public select(Lorg/eclipse/jgit/internal/storage/pack/StoredObjectRepresentation;)V
    .locals 0
    .parameter "ref"

    .prologue
    .line 374
    return-void
.end method

.method final setCachedDelta(Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;)V
    .locals 0
    .parameter "data"

    .prologue
    .line 146
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->cachedDelta:Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;

    .line 147
    return-void
.end method

.method final setCachedSize(I)V
    .locals 0
    .parameter "sz"

    .prologue
    .line 358
    iput p1, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->pathHash:I

    .line 359
    return-void
.end method

.method final setChainLength(I)V
    .locals 0
    .parameter "len"

    .prologue
    .line 202
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setDeltaDepth(I)V

    .line 203
    return-void
.end method

.method final setDeltaAttempted(Z)V
    .locals 1
    .parameter "deltaAttempted"

    .prologue
    .line 262
    if-eqz p1, :cond_0

    .line 263
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    .line 266
    :goto_0
    return-void

    .line 265
    :cond_0
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    goto :goto_0
.end method

.method final setDeltaBase(Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 0
    .parameter "deltaBase"

    .prologue
    .line 142
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->deltaBase:Lorg/eclipse/jgit/lib/ObjectId;

    .line 143
    return-void
.end method

.method final setDeltaDepth(I)V
    .locals 2
    .parameter "d"

    .prologue
    .line 194
    shl-int/lit8 v0, p1, 0xc

    iget v1, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    and-int/lit16 v1, v1, 0xfff

    or-int/2addr v0, v1

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    .line 195
    return-void
.end method

.method final setDoNotDelta()V
    .locals 1

    .prologue
    .line 245
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    .line 246
    return-void
.end method

.method final setEdge()V
    .locals 1

    .prologue
    .line 253
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    .line 254
    return-void
.end method

.method protected final setExtendedFlag(I)V
    .locals 2
    .parameter "flag"

    .prologue
    .line 297
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    and-int/lit8 v1, p1, 0xf

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    .line 298
    return-void
.end method

.method protected final setExtendedFlags(I)V
    .locals 2
    .parameter "extFlags"

    .prologue
    .line 324
    and-int/lit8 v0, p1, 0xf

    shl-int/lit8 v0, v0, 0x8

    iget v1, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    and-int/lit16 v1, v1, -0xf01

    or-int/2addr v0, v1

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    .line 325
    return-void
.end method

.method final setPathHash(I)V
    .locals 0
    .parameter "hc"

    .prologue
    .line 350
    iput p1, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->pathHash:I

    .line 351
    return-void
.end method

.method final setReuseAsIs()V
    .locals 1

    .prologue
    .line 226
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->flags:I

    .line 227
    return-void
.end method

.method final setWeight(I)V
    .locals 0
    .parameter "weight"

    .prologue
    .line 342
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setCRC(I)V

    .line 343
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 379
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 380
    .local v0, buf:Ljava/lang/StringBuilder;
    const-string v1, "ObjectToPack["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 381
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getType()I

    move-result v1

    invoke-static {v1}, Lorg/eclipse/jgit/lib/Constants;->typeString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 382
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 383
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 384
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->wantWrite()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 385
    const-string v1, " wantWrite"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 386
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isReuseAsIs()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 387
    const-string v1, " reuseAsIs"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 388
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isDoNotDelta()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 389
    const-string v1, " doNotDelta"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    :cond_2
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isEdge()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 391
    const-string v1, " edge"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 392
    :cond_3
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getDeltaDepth()I

    move-result v1

    if-lez v1, :cond_4

    .line 393
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " depth="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getDeltaDepth()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 394
    :cond_4
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isDeltaRepresentation()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 395
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getDeltaBase()Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    move-result-object v1

    if-eqz v1, :cond_7

    .line 396
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " base=inpack:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getDeltaBase()Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 400
    :cond_5
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isWritten()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 401
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " offset="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getOffset()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 402
    :cond_6
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 403
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 398
    :cond_7
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " base=edge:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getDeltaBaseId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method final wantWrite()Z
    .locals 4

    .prologue
    .line 210
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getOffset()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
