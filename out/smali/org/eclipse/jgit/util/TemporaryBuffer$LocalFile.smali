.class public Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;
.super Lorg/eclipse/jgit/util/TemporaryBuffer;
.source "TemporaryBuffer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/util/TemporaryBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LocalFile"
.end annotation


# instance fields
.field private final directory:Ljava/io/File;

.field private onDiskFile:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 366
    const/4 v0, 0x0

    const/high16 v1, 0x10

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;-><init>(Ljava/io/File;I)V

    .line 367
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .parameter "inCoreLimit"

    .prologue
    .line 377
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;-><init>(Ljava/io/File;I)V

    .line 378
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .parameter "directory"

    .prologue
    .line 390
    const/high16 v0, 0x10

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;-><init>(Ljava/io/File;I)V

    .line 391
    return-void
.end method

.method public constructor <init>(Ljava/io/File;I)V
    .locals 0
    .parameter "directory"
    .parameter "inCoreLimit"

    .prologue
    .line 406
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/util/TemporaryBuffer;-><init>(I)V

    .line 407
    iput-object p1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;->directory:Ljava/io/File;

    .line 408
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 470
    invoke-super {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->destroy()V

    .line 472
    iget-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;->onDiskFile:Ljava/io/File;

    if-eqz v0, :cond_1

    .line 474
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;->onDiskFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_0

    .line 475
    iget-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;->onDiskFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->deleteOnExit()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 477
    :cond_0
    iput-object v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;->onDiskFile:Ljava/io/File;

    .line 480
    :cond_1
    return-void

    .line 477
    :catchall_0
    move-exception v0

    iput-object v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;->onDiskFile:Ljava/io/File;

    throw v0
.end method

.method public length()J
    .locals 2

    .prologue
    .line 416
    iget-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;->onDiskFile:Ljava/io/File;

    if-nez v0, :cond_0

    .line 417
    invoke-super {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->length()J

    move-result-wide v0

    .line 419
    :goto_0
    return-wide v0

    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;->onDiskFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    goto :goto_0
.end method

.method public openInputStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 463
    iget-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;->onDiskFile:Ljava/io/File;

    if-nez v0, :cond_0

    .line 464
    invoke-super {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->openInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 465
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;->onDiskFile:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    goto :goto_0
.end method

.method protected overflow()Ljava/io/OutputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 411
    const-string v0, "jgit_"

    const-string v1, ".buf"

    iget-object v2, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;->directory:Ljava/io/File;

    invoke-static {v0, v1, v2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;->onDiskFile:Ljava/io/File;

    .line 412
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;->onDiskFile:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method public toByteArray()[B
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 423
    iget-object v4, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;->onDiskFile:Ljava/io/File;

    if-nez v4, :cond_0

    .line 424
    invoke-super {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->toByteArray()[B

    move-result-object v3

    .line 437
    :goto_0
    return-object v3

    .line 427
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;->length()J

    move-result-wide v1

    .line 428
    .local v1, len:J
    const-wide/32 v4, 0x7fffffff

    cmp-long v4, v4, v1

    if-gez v4, :cond_1

    .line 429
    new-instance v4, Ljava/lang/OutOfMemoryError;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->lengthExceedsMaximumArraySize:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/lang/OutOfMemoryError;-><init>(Ljava/lang/String;)V

    throw v4

    .line 430
    :cond_1
    long-to-int v4, v1

    new-array v3, v4, [B

    .line 431
    .local v3, out:[B
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v4, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;->onDiskFile:Ljava/io/File;

    invoke-direct {v0, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 433
    .local v0, in:Ljava/io/FileInputStream;
    const/4 v4, 0x0

    long-to-int v5, v1

    :try_start_0
    invoke-static {v0, v3, v4, v5}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 435
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    goto :goto_0

    :catchall_0
    move-exception v4

    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    throw v4
.end method

.method public writeTo(Ljava/io/OutputStream;Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 4
    .parameter "os"
    .parameter "pm"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 442
    iget-object v3, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;->onDiskFile:Ljava/io/File;

    if-nez v3, :cond_0

    .line 443
    invoke-super {p0, p1, p2}, Lorg/eclipse/jgit/util/TemporaryBuffer;->writeTo(Ljava/io/OutputStream;Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 459
    :goto_0
    return-void

    .line 446
    :cond_0
    if-nez p2, :cond_1

    .line 447
    sget-object p2, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    .line 448
    :cond_1
    new-instance v2, Ljava/io/FileInputStream;

    iget-object v3, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;->onDiskFile:Ljava/io/File;

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 451
    .local v2, in:Ljava/io/FileInputStream;
    const/16 v3, 0x2000

    :try_start_0
    new-array v0, v3, [B

    .line 452
    .local v0, buf:[B
    :goto_1
    invoke-virtual {v2, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v1

    .local v1, cnt:I
    if-ltz v1, :cond_2

    .line 453
    const/4 v3, 0x0

    invoke-virtual {p1, v0, v3, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 454
    div-int/lit16 v3, v1, 0x400

    invoke-interface {p2, v3}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 457
    .end local v0           #buf:[B
    .end local v1           #cnt:I
    :catchall_0
    move-exception v3

    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    throw v3

    .restart local v0       #buf:[B
    .restart local v1       #cnt:I
    :cond_2
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    goto :goto_0
.end method
