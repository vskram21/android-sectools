.class Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;
.super Lorg/eclipse/jgit/lib/RefUpdate;
.source "RefDirectoryUpdate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate$1;
    }
.end annotation


# instance fields
.field private final database:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

.field private lock:Lorg/eclipse/jgit/internal/storage/file/LockFile;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/RefDirectory;Lorg/eclipse/jgit/lib/Ref;)V
    .locals 0
    .parameter "r"
    .parameter "ref"

    .prologue
    .line 62
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/lib/RefUpdate;-><init>(Lorg/eclipse/jgit/lib/Ref;)V

    .line 63
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->database:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    .line 64
    return-void
.end method

.method private toResultString(Lorg/eclipse/jgit/lib/RefUpdate$Result;)Ljava/lang/String;
    .locals 2
    .parameter "status"

    .prologue
    .line 129
    sget-object v0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 137
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 131
    :pswitch_0
    const-string v0, "forced-update"

    goto :goto_0

    .line 133
    :pswitch_1
    const-string v0, "fast forward"

    goto :goto_0

    .line 135
    :pswitch_2
    const-string v0, "created"

    goto :goto_0

    .line 129
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method protected doDelete(Lorg/eclipse/jgit/lib/RefUpdate$Result;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 2
    .parameter "status"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getRef()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getLeaf()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getStorage()Lorg/eclipse/jgit/lib/Ref$Storage;

    move-result-object v0

    sget-object v1, Lorg/eclipse/jgit/lib/Ref$Storage;->NEW:Lorg/eclipse/jgit/lib/Ref$Storage;

    if-eq v0, v1, :cond_0

    .line 144
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->database:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->delete(Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;)V

    .line 145
    :cond_0
    return-object p1
.end method

.method protected doLink(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 5
    .parameter "target"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 150
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->database:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v2

    sget-object v3, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/StoredConfig;->get(Lorg/eclipse/jgit/lib/Config$SectionParser;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;

    .line 153
    .local v1, wc:Lorg/eclipse/jgit/internal/storage/file/WriteConfig;
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->lock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;->getFSyncRefFiles()Z

    move-result v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->setFSync(Z)V

    .line 154
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->lock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->setNeedStatInformation(Z)V

    .line 155
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->lock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ref: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->write([B)V

    .line 157
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getRefLogMessage()Ljava/lang/String;

    move-result-object v0

    .line 158
    .local v0, msg:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 159
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->database:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    const/4 v3, 0x0

    invoke-virtual {v2, p0, v0, v3}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->log(Lorg/eclipse/jgit/lib/RefUpdate;Ljava/lang/String;Z)V

    .line 160
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->lock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->commit()Z

    move-result v2

    if-nez v2, :cond_1

    .line 161
    sget-object v2, Lorg/eclipse/jgit/lib/RefUpdate$Result;->LOCK_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 166
    :goto_0
    return-object v2

    .line 162
    :cond_1
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->database:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->lock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->getCommitSnapshot()Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-result-object v3

    invoke-virtual {v2, p0, v3, p1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->storedSymbolicRef(Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;Ljava/lang/String;)V

    .line 164
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getRef()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v2

    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getStorage()Lorg/eclipse/jgit/lib/Ref$Storage;

    move-result-object v2

    sget-object v3, Lorg/eclipse/jgit/lib/Ref$Storage;->NEW:Lorg/eclipse/jgit/lib/Ref$Storage;

    if-ne v2, v3, :cond_2

    .line 165
    sget-object v2, Lorg/eclipse/jgit/lib/RefUpdate$Result;->NEW:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    goto :goto_0

    .line 166
    :cond_2
    sget-object v2, Lorg/eclipse/jgit/lib/RefUpdate$Result;->FORCED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    goto :goto_0
.end method

.method protected doUpdate(Lorg/eclipse/jgit/lib/RefUpdate$Result;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 6
    .parameter "status"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 102
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->database:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v3

    sget-object v4, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/lib/StoredConfig;->get(Lorg/eclipse/jgit/lib/Config$SectionParser;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;

    .line 105
    .local v2, wc:Lorg/eclipse/jgit/internal/storage/file/WriteConfig;
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->lock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;->getFSyncRefFiles()Z

    move-result v4

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->setFSync(Z)V

    .line 106
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->lock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {v3, v5}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->setNeedStatInformation(Z)V

    .line 107
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->lock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getNewObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->write(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 109
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getRefLogMessage()Ljava/lang/String;

    move-result-object v0

    .line 110
    .local v0, msg:Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 111
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->isRefLogIncludingResult()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 112
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->toResultString(Lorg/eclipse/jgit/lib/RefUpdate$Result;)Ljava/lang/String;

    move-result-object v1

    .line 113
    .local v1, strResult:Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 114
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_2

    .line 115
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 120
    .end local v1           #strResult:Ljava/lang/String;
    :cond_0
    :goto_0
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->database:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    invoke-virtual {v3, p0, v0, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->log(Lorg/eclipse/jgit/lib/RefUpdate;Ljava/lang/String;Z)V

    .line 122
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->lock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->commit()Z

    move-result v3

    if-nez v3, :cond_3

    .line 123
    sget-object p1, Lorg/eclipse/jgit/lib/RefUpdate$Result;->LOCK_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 125
    .end local p1
    :goto_1
    return-object p1

    .line 117
    .restart local v1       #strResult:Ljava/lang/String;
    .restart local p1
    :cond_2
    move-object v0, v1

    goto :goto_0

    .line 124
    .end local v1           #strResult:Ljava/lang/String;
    :cond_3
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->database:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->lock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->getCommitSnapshot()Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-result-object v4

    invoke-virtual {v3, p0, v4}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->stored(Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;)V

    goto :goto_1
.end method

.method protected getRefDatabase()Lorg/eclipse/jgit/internal/storage/file/RefDirectory;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->database:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    return-object v0
.end method

.method protected bridge synthetic getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;
    .locals 1

    .prologue
    .line 56
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getRefDatabase()Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    move-result-object v0

    return-object v0
.end method

.method protected getRepository()Lorg/eclipse/jgit/lib/Repository;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->database:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v0

    return-object v0
.end method

.method protected tryLock(Z)Z
    .locals 5
    .parameter "deref"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getRef()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 79
    .local v0, dst:Lorg/eclipse/jgit/lib/Ref;
    if-eqz p1, :cond_0

    .line 80
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getLeaf()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 81
    :cond_0
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v1

    .line 82
    .local v1, name:Ljava/lang/String;
    new-instance v2, Lorg/eclipse/jgit/internal/storage/file/LockFile;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->database:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    invoke-virtual {v3, v1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->fileFor(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/eclipse/jgit/internal/storage/file/LockFile;-><init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->lock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    .line 83
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->lock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->lock()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 84
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->database:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    invoke-virtual {v2, v1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 85
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    :goto_0
    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->setOldObjectId(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 86
    const/4 v2, 0x1

    .line 88
    :goto_1
    return v2

    .line 85
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 88
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method protected unlock()V
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->lock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    if-eqz v0, :cond_0

    .line 95
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->lock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    .line 96
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->lock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    .line 98
    :cond_0
    return-void
.end method
