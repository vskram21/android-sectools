.class public Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;
.super Lorg/eclipse/jgit/lib/ObjectInserter;
.source "DfsInserter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;
    }
.end annotation


# static fields
.field private static final INDEX_VERSION:I = 0x2


# instance fields
.field private cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

.field private final db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

.field private objectList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/PackedObjectInfo;",
            ">;"
        }
    .end annotation
.end field

.field private objectMap:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/ObjectIdOwnerMap",
            "<",
            "Lorg/eclipse/jgit/transport/PackedObjectInfo;",
            ">;"
        }
    .end annotation
.end field

.field private packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

.field private packKey:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

.field private packOut:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;

.field private rollback:Z


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;)V
    .locals 0
    .parameter "db"

    .prologue
    .line 95
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ObjectInserter;-><init>()V

    .line 96
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    .line 97
    return-void
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;
    .locals 1
    .parameter "x0"

    .prologue
    .line 74
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    return-object v0
.end method

.method static synthetic access$200(Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;
    .locals 1
    .parameter "x0"

    .prologue
    .line 74
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packKey:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    return-object v0
.end method

.method private beginObject(IJ)J
    .locals 3
    .parameter "type"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 204
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packOut:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;

    if-nez v2, :cond_0

    .line 205
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->beginPack()V

    .line 206
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packOut:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->getCount()J

    move-result-wide v0

    .line 207
    .local v0, offset:J
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packOut:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;

    invoke-virtual {v2, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->beginObject(IJ)V

    .line 208
    return-wide v0
.end method

.method private beginPack()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 221
    new-instance v1, Lorg/eclipse/jgit/util/BlockList;

    invoke-direct {v1}, Lorg/eclipse/jgit/util/BlockList;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->objectList:Ljava/util/List;

    .line 222
    new-instance v1, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-direct {v1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->objectMap:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    .line 223
    invoke-static {}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getInstance()Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    .line 225
    iput-boolean v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->rollback:Z

    .line 226
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    sget-object v2, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->INSERT:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->newPack(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    .line 227
    new-instance v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    sget-object v4, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v2, v3, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->writeFile(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;)V

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packOut:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;

    .line 228
    new-instance v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    invoke-direct {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packKey:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    .line 231
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packOut:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;

    #getter for: Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->hdrBuf:[B
    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->access$000(Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;)[B

    move-result-object v0

    .line 232
    .local v0, buf:[B
    sget-object v1, Lorg/eclipse/jgit/lib/Constants;->PACK_SIGNATURE:[B

    invoke-static {v1, v5, v0, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 233
    const/4 v1, 0x2

    invoke-static {v0, v7, v1}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 234
    const/16 v1, 0x8

    invoke-static {v0, v1, v6}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 235
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packOut:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;

    const/16 v2, 0xc

    invoke-virtual {v1, v0, v5, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->write([BII)V

    .line 236
    return-void
.end method

.method private clear()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 197
    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->objectList:Ljava/util/List;

    .line 198
    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->objectMap:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    .line 199
    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packKey:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    .line 200
    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    .line 201
    return-void
.end method

.method private endObject(Lorg/eclipse/jgit/lib/ObjectId;J)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 3
    .parameter "id"
    .parameter "offset"

    .prologue
    .line 212
    new-instance v0, Lorg/eclipse/jgit/transport/PackedObjectInfo;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/transport/PackedObjectInfo;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 213
    .local v0, obj:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    invoke-virtual {v0, p2, p3}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->setOffset(J)V

    .line 214
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packOut:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;

    iget-object v1, v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->crc32:Ljava/util/zip/CRC32;

    invoke-virtual {v1}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v1

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->setCRC(I)V

    .line 215
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->objectList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 216
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->objectMap:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->addIfAbsent(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    .line 217
    return-object p1
.end method

.method private static index(Ljava/io/OutputStream;[BLjava/util/List;)V
    .locals 1
    .parameter "out"
    .parameter "packHash"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/OutputStream;",
            "[B",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/PackedObjectInfo;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 275
    .local p2, list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/PackedObjectInfo;>;"
    const/4 v0, 0x2

    invoke-static {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->createVersion(Ljava/io/OutputStream;I)Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;

    move-result-object v0

    invoke-virtual {v0, p2, p1}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->write(Ljava/util/List;[B)V

    .line 276
    return-void
.end method

.method private sortObjectsById()V
    .locals 1

    .prologue
    .line 239
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->objectList:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 240
    return-void
.end method


# virtual methods
.method public flush()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 149
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    if-nez v3, :cond_0

    .line 172
    :goto_0
    return-void

    .line 152
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packOut:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;

    if-nez v3, :cond_1

    .line 153
    new-instance v3, Ljava/io/IOException;

    invoke-direct {v3}, Ljava/io/IOException;-><init>()V

    throw v3

    .line 155
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packOut:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->writePackFooter()[B

    move-result-object v2

    .line 156
    .local v2, packHash:[B
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    sget-object v4, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->addFileExt(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)V

    .line 157
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    sget-object v4, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packOut:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->getCount()J

    move-result-wide v5

    invoke-virtual {v3, v4, v5, v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->setFileSize(Lorg/eclipse/jgit/internal/storage/pack/PackExt;J)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    .line 158
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packOut:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->close()V

    .line 159
    iput-object v7, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packOut:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;

    .line 161
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->sortObjectsById()V

    .line 163
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->objectList:Ljava/util/List;

    invoke-virtual {p0, v3, v2, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->writePackIndex(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;[BLjava/util/List;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v0

    .line 164
    .local v0, index:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    invoke-static {v4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v4, v7}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->commitPack(Ljava/util/Collection;Ljava/util/Collection;)V

    .line 165
    const/4 v3, 0x0

    iput-boolean v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->rollback:Z

    .line 167
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packKey:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    invoke-virtual {v3, v4, v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getOrCreate(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    move-result-object v1

    .line 168
    .local v1, p:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    if-eqz v0, :cond_2

    .line 169
    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->setPackIndex(Lorg/eclipse/jgit/internal/storage/file/PackIndex;)V

    .line 170
    :cond_2
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    invoke-virtual {v3, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->addPack(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)V

    .line 171
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->clear()V

    goto :goto_0
.end method

.method public insert(IJLjava/io/InputStream;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 8
    .parameter "type"
    .parameter "len"
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 122
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->buffer()[B

    move-result-object v0

    .line 123
    .local v0, buf:[B
    array-length v5, v0

    int-to-long v5, v5

    cmp-long v5, p2, v5

    if-gtz v5, :cond_0

    .line 124
    long-to-int v5, p2

    invoke-static {p4, v0, v7, v5}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 125
    long-to-int v5, p2

    invoke-virtual {p0, p1, v0, v7, v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->insert(I[BII)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    .line 144
    :goto_0
    return-object v5

    .line 128
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->beginObject(IJ)J

    move-result-wide v3

    .line 129
    .local v3, offset:J
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->digest()Ljava/security/MessageDigest;

    move-result-object v1

    .line 130
    .local v1, md:Ljava/security/MessageDigest;
    invoke-static {p1}, Lorg/eclipse/jgit/lib/Constants;->encodedTypeString(I)[B

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/security/MessageDigest;->update([B)V

    .line 131
    const/16 v5, 0x20

    invoke-virtual {v1, v5}, Ljava/security/MessageDigest;->update(B)V

    .line 132
    invoke-static {p2, p3}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(J)[B

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/security/MessageDigest;->update([B)V

    .line 133
    invoke-virtual {v1, v7}, Ljava/security/MessageDigest;->update(B)V

    .line 135
    :goto_1
    const-wide/16 v5, 0x0

    cmp-long v5, v5, p2

    if-gez v5, :cond_2

    .line 136
    array-length v5, v0

    int-to-long v5, v5

    invoke-static {v5, v6, p2, p3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    long-to-int v5, v5

    invoke-virtual {p4, v0, v7, v5}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 137
    .local v2, n:I
    if-gtz v2, :cond_1

    .line 138
    new-instance v5, Ljava/io/EOFException;

    invoke-direct {v5}, Ljava/io/EOFException;-><init>()V

    throw v5

    .line 139
    :cond_1
    invoke-virtual {v1, v0, v7, v2}, Ljava/security/MessageDigest;->update([BII)V

    .line 140
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packOut:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;

    iget-object v5, v5, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->compress:Ljava/util/zip/DeflaterOutputStream;

    invoke-virtual {v5, v0, v7, v2}, Ljava/util/zip/DeflaterOutputStream;->write([BII)V

    .line 141
    int-to-long v5, v2

    sub-long/2addr p2, v5

    .line 142
    goto :goto_1

    .line 143
    .end local v2           #n:I
    :cond_2
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packOut:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;

    iget-object v5, v5, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->compress:Ljava/util/zip/DeflaterOutputStream;

    invoke-virtual {v5}, Ljava/util/zip/DeflaterOutputStream;->finish()V

    .line 144
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v5

    invoke-static {v5}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-direct {p0, v5, v3, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->endObject(Lorg/eclipse/jgit/lib/ObjectId;J)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    goto :goto_0
.end method

.method public insert(I[BII)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 5
    .parameter "type"
    .parameter "data"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->idFor(I[BII)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    .line 108
    .local v0, id:Lorg/eclipse/jgit/lib/ObjectId;
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->objectMap:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->objectMap:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 116
    .end local v0           #id:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_0
    :goto_0
    return-object v0

    .line 110
    .restart local v0       #id:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->has(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 113
    int-to-long v3, p4

    invoke-direct {p0, p1, v3, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->beginObject(IJ)J

    move-result-wide v1

    .line 114
    .local v1, offset:J
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packOut:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;

    iget-object v3, v3, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->compress:Ljava/util/zip/DeflaterOutputStream;

    invoke-virtual {v3, p2, p3, p4}, Ljava/util/zip/DeflaterOutputStream;->write([BII)V

    .line 115
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packOut:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;

    iget-object v3, v3, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->compress:Ljava/util/zip/DeflaterOutputStream;

    invoke-virtual {v3}, Ljava/util/zip/DeflaterOutputStream;->finish()V

    .line 116
    invoke-direct {p0, v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->endObject(Lorg/eclipse/jgit/lib/ObjectId;J)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    goto :goto_0
.end method

.method public newPackParser(Ljava/io/InputStream;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;
    .locals 2
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    invoke-direct {v0, v1, p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;Ljava/io/InputStream;)V

    return-object v0
.end method

.method public bridge synthetic newPackParser(Ljava/io/InputStream;)Lorg/eclipse/jgit/transport/PackParser;
    .locals 1
    .parameter "x0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->newPackParser(Ljava/io/InputStream;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;

    move-result-object v0

    return-object v0
.end method

.method public release()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 176
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packOut:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;

    if-eqz v0, :cond_0

    .line 178
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packOut:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 182
    :goto_0
    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packOut:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;

    .line 185
    :cond_0
    iget-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->rollback:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    if-eqz v0, :cond_1

    .line 187
    :try_start_1
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->rollbackPack(Ljava/util/Collection;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 189
    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    .line 190
    iput-boolean v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->rollback:Z

    .line 193
    :cond_1
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->clear()V

    .line 194
    return-void

    .line 182
    :catchall_0
    move-exception v0

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packOut:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;

    throw v0

    .line 189
    :catchall_1
    move-exception v0

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    .line 190
    iput-boolean v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->rollback:Z

    .line 189
    throw v0

    .line 179
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method writePackIndex(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;[BLjava/util/List;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    .locals 7
    .parameter "pack"
    .parameter "packHash"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;",
            "[B",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/PackedObjectInfo;",
            ">;)",
            "Lorg/eclipse/jgit/internal/storage/file/PackIndex;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 244
    .local p3, list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/PackedObjectInfo;>;"
    const/4 v4, 0x2

    invoke-virtual {p1, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->setIndexVersion(I)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    .line 245
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {p1, v4, v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->setObjectCount(J)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    .line 250
    const/4 v0, 0x0

    .line 251
    .local v0, buf:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;
    const/4 v3, 0x0

    .line 252
    .local v3, packIndex:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v4

    const v5, 0xe290

    if-gt v4, v5, :cond_0

    .line 253
    new-instance v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    .end local v0           #buf:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;
    const/high16 v4, 0x20

    invoke-direct {v0, v4}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;-><init>(I)V

    .line 254
    .restart local v0       #buf:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;
    invoke-static {v0, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->index(Ljava/io/OutputStream;[BLjava/util/List;)V

    .line 255
    invoke-virtual {v0}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->openInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-static {v4}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->read(Ljava/io/InputStream;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v3

    .line 258
    :cond_0
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    sget-object v5, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v4, p1, v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->writeFile(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    move-result-object v2

    .line 260
    .local v2, os:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;
    :try_start_0
    new-instance v1, Lorg/eclipse/jgit/util/io/CountingOutputStream;

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/util/io/CountingOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 261
    .local v1, cnt:Lorg/eclipse/jgit/util/io/CountingOutputStream;
    if-eqz v0, :cond_1

    .line 262
    const/4 v4, 0x0

    invoke-virtual {v0, v1, v4}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->writeTo(Ljava/io/OutputStream;Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 265
    :goto_0
    sget-object v4, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {p1, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->addFileExt(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)V

    .line 266
    sget-object v4, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v1}, Lorg/eclipse/jgit/util/io/CountingOutputStream;->getCount()J

    move-result-wide v5

    invoke-virtual {p1, v4, v5, v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->setFileSize(Lorg/eclipse/jgit/internal/storage/pack/PackExt;J)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 268
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->close()V

    .line 270
    return-object v3

    .line 264
    :cond_1
    :try_start_1
    invoke-static {v1, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->index(Ljava/io/OutputStream;[BLjava/util/List;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 268
    .end local v1           #cnt:Lorg/eclipse/jgit/util/io/CountingOutputStream;
    :catchall_0
    move-exception v4

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->close()V

    throw v4
.end method
