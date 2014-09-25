.class public Lorg/eclipse/jgit/api/StashDropCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "StashDropCommand.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/api/StashDropCommand$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Lorg/eclipse/jgit/lib/ObjectId;",
        ">;"
    }
.end annotation


# instance fields
.field private all:Z

.field private stashRefEntry:I


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 0
    .parameter "repo"

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 85
    return-void
.end method

.method private createRefUpdate(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/RefUpdate;
    .locals 3
    .parameter "stashRef"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    iget-object v1, p0, Lorg/eclipse/jgit/api/StashDropCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v2, "refs/stash"

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v0

    .line 128
    .local v0, update:Lorg/eclipse/jgit/lib/RefUpdate;
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/RefUpdate;->disableRefLog()V

    .line 129
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 130
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->setForceUpdate(Z)V

    .line 131
    return-object v0
.end method

.method private deleteRef(Lorg/eclipse/jgit/lib/Ref;)V
    .locals 6
    .parameter "stashRef"

    .prologue
    .line 136
    :try_start_0
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/StashDropCommand;->createRefUpdate(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/RefUpdate;->delete()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v1

    .line 137
    .local v1, result:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    sget-object v2, Lorg/eclipse/jgit/lib/RefUpdate$Result;->FORCED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    if-eq v2, v1, :cond_0

    .line 138
    new-instance v2, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->stashDropDeleteRefFailed:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    .end local v1           #result:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :catch_0
    move-exception v0

    .line 141
    .local v0, e:Ljava/io/IOException;
    new-instance v2, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->stashDropFailed:Ljava/lang/String;

    invoke-direct {v2, v3, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 143
    .end local v0           #e:Ljava/io/IOException;
    .restart local v1       #result:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :cond_0
    return-void
.end method

.method private getRef()Lorg/eclipse/jgit/lib/Ref;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 119
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/api/StashDropCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v2, "refs/stash"

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 120
    :catch_0
    move-exception v0

    .line 121
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Lorg/eclipse/jgit/api/errors/InvalidRefNameException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->cannotRead:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "refs/stash"

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/eclipse/jgit/api/errors/InvalidRefNameException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private updateRef(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 8
    .parameter "stashRef"
    .parameter "newId"

    .prologue
    .line 147
    :try_start_0
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/StashDropCommand;->createRefUpdate(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v2

    .line 148
    .local v2, update:Lorg/eclipse/jgit/lib/RefUpdate;
    invoke-virtual {v2, p2}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 149
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/RefUpdate;->update()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v1

    .line 150
    .local v1, result:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    sget-object v3, Lorg/eclipse/jgit/api/StashDropCommand$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 156
    new-instance v3, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->updatingRefFailed:Ljava/lang/String;

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "refs/stash"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    const/4 v6, 0x2

    aput-object v1, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 160
    .end local v1           #result:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .end local v2           #update:Lorg/eclipse/jgit/lib/RefUpdate;
    :catch_0
    move-exception v0

    .line 161
    .local v0, e:Ljava/io/IOException;
    new-instance v3, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->stashDropFailed:Ljava/lang/String;

    invoke-direct {v3, v4, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 154
    .end local v0           #e:Ljava/io/IOException;
    .restart local v1       #result:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .restart local v2       #update:Lorg/eclipse/jgit/lib/RefUpdate;
    :pswitch_0
    return-void

    .line 150
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/StashDropCommand;->call()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 173
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/api/StashDropCommand;->checkCallable()V

    .line 175
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/StashDropCommand;->getRef()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v15

    .line 176
    .local v15, stashRef:Lorg/eclipse/jgit/lib/Ref;
    if-nez v15, :cond_0

    .line 177
    const/4 v4, 0x0

    .line 232
    :goto_0
    return-object v4

    .line 179
    :cond_0
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/eclipse/jgit/api/StashDropCommand;->all:Z

    if-eqz v4, :cond_1

    .line 180
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lorg/eclipse/jgit/api/StashDropCommand;->deleteRef(Lorg/eclipse/jgit/lib/Ref;)V

    .line 181
    const/4 v4, 0x0

    goto :goto_0

    .line 186
    :cond_1
    :try_start_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/api/StashDropCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v5, "refs/stash"

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/lib/Repository;->getReflogReader(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ReflogReader;

    move-result-object v12

    .line 187
    .local v12, reader:Lorg/eclipse/jgit/lib/ReflogReader;
    invoke-interface {v12}, Lorg/eclipse/jgit/lib/ReflogReader;->getReverseEntries()Ljava/util/List;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    .line 192
    .local v8, entries:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ReflogEntry;>;"
    move-object/from16 v0, p0

    iget v4, v0, Lorg/eclipse/jgit/api/StashDropCommand;->stashRefEntry:I

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v5

    if-lt v4, v5, :cond_2

    .line 193
    new-instance v4, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->stashDropMissingReflog:Ljava/lang/String;

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 188
    .end local v8           #entries:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ReflogEntry;>;"
    .end local v12           #reader:Lorg/eclipse/jgit/lib/ReflogReader;
    :catch_0
    move-exception v7

    .line 189
    .local v7, e:Ljava/io/IOException;
    new-instance v4, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->stashDropFailed:Ljava/lang/String;

    invoke-direct {v4, v5, v7}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 196
    .end local v7           #e:Ljava/io/IOException;
    .restart local v8       #entries:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ReflogEntry;>;"
    .restart local v12       #reader:Lorg/eclipse/jgit/lib/ReflogReader;
    :cond_2
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_3

    .line 197
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lorg/eclipse/jgit/api/StashDropCommand;->deleteRef(Lorg/eclipse/jgit/lib/Ref;)V

    .line 198
    const/4 v4, 0x0

    goto :goto_0

    .line 201
    :cond_3
    new-instance v1, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/api/StashDropCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;-><init>(Lorg/eclipse/jgit/lib/Repository;Z)V

    .line 202
    .local v1, writer:Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;
    const-string v4, "refs/stash"

    invoke-static {v4}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->refLockFor(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 203
    .local v2, stashLockRef:Ljava/lang/String;
    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->logFor(Ljava/lang/String;)Ljava/io/File;

    move-result-object v14

    .line 204
    .local v14, stashLockFile:Ljava/io/File;
    const-string v4, "refs/stash"

    invoke-virtual {v1, v4}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->logFor(Ljava/lang/String;)Ljava/io/File;

    move-result-object v13

    .line 205
    .local v13, stashFile:Ljava/io/File;
    invoke-virtual {v14}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 206
    new-instance v4, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->stashDropFailed:Ljava/lang/String;

    new-instance v6, Lorg/eclipse/jgit/errors/LockFailedException;

    invoke-direct {v6, v13}, Lorg/eclipse/jgit/errors/LockFailedException;-><init>(Ljava/io/File;)V

    invoke-direct {v4, v5, v6}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 209
    :cond_4
    move-object/from16 v0, p0

    iget v4, v0, Lorg/eclipse/jgit/api/StashDropCommand;->stashRefEntry:I

    invoke-interface {v8, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 210
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    .line 212
    .local v3, entryId:Lorg/eclipse/jgit/lib/ObjectId;
    :try_start_1
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v10, v4, -0x1

    .local v10, i:I
    :goto_1
    if-ltz v10, :cond_5

    .line 213
    invoke-interface {v8, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/eclipse/jgit/lib/ReflogEntry;

    .line 214
    .local v9, entry:Lorg/eclipse/jgit/lib/ReflogEntry;
    invoke-interface {v9}, Lorg/eclipse/jgit/lib/ReflogEntry;->getNewId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-interface {v9}, Lorg/eclipse/jgit/lib/ReflogEntry;->getWho()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v5

    invoke-interface {v9}, Lorg/eclipse/jgit/lib/ReflogEntry;->getComment()Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {v1 .. v6}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->log(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/PersonIdent;Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;

    .line 216
    invoke-interface {v9}, Lorg/eclipse/jgit/lib/ReflogEntry;->getNewId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    .line 212
    add-int/lit8 v10, v10, -0x1

    goto :goto_1

    .line 218
    .end local v9           #entry:Lorg/eclipse/jgit/lib/ReflogEntry;
    :cond_5
    invoke-virtual {v14, v13}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v4

    if-nez v4, :cond_6

    .line 219
    invoke-static {v13}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V

    .line 220
    invoke-virtual {v14, v13}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v4

    if-nez v4, :cond_6

    .line 221
    new-instance v4, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->renameFileFailed:Ljava/lang/String;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-virtual {v14}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v6, v16

    const/16 v16, 0x1

    invoke-virtual {v13}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v6, v16

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 225
    .end local v10           #i:I
    :catch_1
    move-exception v7

    .line 226
    .restart local v7       #e:Ljava/io/IOException;
    new-instance v4, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->stashDropFailed:Ljava/lang/String;

    invoke-direct {v4, v5, v7}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 228
    .end local v7           #e:Ljava/io/IOException;
    .restart local v10       #i:I
    :cond_6
    move-object/from16 v0, p0

    invoke-direct {v0, v15, v3}, Lorg/eclipse/jgit/api/StashDropCommand;->updateRef(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 231
    :try_start_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/api/StashDropCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v5, "refs/stash"

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v11

    .line 232
    .local v11, newStashRef:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v11, :cond_7

    invoke-interface {v11}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v4

    goto/16 :goto_0

    :cond_7
    const/4 v4, 0x0

    goto/16 :goto_0

    .line 233
    .end local v11           #newStashRef:Lorg/eclipse/jgit/lib/Ref;
    :catch_2
    move-exception v7

    .line 234
    .restart local v7       #e:Ljava/io/IOException;
    new-instance v4, Lorg/eclipse/jgit/api/errors/InvalidRefNameException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->cannotRead:Ljava/lang/String;

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v17, "refs/stash"

    aput-object v17, v6, v16

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v7}, Lorg/eclipse/jgit/api/errors/InvalidRefNameException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method public setAll(Z)Lorg/eclipse/jgit/api/StashDropCommand;
    .locals 0
    .parameter "all"

    .prologue
    .line 113
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/StashDropCommand;->all:Z

    .line 114
    return-object p0
.end method

.method public setStashRef(I)Lorg/eclipse/jgit/api/StashDropCommand;
    .locals 1
    .parameter "stashRef"

    .prologue
    .line 97
    if-gez p1, :cond_0

    .line 98
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 100
    :cond_0
    iput p1, p0, Lorg/eclipse/jgit/api/StashDropCommand;->stashRefEntry:I

    .line 101
    return-object p0
.end method
