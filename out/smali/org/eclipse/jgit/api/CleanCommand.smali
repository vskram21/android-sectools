.class public Lorg/eclipse/jgit/api/CleanCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "CleanCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Ljava/util/Set",
        "<",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# instance fields
.field private directories:Z

.field private dryRun:Z

.field private ignore:Z

.field private paths:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 68
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/api/CleanCommand;->paths:Ljava/util/Set;

    .line 74
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/api/CleanCommand;->ignore:Z

    .line 81
    return-void
.end method

.method private filterFolders(Ljava/util/Set;Ljava/util/Set;)Ljava/util/Set;
    .locals 6
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 162
    .local p1, untracked:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    .local p2, untrackedFolders:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/TreeSet;

    invoke-direct {v1, p1}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    .line 163
    .local v1, filtered:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 164
    .local v0, file:Ljava/lang/String;
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 165
    .local v2, folder:Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 166
    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 171
    .end local v0           #file:Ljava/lang/String;
    .end local v2           #folder:Ljava/lang/String;
    .end local v4           #i$:Ljava/util/Iterator;
    :cond_2
    return-object v1
.end method

.method private filterIgnorePaths(Ljava/util/Set;Ljava/util/Set;Z)Ljava/util/Set;
    .locals 6
    .parameter
    .parameter
    .parameter "exact"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;Z)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 145
    .local p1, inputPaths:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    .local p2, ignoredNotInIndex:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    iget-boolean v5, p0, Lorg/eclipse/jgit/api/CleanCommand;->ignore:Z

    if-eqz v5, :cond_4

    .line 146
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0, p1}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    .line 147
    .local v0, filtered:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 148
    .local v4, path:Ljava/lang/String;
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 149
    .local v3, ignored:Ljava/lang/String;
    if-eqz p3, :cond_2

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    :cond_2
    if-nez p3, :cond_1

    invoke-virtual {v4, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 151
    :cond_3
    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .end local v0           #filtered:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v3           #ignored:Ljava/lang/String;
    .end local v4           #path:Ljava/lang/String;
    :cond_4
    move-object v0, p1

    .line 157
    :cond_5
    return-object v0
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
    .line 66
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CleanCommand;->call()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/Set;
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NoWorkTreeException;,
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 94
    new-instance v9, Ljava/util/TreeSet;

    invoke-direct {v9}, Ljava/util/TreeSet;-><init>()V

    .line 96
    .local v9, files:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    :try_start_0
    new-instance v4, Lorg/eclipse/jgit/api/StatusCommand;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CleanCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-direct {v4, v0}, Lorg/eclipse/jgit/api/StatusCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 97
    .local v4, command:Lorg/eclipse/jgit/api/StatusCommand;
    invoke-virtual {v4}, Lorg/eclipse/jgit/api/StatusCommand;->call()Lorg/eclipse/jgit/api/Status;

    move-result-object v16

    .line 99
    .local v16, status:Lorg/eclipse/jgit/api/Status;
    new-instance v18, Ljava/util/TreeSet;

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/api/Status;->getUntracked()Ljava/util/Set;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    .line 101
    .local v18, untrackedAndIgnoredFiles:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v17, Ljava/util/TreeSet;

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/api/Status;->getUntrackedFolders()Ljava/util/Set;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    .line 104
    .local v17, untrackedAndIgnoredDirs:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/api/CleanCommand;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v11

    .line 105
    .local v11, fs:Lorg/eclipse/jgit/util/FS;
    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/api/Status;->getIgnoredNotInIndex()Ljava/util/Set;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .local v12, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_3

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    .line 106
    .local v15, p:Ljava/lang/String;
    new-instance v7, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CleanCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v7, v0, v15}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 107
    .local v7, f:Ljava/io/File;
    invoke-virtual {v11, v7}, Lorg/eclipse/jgit/util/FS;->isFile(Ljava/io/File;)Z

    move-result v19

    if-nez v19, :cond_1

    invoke-virtual {v11, v7}, Lorg/eclipse/jgit/util/FS;->isSymLink(Ljava/io/File;)Z

    move-result v19

    if-eqz v19, :cond_2

    .line 108
    :cond_1
    move-object/from16 v0, v18

    invoke-interface {v0, v15}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 137
    .end local v4           #command:Lorg/eclipse/jgit/api/StatusCommand;
    .end local v7           #f:Ljava/io/File;
    .end local v11           #fs:Lorg/eclipse/jgit/util/FS;
    .end local v12           #i$:Ljava/util/Iterator;
    .end local v15           #p:Ljava/lang/String;
    .end local v16           #status:Lorg/eclipse/jgit/api/Status;
    .end local v17           #untrackedAndIgnoredDirs:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    .end local v18           #untrackedAndIgnoredFiles:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    :catch_0
    move-exception v6

    .line 138
    .local v6, e:Ljava/io/IOException;
    new-instance v19, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v6}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v0, v1, v6}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v19

    .line 109
    .end local v6           #e:Ljava/io/IOException;
    .restart local v4       #command:Lorg/eclipse/jgit/api/StatusCommand;
    .restart local v7       #f:Ljava/io/File;
    .restart local v11       #fs:Lorg/eclipse/jgit/util/FS;
    .restart local v12       #i$:Ljava/util/Iterator;
    .restart local v15       #p:Ljava/lang/String;
    .restart local v16       #status:Lorg/eclipse/jgit/api/Status;
    .restart local v17       #untrackedAndIgnoredDirs:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v18       #untrackedAndIgnoredFiles:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    :cond_2
    :try_start_1
    invoke-virtual {v11, v7}, Lorg/eclipse/jgit/util/FS;->isDirectory(Ljava/io/File;)Z

    move-result v19

    if-eqz v19, :cond_0

    .line 110
    move-object/from16 v0, v17

    invoke-interface {v0, v15}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 113
    .end local v7           #f:Ljava/io/File;
    .end local v15           #p:Ljava/lang/String;
    :cond_3
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/CleanCommand;->filterFolders(Ljava/util/Set;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v10

    .line 116
    .local v10, filtered:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/api/Status;->getIgnoredNotInIndex()Ljava/util/Set;

    move-result-object v19

    const/16 v20, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v10, v1, v2}, Lorg/eclipse/jgit/api/CleanCommand;->filterIgnorePaths(Ljava/util/Set;Ljava/util/Set;Z)Ljava/util/Set;

    move-result-object v14

    .line 118
    .local v14, notIgnoredFiles:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/api/Status;->getIgnoredNotInIndex()Ljava/util/Set;

    move-result-object v19

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v19

    move/from16 v3, v20

    invoke-direct {v0, v1, v2, v3}, Lorg/eclipse/jgit/api/CleanCommand;->filterIgnorePaths(Ljava/util/Set;Ljava/util/Set;Z)Ljava/util/Set;

    move-result-object v13

    .line 122
    .local v13, notIgnoredDirs:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_4
    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_7

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 123
    .local v8, file:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CleanCommand;->paths:Ljava/util/Set;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/Set;->isEmpty()Z

    move-result v19

    if-nez v19, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CleanCommand;->paths:Ljava/util/Set;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_4

    .line 124
    :cond_5
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/CleanCommand;->dryRun:Z

    move/from16 v19, v0

    if-nez v19, :cond_6

    .line 125
    new-instance v19, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CleanCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v0, v1, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static/range {v19 .. v19}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V

    .line 126
    :cond_6
    invoke-interface {v9, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 129
    .end local v8           #file:Ljava/lang/String;
    :cond_7
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/CleanCommand;->directories:Z

    move/from16 v19, v0

    if-eqz v19, :cond_b

    .line 130
    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_8
    :goto_2
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_b

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 131
    .local v5, dir:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CleanCommand;->paths:Ljava/util/Set;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/Set;->isEmpty()Z

    move-result v19

    if-nez v19, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CleanCommand;->paths:Ljava/util/Set;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_8

    .line 132
    :cond_9
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/CleanCommand;->dryRun:Z

    move/from16 v19, v0

    if-nez v19, :cond_a

    .line 133
    new-instance v19, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CleanCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v0, v1, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const/16 v20, 0x1

    invoke-static/range {v19 .. v20}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    .line 135
    :cond_a
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "/"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v9, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 140
    .end local v5           #dir:Ljava/lang/String;
    :cond_b
    return-object v9
.end method

.method public setCleanDirectories(Z)Lorg/eclipse/jgit/api/CleanCommand;
    .locals 0
    .parameter "dirs"

    .prologue
    .line 206
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/CleanCommand;->directories:Z

    .line 207
    return-object p0
.end method

.method public setDryRun(Z)Lorg/eclipse/jgit/api/CleanCommand;
    .locals 0
    .parameter "dryRun"

    .prologue
    .line 194
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/CleanCommand;->dryRun:Z

    .line 195
    return-object p0
.end method

.method public setIgnore(Z)Lorg/eclipse/jgit/api/CleanCommand;
    .locals 0
    .parameter "ignore"

    .prologue
    .line 219
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/CleanCommand;->ignore:Z

    .line 220
    return-object p0
.end method

.method public setPaths(Ljava/util/Set;)Lorg/eclipse/jgit/api/CleanCommand;
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/eclipse/jgit/api/CleanCommand;"
        }
    .end annotation

    .prologue
    .line 182
    .local p1, paths:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    iput-object p1, p0, Lorg/eclipse/jgit/api/CleanCommand;->paths:Ljava/util/Set;

    .line 183
    return-object p0
.end method
