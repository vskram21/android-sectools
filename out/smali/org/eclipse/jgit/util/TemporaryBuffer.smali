.class public abstract Lorg/eclipse/jgit/util/TemporaryBuffer;
.super Ljava/io/OutputStream;
.source "TemporaryBuffer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/util/TemporaryBuffer$Block;,
        Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;,
        Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;,
        Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;
    }
.end annotation


# static fields
.field protected static final DEFAULT_IN_CORE_LIMIT:I = 0x100000


# instance fields
.field private blocks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/eclipse/jgit/util/TemporaryBuffer$Block;",
            ">;"
        }
    .end annotation
.end field

.field private inCoreLimit:I

.field private overflow:Ljava/io/OutputStream;


# direct methods
.method protected constructor <init>(I)V
    .locals 0
    .parameter "limit"

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 92
    iput p1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->inCoreLimit:I

    .line 93
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->reset()V

    .line 94
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/util/TemporaryBuffer;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 66
    iget-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->blocks:Ljava/util/ArrayList;

    return-object v0
.end method

.method private inCoreLength()J
    .locals 5

    .prologue
    .line 199
    invoke-direct {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->last()Lorg/eclipse/jgit/util/TemporaryBuffer$Block;

    move-result-object v0

    .line 200
    .local v0, last:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    iget-object v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->blocks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    int-to-long v1, v1

    const-wide/16 v3, 0x1

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x2000

    mul-long/2addr v1, v3

    iget v3, v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->count:I

    int-to-long v3, v3

    add-long/2addr v1, v3

    return-wide v1
.end method

.method private last()Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    .locals 2

    .prologue
    .line 293
    iget-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->blocks:Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->blocks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;

    return-object v0
.end method

.method private reachedInCoreLimit()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 297
    invoke-direct {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->inCoreLength()J

    move-result-wide v0

    iget v2, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->inCoreLimit:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 298
    const/4 v0, 0x0

    .line 301
    :goto_0
    return v0

    .line 300
    :cond_0
    invoke-direct {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->switchToOverflow()V

    .line 301
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private switchToOverflow()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 305
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow()Ljava/io/OutputStream;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    .line 307
    iget-object v3, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->blocks:Ljava/util/ArrayList;

    iget-object v4, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->blocks:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;

    .line 308
    .local v2, last:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    iget-object v3, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->blocks:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;

    .line 309
    .local v0, b:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    iget-object v3, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    iget-object v4, v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->buffer:[B

    iget v5, v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->count:I

    invoke-virtual {v3, v4, v6, v5}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 310
    .end local v0           #b:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    :cond_0
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->blocks:Ljava/util/ArrayList;

    .line 312
    new-instance v3, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;

    iget-object v4, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    const/16 v5, 0x2000

    invoke-direct {v3, v4, v5}, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    iput-object v3, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    .line 313
    iget-object v3, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    iget-object v4, v2, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->buffer:[B

    iget v5, v2, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->count:I

    invoke-virtual {v3, v4, v6, v5}, Ljava/io/OutputStream;->write([BII)V

    .line 314
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 317
    iget-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    if-eqz v0, :cond_0

    .line 319
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 321
    iput-object v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    .line 324
    :cond_0
    return-void

    .line 321
    :catchall_0
    move-exception v0

    iput-object v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    throw v0
.end method

.method public copy(Ljava/io/InputStream;)V
    .locals 7
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 164
    iget-object v3, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->blocks:Ljava/util/ArrayList;

    if-eqz v3, :cond_0

    .line 166
    :goto_0
    invoke-direct {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->last()Lorg/eclipse/jgit/util/TemporaryBuffer$Block;

    move-result-object v1

    .line 167
    .local v1, s:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    invoke-virtual {v1}, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->isFull()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 168
    invoke-direct {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->reachedInCoreLimit()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 181
    .end local v1           #s:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    :cond_0
    const/16 v3, 0x2000

    new-array v2, v3, [B

    .line 183
    .local v2, tmp:[B
    :goto_1
    invoke-virtual {p1, v2}, Ljava/io/InputStream;->read([B)I

    move-result v0

    .local v0, n:I
    if-lez v0, :cond_3

    .line 184
    iget-object v3, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4, v0}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_1

    .line 170
    .end local v0           #n:I
    .end local v2           #tmp:[B
    .restart local v1       #s:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    :cond_1
    new-instance v1, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;

    .end local v1           #s:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    invoke-direct {v1}, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;-><init>()V

    .line 171
    .restart local v1       #s:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    iget-object v3, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->blocks:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 174
    :cond_2
    iget-object v3, v1, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->buffer:[B

    iget v4, v1, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->count:I

    iget-object v5, v1, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->buffer:[B

    array-length v5, v5

    iget v6, v1, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->count:I

    sub-int/2addr v5, v6

    invoke-virtual {p1, v3, v4, v5}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 175
    .restart local v0       #n:I
    const/4 v3, 0x1

    if-ge v0, v3, :cond_4

    .line 185
    .end local v1           #s:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    :cond_3
    return-void

    .line 177
    .restart local v1       #s:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    :cond_4
    iget v3, v1, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->count:I

    add-int/2addr v3, v0

    iput v3, v1, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->count:I

    goto :goto_0
.end method

.method public destroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 328
    iput-object v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->blocks:Ljava/util/ArrayList;

    .line 330
    iget-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    if-eqz v0, :cond_0

    .line 332
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 336
    iput-object v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    .line 339
    :cond_0
    :goto_0
    return-void

    .line 333
    :catch_0
    move-exception v0

    .line 336
    iput-object v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    goto :goto_0

    :catchall_0
    move-exception v0

    iput-object v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    throw v0
.end method

.method protected doFlush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    iget-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    if-nez v0, :cond_0

    .line 150
    invoke-direct {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->switchToOverflow()V

    .line 151
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 152
    return-void
.end method

.method public length()J
    .locals 2

    .prologue
    .line 195
    invoke-direct {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->inCoreLength()J

    move-result-wide v0

    return-wide v0
.end method

.method public openInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 265
    new-instance v0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;-><init>(Lorg/eclipse/jgit/util/TemporaryBuffer;)V

    return-object v0
.end method

.method protected abstract overflow()Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public reset()V
    .locals 3

    .prologue
    .line 270
    iget-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    if-eqz v0, :cond_0

    .line 271
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->destroy()V

    .line 273
    :cond_0
    iget v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->inCoreLimit:I

    const/16 v1, 0x2000

    if-ge v0, v1, :cond_1

    .line 274
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->blocks:Ljava/util/ArrayList;

    .line 275
    iget-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->blocks:Ljava/util/ArrayList;

    new-instance v1, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;

    iget v2, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->inCoreLimit:I

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 280
    :goto_0
    return-void

    .line 277
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    iget v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->inCoreLimit:I

    div-int/lit16 v1, v1, 0x2000

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->blocks:Ljava/util/ArrayList;

    .line 278
    iget-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->blocks:Ljava/util/ArrayList;

    new-instance v1, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;

    invoke-direct {v1}, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;-><init>()V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public toByteArray()[B
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 215
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->length()J

    move-result-wide v2

    .line 216
    .local v2, len:J
    const-wide/32 v6, 0x7fffffff

    cmp-long v6, v6, v2

    if-gez v6, :cond_0

    .line 217
    new-instance v6, Ljava/lang/OutOfMemoryError;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->lengthExceedsMaximumArraySize:Ljava/lang/String;

    invoke-direct {v6, v7}, Ljava/lang/OutOfMemoryError;-><init>(Ljava/lang/String;)V

    throw v6

    .line 218
    :cond_0
    long-to-int v6, v2

    new-array v4, v6, [B

    .line 219
    .local v4, out:[B
    const/4 v5, 0x0

    .line 220
    .local v5, outPtr:I
    iget-object v6, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->blocks:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;

    .line 221
    .local v0, b:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    iget-object v6, v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->buffer:[B

    const/4 v7, 0x0

    iget v8, v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->count:I

    invoke-static {v6, v7, v4, v5, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 222
    iget v6, v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->count:I

    add-int/2addr v5, v6

    .line 223
    goto :goto_0

    .line 224
    .end local v0           #b:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    :cond_1
    return-object v4
.end method

.method public write(I)V
    .locals 4
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 98
    iget-object v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    if-eqz v1, :cond_0

    .line 99
    iget-object v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    invoke-virtual {v1, p1}, Ljava/io/OutputStream;->write(I)V

    .line 114
    :goto_0
    return-void

    .line 103
    :cond_0
    invoke-direct {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->last()Lorg/eclipse/jgit/util/TemporaryBuffer$Block;

    move-result-object v0

    .line 104
    .local v0, s:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    invoke-virtual {v0}, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->isFull()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 105
    invoke-direct {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->reachedInCoreLimit()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 106
    iget-object v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    invoke-virtual {v1, p1}, Ljava/io/OutputStream;->write(I)V

    goto :goto_0

    .line 110
    :cond_1
    new-instance v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;

    .end local v0           #s:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    invoke-direct {v0}, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;-><init>()V

    .line 111
    .restart local v0       #s:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    iget-object v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->blocks:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 113
    :cond_2
    iget-object v1, v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->buffer:[B

    iget v2, v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->count:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->count:I

    int-to-byte v3, p1

    aput-byte v3, v1, v2

    goto :goto_0
.end method

.method public write([BII)V
    .locals 4
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    iget-object v2, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    if-nez v2, :cond_0

    .line 119
    :goto_0
    if-lez p3, :cond_0

    .line 120
    invoke-direct {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->last()Lorg/eclipse/jgit/util/TemporaryBuffer$Block;

    move-result-object v1

    .line 121
    .local v1, s:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    invoke-virtual {v1}, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->isFull()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 122
    invoke-direct {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->reachedInCoreLimit()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 137
    .end local v1           #s:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    :cond_0
    if-lez p3, :cond_1

    .line 138
    iget-object v2, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->overflow:Ljava/io/OutputStream;

    invoke-virtual {v2, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 139
    :cond_1
    return-void

    .line 125
    .restart local v1       #s:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    :cond_2
    new-instance v1, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;

    .end local v1           #s:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    invoke-direct {v1}, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;-><init>()V

    .line 126
    .restart local v1       #s:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    iget-object v2, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->blocks:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    :cond_3
    iget-object v2, v1, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->buffer:[B

    array-length v2, v2

    iget v3, v1, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->count:I

    sub-int/2addr v2, v3

    invoke-static {v2, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 130
    .local v0, n:I
    iget-object v2, v1, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->buffer:[B

    iget v3, v1, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->count:I

    invoke-static {p1, p2, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 131
    iget v2, v1, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->count:I

    add-int/2addr v2, v0

    iput v2, v1, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->count:I

    .line 132
    sub-int/2addr p3, v0

    .line 133
    add-int/2addr p2, v0

    .line 134
    goto :goto_0
.end method

.method public writeTo(Ljava/io/OutputStream;Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 5
    .parameter "os"
    .parameter "pm"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 245
    if-nez p2, :cond_0

    .line 246
    sget-object p2, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    .line 247
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/util/TemporaryBuffer;->blocks:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;

    .line 248
    .local v0, b:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    iget-object v2, v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->buffer:[B

    const/4 v3, 0x0

    iget v4, v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->count:I

    invoke-virtual {p1, v2, v3, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 249
    iget v2, v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->count:I

    div-int/lit16 v2, v2, 0x400

    invoke-interface {p2, v2}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto :goto_0

    .line 251
    .end local v0           #b:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;
    :cond_1
    return-void
.end method
