.class public Lorg/eclipse/jgit/internal/storage/file/PackLock;
.super Ljava/lang/Object;
.source "PackLock.java"


# instance fields
.field private final fs:Lorg/eclipse/jgit/util/FS;

.field private final keepFile:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V
    .locals 6
    .parameter "packFile"
    .parameter "fs"

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 68
    .local v1, p:Ljava/io/File;
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    .line 69
    .local v0, n:Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x5

    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".keep"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackLock;->keepFile:Ljava/io/File;

    .line 70
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/file/PackLock;->fs:Lorg/eclipse/jgit/util/FS;

    .line 71
    return-void
.end method


# virtual methods
.method public lock(Ljava/lang/String;)Z
    .locals 4
    .parameter "msg"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 83
    if-nez p1, :cond_1

    .line 91
    :cond_0
    :goto_0
    return v1

    .line 85
    :cond_1
    const-string v2, "\n"

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 86
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 87
    :cond_2
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/LockFile;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackLock;->keepFile:Ljava/io/File;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackLock;->fs:Lorg/eclipse/jgit/util/FS;

    invoke-direct {v0, v2, v3}, Lorg/eclipse/jgit/internal/storage/file/LockFile;-><init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    .line 88
    .local v0, lf:Lorg/eclipse/jgit/internal/storage/file/LockFile;
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->lock()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 90
    invoke-static {p1}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->write([B)V

    .line 91
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->commit()Z

    move-result v1

    goto :goto_0
.end method

.method public unlock()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackLock;->keepFile:Ljava/io/File;

    invoke-static {v0}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V

    .line 102
    return-void
.end method
