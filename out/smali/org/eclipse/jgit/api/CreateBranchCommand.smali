.class public Lorg/eclipse/jgit/api/CreateBranchCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "CreateBranchCommand.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/api/CreateBranchCommand$1;,
        Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Lorg/eclipse/jgit/lib/Ref;",
        ">;"
    }
.end annotation


# instance fields
.field private force:Z

.field private name:Ljava/lang/String;

.field private startCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

.field private startPoint:Ljava/lang/String;

.field private upstreamMode:Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 109
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 77
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/api/CreateBranchCommand;->force:Z

    .line 81
    const-string v0, "HEAD"

    iput-object v0, p0, Lorg/eclipse/jgit/api/CreateBranchCommand;->startPoint:Ljava/lang/String;

    .line 110
    return-void
.end method

.method private getStartPoint()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/AmbiguousObjectException;,
            Lorg/eclipse/jgit/api/errors/RefNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 280
    iget-object v2, p0, Lorg/eclipse/jgit/api/CreateBranchCommand;->startCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v2, :cond_1

    .line 281
    iget-object v2, p0, Lorg/eclipse/jgit/api/CreateBranchCommand;->startCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    .line 293
    :cond_0
    return-object v1

    .line 282
    :cond_1
    const/4 v1, 0x0

    .line 284
    .local v1, result:Lorg/eclipse/jgit/lib/ObjectId;
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/api/CreateBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    iget-object v2, p0, Lorg/eclipse/jgit/api/CreateBranchCommand;->startPoint:Ljava/lang/String;

    if-nez v2, :cond_2

    const-string v2, "HEAD"

    :goto_0
    invoke-virtual {v3, v2}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/AmbiguousObjectException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 289
    if-nez v1, :cond_0

    .line 290
    new-instance v3, Lorg/eclipse/jgit/api/errors/RefNotFoundException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v4, v2, Lorg/eclipse/jgit/internal/JGitText;->refNotResolved:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v5, v2, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v2, p0, Lorg/eclipse/jgit/api/CreateBranchCommand;->startPoint:Ljava/lang/String;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lorg/eclipse/jgit/api/CreateBranchCommand;->startPoint:Ljava/lang/String;

    :goto_1
    aput-object v2, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Lorg/eclipse/jgit/api/errors/RefNotFoundException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 284
    :cond_2
    :try_start_1
    iget-object v2, p0, Lorg/eclipse/jgit/api/CreateBranchCommand;->startPoint:Ljava/lang/String;
    :try_end_1
    .catch Lorg/eclipse/jgit/errors/AmbiguousObjectException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 286
    :catch_0
    move-exception v0

    .line 287
    .local v0, e:Lorg/eclipse/jgit/errors/AmbiguousObjectException;
    throw v0

    .line 290
    .end local v0           #e:Lorg/eclipse/jgit/errors/AmbiguousObjectException;
    :cond_3
    const-string v2, "HEAD"

    goto :goto_1
.end method

.method private processOptions()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/InvalidRefNameException;
        }
    .end annotation

    .prologue
    .line 297
    iget-object v0, p0, Lorg/eclipse/jgit/api/CreateBranchCommand;->name:Ljava/lang/String;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "refs/heads/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/api/CreateBranchCommand;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Repository;->isValidRefName(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 299
    :cond_0
    new-instance v1, Lorg/eclipse/jgit/api/errors/InvalidRefNameException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v2, v0, Lorg/eclipse/jgit/internal/JGitText;->branchNameInvalid:Ljava/lang/String;

    const/4 v0, 0x1

    new-array v3, v0, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v0, p0, Lorg/eclipse/jgit/api/CreateBranchCommand;->name:Ljava/lang/String;

    if-nez v0, :cond_1

    const-string v0, "<null>"

    :goto_0
    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lorg/eclipse/jgit/api/errors/InvalidRefNameException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/api/CreateBranchCommand;->name:Ljava/lang/String;

    goto :goto_0

    .line 301
    :cond_2
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
    .line 74
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CreateBranchCommand;->call()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/lib/Ref;
    .locals 29
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/RefAlreadyExistsException;,
            Lorg/eclipse/jgit/api/errors/RefNotFoundException;,
            Lorg/eclipse/jgit/api/errors/InvalidRefNameException;
        }
    .end annotation

    .prologue
    .line 125
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/api/CreateBranchCommand;->checkCallable()V

    .line 126
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/CreateBranchCommand;->processOptions()V

    .line 127
    new-instance v19, Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 129
    .local v19, revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->name:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v16

    .line 130
    .local v16, refToCheck:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v16, :cond_0

    invoke-interface/range {v16 .. v16}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v24

    const-string v25, "refs/heads/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_0

    const/4 v12, 0x1

    .line 132
    .local v12, exists:Z
    :goto_0
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->force:Z

    move/from16 v24, v0

    if-nez v24, :cond_1

    if-eqz v12, :cond_1

    .line 133
    new-instance v24, Lorg/eclipse/jgit/api/errors/RefAlreadyExistsException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v25

    move-object/from16 v0, v25

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->refAlreadyExists1:Ljava/lang/String;

    move-object/from16 v25, v0

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->name:Ljava/lang/String;

    move-object/from16 v28, v0

    aput-object v28, v26, v27

    invoke-static/range {v25 .. v26}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Lorg/eclipse/jgit/api/errors/RefAlreadyExistsException;-><init>(Ljava/lang/String;)V

    throw v24
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 271
    .end local v12           #exists:Z
    .end local v16           #refToCheck:Lorg/eclipse/jgit/lib/Ref;
    :catch_0
    move-exception v13

    .line 272
    .local v13, ioe:Ljava/io/IOException;
    :try_start_1
    new-instance v24, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v13}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-direct {v0, v1, v13}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v24
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 274
    .end local v13           #ioe:Ljava/io/IOException;
    :catchall_0
    move-exception v24

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v24

    .line 130
    .restart local v16       #refToCheck:Lorg/eclipse/jgit/lib/Ref;
    :cond_0
    const/4 v12, 0x0

    goto :goto_0

    .line 136
    .restart local v12       #exists:Z
    :cond_1
    :try_start_2
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/CreateBranchCommand;->getStartPoint()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v20

    .line 137
    .local v20, startAt:Lorg/eclipse/jgit/lib/ObjectId;
    const/16 v21, 0x0

    .line 138
    .local v21, startPointFullName:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->startPoint:Ljava/lang/String;

    move-object/from16 v24, v0

    if-eqz v24, :cond_2

    .line 139
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->startPoint:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v7

    .line 140
    .local v7, baseRef:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v7, :cond_2

    .line 141
    invoke-interface {v7}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v21

    .line 147
    .end local v7           #baseRef:Lorg/eclipse/jgit/lib/Ref;
    :cond_2
    const-string v5, ""

    .line 148
    .local v5, baseBranch:Ljava/lang/String;
    if-nez v21, :cond_5

    .line 150
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->startCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    move-object/from16 v24, v0

    if-eqz v24, :cond_3

    .line 151
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->startCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lorg/eclipse/jgit/revwalk/RevCommit;->getShortMessage()Ljava/lang/String;

    move-result-object v6

    .line 157
    .local v6, baseCommit:Ljava/lang/String;
    :goto_1
    if-eqz v12, :cond_4

    .line 158
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "branch: Reset start-point to commit "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 181
    .end local v6           #baseCommit:Ljava/lang/String;
    .local v15, refLogMessage:Ljava/lang/String;
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "refs/heads/"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->name:Ljava/lang/String;

    move-object/from16 v26, v0

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v22

    .line 182
    .local v22, updateRef:Lorg/eclipse/jgit/lib/RefUpdate;
    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 183
    const/16 v24, 0x0

    move-object/from16 v0, v22

    move/from16 v1, v24

    invoke-virtual {v0, v15, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogMessage(Ljava/lang/String;Z)V

    .line 185
    if-eqz v12, :cond_a

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->force:Z

    move/from16 v24, v0

    if-eqz v24, :cond_a

    .line 186
    invoke-virtual/range {v22 .. v22}, Lorg/eclipse/jgit/lib/RefUpdate;->forceUpdate()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v23

    .line 190
    .local v23, updateResult:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :goto_3
    const/16 v24, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/api/CreateBranchCommand;->setCallable(Z)V

    .line 192
    const/4 v14, 0x0

    .line 193
    .local v14, ok:Z
    sget-object v24, Lorg/eclipse/jgit/api/CreateBranchCommand$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    invoke-virtual/range {v23 .. v23}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v25

    aget v24, v24, v25

    packed-switch v24, :pswitch_data_0

    .line 206
    :goto_4
    if-nez v14, :cond_c

    .line 207
    new-instance v24, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v25

    move-object/from16 v0, v25

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->createBranchUnexpectedResult:Ljava/lang/String;

    move-object/from16 v25, v0

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    invoke-virtual/range {v23 .. v23}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->name()Ljava/lang/String;

    move-result-object v28

    aput-object v28, v26, v27

    invoke-static/range {v25 .. v26}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 153
    .end local v14           #ok:Z
    .end local v15           #refLogMessage:Ljava/lang/String;
    .end local v22           #updateRef:Lorg/eclipse/jgit/lib/RefUpdate;
    .end local v23           #updateResult:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->startPoint:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v24

    move-object/from16 v0, v19

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v9

    .line 155
    .local v9, commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v9}, Lorg/eclipse/jgit/revwalk/RevCommit;->getShortMessage()Ljava/lang/String;

    move-result-object v6

    .restart local v6       #baseCommit:Ljava/lang/String;
    goto/16 :goto_1

    .line 161
    .end local v9           #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_4
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "branch: Created from commit "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .restart local v15       #refLogMessage:Ljava/lang/String;
    goto/16 :goto_2

    .line 163
    .end local v6           #baseCommit:Ljava/lang/String;
    .end local v15           #refLogMessage:Ljava/lang/String;
    :cond_5
    const-string v24, "refs/heads/"

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v24

    if-nez v24, :cond_6

    const-string v24, "refs/remotes/"

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_8

    .line 165
    :cond_6
    move-object/from16 v5, v21

    .line 166
    if-eqz v12, :cond_7

    .line 167
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "branch: Reset start-point to branch "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .restart local v15       #refLogMessage:Ljava/lang/String;
    goto/16 :goto_2

    .line 170
    .end local v15           #refLogMessage:Ljava/lang/String;
    :cond_7
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "branch: Created from branch "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .restart local v15       #refLogMessage:Ljava/lang/String;
    goto/16 :goto_2

    .line 172
    .end local v15           #refLogMessage:Ljava/lang/String;
    :cond_8
    invoke-virtual/range {v19 .. v20}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v24

    move-object/from16 v0, v19

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->peel(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v20

    .line 173
    if-eqz v12, :cond_9

    .line 174
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "branch: Reset start-point to tag "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .restart local v15       #refLogMessage:Ljava/lang/String;
    goto/16 :goto_2

    .line 177
    .end local v15           #refLogMessage:Ljava/lang/String;
    :cond_9
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "branch: Created from tag "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .restart local v15       #refLogMessage:Ljava/lang/String;
    goto/16 :goto_2

    .line 188
    .restart local v22       #updateRef:Lorg/eclipse/jgit/lib/RefUpdate;
    :cond_a
    invoke-virtual/range {v22 .. v22}, Lorg/eclipse/jgit/lib/RefUpdate;->update()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v23

    .restart local v23       #updateResult:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    goto/16 :goto_3

    .line 195
    .restart local v14       #ok:Z
    :pswitch_0
    if-nez v12, :cond_b

    const/4 v14, 0x1

    .line 196
    :goto_5
    goto/16 :goto_4

    .line 195
    :cond_b
    const/4 v14, 0x0

    goto :goto_5

    .line 200
    :pswitch_1
    move v14, v12

    .line 201
    goto/16 :goto_4

    .line 211
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->name:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v18

    .line 212
    .local v18, result:Lorg/eclipse/jgit/lib/Ref;
    if-nez v18, :cond_d

    .line 213
    new-instance v24, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v25

    move-object/from16 v0, v25

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->createBranchFailedUnknownReason:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-direct/range {v24 .. v25}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 216
    :cond_d
    invoke-virtual {v5}, Ljava/lang/String;->length()I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move-result v24

    if-nez v24, :cond_e

    .line 274
    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    :goto_6
    return-object v18

    .line 224
    :cond_e
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->upstreamMode:Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    move-object/from16 v24, v0

    sget-object v25, Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;->SET_UPSTREAM:Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    if-eq v0, v1, :cond_f

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->upstreamMode:Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    move-object/from16 v24, v0

    sget-object v25, Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;->TRACK:Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    if-ne v0, v1, :cond_11

    .line 227
    :cond_f
    const/4 v11, 0x1

    .line 247
    .local v11, doConfigure:Z
    :goto_7
    if-eqz v11, :cond_10

    .line 248
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v10

    .line 250
    .local v10, config:Lorg/eclipse/jgit/lib/StoredConfig;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v0, v5}, Lorg/eclipse/jgit/lib/Repository;->getRemoteName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 251
    .local v17, remoteName:Ljava/lang/String;
    if-eqz v17, :cond_15

    .line 252
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v0, v5}, Lorg/eclipse/jgit/lib/Repository;->shortenRemoteBranchName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 254
    .local v8, branchName:Ljava/lang/String;
    const-string v24, "branch"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->name:Ljava/lang/String;

    move-object/from16 v25, v0

    const-string v26, "remote"

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    move-object/from16 v3, v17

    invoke-virtual {v10, v0, v1, v2, v3}, Lorg/eclipse/jgit/lib/StoredConfig;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    const-string v24, "branch"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->name:Ljava/lang/String;

    move-object/from16 v25, v0

    const-string v26, "merge"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "refs/heads/"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    move-object/from16 v3, v27

    invoke-virtual {v10, v0, v1, v2, v3}, Lorg/eclipse/jgit/lib/StoredConfig;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 268
    .end local v8           #branchName:Ljava/lang/String;
    :goto_8
    invoke-virtual {v10}, Lorg/eclipse/jgit/lib/StoredConfig;->save()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 274
    .end local v10           #config:Lorg/eclipse/jgit/lib/StoredConfig;
    .end local v17           #remoteName:Ljava/lang/String;
    :cond_10
    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    goto/16 :goto_6

    .line 228
    .end local v11           #doConfigure:Z
    :cond_11
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->upstreamMode:Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    move-object/from16 v24, v0

    sget-object v25, Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;->NOTRACK:Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    if-ne v0, v1, :cond_12

    .line 230
    const/4 v11, 0x0

    .restart local v11       #doConfigure:Z
    goto :goto_7

    .line 233
    .end local v11           #doConfigure:Z
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v24

    const-string v25, "branch"

    const/16 v26, 0x0

    const-string v27, "autosetupmerge"

    invoke-virtual/range {v24 .. v27}, Lorg/eclipse/jgit/lib/StoredConfig;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 236
    .local v4, autosetupflag:Ljava/lang/String;
    const-string v24, "false"

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_13

    .line 237
    const/4 v11, 0x0

    .restart local v11       #doConfigure:Z
    goto/16 :goto_7

    .line 238
    .end local v11           #doConfigure:Z
    :cond_13
    const-string v24, "always"

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_14

    .line 239
    const/4 v11, 0x1

    .restart local v11       #doConfigure:Z
    goto/16 :goto_7

    .line 243
    .end local v11           #doConfigure:Z
    :cond_14
    const-string v24, "refs/remotes/"

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    .restart local v11       #doConfigure:Z
    goto/16 :goto_7

    .line 263
    .end local v4           #autosetupflag:Ljava/lang/String;
    .restart local v10       #config:Lorg/eclipse/jgit/lib/StoredConfig;
    .restart local v17       #remoteName:Ljava/lang/String;
    :cond_15
    const-string v24, "branch"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->name:Ljava/lang/String;

    move-object/from16 v25, v0

    const-string v26, "remote"

    const-string v27, "."

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    move-object/from16 v3, v27

    invoke-virtual {v10, v0, v1, v2, v3}, Lorg/eclipse/jgit/lib/StoredConfig;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    const-string v24, "branch"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CreateBranchCommand;->name:Ljava/lang/String;

    move-object/from16 v25, v0

    const-string v26, "merge"

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-virtual {v10, v0, v1, v2, v5}, Lorg/eclipse/jgit/lib/StoredConfig;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_8

    .line 193
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public setForce(Z)Lorg/eclipse/jgit/api/CreateBranchCommand;
    .locals 0
    .parameter "force"

    .prologue
    .line 323
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CreateBranchCommand;->checkCallable()V

    .line 324
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/CreateBranchCommand;->force:Z

    .line 325
    return-object p0
.end method

.method public setName(Ljava/lang/String;)Lorg/eclipse/jgit/api/CreateBranchCommand;
    .locals 0
    .parameter "name"

    .prologue
    .line 309
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CreateBranchCommand;->checkCallable()V

    .line 310
    iput-object p1, p0, Lorg/eclipse/jgit/api/CreateBranchCommand;->name:Ljava/lang/String;

    .line 311
    return-object p0
.end method

.method public setStartPoint(Ljava/lang/String;)Lorg/eclipse/jgit/api/CreateBranchCommand;
    .locals 1
    .parameter "startPoint"

    .prologue
    .line 335
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CreateBranchCommand;->checkCallable()V

    .line 336
    iput-object p1, p0, Lorg/eclipse/jgit/api/CreateBranchCommand;->startPoint:Ljava/lang/String;

    .line 337
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/api/CreateBranchCommand;->startCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 338
    return-object p0
.end method

.method public setStartPoint(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/api/CreateBranchCommand;
    .locals 1
    .parameter "startPoint"

    .prologue
    .line 348
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CreateBranchCommand;->checkCallable()V

    .line 349
    iput-object p1, p0, Lorg/eclipse/jgit/api/CreateBranchCommand;->startCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 350
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/api/CreateBranchCommand;->startPoint:Ljava/lang/String;

    .line 351
    return-object p0
.end method

.method public setUpstreamMode(Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;)Lorg/eclipse/jgit/api/CreateBranchCommand;
    .locals 0
    .parameter "mode"

    .prologue
    .line 361
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CreateBranchCommand;->checkCallable()V

    .line 362
    iput-object p1, p0, Lorg/eclipse/jgit/api/CreateBranchCommand;->upstreamMode:Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    .line 363
    return-object p0
.end method
