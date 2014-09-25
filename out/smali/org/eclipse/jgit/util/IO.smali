.class public Lorg/eclipse/jgit/util/IO;
.super Ljava/lang/Object;
.source "IO.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 374
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 376
    return-void
.end method

.method public static read(Ljava/nio/channels/ReadableByteChannel;[BII)I
    .locals 3
    .parameter "channel"
    .parameter "dst"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 271
    if-nez p3, :cond_1

    .line 272
    const/4 v0, 0x0

    .line 282
    :cond_0
    :goto_0
    return v0

    .line 273
    :cond_1
    const/4 v0, 0x0

    .line 274
    .local v0, cnt:I
    :goto_1
    if-lez p3, :cond_2

    .line 275
    invoke-static {p1, p2, p3}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-interface {p0, v2}, Ljava/nio/channels/ReadableByteChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v1

    .line 276
    .local v1, r:I
    if-gtz v1, :cond_3

    .line 282
    .end local v1           #r:I
    :cond_2
    if-nez v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    .line 278
    .restart local v1       #r:I
    :cond_3
    add-int/2addr p2, v1

    .line 279
    sub-int/2addr p3, v1

    .line 280
    add-int/2addr v0, v1

    .line 281
    goto :goto_1
.end method

.method public static readFully(Ljava/io/InputStream;[BI)I
    .locals 3
    .parameter "fd"
    .parameter "dst"
    .parameter "off"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 301
    const/4 v0, 0x0

    .line 302
    .local v0, len:I
    :goto_0
    array-length v2, p1

    sub-int/2addr v2, p2

    invoke-virtual {p0, p1, p2, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .local v1, r:I
    if-ltz v1, :cond_0

    array-length v2, p1

    if-ge v0, v2, :cond_0

    .line 304
    add-int/2addr p2, v1

    .line 305
    add-int/2addr v0, v1

    goto :goto_0

    .line 307
    :cond_0
    return v0
.end method

.method public static readFully(Ljava/io/InputStream;[BII)V
    .locals 3
    .parameter "fd"
    .parameter "dst"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 245
    :goto_0
    if-lez p3, :cond_1

    .line 246
    invoke-virtual {p0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 247
    .local v0, r:I
    if-gtz v0, :cond_0

    .line 248
    new-instance v1, Ljava/io/EOFException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->shortReadOfBlock:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 249
    :cond_0
    add-int/2addr p2, v0

    .line 250
    sub-int/2addr p3, v0

    .line 251
    goto :goto_0

    .line 252
    .end local v0           #r:I
    :cond_1
    return-void
.end method

.method public static final readFully(Ljava/io/File;)[B
    .locals 1
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 80
    const v0, 0x7fffffff

    invoke-static {p0, v0}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/File;I)[B

    move-result-object v0

    return-object v0
.end method

.method public static final readFully(Ljava/io/File;I)[B
    .locals 12
    .parameter "path"
    .parameter "max"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 140
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 142
    .local v1, in:Ljava/io/FileInputStream;
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v8

    const-wide/16 v10, 0x1

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    .line 143
    .local v5, sz:J
    int-to-long v8, p1

    cmp-long v8, v5, v8

    if-lez v8, :cond_0

    .line 144
    new-instance v8, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v9

    iget-object v9, v9, Lorg/eclipse/jgit/internal/JGitText;->fileIsTooLarge:Ljava/lang/String;

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object p0, v10, v11

    invoke-static {v9, v10}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 176
    .end local v5           #sz:J
    :catchall_0
    move-exception v8

    .line 177
    :try_start_1
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 180
    :goto_0
    throw v8

    .line 147
    .restart local v5       #sz:J
    :cond_0
    long-to-int v8, v5

    :try_start_2
    new-array v0, v8, [B

    .line 148
    .local v0, buf:[B
    const/4 v7, 0x0

    .line 150
    .local v7, valid:I
    :goto_1
    array-length v8, v0

    if-ne v8, v7, :cond_5

    .line 151
    array-length v8, v0

    if-ne v8, p1, :cond_4

    .line 152
    invoke-virtual {v1}, Ljava/io/FileInputStream;->read()I

    move-result v4

    .line 153
    .local v4, next:I
    if-gez v4, :cond_3

    .line 169
    .end local v4           #next:I
    :cond_1
    array-length v8, v0

    if-ge v7, v8, :cond_2

    .line 170
    new-array v3, v7, [B

    .line 171
    .local v3, nb:[B
    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v0, v8, v3, v9, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 172
    move-object v0, v3

    .line 177
    .end local v3           #nb:[B
    :cond_2
    :try_start_3
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 180
    :goto_2
    return-object v0

    .line 156
    .restart local v4       #next:I
    :cond_3
    :try_start_4
    new-instance v8, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v9

    iget-object v9, v9, Lorg/eclipse/jgit/internal/JGitText;->fileIsTooLarge:Ljava/lang/String;

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object p0, v10, v11

    invoke-static {v9, v10}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 160
    .end local v4           #next:I
    :cond_4
    array-length v8, v0

    mul-int/lit8 v8, v8, 0x2

    invoke-static {v8, p1}, Ljava/lang/Math;->min(II)I

    move-result v8

    new-array v3, v8, [B

    .line 161
    .restart local v3       #nb:[B
    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v0, v8, v3, v9, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 162
    move-object v0, v3

    .line 164
    .end local v3           #nb:[B
    :cond_5
    array-length v8, v0

    sub-int/2addr v8, v7

    invoke-virtual {v1, v0, v7, v8}, Ljava/io/FileInputStream;->read([BII)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result v2

    .line 165
    .local v2, n:I
    if-ltz v2, :cond_1

    .line 167
    add-int/2addr v7, v2

    .line 168
    goto :goto_1

    .line 178
    .end local v2           #n:I
    :catch_0
    move-exception v8

    goto :goto_2

    .end local v0           #buf:[B
    .end local v5           #sz:J
    .end local v7           #valid:I
    :catch_1
    move-exception v9

    goto :goto_0
.end method

.method public static readLines(Ljava/lang/String;)Ljava/util/List;
    .locals 8
    .parameter "s"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v7, 0xa

    const/4 v6, 0x0

    .line 346
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 347
    .local v2, l:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 348
    .local v3, sb:Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v1, v4, :cond_3

    .line 349
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 350
    .local v0, c:C
    if-ne v0, v7, :cond_1

    .line 351
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 352
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 348
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 355
    :cond_1
    const/16 v4, 0xd

    if-ne v0, v4, :cond_4

    .line 356
    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_2

    .line 357
    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 358
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 359
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 360
    if-eq v0, v7, :cond_0

    .line 361
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 364
    :cond_2
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 370
    .end local v0           #c:C
    :cond_3
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 371
    return-object v2

    .line 368
    .restart local v0       #c:C
    :cond_4
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1
.end method

.method public static final readSome(Ljava/io/File;I)[B
    .locals 7
    .parameter "path"
    .parameter "limit"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 102
    .local v2, in:Ljava/io/FileInputStream;
    :try_start_0
    new-array v0, p1, [B

    .line 103
    .local v0, buf:[B
    const/4 v1, 0x0

    .line 105
    .local v1, cnt:I
    :goto_0
    array-length v5, v0

    sub-int/2addr v5, v1

    invoke-virtual {v2, v0, v1, v5}, Ljava/io/FileInputStream;->read([BII)I

    move-result v3

    .line 106
    .local v3, n:I
    if-gtz v3, :cond_0

    .line 110
    array-length v5, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v1, v5, :cond_1

    .line 117
    :try_start_1
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 120
    .end local v0           #buf:[B
    :goto_1
    return-object v0

    .line 108
    .restart local v0       #buf:[B
    :cond_0
    add-int/2addr v1, v3

    .line 109
    goto :goto_0

    .line 112
    :cond_1
    :try_start_2
    new-array v4, v1, [B

    .line 113
    .local v4, res:[B
    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v0, v5, v4, v6, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 117
    :try_start_3
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    :goto_2
    move-object v0, v4

    .line 120
    goto :goto_1

    .line 116
    .end local v0           #buf:[B
    .end local v1           #cnt:I
    .end local v3           #n:I
    .end local v4           #res:[B
    :catchall_0
    move-exception v5

    .line 117
    :try_start_4
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 120
    :goto_3
    throw v5

    .line 118
    .restart local v0       #buf:[B
    .restart local v1       #cnt:I
    .restart local v3       #n:I
    :catch_0
    move-exception v5

    goto :goto_1

    .restart local v4       #res:[B
    :catch_1
    move-exception v5

    goto :goto_2

    .end local v0           #buf:[B
    .end local v1           #cnt:I
    .end local v3           #n:I
    .end local v4           #res:[B
    :catch_2
    move-exception v6

    goto :goto_3
.end method

.method public static readWholeStream(Ljava/io/InputStream;I)Ljava/nio/ByteBuffer;
    .locals 7
    .parameter "in"
    .parameter "sizeHint"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 206
    new-array v1, p1, [B

    .line 207
    .local v1, out:[B
    const/4 v2, 0x0

    .line 208
    .local v2, pos:I
    :goto_0
    array-length v5, v1

    if-ge v2, v5, :cond_1

    .line 209
    array-length v5, v1

    sub-int/2addr v5, v2

    invoke-virtual {p0, v1, v2, v5}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    .line 210
    .local v3, read:I
    if-gez v3, :cond_0

    .line 211
    invoke-static {v1, v6, v2}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 224
    .end local v3           #read:I
    :goto_1
    return-object v5

    .line 212
    .restart local v3       #read:I
    :cond_0
    add-int/2addr v2, v3

    .line 213
    goto :goto_0

    .line 215
    .end local v3           #read:I
    :cond_1
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 216
    .local v0, last:I
    if-gez v0, :cond_2

    .line 217
    invoke-static {v1, v6, v2}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v5

    goto :goto_1

    .line 220
    :cond_2
    new-instance v4, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    const v5, 0x7fffffff

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;-><init>(I)V

    .line 221
    .local v4, tmp:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;
    invoke-virtual {v4, v1}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->write([B)V

    .line 222
    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->write(I)V

    .line 223
    invoke-virtual {v4, p0}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->copy(Ljava/io/InputStream;)V

    .line 224
    invoke-virtual {v4}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->toByteArray()[B

    move-result-object v5

    invoke-static {v5}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v5

    goto :goto_1
.end method

.method public static skipFully(Ljava/io/InputStream;J)V
    .locals 5
    .parameter "fd"
    .parameter "toSkip"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v3, 0x0

    .line 329
    :goto_0
    cmp-long v2, p1, v3

    if-lez v2, :cond_1

    .line 330
    invoke-virtual {p0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    .line 331
    .local v0, r:J
    cmp-long v2, v0, v3

    if-gtz v2, :cond_0

    .line 332
    new-instance v2, Ljava/io/EOFException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->shortSkipOfBlock:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 333
    :cond_0
    sub-long/2addr p1, v0

    .line 334
    goto :goto_0

    .line 335
    .end local v0           #r:J
    :cond_1
    return-void
.end method
