.class public abstract Lorg/eclipse/jgit/lib/ObjectLoader;
.super Ljava/lang/Object;
.source "ObjectLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/lib/ObjectLoader$SmallObject;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 282
    return-void
.end method

.method private static cloneArray([B)[B
    .locals 3
    .parameter "data"

    .prologue
    const/4 v2, 0x0

    .line 271
    array-length v1, p0

    new-array v0, v1, [B

    .line 272
    .local v0, copy:[B
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 273
    return-object v0
.end method


# virtual methods
.method public copyTo(Ljava/io/OutputStream;)V
    .locals 9
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 247
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectLoader;->isLarge()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 248
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectLoader;->openStream()Lorg/eclipse/jgit/lib/ObjectStream;

    move-result-object v2

    .line 250
    .local v2, in:Lorg/eclipse/jgit/lib/ObjectStream;
    :try_start_0
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectStream;->getSize()J

    move-result-wide v4

    .line 251
    .local v4, sz:J
    const/16 v7, 0x2000

    new-array v6, v7, [B

    .line 252
    .local v6, tmp:[B
    const-wide/16 v0, 0x0

    .line 253
    .local v0, copied:J
    :goto_0
    cmp-long v7, v0, v4

    if-gez v7, :cond_1

    .line 254
    invoke-virtual {v2, v6}, Lorg/eclipse/jgit/lib/ObjectStream;->read([B)I

    move-result v3

    .line 255
    .local v3, n:I
    if-gez v3, :cond_0

    .line 256
    new-instance v7, Ljava/io/EOFException;

    invoke-direct {v7}, Ljava/io/EOFException;-><init>()V

    throw v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 263
    .end local v0           #copied:J
    .end local v3           #n:I
    .end local v4           #sz:J
    .end local v6           #tmp:[B
    :catchall_0
    move-exception v7

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectStream;->close()V

    throw v7

    .line 257
    .restart local v0       #copied:J
    .restart local v3       #n:I
    .restart local v4       #sz:J
    .restart local v6       #tmp:[B
    :cond_0
    const/4 v7, 0x0

    :try_start_1
    invoke-virtual {p1, v6, v7, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 258
    int-to-long v7, v3

    add-long/2addr v0, v7

    .line 259
    goto :goto_0

    .line 260
    .end local v3           #n:I
    :cond_1
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectStream;->read()I

    move-result v7

    if-ltz v7, :cond_2

    .line 261
    new-instance v7, Ljava/io/EOFException;

    invoke-direct {v7}, Ljava/io/EOFException;-><init>()V

    throw v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 263
    :cond_2
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectStream;->close()V

    .line 268
    .end local v0           #copied:J
    .end local v2           #in:Lorg/eclipse/jgit/lib/ObjectStream;
    .end local v4           #sz:J
    .end local v6           #tmp:[B
    :goto_1
    return-void

    .line 266
    :cond_3
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes()[B

    move-result-object v7

    invoke-virtual {p1, v7}, Ljava/io/OutputStream;->write([B)V

    goto :goto_1
.end method

.method public final getBytes()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/LargeObjectException;
        }
    .end annotation

    .prologue
    .line 100
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes()[B

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectLoader;->cloneArray([B)[B

    move-result-object v0

    return-object v0
.end method

.method public final getBytes(I)[B
    .locals 3
    .parameter "sizeLimit"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/LargeObjectException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes(I)[B

    move-result-object v0

    .line 132
    .local v0, cached:[B
    :try_start_0
    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectLoader;->cloneArray([B)[B
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    return-object v2

    .line 133
    :catch_0
    move-exception v1

    .line 134
    .local v1, tooBig:Ljava/lang/OutOfMemoryError;
    new-instance v2, Lorg/eclipse/jgit/errors/LargeObjectException$OutOfMemory;

    invoke-direct {v2, v1}, Lorg/eclipse/jgit/errors/LargeObjectException$OutOfMemory;-><init>(Ljava/lang/OutOfMemoryError;)V

    throw v2
.end method

.method public abstract getCachedBytes()[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/LargeObjectException;
        }
    .end annotation
.end method

.method public getCachedBytes(I)[B
    .locals 8
    .parameter "sizeLimit"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/LargeObjectException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 184
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectLoader;->isLarge()Z

    move-result v5

    if-nez v5, :cond_0

    .line 185
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes()[B

    move-result-object v0

    .line 206
    :goto_0
    return-object v0

    .line 187
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectLoader;->openStream()Lorg/eclipse/jgit/lib/ObjectStream;

    move-result-object v1

    .line 189
    .local v1, in:Lorg/eclipse/jgit/lib/ObjectStream;
    :try_start_0
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectStream;->getSize()J

    move-result-wide v3

    .line 190
    .local v3, sz:J
    int-to-long v5, p1

    cmp-long v5, v5, v3

    if-gez v5, :cond_1

    .line 191
    new-instance v5, Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsLimit;

    int-to-long v6, p1

    invoke-direct {v5, v6, v7, v3, v4}, Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsLimit;-><init>(JJ)V

    throw v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 206
    .end local v3           #sz:J
    :catchall_0
    move-exception v5

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectStream;->close()V

    throw v5

    .line 193
    .restart local v3       #sz:J
    :cond_1
    const-wide/32 v5, 0x7fffffff

    cmp-long v5, v5, v3

    if-gez v5, :cond_2

    .line 194
    :try_start_1
    new-instance v5, Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsByteArrayLimit;

    invoke-direct {v5}, Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsByteArrayLimit;-><init>()V

    throw v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 198
    :cond_2
    long-to-int v5, v3

    :try_start_2
    new-array v0, v5, [B
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_0

    .line 203
    .local v0, buf:[B
    const/4 v5, 0x0

    :try_start_3
    array-length v6, v0

    invoke-static {v1, v0, v5, v6}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 206
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectStream;->close()V

    goto :goto_0

    .line 199
    .end local v0           #buf:[B
    :catch_0
    move-exception v2

    .line 200
    .local v2, notEnoughHeap:Ljava/lang/OutOfMemoryError;
    :try_start_4
    new-instance v5, Lorg/eclipse/jgit/errors/LargeObjectException$OutOfMemory;

    invoke-direct {v5, v2}, Lorg/eclipse/jgit/errors/LargeObjectException$OutOfMemory;-><init>(Ljava/lang/OutOfMemoryError;)V

    throw v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
.end method

.method public abstract getSize()J
.end method

.method public abstract getType()I
.end method

.method public isLarge()Z
    .locals 2

    .prologue
    .line 80
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes()[B
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/LargeObjectException; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    const/4 v1, 0x0

    .line 83
    :goto_0
    return v1

    .line 82
    :catch_0
    move-exception v0

    .line 83
    .local v0, tooBig:Lorg/eclipse/jgit/errors/LargeObjectException;
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public abstract openStream()Lorg/eclipse/jgit/lib/ObjectStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method
