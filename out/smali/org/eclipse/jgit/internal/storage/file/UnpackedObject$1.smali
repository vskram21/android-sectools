.class final Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$1;
.super Ljava/util/zip/InflaterInputStream;
.source "UnpackedObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->inflate(Ljava/io/InputStream;JLorg/eclipse/jgit/lib/ObjectId;)Ljava/io/InputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field private remaining:J

.field final synthetic val$id:Lorg/eclipse/jgit/lib/ObjectId;

.field final synthetic val$size:J


# direct methods
.method constructor <init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;JLorg/eclipse/jgit/lib/ObjectId;)V
    .locals 2
    .parameter "x0"
    .parameter "x1"
    .parameter
    .parameter

    .prologue
    .line 307
    iput-wide p3, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$1;->val$size:J

    iput-object p5, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$1;->val$id:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-direct {p0, p1, p2}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;)V

    .line 308
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$1;->val$size:J

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$1;->remaining:J

    return-void
.end method


# virtual methods
.method public close()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 326
    :try_start_0
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$1;->remaining:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 327
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$1;->in:Ljava/io/InputStream;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$1;->inf:Ljava/util/zip/Inflater;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$1;->val$id:Lorg/eclipse/jgit/lib/ObjectId;

    const/16 v3, 0x40

    new-array v3, v3, [B

    #calls: Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->checkValidEndOfStream(Ljava/io/InputStream;Ljava/util/zip/Inflater;Lorg/eclipse/jgit/lib/AnyObjectId;[B)V
    invoke-static {v0, v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->access$100(Ljava/io/InputStream;Ljava/util/zip/Inflater;Lorg/eclipse/jgit/lib/AnyObjectId;[B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 329
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$1;->inf:Ljava/util/zip/Inflater;

    invoke-static {v0}, Lorg/eclipse/jgit/lib/InflaterCache;->release(Ljava/util/zip/Inflater;)V

    .line 330
    invoke-super {p0}, Ljava/util/zip/InflaterInputStream;->close()V

    .line 332
    return-void

    .line 329
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$1;->inf:Ljava/util/zip/Inflater;

    invoke-static {v1}, Lorg/eclipse/jgit/lib/InflaterCache;->release(Ljava/util/zip/Inflater;)V

    .line 330
    invoke-super {p0}, Ljava/util/zip/InflaterInputStream;->close()V

    throw v0
.end method

.method public read([BII)I
    .locals 6
    .parameter "b"
    .parameter "off"
    .parameter "cnt"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 313
    :try_start_0
    invoke-super {p0, p1, p2, p3}, Ljava/util/zip/InflaterInputStream;->read([BII)I

    move-result v1

    .line 314
    .local v1, r:I
    if-lez v1, :cond_0

    .line 315
    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$1;->remaining:J

    int-to-long v4, v1

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$1;->remaining:J
    :try_end_0
    .catch Ljava/util/zip/ZipException; {:try_start_0 .. :try_end_0} :catch_0

    .line 316
    :cond_0
    return v1

    .line 317
    .end local v1           #r:I
    :catch_0
    move-exception v0

    .line 318
    .local v0, badStream:Ljava/util/zip/ZipException;
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$1;->val$id:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectBadStream:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v2
.end method
