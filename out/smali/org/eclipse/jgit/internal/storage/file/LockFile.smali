.class public Lorg/eclipse/jgit/internal/storage/file/LockFile;
.super Ljava/lang/Object;
.source "LockFile.java"


# static fields
.field static final FILTER:Ljava/io/FilenameFilter; = null

.field static final SUFFIX:Ljava/lang/String; = ".lock"


# instance fields
.field private commitSnapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

.field private final fs:Lorg/eclipse/jgit/util/FS;

.field private fsync:Z

.field private haveLck:Z

.field private final lck:Ljava/io/File;

.field private needSnapshot:Z

.field private os:Ljava/io/FileOutputStream;

.field private final ref:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 111
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/LockFile$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/internal/storage/file/LockFile$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->FILTER:Ljava/io/FilenameFilter;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V
    .locals 1
    .parameter "f"
    .parameter "fs"

    .prologue
    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 143
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->ref:Ljava/io/File;

    .line 144
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->ref:Ljava/io/File;

    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->getLockFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->lck:Ljava/io/File;

    .line 145
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->fs:Lorg/eclipse/jgit/util/FS;

    .line 146
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/internal/storage/file/LockFile;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->fsync:Z

    return v0
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/internal/storage/file/LockFile;)Ljava/io/FileOutputStream;
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->os:Ljava/io/FileOutputStream;

    return-object v0
.end method

.method static synthetic access$102(Lorg/eclipse/jgit/internal/storage/file/LockFile;Ljava/io/FileOutputStream;)Ljava/io/FileOutputStream;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 76
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->os:Ljava/io/FileOutputStream;

    return-object p1
.end method

.method private deleteRef()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 455
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->fs:Lorg/eclipse/jgit/util/FS;

    invoke-virtual {v3}, Lorg/eclipse/jgit/util/FS;->retryFailedLockFileCommit()Z

    move-result v3

    if-nez v3, :cond_1

    .line 456
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->ref:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v2

    .line 470
    :cond_0
    :goto_0
    return v2

    .line 461
    :cond_1
    const/4 v0, 0x0

    .local v0, attempts:I
    :goto_1
    const/16 v3, 0xa

    if-ge v0, v3, :cond_0

    .line 462
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->ref:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 463
    const/4 v2, 0x1

    goto :goto_0

    .line 465
    :cond_2
    const-wide/16 v3, 0x64

    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 461
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 466
    :catch_0
    move-exception v1

    .line 467
    .local v1, e:Ljava/lang/InterruptedException;
    goto :goto_0
.end method

.method static getLockFile(Ljava/io/File;)Ljava/io/File;
    .locals 4
    .parameter "file"

    .prologue
    .line 107
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".lock"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private renameLock()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 474
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->fs:Lorg/eclipse/jgit/util/FS;

    invoke-virtual {v3}, Lorg/eclipse/jgit/util/FS;->retryFailedLockFileCommit()Z

    move-result v3

    if-nez v3, :cond_1

    .line 475
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->lck:Ljava/io/File;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->ref:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v2

    .line 489
    :cond_0
    :goto_0
    return v2

    .line 480
    :cond_1
    const/4 v0, 0x0

    .local v0, attempts:I
    :goto_1
    const/16 v3, 0xa

    if-ge v0, v3, :cond_0

    .line 481
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->lck:Ljava/io/File;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->ref:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 482
    const/4 v2, 0x1

    goto :goto_0

    .line 484
    :cond_2
    const-wide/16 v3, 0x64

    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 480
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 485
    :catch_0
    move-exception v1

    .line 486
    .local v1, e:Ljava/lang/InterruptedException;
    goto :goto_0
.end method

.method private requireLock()V
    .locals 5

    .prologue
    .line 362
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->os:Ljava/io/FileOutputStream;

    if-nez v0, :cond_0

    .line 363
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    .line 364
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->lockOnNotHeld:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->ref:Ljava/io/File;

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 366
    :cond_0
    return-void
.end method

.method private saveStatInformation()V
    .locals 1

    .prologue
    .line 493
    iget-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->needSnapshot:Z

    if-eqz v0, :cond_0

    .line 494
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->lck:Ljava/io/File;

    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->save(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->commitSnapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    .line 495
    :cond_0
    return-void
.end method

.method public static unlock(Ljava/io/File;)Z
    .locals 3
    .parameter "file"

    .prologue
    .line 90
    invoke-static {p0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->getLockFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v1

    .line 91
    .local v1, lockFile:Ljava/io/File;
    const/4 v0, 0x6

    .line 93
    .local v0, flags:I
    const/4 v2, 0x6

    :try_start_0
    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    :goto_0
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    :goto_1
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_1

    .line 94
    :catch_0
    move-exception v2

    goto :goto_0
.end method


# virtual methods
.method public commit()Z
    .locals 5

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 434
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->os:Ljava/io/FileOutputStream;

    if-eqz v2, :cond_0

    .line 435
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    .line 436
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->lockOnNotClosed:Ljava/lang/String;

    new-array v0, v0, [Ljava/lang/Object;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->ref:Ljava/io/File;

    aput-object v4, v0, v1

    invoke-static {v3, v0}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 439
    :cond_0
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->saveStatInformation()V

    .line 440
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->lck:Ljava/io/File;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->ref:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 441
    iput-boolean v1, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->haveLck:Z

    .line 451
    :goto_0
    return v0

    .line 444
    :cond_1
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->ref:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->deleteRef()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 445
    :cond_2
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->renameLock()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 446
    iput-boolean v1, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->haveLck:Z

    goto :goto_0

    .line 450
    :cond_3
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    move v0, v1

    .line 451
    goto :goto_0
.end method

.method public copyCurrentContent()V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 207
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->requireLock()V

    .line 209
    :try_start_0
    new-instance v7, Ljava/io/FileInputStream;

    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->ref:Ljava/io/File;

    invoke-direct {v7, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_3

    .line 211
    .local v7, fis:Ljava/io/FileInputStream;
    :try_start_1
    iget-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->fsync:Z

    if-eqz v0, :cond_0

    .line 212
    invoke-virtual {v7}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    .line 213
    .local v1, in:Ljava/nio/channels/FileChannel;
    const-wide/16 v2, 0x0

    .line 214
    .local v2, pos:J
    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v4

    .line 215
    .local v4, cnt:J
    :goto_0
    const-wide/16 v11, 0x0

    cmp-long v0, v11, v4

    if-gez v0, :cond_1

    .line 216
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->os:Ljava/io/FileOutputStream;

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    invoke-virtual/range {v0 .. v5}, Ljava/nio/channels/FileChannel;->transferFrom(Ljava/nio/channels/ReadableByteChannel;JJ)J

    move-result-wide v9

    .line 217
    .local v9, r:J
    add-long/2addr v2, v9

    .line 218
    sub-long/2addr v4, v9

    .line 219
    goto :goto_0

    .line 221
    .end local v1           #in:Ljava/nio/channels/FileChannel;
    .end local v2           #pos:J
    .end local v4           #cnt:J
    .end local v9           #r:J
    :cond_0
    const/16 v0, 0x800

    new-array v6, v0, [B

    .line 223
    .local v6, buf:[B
    :goto_1
    invoke-virtual {v7, v6}, Ljava/io/FileInputStream;->read([B)I

    move-result v9

    .local v9, r:I
    if-ltz v9, :cond_1

    .line 224
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->os:Ljava/io/FileOutputStream;

    const/4 v11, 0x0

    invoke-virtual {v0, v6, v11, v9}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 227
    .end local v6           #buf:[B
    .end local v9           #r:I
    :catchall_0
    move-exception v0

    :try_start_2
    invoke-virtual {v7}, Ljava/io/FileInputStream;->close()V

    throw v0

    .line 229
    .end local v7           #fis:Ljava/io/FileInputStream;
    :catch_0
    move-exception v0

    .line 243
    :goto_2
    return-void

    .line 227
    .restart local v7       #fis:Ljava/io/FileInputStream;
    :cond_1
    invoke-virtual {v7}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Error; {:try_start_2 .. :try_end_2} :catch_3

    goto :goto_2

    .line 233
    .end local v7           #fis:Ljava/io/FileInputStream;
    :catch_1
    move-exception v8

    .line 234
    .local v8, ioe:Ljava/io/IOException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    .line 235
    throw v8

    .line 236
    .end local v8           #ioe:Ljava/io/IOException;
    :catch_2
    move-exception v8

    .line 237
    .local v8, ioe:Ljava/lang/RuntimeException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    .line 238
    throw v8

    .line 239
    .end local v8           #ioe:Ljava/lang/RuntimeException;
    :catch_3
    move-exception v8

    .line 240
    .local v8, ioe:Ljava/lang/Error;
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    .line 241
    throw v8
.end method

.method public createCommitSnapshot()V
    .locals 0

    .prologue
    .line 518
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->saveStatInformation()V

    .line 519
    return-void
.end method

.method public getCommitLastModified()J
    .locals 2

    .prologue
    .line 503
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->commitSnapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->lastModified()J

    move-result-wide v0

    return-wide v0
.end method

.method public getCommitSnapshot()Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;
    .locals 1

    .prologue
    .line 508
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->commitSnapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 2

    .prologue
    .line 315
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->requireLock()V

    .line 318
    iget-boolean v1, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->fsync:Z

    if-eqz v1, :cond_0

    .line 319
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->os:Ljava/io/FileOutputStream;

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    invoke-static {v1}, Ljava/nio/channels/Channels;->newOutputStream(Ljava/nio/channels/WritableByteChannel;)Ljava/io/OutputStream;

    move-result-object v0

    .line 323
    .local v0, out:Ljava/io/OutputStream;
    :goto_0
    new-instance v1, Lorg/eclipse/jgit/internal/storage/file/LockFile$2;

    invoke-direct {v1, p0, v0}, Lorg/eclipse/jgit/internal/storage/file/LockFile$2;-><init>(Lorg/eclipse/jgit/internal/storage/file/LockFile;Ljava/io/OutputStream;)V

    return-object v1

    .line 321
    .end local v0           #out:Ljava/io/OutputStream;
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->os:Ljava/io/FileOutputStream;

    .restart local v0       #out:Ljava/io/OutputStream;
    goto :goto_0
.end method

.method public lock()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 158
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->lck:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/FileUtils;->mkdirs(Ljava/io/File;Z)V

    .line 159
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->lck:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 160
    iput-boolean v2, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->haveLck:Z

    .line 162
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->lck:Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->os:Ljava/io/FileOutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    :cond_0
    iget-boolean v1, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->haveLck:Z

    return v1

    .line 163
    :catch_0
    move-exception v0

    .line 164
    .local v0, ioe:Ljava/io/IOException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    .line 165
    throw v0
.end method

.method public lockForAppend()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 181
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->lock()Z

    move-result v0

    if-nez v0, :cond_0

    .line 182
    const/4 v0, 0x0

    .line 184
    :goto_0
    return v0

    .line 183
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->copyCurrentContent()V

    .line 184
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public setFSync(Z)V
    .locals 0
    .parameter "on"

    .prologue
    .line 397
    iput-boolean p1, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->fsync:Z

    .line 398
    return-void
.end method

.method public setNeedSnapshot(Z)V
    .locals 0
    .parameter "on"

    .prologue
    .line 387
    iput-boolean p1, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->needSnapshot:Z

    .line 388
    return-void
.end method

.method public setNeedStatInformation(Z)V
    .locals 0
    .parameter "on"

    .prologue
    .line 377
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->setNeedSnapshot(Z)V

    .line 378
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 549
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "LockFile["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->lck:Ljava/io/File;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", haveLck="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->haveLck:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public unlock()V
    .locals 2

    .prologue
    .line 527
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->os:Ljava/io/FileOutputStream;

    if-eqz v0, :cond_0

    .line 529
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->os:Ljava/io/FileOutputStream;

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 533
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->os:Ljava/io/FileOutputStream;

    .line 536
    :cond_0
    iget-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->haveLck:Z

    if-eqz v0, :cond_1

    .line 537
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->haveLck:Z

    .line 539
    :try_start_1
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->lck:Ljava/io/File;

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 544
    :cond_1
    :goto_1
    return-void

    .line 540
    :catch_0
    move-exception v0

    goto :goto_1

    .line 530
    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method public waitForStatChange()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 413
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->ref:Ljava/io/File;

    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->save(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-result-object v1

    .line 414
    .local v1, o:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->lck:Ljava/io/File;

    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->save(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-result-object v0

    .line 415
    .local v0, n:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;
    :goto_0
    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->equals(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 416
    const-wide/16 v2, 0x19

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    .line 417
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->lck:Ljava/io/File;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/io/File;->setLastModified(J)Z

    .line 418
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->lck:Ljava/io/File;

    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->save(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-result-object v0

    goto :goto_0

    .line 420
    :cond_0
    return-void
.end method

.method public write(Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 3
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 259
    const/16 v1, 0x29

    new-array v0, v1, [B

    .line 260
    .local v0, buf:[B
    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lorg/eclipse/jgit/lib/ObjectId;->copyTo([BI)V

    .line 261
    const/16 v1, 0x28

    const/16 v2, 0xa

    aput-byte v2, v0, v1

    .line 262
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->write([B)V

    .line 263
    return-void
.end method

.method public write([B)V
    .locals 4
    .parameter "content"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 280
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->requireLock()V

    .line 282
    :try_start_0
    iget-boolean v3, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->fsync:Z

    if-eqz v3, :cond_1

    .line 283
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->os:Ljava/io/FileOutputStream;

    invoke-virtual {v3}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    .line 284
    .local v1, fc:Ljava/nio/channels/FileChannel;
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 285
    .local v0, buf:Ljava/nio/ByteBuffer;
    :goto_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    if-lez v3, :cond_0

    .line 286
    invoke-virtual {v1, v0}, Ljava/nio/channels/FileChannel;->write(Ljava/nio/ByteBuffer;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 293
    .end local v0           #buf:Ljava/nio/ByteBuffer;
    .end local v1           #fc:Ljava/nio/channels/FileChannel;
    :catch_0
    move-exception v2

    .line 294
    .local v2, ioe:Ljava/io/IOException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    .line 295
    throw v2

    .line 287
    .end local v2           #ioe:Ljava/io/IOException;
    .restart local v0       #buf:Ljava/nio/ByteBuffer;
    .restart local v1       #fc:Ljava/nio/channels/FileChannel;
    :cond_0
    const/4 v3, 0x1

    :try_start_1
    invoke-virtual {v1, v3}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 291
    .end local v0           #buf:Ljava/nio/ByteBuffer;
    .end local v1           #fc:Ljava/nio/channels/FileChannel;
    :goto_1
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->os:Ljava/io/FileOutputStream;

    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 292
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->os:Ljava/io/FileOutputStream;

    .line 303
    return-void

    .line 289
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile;->os:Ljava/io/FileOutputStream;

    invoke-virtual {v3, p1}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_1

    .line 296
    :catch_1
    move-exception v2

    .line 297
    .local v2, ioe:Ljava/lang/RuntimeException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    .line 298
    throw v2

    .line 299
    .end local v2           #ioe:Ljava/lang/RuntimeException;
    :catch_2
    move-exception v2

    .line 300
    .local v2, ioe:Ljava/lang/Error;
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    .line 301
    throw v2
.end method
