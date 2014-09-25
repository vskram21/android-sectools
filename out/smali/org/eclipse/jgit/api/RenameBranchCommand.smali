.class public Lorg/eclipse/jgit/api/RenameBranchCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "RenameBranchCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Lorg/eclipse/jgit/lib/Ref;",
        ">;"
    }
.end annotation


# instance fields
.field private newName:Ljava/lang/String;

.field private oldName:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 0
    .parameter "repo"

    .prologue
    .line 82
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 83
    return-void
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
    .line 73
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/RenameBranchCommand;->call()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/lib/Ref;
    .locals 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/RefNotFoundException;,
            Lorg/eclipse/jgit/api/errors/InvalidRefNameException;,
            Lorg/eclipse/jgit/api/errors/RefAlreadyExistsException;,
            Lorg/eclipse/jgit/api/errors/DetachedHeadException;
        }
    .end annotation

    .prologue
    .line 100
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/api/RenameBranchCommand;->checkCallable()V

    .line 102
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RenameBranchCommand;->newName:Ljava/lang/String;

    move-object/from16 v18, v0

    if-nez v18, :cond_0

    .line 103
    new-instance v18, Lorg/eclipse/jgit/api/errors/InvalidRefNameException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v19

    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->branchNameInvalid:Ljava/lang/String;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    const-string v22, "<null>"

    aput-object v22, v20, v21

    invoke-static/range {v19 .. v20}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lorg/eclipse/jgit/api/errors/InvalidRefNameException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 109
    :cond_0
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RenameBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RenameBranchCommand;->newName:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v18

    if-eqz v18, :cond_1

    .line 110
    new-instance v18, Lorg/eclipse/jgit/api/errors/RefAlreadyExistsException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v19

    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->refAlreadyExists1:Ljava/lang/String;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RenameBranchCommand;->newName:Ljava/lang/String;

    move-object/from16 v22, v0

    aput-object v22, v20, v21

    invoke-static/range {v19 .. v20}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lorg/eclipse/jgit/api/errors/RefAlreadyExistsException;-><init>(Ljava/lang/String;)V

    throw v18
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 189
    :catch_0
    move-exception v8

    .line 190
    .local v8, ioe:Ljava/io/IOException;
    new-instance v18, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v8}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v8}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v18

    .line 112
    .end local v8           #ioe:Ljava/io/IOException;
    :cond_1
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RenameBranchCommand;->oldName:Ljava/lang/String;

    move-object/from16 v18, v0

    if-eqz v18, :cond_5

    .line 113
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RenameBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RenameBranchCommand;->oldName:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v11

    .line 114
    .local v11, ref:Lorg/eclipse/jgit/lib/Ref;
    if-nez v11, :cond_2

    .line 115
    new-instance v18, Lorg/eclipse/jgit/api/errors/RefNotFoundException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v19

    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->refNotResolved:Ljava/lang/String;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RenameBranchCommand;->oldName:Ljava/lang/String;

    move-object/from16 v22, v0

    aput-object v22, v20, v21

    invoke-static/range {v19 .. v20}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lorg/eclipse/jgit/api/errors/RefNotFoundException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 117
    :cond_2
    invoke-interface {v11}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v18

    const-string v19, "refs/tags/"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_3

    .line 118
    new-instance v18, Lorg/eclipse/jgit/api/errors/RefNotFoundException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v19

    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->renameBranchFailedBecauseTag:Ljava/lang/String;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RenameBranchCommand;->oldName:Ljava/lang/String;

    move-object/from16 v22, v0

    aput-object v22, v20, v21

    invoke-static/range {v19 .. v20}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lorg/eclipse/jgit/api/errors/RefNotFoundException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 121
    :cond_3
    invoke-interface {v11}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v6

    .line 128
    .end local v11           #ref:Lorg/eclipse/jgit/lib/Ref;
    .local v6, fullOldName:Ljava/lang/String;
    :cond_4
    const-string v18, "refs/remotes/"

    move-object/from16 v0, v18

    invoke-virtual {v6, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_6

    .line 129
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "refs/remotes/"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RenameBranchCommand;->newName:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 134
    .local v5, fullNewName:Ljava/lang/String;
    :goto_0
    invoke-static {v5}, Lorg/eclipse/jgit/lib/Repository;->isValidRefName(Ljava/lang/String;)Z

    move-result v18

    if-nez v18, :cond_7

    .line 135
    new-instance v18, Lorg/eclipse/jgit/api/errors/InvalidRefNameException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v19

    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->branchNameInvalid:Ljava/lang/String;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput-object v5, v20, v21

    invoke-static/range {v19 .. v20}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lorg/eclipse/jgit/api/errors/InvalidRefNameException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 123
    .end local v5           #fullNewName:Ljava/lang/String;
    .end local v6           #fullOldName:Ljava/lang/String;
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RenameBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/lib/Repository;->getFullBranch()Ljava/lang/String;

    move-result-object v6

    .line 124
    .restart local v6       #fullOldName:Ljava/lang/String;
    invoke-static {v6}, Lorg/eclipse/jgit/lib/ObjectId;->isId(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_4

    .line 125
    new-instance v18, Lorg/eclipse/jgit/api/errors/DetachedHeadException;

    invoke-direct/range {v18 .. v18}, Lorg/eclipse/jgit/api/errors/DetachedHeadException;-><init>()V

    throw v18

    .line 131
    :cond_6
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "refs/heads/"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RenameBranchCommand;->newName:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .restart local v5       #fullNewName:Ljava/lang/String;
    goto :goto_0

    .line 138
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RenameBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v6, v5}, Lorg/eclipse/jgit/lib/Repository;->renameRef(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefRename;

    move-result-object v12

    .line 139
    .local v12, rename:Lorg/eclipse/jgit/lib/RefRename;
    invoke-virtual {v12}, Lorg/eclipse/jgit/lib/RefRename;->rename()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v13

    .line 141
    .local v13, renameResult:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    const/16 v18, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/api/RenameBranchCommand;->setCallable(Z)V

    .line 143
    sget-object v18, Lorg/eclipse/jgit/lib/RefUpdate$Result;->RENAMED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-object/from16 v0, v18

    if-eq v0, v13, :cond_8

    .line 144
    new-instance v18, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v19

    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->renameBranchUnexpectedResult:Ljava/lang/String;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual {v13}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->name()Ljava/lang/String;

    move-result-object v22

    aput-object v22, v20, v21

    invoke-static/range {v19 .. v20}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 148
    :cond_8
    const-string v18, "refs/heads/"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_c

    .line 149
    const-string v18, "refs/heads/"

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v6, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v16

    .line 151
    .local v16, shortOldName:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RenameBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v14

    .line 153
    .local v14, repoConfig:Lorg/eclipse/jgit/lib/StoredConfig;
    const-string v18, "branch"

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v14, v0, v1}, Lorg/eclipse/jgit/lib/StoredConfig;->getNames(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Set;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, i$:Ljava/util/Iterator;
    :cond_9
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_b

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 155
    .local v9, name:Ljava/lang/String;
    const-string v18, "branch"

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v14, v0, v1, v9}, Lorg/eclipse/jgit/lib/StoredConfig;->getStringList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v17

    .line 158
    .local v17, values:[Ljava/lang/String;
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v18, v0

    if-eqz v18, :cond_9

    .line 162
    const-string v18, "branch"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RenameBranchCommand;->newName:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v14, v0, v1, v9}, Lorg/eclipse/jgit/lib/StoredConfig;->getStringList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 165
    .local v4, existing:[Ljava/lang/String;
    array-length v0, v4

    move/from16 v18, v0

    if-lez v18, :cond_a

    .line 166
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v18, v0

    array-length v0, v4

    move/from16 v19, v0

    add-int v18, v18, v19

    move/from16 v0, v18

    new-array v10, v0, [Ljava/lang/String;

    .line 168
    .local v10, newValues:[Ljava/lang/String;
    const/16 v18, 0x0

    const/16 v19, 0x0

    array-length v0, v4

    move/from16 v20, v0

    move/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-static {v4, v0, v10, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 170
    const/16 v18, 0x0

    array-length v0, v4

    move/from16 v19, v0

    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v20, v0

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-static {v0, v1, v10, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 172
    move-object/from16 v17, v10

    .line 175
    .end local v10           #newValues:[Ljava/lang/String;
    :cond_a
    const-string v18, "branch"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RenameBranchCommand;->newName:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-static/range {v17 .. v17}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v20

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v14, v0, v1, v9, v2}, Lorg/eclipse/jgit/lib/StoredConfig;->setStringList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    goto :goto_1

    .line 179
    .end local v4           #existing:[Ljava/lang/String;
    .end local v9           #name:Ljava/lang/String;
    .end local v17           #values:[Ljava/lang/String;
    :cond_b
    const-string v18, "branch"

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v14, v0, v1}, Lorg/eclipse/jgit/lib/StoredConfig;->unsetSection(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    invoke-virtual {v14}, Lorg/eclipse/jgit/lib/StoredConfig;->save()V

    .line 184
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v14           #repoConfig:Lorg/eclipse/jgit/lib/StoredConfig;
    .end local v16           #shortOldName:Ljava/lang/String;
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RenameBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RenameBranchCommand;->newName:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v15

    .line 185
    .local v15, resultRef:Lorg/eclipse/jgit/lib/Ref;
    if-nez v15, :cond_d

    .line 186
    new-instance v18, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v19

    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->renameBranchFailedUnknownReason:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-direct/range {v18 .. v19}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v18
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 188
    :cond_d
    return-object v15
.end method

.method public setNewName(Ljava/lang/String;)Lorg/eclipse/jgit/api/RenameBranchCommand;
    .locals 0
    .parameter "newName"

    .prologue
    .line 200
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/RenameBranchCommand;->checkCallable()V

    .line 201
    iput-object p1, p0, Lorg/eclipse/jgit/api/RenameBranchCommand;->newName:Ljava/lang/String;

    .line 202
    return-object p0
.end method

.method public setOldName(Ljava/lang/String;)Lorg/eclipse/jgit/api/RenameBranchCommand;
    .locals 0
    .parameter "oldName"

    .prologue
    .line 212
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/RenameBranchCommand;->checkCallable()V

    .line 213
    iput-object p1, p0, Lorg/eclipse/jgit/api/RenameBranchCommand;->oldName:Ljava/lang/String;

    .line 214
    return-object p0
.end method
