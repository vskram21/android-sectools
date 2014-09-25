.class Lorg/eclipse/jgit/internal/storage/file/LargePackedWholeObject;
.super Lorg/eclipse/jgit/lib/ObjectLoader;
.source "LargePackedWholeObject.java"


# instance fields
.field private final db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

.field private final headerLength:I

.field private final objectOffset:J

.field private final pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

.field private final size:J

.field private final type:I


# direct methods
.method constructor <init>(IJJILorg/eclipse/jgit/internal/storage/file/PackFile;Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;)V
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
    iput p1, p0, Lorg/eclipse/jgit/internal/storage/file/LargePackedWholeObject;->type:I

    .line 73
    iput-wide p2, p0, Lorg/eclipse/jgit/internal/storage/file/LargePackedWholeObject;->size:J

    .line 74
    iput-wide p4, p0, Lorg/eclipse/jgit/internal/storage/file/LargePackedWholeObject;->objectOffset:J

    .line 75
    iput p6, p0, Lorg/eclipse/jgit/internal/storage/file/LargePackedWholeObject;->headerLength:I

    .line 76
    iput-object p7, p0, Lorg/eclipse/jgit/internal/storage/file/LargePackedWholeObject;->pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 77
    iput-object p8, p0, Lorg/eclipse/jgit/internal/storage/file/LargePackedWholeObject;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    .line 78
    return-void
.end method

.method private getObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LargePackedWholeObject;->pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/file/LargePackedWholeObject;->objectOffset:J

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->findObjectForOffset(J)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getCachedBytes()[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/LargeObjectException;
        }
    .end annotation

    .prologue
    .line 98
    :try_start_0
    new-instance v2, Lorg/eclipse/jgit/errors/LargeObjectException;

    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/LargePackedWholeObject;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/LargeObjectException;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    throw v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    :catch_0
    move-exception v0

    .line 100
    .local v0, cannotObtainId:Ljava/io/IOException;
    new-instance v1, Lorg/eclipse/jgit/errors/LargeObjectException;

    invoke-direct {v1}, Lorg/eclipse/jgit/errors/LargeObjectException;-><init>()V

    .line 101
    .local v1, err:Lorg/eclipse/jgit/errors/LargeObjectException;
    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/errors/LargeObjectException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 102
    throw v1
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 87
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/LargePackedWholeObject;->size:J

    return-wide v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 82
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/LargePackedWholeObject;->type:I

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
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x2000

    .line 108
    new-instance v3, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/LargePackedWholeObject;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;)V

    .line 111
    .local v3, wc:Lorg/eclipse/jgit/internal/storage/file/WindowCursor;
    :try_start_0
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/PackInputStream;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/LargePackedWholeObject;->pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    iget-wide v5, p0, Lorg/eclipse/jgit/internal/storage/file/LargePackedWholeObject;->objectOffset:J

    iget v7, p0, Lorg/eclipse/jgit/internal/storage/file/LargePackedWholeObject;->headerLength:I

    int-to-long v7, v7

    add-long/2addr v5, v7

    invoke-direct {v0, v4, v5, v6, v3}, Lorg/eclipse/jgit/internal/storage/file/PackInputStream;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackFile;JLorg/eclipse/jgit/internal/storage/file/WindowCursor;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    .local v0, in:Ljava/io/InputStream;
    new-instance v1, Ljava/io/BufferedInputStream;

    new-instance v4, Ljava/util/zip/InflaterInputStream;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->inflater()Ljava/util/zip/Inflater;

    move-result-object v5

    invoke-direct {v4, v0, v5, v9}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;I)V

    invoke-direct {v1, v4, v9}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 126
    .end local v0           #in:Ljava/io/InputStream;
    .local v1, in:Ljava/io/InputStream;
    new-instance v4, Lorg/eclipse/jgit/lib/ObjectStream$Filter;

    iget v5, p0, Lorg/eclipse/jgit/internal/storage/file/LargePackedWholeObject;->type:I

    iget-wide v6, p0, Lorg/eclipse/jgit/internal/storage/file/LargePackedWholeObject;->size:J

    invoke-direct {v4, v5, v6, v7, v1}, Lorg/eclipse/jgit/lib/ObjectStream$Filter;-><init>(IJLjava/io/InputStream;)V

    .end local v1           #in:Ljava/io/InputStream;
    :goto_0
    return-object v4

    .line 112
    :catch_0
    move-exception v2

    .line 117
    .local v2, packGone:Ljava/io/IOException;
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/LargePackedWholeObject;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    iget v5, p0, Lorg/eclipse/jgit/internal/storage/file/LargePackedWholeObject;->type:I

    invoke-virtual {v3, v4, v5}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/ObjectLoader;->openStream()Lorg/eclipse/jgit/lib/ObjectStream;

    move-result-object v4

    goto :goto_0
.end method
