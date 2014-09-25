.class final Lorg/eclipse/jgit/internal/storage/dfs/LargePackedWholeObject;
.super Lorg/eclipse/jgit/lib/ObjectLoader;
.source "LargePackedWholeObject.java"


# instance fields
.field private final db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

.field private final headerLength:I

.field private final objectOffset:J

.field private final pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

.field private final size:J

.field private final type:I


# direct methods
.method constructor <init>(IJJILorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;)V
    .locals 0
    .parameter "type"
    .parameter "size"
    .parameter "objectOffset"
    .parameter "headerLength"
    .parameter "pack"
    .parameter "db"

    .prologue
    .line 71
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ObjectLoader;-><init>()V

    .line 72
    iput p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/LargePackedWholeObject;->type:I

    .line 73
    iput-wide p2, p0, Lorg/eclipse/jgit/internal/storage/dfs/LargePackedWholeObject;->size:J

    .line 74
    iput-wide p4, p0, Lorg/eclipse/jgit/internal/storage/dfs/LargePackedWholeObject;->objectOffset:J

    .line 75
    iput p6, p0, Lorg/eclipse/jgit/internal/storage/dfs/LargePackedWholeObject;->headerLength:I

    .line 76
    iput-object p7, p0, Lorg/eclipse/jgit/internal/storage/dfs/LargePackedWholeObject;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .line 77
    iput-object p8, p0, Lorg/eclipse/jgit/internal/storage/dfs/LargePackedWholeObject;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    .line 78
    return-void
.end method


# virtual methods
.method public getCachedBytes()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/LargeObjectException;
        }
    .end annotation

    .prologue
    .line 97
    new-instance v0, Lorg/eclipse/jgit/errors/LargeObjectException;

    invoke-direct {v0}, Lorg/eclipse/jgit/errors/LargeObjectException;-><init>()V

    throw v0
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 87
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/LargePackedWholeObject;->size:J

    return-wide v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 82
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/LargePackedWholeObject;->type:I

    return v0
.end method

.method public isLarge()Z
    .locals 1

    .prologue
    .line 92
    const/4 v0, 0x1

    return v0
.end method

.method public openStream()Lorg/eclipse/jgit/lib/ObjectStream;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    new-instance v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;

    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/LargePackedWholeObject;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    invoke-direct {v1, v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;)V

    .line 105
    .local v1, ctx:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;
    :try_start_0
    new-instance v2, Lorg/eclipse/jgit/internal/storage/dfs/PackInputStream;

    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/LargePackedWholeObject;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    iget-wide v7, p0, Lorg/eclipse/jgit/internal/storage/dfs/LargePackedWholeObject;->objectOffset:J

    iget v9, p0, Lorg/eclipse/jgit/internal/storage/dfs/LargePackedWholeObject;->headerLength:I

    int-to-long v9, v9

    add-long/2addr v7, v9

    invoke-direct {v2, v6, v7, v8, v1}, Lorg/eclipse/jgit/internal/storage/dfs/PackInputStream;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;JLorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    .local v2, in:Ljava/io/InputStream;
    const/16 v0, 0x2000

    .line 123
    .local v0, bufsz:I
    new-instance v3, Ljava/io/BufferedInputStream;

    new-instance v6, Ljava/util/zip/InflaterInputStream;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->inflater()Ljava/util/zip/Inflater;

    move-result-object v7

    invoke-direct {v6, v2, v7, v0}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;I)V

    invoke-direct {v3, v6, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 126
    .end local v2           #in:Ljava/io/InputStream;
    .local v3, in:Ljava/io/InputStream;
    new-instance v6, Lorg/eclipse/jgit/lib/ObjectStream$Filter;

    iget v7, p0, Lorg/eclipse/jgit/internal/storage/dfs/LargePackedWholeObject;->type:I

    iget-wide v8, p0, Lorg/eclipse/jgit/internal/storage/dfs/LargePackedWholeObject;->size:J

    invoke-direct {v6, v7, v8, v9, v3}, Lorg/eclipse/jgit/lib/ObjectStream$Filter;-><init>(IJLjava/io/InputStream;)V

    .end local v0           #bufsz:I
    .end local v3           #in:Ljava/io/InputStream;
    :goto_0
    return-object v6

    .line 106
    :catch_0
    move-exception v5

    .line 112
    .local v5, packGone:Ljava/io/IOException;
    :try_start_1
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/LargePackedWholeObject;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    invoke-virtual {v6, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getReverseIdx(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;

    move-result-object v6

    iget-wide v7, p0, Lorg/eclipse/jgit/internal/storage/dfs/LargePackedWholeObject;->objectOffset:J

    invoke-virtual {v6, v7, v8}, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->findObject(J)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    .line 113
    .local v4, obj:Lorg/eclipse/jgit/lib/ObjectId;
    iget v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/LargePackedWholeObject;->type:I

    invoke-virtual {v1, v4, v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v6

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/ObjectLoader;->openStream()Lorg/eclipse/jgit/lib/ObjectStream;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v6

    .line 115
    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->release()V

    goto :goto_0

    .end local v4           #obj:Lorg/eclipse/jgit/lib/ObjectId;
    :catchall_0
    move-exception v6

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->release()V

    throw v6
.end method
