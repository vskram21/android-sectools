.class public abstract Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;
.super Ljava/lang/Object;
.source "PackIndexWriter.java"


# static fields
.field protected static final TOC:[B


# instance fields
.field protected entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<+",
            "Lorg/eclipse/jgit/transport/PackedObjectInfo;",
            ">;"
        }
    .end annotation
.end field

.field protected final out:Ljava/security/DigestOutputStream;

.field protected packChecksum:[B

.field protected final tmp:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 70
    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->TOC:[B

    return-void

    nop

    :array_0
    .array-data 0x1
        0xfft
        0x74t
        0x4ft
        0x63t
    .end array-data
.end method

.method protected constructor <init>(Ljava/io/OutputStream;)V
    .locals 2
    .parameter "dst"

    .prologue
    .line 184
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 185
    new-instance v1, Ljava/security/DigestOutputStream;

    instance-of v0, p1, Ljava/io/BufferedOutputStream;

    if-eqz v0, :cond_0

    .end local p1
    :goto_0
    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v0

    invoke-direct {v1, p1, v0}, Ljava/security/DigestOutputStream;-><init>(Ljava/io/OutputStream;Ljava/security/MessageDigest;)V

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->out:Ljava/security/DigestOutputStream;

    .line 188
    const/16 v0, 0x18

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->tmp:[B

    .line 189
    return-void

    .line 185
    .restart local p1
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    move-object p1, v0

    goto :goto_0
.end method

.method public static createOldestPossible(Ljava/io/OutputStream;Ljava/util/List;)Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;
    .locals 1
    .parameter "dst"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/OutputStream;",
            "Ljava/util/List",
            "<+",
            "Lorg/eclipse/jgit/transport/PackedObjectInfo;",
            ">;)",
            "Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;"
        }
    .end annotation

    .prologue
    .line 101
    .local p1, objs:Ljava/util/List;,"Ljava/util/List<+Lorg/eclipse/jgit/transport/PackedObjectInfo;>;"
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->oldestPossibleFormat(Ljava/util/List;)I

    move-result v0

    invoke-static {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->createVersion(Ljava/io/OutputStream;I)Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;

    move-result-object v0

    return-object v0
.end method

.method public static createVersion(Ljava/io/OutputStream;I)Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;
    .locals 5
    .parameter "dst"
    .parameter "version"

    .prologue
    .line 153
    packed-switch p1, :pswitch_data_0

    .line 159
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->unsupportedPackIndexVersion:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 155
    :pswitch_0
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV1;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV1;-><init>(Ljava/io/OutputStream;)V

    .line 157
    :goto_0
    return-object v0

    :pswitch_1
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;-><init>(Ljava/io/OutputStream;)V

    goto :goto_0

    .line 153
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static oldestPossibleFormat(Ljava/util/List;)I
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lorg/eclipse/jgit/transport/PackedObjectInfo;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 127
    .local p0, objs:Ljava/util/List;,"Ljava/util/List<+Lorg/eclipse/jgit/transport/PackedObjectInfo;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/transport/PackedObjectInfo;

    .line 128
    .local v1, oe:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV1;->canStore(Lorg/eclipse/jgit/transport/PackedObjectInfo;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 129
    const/4 v2, 0x2

    .line 131
    .end local v1           #oe:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method public write(Ljava/util/List;[B)V
    .locals 1
    .parameter
    .parameter "packDataChecksum"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lorg/eclipse/jgit/transport/PackedObjectInfo;",
            ">;[B)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 210
    .local p1, toStore:Ljava/util/List;,"Ljava/util/List<+Lorg/eclipse/jgit/transport/PackedObjectInfo;>;"
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->entries:Ljava/util/List;

    .line 211
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->packChecksum:[B

    .line 212
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->writeImpl()V

    .line 213
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->out:Ljava/security/DigestOutputStream;

    invoke-virtual {v0}, Ljava/security/DigestOutputStream;->flush()V

    .line 214
    return-void
.end method

.method protected writeChecksumFooter()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 296
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->out:Ljava/security/DigestOutputStream;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->packChecksum:[B

    invoke-virtual {v0, v1}, Ljava/security/DigestOutputStream;->write([B)V

    .line 297
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->out:Ljava/security/DigestOutputStream;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/security/DigestOutputStream;->on(Z)V

    .line 298
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->out:Ljava/security/DigestOutputStream;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->out:Ljava/security/DigestOutputStream;

    invoke-virtual {v1}, Ljava/security/DigestOutputStream;->getMessageDigest()Ljava/security/MessageDigest;

    move-result-object v1

    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/DigestOutputStream;->write([B)V

    .line 299
    return-void
.end method

.method protected writeFanOutTable()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x100

    const/4 v10, 0x0

    .line 271
    new-array v1, v9, [I

    .line 272
    .local v1, fanout:[I
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->entries:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/transport/PackedObjectInfo;

    .line 273
    .local v6, po:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    invoke-virtual {v6}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->getFirstByte()I

    move-result v7

    and-int/lit16 v7, v7, 0xff

    aget v8, v1, v7

    add-int/lit8 v8, v8, 0x1

    aput v8, v1, v7

    goto :goto_0

    .line 274
    .end local v6           #po:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    :cond_0
    const/4 v2, 0x1

    .local v2, i:I
    :goto_1
    if-ge v2, v9, :cond_1

    .line 275
    aget v7, v1, v2

    add-int/lit8 v8, v2, -0x1

    aget v8, v1, v8

    add-int/2addr v7, v8

    aput v7, v1, v2

    .line 274
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 276
    :cond_1
    move-object v0, v1

    .local v0, arr$:[I
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_2
    if-ge v3, v4, :cond_2

    aget v5, v0, v3

    .line 277
    .local v5, n:I
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->tmp:[B

    invoke-static {v7, v10, v5}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 278
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->out:Ljava/security/DigestOutputStream;

    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->tmp:[B

    const/4 v9, 0x4

    invoke-virtual {v7, v8, v10, v9}, Ljava/security/DigestOutputStream;->write([BII)V

    .line 276
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 280
    .end local v5           #n:I
    :cond_2
    return-void
.end method

.method protected abstract writeImpl()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected writeTOC(I)V
    .locals 4
    .parameter "version"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 254
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->out:Ljava/security/DigestOutputStream;

    sget-object v1, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->TOC:[B

    invoke-virtual {v0, v1}, Ljava/security/DigestOutputStream;->write([B)V

    .line 255
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->tmp:[B

    invoke-static {v0, v3, p1}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 256
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->out:Ljava/security/DigestOutputStream;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->tmp:[B

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v3, v2}, Ljava/security/DigestOutputStream;->write([BII)V

    .line 257
    return-void
.end method
