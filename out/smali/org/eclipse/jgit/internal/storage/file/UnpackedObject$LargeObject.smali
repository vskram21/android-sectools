.class final Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;
.super Lorg/eclipse/jgit/lib/ObjectLoader;
.source "UnpackedObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LargeObject"
.end annotation


# instance fields
.field private final id:Lorg/eclipse/jgit/lib/ObjectId;

.field private final path:Ljava/io/File;

.field private final size:J

.field private final source:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

.field private final type:I


# direct methods
.method private constructor <init>(IJLjava/io/File;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;)V
    .locals 1
    .parameter "type"
    .parameter "size"
    .parameter "path"
    .parameter "id"
    .parameter "db"

    .prologue
    .line 370
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ObjectLoader;-><init>()V

    .line 371
    iput p1, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;->type:I

    .line 372
    iput-wide p2, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;->size:J

    .line 373
    iput-object p4, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;->path:Ljava/io/File;

    .line 374
    invoke-virtual {p5}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;->id:Lorg/eclipse/jgit/lib/ObjectId;

    .line 375
    iput-object p6, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;->source:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    .line 376
    return-void
.end method

.method synthetic constructor <init>(IJLjava/io/File;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .parameter "x5"

    .prologue
    .line 358
    invoke-direct/range {p0 .. p6}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;-><init>(IJLjava/io/File;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;)V

    return-void
.end method


# virtual methods
.method public getCachedBytes()[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/LargeObjectException;
        }
    .end annotation

    .prologue
    .line 395
    new-instance v0, Lorg/eclipse/jgit/errors/LargeObjectException;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;->id:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/LargeObjectException;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    throw v0
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 385
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;->size:J

    return-wide v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 380
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;->type:I

    return v0
.end method

.method public isLarge()Z
    .locals 1

    .prologue
    .line 390
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
    .line 403
    :try_start_0
    new-instance v7, Ljava/io/FileInputStream;

    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;->path:Ljava/io/File;

    invoke-direct {v7, v8}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    #calls: Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->buffer(Ljava/io/InputStream;)Ljava/io/BufferedInputStream;
    invoke-static {v7}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->access$200(Ljava/io/InputStream;)Ljava/io/BufferedInputStream;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 412
    .local v3, in:Ljava/io/InputStream;
    const/4 v4, 0x0

    .line 414
    .local v4, ok:Z
    const/16 v7, 0x40

    :try_start_1
    new-array v2, v7, [B

    .line 415
    .local v2, hdr:[B
    const/16 v7, 0x14

    invoke-virtual {v3, v7}, Ljava/io/InputStream;->mark(I)V

    .line 416
    const/4 v7, 0x0

    const/4 v8, 0x2

    invoke-static {v3, v2, v7, v8}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 418
    #calls: Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->isStandardFormat([B)Z
    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->access$300([B)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 419
    invoke-virtual {v3}, Ljava/io/InputStream;->reset()V

    .line 420
    iget-wide v7, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;->size:J

    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;->id:Lorg/eclipse/jgit/lib/ObjectId;

    #calls: Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->inflate(Ljava/io/InputStream;JLorg/eclipse/jgit/lib/ObjectId;)Ljava/io/InputStream;
    invoke-static {v3, v7, v8, v9}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->access$400(Ljava/io/InputStream;JLorg/eclipse/jgit/lib/ObjectId;)Ljava/io/InputStream;

    move-result-object v7

    #calls: Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->buffer(Ljava/io/InputStream;)Ljava/io/BufferedInputStream;
    invoke-static {v7}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->access$200(Ljava/io/InputStream;)Ljava/io/BufferedInputStream;

    move-result-object v3

    .line 421
    :cond_0
    invoke-virtual {v3}, Ljava/io/InputStream;->read()I

    move-result v7

    if-gtz v7, :cond_0

    .line 435
    :goto_0
    const/4 v4, 0x1

    .line 436
    new-instance v7, Lorg/eclipse/jgit/lib/ObjectStream$Filter;

    iget v8, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;->type:I

    iget-wide v9, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;->size:J

    invoke-direct {v7, v8, v9, v10, v3}, Lorg/eclipse/jgit/lib/ObjectStream$Filter;-><init>(IJLjava/io/InputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 438
    if-nez v4, :cond_1

    .line 439
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .end local v2           #hdr:[B
    .end local v3           #in:Ljava/io/InputStream;
    .end local v4           #ok:Z
    :cond_1
    :goto_1
    return-object v7

    .line 404
    :catch_0
    move-exception v1

    .line 409
    .local v1, gone:Ljava/io/FileNotFoundException;
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;->source:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;->id:Lorg/eclipse/jgit/lib/ObjectId;

    iget v9, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;->type:I

    invoke-virtual {v7, v8, v9}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v7

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/ObjectLoader;->openStream()Lorg/eclipse/jgit/lib/ObjectStream;

    move-result-object v7

    goto :goto_1

    .line 424
    .end local v1           #gone:Ljava/io/FileNotFoundException;
    .restart local v2       #hdr:[B
    .restart local v3       #in:Ljava/io/InputStream;
    .restart local v4       #ok:Z
    :cond_2
    const/4 v7, 0x2

    const/16 v8, 0x12

    :try_start_2
    #calls: Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->readSome(Ljava/io/InputStream;[BII)I
    invoke-static {v3, v2, v7, v8}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->access$500(Ljava/io/InputStream;[BII)I

    .line 425
    const/4 v7, 0x0

    aget-byte v7, v2, v7

    and-int/lit16 v0, v7, 0xff

    .line 426
    .local v0, c:I
    const/4 v5, 0x1

    .local v5, p:I
    move v6, v5

    .line 427
    .end local v5           #p:I
    .local v6, p:I
    :goto_2
    and-int/lit16 v7, v0, 0x80

    if-eqz v7, :cond_3

    .line 428
    add-int/lit8 v5, v6, 0x1

    .end local v6           #p:I
    .restart local v5       #p:I
    aget-byte v7, v2, v6

    and-int/lit16 v0, v7, 0xff

    move v6, v5

    .end local v5           #p:I
    .restart local v6       #p:I
    goto :goto_2

    .line 430
    :cond_3
    invoke-virtual {v3}, Ljava/io/InputStream;->reset()V

    .line 431
    int-to-long v7, v6

    invoke-static {v3, v7, v8}, Lorg/eclipse/jgit/util/IO;->skipFully(Ljava/io/InputStream;J)V

    .line 432
    iget-wide v7, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;->size:J

    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;->id:Lorg/eclipse/jgit/lib/ObjectId;

    #calls: Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->inflate(Ljava/io/InputStream;JLorg/eclipse/jgit/lib/ObjectId;)Ljava/io/InputStream;
    invoke-static {v3, v7, v8, v9}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->access$400(Ljava/io/InputStream;JLorg/eclipse/jgit/lib/ObjectId;)Ljava/io/InputStream;

    move-result-object v7

    #calls: Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->buffer(Ljava/io/InputStream;)Ljava/io/BufferedInputStream;
    invoke-static {v7}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->access$200(Ljava/io/InputStream;)Ljava/io/BufferedInputStream;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v3

    goto :goto_0

    .line 438
    .end local v0           #c:I
    .end local v2           #hdr:[B
    .end local v6           #p:I
    :catchall_0
    move-exception v7

    if-nez v4, :cond_4

    .line 439
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    :cond_4
    throw v7
.end method
