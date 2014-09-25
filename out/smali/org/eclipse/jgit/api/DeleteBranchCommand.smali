.class public Lorg/eclipse/jgit/api/DeleteBranchCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "DeleteBranchCommand.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/api/DeleteBranchCommand$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Ljava/util/List",
        "<",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# instance fields
.field private final branchNames:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private force:Z


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 90
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 82
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/api/DeleteBranchCommand;->branchNames:Ljava/util/Set;

    .line 91
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
    .line 81
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/DeleteBranchCommand;->call()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/List;
    .locals 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/NotMergedException;,
            Lorg/eclipse/jgit/api/errors/CannotDeleteCurrentBranchException;
        }
    .end annotation

    .prologue
    .line 102
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/api/DeleteBranchCommand;->checkCallable()V

    .line 103
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 104
    .local v12, result:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DeleteBranchCommand;->branchNames:Ljava/util/Set;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/Set;->isEmpty()Z

    move-result v17

    if-eqz v17, :cond_1

    .line 173
    :cond_0
    return-object v12

    .line 107
    :cond_1
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DeleteBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lorg/eclipse/jgit/lib/Repository;->getFullBranch()Ljava/lang/String;

    move-result-object v5

    .line 108
    .local v5, currentBranch:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/DeleteBranchCommand;->force:Z

    move/from16 v17, v0

    if-nez v17, :cond_3

    .line 111
    new-instance v16, Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DeleteBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v17, v0

    invoke-direct/range {v16 .. v17}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 112
    .local v16, walk:Lorg/eclipse/jgit/revwalk/RevWalk;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DeleteBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v17, v0

    const-string v18, "HEAD"

    invoke-virtual/range {v17 .. v18}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v14

    .line 113
    .local v14, tip:Lorg/eclipse/jgit/revwalk/RevCommit;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DeleteBranchCommand;->branchNames:Ljava/util/Set;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, i$:Ljava/util/Iterator;
    :cond_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_3

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 114
    .local v3, branchName:Ljava/lang/String;
    if-eqz v3, :cond_2

    .line 116
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DeleteBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v6

    .line 117
    .local v6, currentRef:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v6, :cond_2

    .line 120
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DeleteBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v2

    .line 121
    .local v2, base:Lorg/eclipse/jgit/revwalk/RevCommit;
    move-object/from16 v0, v16

    invoke-virtual {v0, v2, v14}, Lorg/eclipse/jgit/revwalk/RevWalk;->isMergedInto(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v17

    if-nez v17, :cond_2

    .line 122
    new-instance v17, Lorg/eclipse/jgit/api/errors/NotMergedException;

    invoke-direct/range {v17 .. v17}, Lorg/eclipse/jgit/api/errors/NotMergedException;-><init>()V

    throw v17
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 174
    .end local v2           #base:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v3           #branchName:Ljava/lang/String;
    .end local v5           #currentBranch:Ljava/lang/String;
    .end local v6           #currentRef:Lorg/eclipse/jgit/lib/Ref;
    .end local v9           #i$:Ljava/util/Iterator;
    .end local v14           #tip:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v16           #walk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :catch_0
    move-exception v10

    .line 175
    .local v10, ioe:Ljava/io/IOException;
    new-instance v17, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v10}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v10}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v17

    .line 126
    .end local v10           #ioe:Ljava/io/IOException;
    .restart local v5       #currentBranch:Ljava/lang/String;
    :cond_3
    const/16 v17, 0x0

    :try_start_1
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/api/DeleteBranchCommand;->setCallable(Z)V

    .line 127
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DeleteBranchCommand;->branchNames:Ljava/util/Set;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .restart local v9       #i$:Ljava/util/Iterator;
    :cond_4
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_0

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 128
    .restart local v3       #branchName:Ljava/lang/String;
    if-eqz v3, :cond_4

    .line 130
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DeleteBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v6

    .line 131
    .restart local v6       #currentRef:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v6, :cond_4

    .line 133
    invoke-interface {v6}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v8

    .line 134
    .local v8, fullName:Ljava/lang/String;
    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_5

    .line 135
    new-instance v17, Lorg/eclipse/jgit/api/errors/CannotDeleteCurrentBranchException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v18

    move-object/from16 v0, v18

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->cannotDeleteCheckedOutBranch:Ljava/lang/String;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput-object v3, v19, v20

    invoke-static/range {v18 .. v19}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lorg/eclipse/jgit/api/errors/CannotDeleteCurrentBranchException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 140
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DeleteBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v8}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v15

    .line 141
    .local v15, update:Lorg/eclipse/jgit/lib/RefUpdate;
    const-string v17, "branch deleted"

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v15, v0, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogMessage(Ljava/lang/String;Z)V

    .line 142
    const/16 v17, 0x1

    move/from16 v0, v17

    invoke-virtual {v15, v0}, Lorg/eclipse/jgit/lib/RefUpdate;->setForceUpdate(Z)V

    .line 143
    invoke-virtual {v15}, Lorg/eclipse/jgit/lib/RefUpdate;->delete()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v7

    .line 145
    .local v7, deleteResult:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    const/4 v11, 0x1

    .line 146
    .local v11, ok:Z
    sget-object v17, Lorg/eclipse/jgit/api/DeleteBranchCommand$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v18

    aget v17, v17, v18

    packed-switch v17, :pswitch_data_0

    .line 156
    :goto_1
    if-eqz v11, :cond_6

    .line 157
    invoke-interface {v12, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 158
    const-string v17, "refs/heads/"

    move-object/from16 v0, v17

    invoke-virtual {v8, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_4

    .line 159
    const-string v17, "refs/heads/"

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v17

    move/from16 v0, v17

    invoke-virtual {v8, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v13

    .line 162
    .local v13, shortenedName:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DeleteBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v4

    .line 163
    .local v4, cfg:Lorg/eclipse/jgit/lib/StoredConfig;
    const-string v17, "branch"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0, v13}, Lorg/eclipse/jgit/lib/StoredConfig;->unsetSection(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/StoredConfig;->save()V

    goto/16 :goto_0

    .line 150
    .end local v4           #cfg:Lorg/eclipse/jgit/lib/StoredConfig;
    .end local v13           #shortenedName:Ljava/lang/String;
    :pswitch_0
    const/4 v11, 0x0

    .line 151
    goto :goto_1

    .line 169
    :cond_6
    new-instance v17, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v18

    move-object/from16 v0, v18

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->deleteBranchUnexpectedResult:Ljava/lang/String;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->name()Ljava/lang/String;

    move-result-object v21

    aput-object v21, v19, v20

    invoke-static/range {v18 .. v19}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v17
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 146
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public varargs setBranchNames([Ljava/lang/String;)Lorg/eclipse/jgit/api/DeleteBranchCommand;
    .locals 5
    .parameter "branchnames"

    .prologue
    .line 186
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/DeleteBranchCommand;->checkCallable()V

    .line 187
    iget-object v4, p0, Lorg/eclipse/jgit/api/DeleteBranchCommand;->branchNames:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->clear()V

    .line 188
    move-object v0, p1

    .local v0, arr$:[Ljava/lang/String;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 189
    .local v1, branch:Ljava/lang/String;
    iget-object v4, p0, Lorg/eclipse/jgit/api/DeleteBranchCommand;->branchNames:Ljava/util/Set;

    invoke-interface {v4, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 188
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 190
    .end local v1           #branch:Ljava/lang/String;
    :cond_0
    return-object p0
.end method

.method public setForce(Z)Lorg/eclipse/jgit/api/DeleteBranchCommand;
    .locals 0
    .parameter "force"

    .prologue
    .line 203
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/DeleteBranchCommand;->checkCallable()V

    .line 204
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/DeleteBranchCommand;->force:Z

    .line 205
    return-object p0
.end method
