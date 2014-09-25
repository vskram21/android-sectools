.class final Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;
.super Ljava/lang/Object;
.source "WalkRemoteObjectDatabase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "FileStream"
.end annotation


# instance fields
.field final in:Ljava/io/InputStream;

.field final length:J


# direct methods
.method constructor <init>(Ljava/io/InputStream;)V
    .locals 2
    .parameter "i"

    .prologue
    .line 487
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 488
    iput-object p1, p0, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;->in:Ljava/io/InputStream;

    .line 489
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;->length:J

    .line 490
    return-void
.end method

.method constructor <init>(Ljava/io/InputStream;J)V
    .locals 0
    .parameter "i"
    .parameter "n"

    .prologue
    .line 502
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 503
    iput-object p1, p0, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;->in:Ljava/io/InputStream;

    .line 504
    iput-wide p2, p0, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;->length:J

    .line 505
    return-void
.end method


# virtual methods
.method toArray()[B
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 509
    :try_start_0
    iget-wide v3, p0, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;->length:J

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-ltz v3, :cond_0

    .line 510
    iget-wide v3, p0, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;->length:J

    long-to-int v3, v3

    new-array v2, v3, [B

    .line 511
    .local v2, r:[B
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;->in:Ljava/io/InputStream;

    const/4 v4, 0x0

    array-length v5, v2

    invoke-static {v3, v2, v4, v5}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 522
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;->in:Ljava/io/InputStream;

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .end local v2           #r:[B
    :goto_0
    return-object v2

    .line 515
    :cond_0
    :try_start_1
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 516
    .local v2, r:Ljava/io/ByteArrayOutputStream;
    const/16 v3, 0x800

    new-array v0, v3, [B

    .line 518
    .local v0, buf:[B
    :goto_1
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;->in:Ljava/io/InputStream;

    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, n:I
    if-ltz v1, :cond_1

    .line 519
    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3, v1}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 522
    .end local v0           #buf:[B
    .end local v1           #n:I
    .end local v2           #r:Ljava/io/ByteArrayOutputStream;
    :catchall_0
    move-exception v3

    iget-object v4, p0, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;->in:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    throw v3

    .line 520
    .restart local v0       #buf:[B
    .restart local v1       #n:I
    .restart local v2       #r:Ljava/io/ByteArrayOutputStream;
    :cond_1
    :try_start_2
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v2

    .line 522
    .end local v2           #r:Ljava/io/ByteArrayOutputStream;
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;->in:Ljava/io/InputStream;

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    goto :goto_0
.end method
