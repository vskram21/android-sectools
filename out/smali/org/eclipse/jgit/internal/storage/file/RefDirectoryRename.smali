.class Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;
.super Lorg/eclipse/jgit/lib/RefRename;
.source "RefDirectoryRename.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename$1;
    }
.end annotation


# instance fields
.field private objId:Lorg/eclipse/jgit/lib/ObjectId;

.field private final refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

.field private tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

.field private updateHEAD:Z


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;)V
    .locals 1
    .parameter "src"
    .parameter "dst"

    .prologue
    .line 87
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/lib/RefRename;-><init>(Lorg/eclipse/jgit/lib/RefUpdate;Lorg/eclipse/jgit/lib/RefUpdate;)V

    .line 88
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getRefDatabase()Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    .line 89
    return-void
.end method

.method private linkHEAD(Lorg/eclipse/jgit/lib/RefUpdate;)Z
    .locals 6
    .parameter "target"

    .prologue
    const/4 v2, 0x0

    .line 217
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    const-string v4, "HEAD"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->newUpdate(Ljava/lang/String;Z)Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    move-result-object v1

    .line 218
    .local v1, u:Lorg/eclipse/jgit/lib/RefUpdate;
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RefUpdate;->disableRefLog()V

    .line 219
    sget-object v3, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/RefUpdate;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/eclipse/jgit/lib/RefUpdate;->link(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v4

    aget v3, v3, v4
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    packed-switch v3, :pswitch_data_0

    .line 228
    .end local v1           #u:Lorg/eclipse/jgit/lib/RefUpdate;
    :goto_0
    return v2

    .line 223
    .restart local v1       #u:Lorg/eclipse/jgit/lib/RefUpdate;
    :pswitch_0
    const/4 v2, 0x1

    goto :goto_0

    .line 227
    .end local v1           #u:Lorg/eclipse/jgit/lib/RefUpdate;
    :catch_0
    move-exception v0

    .line 228
    .local v0, e:Ljava/io/IOException;
    goto :goto_0

    .line 219
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static rename(Ljava/io/File;Ljava/io/File;)Z
    .locals 2
    .parameter "src"
    .parameter "dst"

    .prologue
    .line 206
    invoke-virtual {p0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 207
    const/4 v1, 0x1

    .line 212
    :goto_0
    return v1

    .line 209
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 210
    .local v0, dir:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-nez v1, :cond_2

    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_2

    .line 211
    const/4 v1, 0x0

    goto :goto_0

    .line 212
    :cond_2
    invoke-virtual {p0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v1

    goto :goto_0
.end method

.method private renameLog(Lorg/eclipse/jgit/lib/RefUpdate;Lorg/eclipse/jgit/lib/RefUpdate;)Z
    .locals 8
    .parameter "src"
    .parameter "dst"

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 186
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    invoke-virtual {v6}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->getLogWriter()Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;

    move-result-object v6

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/RefUpdate;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->logFor(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    .line 187
    .local v3, srcLog:Ljava/io/File;
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    invoke-virtual {v6}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->getLogWriter()Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;

    move-result-object v6

    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/RefUpdate;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->logFor(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 189
    .local v0, dstLog:Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_0

    .line 201
    :goto_0
    return v4

    .line 192
    :cond_0
    invoke-static {v3, v0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->rename(Ljava/io/File;Ljava/io/File;)Z

    move-result v6

    if-nez v6, :cond_1

    move v4, v5

    .line 193
    goto :goto_0

    .line 196
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/RefUpdate;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->levelsIn(Ljava/lang/String;)I

    move-result v6

    add-int/lit8 v2, v6, -0x2

    .line 197
    .local v2, levels:I
    invoke-static {v3, v2}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->delete(Ljava/io/File;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 199
    .end local v2           #levels:I
    :catch_0
    move-exception v1

    .line 200
    .local v1, e:Ljava/io/IOException;
    invoke-static {v0, v3}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->rename(Ljava/io/File;Ljava/io/File;)Z

    move v4, v5

    .line 201
    goto :goto_0
.end method


# virtual methods
.method protected doRename()Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/RefUpdate;->getRef()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v3

    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 94
    sget-object v3, Lorg/eclipse/jgit/lib/RefUpdate$Result;->IO_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 181
    :goto_0
    return-object v3

    .line 96
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/RefUpdate;->getOldObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->objId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 97
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->needToUpdateHEAD()Z

    move-result v3

    iput-boolean v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->updateHEAD:Z

    .line 98
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->newTemporaryUpdate()Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    .line 99
    new-instance v2, Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 102
    .local v2, rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->objId:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 103
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->setForceUpdate(Z)V

    .line 104
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->disableRefLog()V

    .line 105
    sget-object v3, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-virtual {v4, v2}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->update(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 111
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getResult()Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 177
    :try_start_1
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->delete(Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 181
    :goto_1
    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    goto :goto_0

    .line 178
    :catch_0
    move-exception v1

    .line 179
    .local v1, err:Ljava/io/IOException;
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->fileFor(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V

    goto :goto_1

    .line 116
    .end local v1           #err:Ljava/io/IOException;
    :pswitch_0
    :try_start_2
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-direct {p0, v3, v4}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->renameLog(Lorg/eclipse/jgit/lib/RefUpdate;Lorg/eclipse/jgit/lib/RefUpdate;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 117
    sget-object v3, Lorg/eclipse/jgit/lib/RefUpdate$Result;->IO_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 177
    :try_start_3
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->delete(Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 181
    :goto_2
    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    goto :goto_0

    .line 178
    :catch_1
    move-exception v1

    .line 179
    .restart local v1       #err:Ljava/io/IOException;
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->fileFor(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V

    goto :goto_2

    .line 122
    .end local v1           #err:Ljava/io/IOException;
    :cond_1
    :try_start_4
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->destination:Lorg/eclipse/jgit/lib/RefUpdate;

    .line 123
    .local v0, dst:Lorg/eclipse/jgit/lib/RefUpdate;
    iget-boolean v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->updateHEAD:Z

    if-eqz v3, :cond_3

    .line 124
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->destination:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-direct {p0, v3}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->linkHEAD(Lorg/eclipse/jgit/lib/RefUpdate;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 125
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-direct {p0, v3, v4}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->renameLog(Lorg/eclipse/jgit/lib/RefUpdate;Lorg/eclipse/jgit/lib/RefUpdate;)Z

    .line 126
    sget-object v3, Lorg/eclipse/jgit/lib/RefUpdate$Result;->LOCK_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 177
    :try_start_5
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->delete(Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 181
    :goto_3
    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    goto/16 :goto_0

    .line 178
    :catch_2
    move-exception v1

    .line 179
    .restart local v1       #err:Ljava/io/IOException;
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->fileFor(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V

    goto :goto_3

    .line 130
    .end local v1           #err:Ljava/io/IOException;
    :cond_2
    :try_start_6
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    const-string v4, "HEAD"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->newUpdate(Ljava/lang/String;Z)Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    move-result-object v0

    .line 131
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->destination:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/RefUpdate;->getRefLogIdent()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogIdent(Lorg/eclipse/jgit/lib/PersonIdent;)V

    .line 132
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->destination:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/RefUpdate;->getRefLogMessage()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogMessage(Ljava/lang/String;Z)V

    .line 136
    :cond_3
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->objId:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 137
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/lib/RefUpdate;->setForceUpdate(Z)V

    .line 138
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/RefUpdate;->disableRefLog()V

    .line 139
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v3, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->delete(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v3

    sget-object v4, Lorg/eclipse/jgit/lib/RefUpdate$Result;->FORCED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    if-eq v3, v4, :cond_5

    .line 140
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-direct {p0, v3, v4}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->renameLog(Lorg/eclipse/jgit/lib/RefUpdate;Lorg/eclipse/jgit/lib/RefUpdate;)Z

    .line 141
    iget-boolean v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->updateHEAD:Z

    if-eqz v3, :cond_4

    .line 142
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-direct {p0, v3}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->linkHEAD(Lorg/eclipse/jgit/lib/RefUpdate;)Z

    .line 143
    :cond_4
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/RefUpdate;->getResult()Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-result-object v3

    .line 177
    :try_start_7
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->delete(Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;)V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    .line 181
    :goto_4
    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    goto/16 :goto_0

    .line 178
    :catch_3
    move-exception v1

    .line 179
    .restart local v1       #err:Ljava/io/IOException;
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->fileFor(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V

    goto :goto_4

    .line 147
    .end local v1           #err:Ljava/io/IOException;
    :cond_5
    :try_start_8
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->destination:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-direct {p0, v3, v4}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->renameLog(Lorg/eclipse/jgit/lib/RefUpdate;Lorg/eclipse/jgit/lib/RefUpdate;)Z

    move-result v3

    if-nez v3, :cond_7

    .line 148
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-direct {p0, v3, v4}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->renameLog(Lorg/eclipse/jgit/lib/RefUpdate;Lorg/eclipse/jgit/lib/RefUpdate;)Z

    .line 149
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 150
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->objId:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 151
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v3, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->update(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 152
    iget-boolean v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->updateHEAD:Z

    if-eqz v3, :cond_6

    .line 153
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-direct {p0, v3}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->linkHEAD(Lorg/eclipse/jgit/lib/RefUpdate;)Z

    .line 154
    :cond_6
    sget-object v3, Lorg/eclipse/jgit/lib/RefUpdate$Result;->IO_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 177
    :try_start_9
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->delete(Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;)V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_4

    .line 181
    :goto_5
    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    goto/16 :goto_0

    .line 178
    :catch_4
    move-exception v1

    .line 179
    .restart local v1       #err:Ljava/io/IOException;
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->fileFor(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V

    goto :goto_5

    .line 158
    .end local v1           #err:Ljava/io/IOException;
    :cond_7
    :try_start_a
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 159
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->objId:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 160
    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->update(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v3

    sget-object v4, Lorg/eclipse/jgit/lib/RefUpdate$Result;->NEW:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    if-eq v3, v4, :cond_a

    .line 163
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->destination:Lorg/eclipse/jgit/lib/RefUpdate;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-direct {p0, v3, v4}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->renameLog(Lorg/eclipse/jgit/lib/RefUpdate;Lorg/eclipse/jgit/lib/RefUpdate;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 164
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-direct {p0, v3, v4}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->renameLog(Lorg/eclipse/jgit/lib/RefUpdate;Lorg/eclipse/jgit/lib/RefUpdate;)Z

    .line 165
    :cond_8
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 166
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->objId:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 167
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v3, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->update(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 168
    iget-boolean v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->updateHEAD:Z

    if-eqz v3, :cond_9

    .line 169
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-direct {p0, v3}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->linkHEAD(Lorg/eclipse/jgit/lib/RefUpdate;)Z

    .line 170
    :cond_9
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/RefUpdate;->getResult()Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    move-result-object v3

    .line 177
    :try_start_b
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->delete(Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;)V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_5

    .line 181
    :goto_6
    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    goto/16 :goto_0

    .line 178
    :catch_5
    move-exception v1

    .line 179
    .restart local v1       #err:Ljava/io/IOException;
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->fileFor(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V

    goto :goto_6

    .line 173
    .end local v1           #err:Ljava/io/IOException;
    :cond_a
    :try_start_c
    sget-object v3, Lorg/eclipse/jgit/lib/RefUpdate$Result;->RENAMED:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 177
    :try_start_d
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->delete(Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;)V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_6

    .line 181
    :goto_7
    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    goto/16 :goto_0

    .line 178
    :catch_6
    move-exception v1

    .line 179
    .restart local v1       #err:Ljava/io/IOException;
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->fileFor(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V

    goto :goto_7

    .line 176
    .end local v0           #dst:Lorg/eclipse/jgit/lib/RefUpdate;
    .end local v1           #err:Ljava/io/IOException;
    :catchall_0
    move-exception v3

    .line 177
    :try_start_e
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->delete(Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;)V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_7

    .line 181
    :goto_8
    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v3

    .line 178
    :catch_7
    move-exception v1

    .line 179
    .restart local v1       #err:Ljava/io/IOException;
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->refdb:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;->tmp:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->fileFor(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V

    goto :goto_8

    .line 105
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
