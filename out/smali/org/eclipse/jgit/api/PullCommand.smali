.class public Lorg/eclipse/jgit/api/PullCommand;
.super Lorg/eclipse/jgit/api/TransportCommand;
.source "PullCommand.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/api/PullCommand$1;,
        Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/TransportCommand",
        "<",
        "Lorg/eclipse/jgit/api/PullCommand;",
        "Lorg/eclipse/jgit/api/PullResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final DOT:Ljava/lang/String; = "."


# instance fields
.field private monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

.field private pullRebaseMode:Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

.field private remote:Ljava/lang/String;

.field private remoteBranchName:Ljava/lang/String;

.field private strategy:Lorg/eclipse/jgit/merge/MergeStrategy;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 102
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/TransportCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 82
    sget-object v0, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    iput-object v0, p0, Lorg/eclipse/jgit/api/PullCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 84
    sget-object v0, Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;->USE_CONFIG:Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

    iput-object v0, p0, Lorg/eclipse/jgit/api/PullCommand;->pullRebaseMode:Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

    .line 90
    sget-object v0, Lorg/eclipse/jgit/merge/MergeStrategy;->RECURSIVE:Lorg/eclipse/jgit/merge/ThreeWayMergeStrategy;

    iput-object v0, p0, Lorg/eclipse/jgit/api/PullCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    .line 103
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
    .line 78
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/PullCommand;->call()Lorg/eclipse/jgit/api/PullResult;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/api/PullResult;
    .locals 27
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;,
            Lorg/eclipse/jgit/api/errors/InvalidConfigurationException;,
            Lorg/eclipse/jgit/api/errors/DetachedHeadException;,
            Lorg/eclipse/jgit/api/errors/InvalidRemoteException;,
            Lorg/eclipse/jgit/api/errors/CanceledException;,
            Lorg/eclipse/jgit/api/errors/RefNotFoundException;,
            Lorg/eclipse/jgit/api/errors/NoHeadException;,
            Lorg/eclipse/jgit/api/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 162
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/api/PullCommand;->checkCallable()V

    .line 164
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v22, v0

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v23

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->pullTaskName:Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v24, 0x2

    invoke-interface/range {v22 .. v24}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 168
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lorg/eclipse/jgit/lib/Repository;->getFullBranch()Ljava/lang/String;

    move-result-object v10

    .line 169
    .local v10, fullBranch:Ljava/lang/String;
    if-nez v10, :cond_0

    .line 170
    new-instance v22, Lorg/eclipse/jgit/api/errors/NoHeadException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v23

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->pullOnRepoWithoutHEADCurrentlyNotSupported:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-direct/range {v22 .. v23}, Lorg/eclipse/jgit/api/errors/NoHeadException;-><init>(Ljava/lang/String;)V

    throw v22
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 178
    .end local v10           #fullBranch:Ljava/lang/String;
    :catch_0
    move-exception v7

    .line 179
    .local v7, e:Ljava/io/IOException;
    new-instance v22, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v23

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->exceptionCaughtDuringExecutionOfPullCommand:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-direct {v0, v1, v7}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v22

    .line 172
    .end local v7           #e:Ljava/io/IOException;
    .restart local v10       #fullBranch:Ljava/lang/String;
    :cond_0
    :try_start_1
    const-string v22, "refs/heads/"

    move-object/from16 v0, v22

    invoke-virtual {v10, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_1

    .line 175
    new-instance v22, Lorg/eclipse/jgit/api/errors/DetachedHeadException;

    invoke-direct/range {v22 .. v22}, Lorg/eclipse/jgit/api/errors/DetachedHeadException;-><init>()V

    throw v22

    .line 177
    :cond_1
    const-string v22, "refs/heads/"

    invoke-virtual/range {v22 .. v22}, Ljava/lang/String;->length()I

    move-result v22

    move/from16 v0, v22

    invoke-virtual {v10, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v4

    .line 184
    .local v4, branchName:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lorg/eclipse/jgit/lib/Repository;->getRepositoryState()Lorg/eclipse/jgit/lib/RepositoryState;

    move-result-object v22

    sget-object v23, Lorg/eclipse/jgit/lib/RepositoryState;->SAFE:Lorg/eclipse/jgit/lib/RepositoryState;

    invoke-virtual/range {v22 .. v23}, Lorg/eclipse/jgit/lib/RepositoryState;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_2

    .line 185
    new-instance v22, Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v23

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->cannotPullOnARepoWithState:Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Lorg/eclipse/jgit/lib/Repository;->getRepositoryState()Lorg/eclipse/jgit/lib/RepositoryState;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Lorg/eclipse/jgit/lib/RepositoryState;->name()Ljava/lang/String;

    move-result-object v26

    aput-object v26, v24, v25

    invoke-static/range {v23 .. v24}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 189
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v19

    .line 190
    .local v19, repoConfig:Lorg/eclipse/jgit/lib/Config;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->remote:Ljava/lang/String;

    move-object/from16 v22, v0

    if-nez v22, :cond_3

    .line 193
    const-string v22, "branch"

    const-string v23, "remote"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v4, v2}, Lorg/eclipse/jgit/lib/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/api/PullCommand;->remote:Ljava/lang/String;

    .line 197
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->remote:Ljava/lang/String;

    move-object/from16 v22, v0

    if-nez v22, :cond_4

    .line 199
    const-string v22, "origin"

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/api/PullCommand;->remote:Ljava/lang/String;

    .line 201
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->remoteBranchName:Ljava/lang/String;

    move-object/from16 v22, v0

    if-nez v22, :cond_5

    .line 204
    const-string v22, "branch"

    const-string v23, "merge"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v4, v2}, Lorg/eclipse/jgit/lib/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/api/PullCommand;->remoteBranchName:Ljava/lang/String;

    .line 209
    :cond_5
    const/4 v6, 0x0

    .line 210
    .local v6, doRebase:Z
    sget-object v22, Lorg/eclipse/jgit/api/PullCommand$1;->$SwitchMap$org$eclipse$jgit$api$PullCommand$PullRebaseMode:[I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->pullRebaseMode:Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;->ordinal()I

    move-result v23

    aget v22, v22, v23

    packed-switch v22, :pswitch_data_0

    .line 220
    const-string v22, "branch"

    const-string v23, "rebase"

    const/16 v24, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    move/from16 v3, v24

    invoke-virtual {v0, v1, v4, v2, v3}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v6

    .line 226
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->remoteBranchName:Ljava/lang/String;

    move-object/from16 v22, v0

    if-nez v22, :cond_6

    .line 227
    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/eclipse/jgit/api/PullCommand;->remoteBranchName:Ljava/lang/String;

    .line 229
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->remote:Ljava/lang/String;

    move-object/from16 v22, v0

    const-string v23, "."

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_7

    const/4 v11, 0x1

    .line 232
    .local v11, isRemote:Z
    :goto_1
    if-eqz v11, :cond_a

    .line 233
    const-string v22, "remote"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->remote:Ljava/lang/String;

    move-object/from16 v23, v0

    const-string v24, "url"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    move-object/from16 v3, v24

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/lib/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 236
    .local v18, remoteUri:Ljava/lang/String;
    if-nez v18, :cond_8

    .line 237
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "remote."

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->remote:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "."

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "url"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 239
    .local v14, missingKey:Ljava/lang/String;
    new-instance v22, Lorg/eclipse/jgit/api/errors/InvalidConfigurationException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v23

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->missingConfigurationForKey:Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    aput-object v14, v24, v25

    invoke-static/range {v23 .. v24}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Lorg/eclipse/jgit/api/errors/InvalidConfigurationException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 212
    .end local v11           #isRemote:Z
    .end local v14           #missingKey:Ljava/lang/String;
    .end local v18           #remoteUri:Ljava/lang/String;
    :pswitch_0
    const/4 v6, 0x1

    .line 213
    goto :goto_0

    .line 215
    :pswitch_1
    const/4 v6, 0x0

    .line 216
    goto :goto_0

    .line 229
    :cond_7
    const/4 v11, 0x0

    goto :goto_1

    .line 243
    .restart local v11       #isRemote:Z
    .restart local v18       #remoteUri:Ljava/lang/String;
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lorg/eclipse/jgit/lib/ProgressMonitor;->isCancelled()Z

    move-result v22

    if-eqz v22, :cond_9

    .line 244
    new-instance v22, Lorg/eclipse/jgit/api/errors/CanceledException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v23

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->operationCanceled:Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v26

    move-object/from16 v0, v26

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->pullTaskName:Ljava/lang/String;

    move-object/from16 v26, v0

    aput-object v26, v24, v25

    invoke-static/range {v23 .. v24}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Lorg/eclipse/jgit/api/errors/CanceledException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 248
    :cond_9
    new-instance v8, Lorg/eclipse/jgit/api/FetchCommand;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-direct {v8, v0}, Lorg/eclipse/jgit/api/FetchCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 249
    .local v8, fetch:Lorg/eclipse/jgit/api/FetchCommand;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->remote:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v8, v0}, Lorg/eclipse/jgit/api/FetchCommand;->setRemote(Ljava/lang/String;)Lorg/eclipse/jgit/api/FetchCommand;

    .line 250
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v8, v0}, Lorg/eclipse/jgit/api/FetchCommand;->setProgressMonitor(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/api/FetchCommand;

    .line 251
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lorg/eclipse/jgit/api/PullCommand;->configure(Lorg/eclipse/jgit/api/TransportCommand;)Lorg/eclipse/jgit/api/GitCommand;

    .line 253
    invoke-virtual {v8}, Lorg/eclipse/jgit/api/FetchCommand;->call()Lorg/eclipse/jgit/transport/FetchResult;

    move-result-object v9

    .line 260
    .end local v8           #fetch:Lorg/eclipse/jgit/api/FetchCommand;
    .local v9, fetchRes:Lorg/eclipse/jgit/transport/FetchResult;
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v22, v0

    const/16 v23, 0x1

    invoke-interface/range {v22 .. v23}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 262
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lorg/eclipse/jgit/lib/ProgressMonitor;->isCancelled()Z

    move-result v22

    if-eqz v22, :cond_b

    .line 263
    new-instance v22, Lorg/eclipse/jgit/api/errors/CanceledException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v23

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->operationCanceled:Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v26

    move-object/from16 v0, v26

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->pullTaskName:Ljava/lang/String;

    move-object/from16 v26, v0

    aput-object v26, v24, v25

    invoke-static/range {v23 .. v24}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Lorg/eclipse/jgit/api/errors/CanceledException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 256
    .end local v9           #fetchRes:Lorg/eclipse/jgit/transport/FetchResult;
    .end local v18           #remoteUri:Ljava/lang/String;
    :cond_a
    const-string v18, "local repository"

    .line 257
    .restart local v18       #remoteUri:Ljava/lang/String;
    const/4 v9, 0x0

    .restart local v9       #fetchRes:Lorg/eclipse/jgit/transport/FetchResult;
    goto :goto_2

    .line 271
    :cond_b
    if-eqz v11, :cond_f

    .line 272
    const/4 v15, 0x0

    .line 273
    .local v15, r:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v9, :cond_c

    .line 274
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->remoteBranchName:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v9, v0}, Lorg/eclipse/jgit/transport/FetchResult;->getAdvertisedRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v15

    .line 275
    if-nez v15, :cond_c

    .line 276
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "refs/heads/"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->remoteBranchName:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v9, v0}, Lorg/eclipse/jgit/transport/FetchResult;->getAdvertisedRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v15

    .line 279
    :cond_c
    if-nez v15, :cond_d

    .line 280
    new-instance v22, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v23

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->couldNotGetAdvertisedRef:Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->remoteBranchName:Ljava/lang/String;

    move-object/from16 v26, v0

    aput-object v26, v24, v25

    invoke-static/range {v23 .. v24}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 283
    :cond_d
    invoke-interface {v15}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    .line 297
    .end local v15           #r:Lorg/eclipse/jgit/lib/Ref;
    .local v5, commitToMerge:Lorg/eclipse/jgit/lib/AnyObjectId;
    :cond_e
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "branch \'"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->remoteBranchName:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-static/range {v23 .. v23}, Lorg/eclipse/jgit/lib/Repository;->shortenRefName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "\' of "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 302
    .local v21, upstreamName:Ljava/lang/String;
    if-eqz v6, :cond_10

    .line 303
    new-instance v16, Lorg/eclipse/jgit/api/RebaseCommand;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v22, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/RebaseCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 304
    .local v16, rebase:Lorg/eclipse/jgit/api/RebaseCommand;
    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Lorg/eclipse/jgit/api/RebaseCommand;->setUpstream(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/RebaseCommand;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/api/RebaseCommand;->setUpstreamName(Ljava/lang/String;)Lorg/eclipse/jgit/api/RebaseCommand;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Lorg/eclipse/jgit/api/RebaseCommand;->setProgressMonitor(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/api/RebaseCommand;

    move-result-object v22

    sget-object v23, Lorg/eclipse/jgit/api/RebaseCommand$Operation;->BEGIN:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    invoke-virtual/range {v22 .. v23}, Lorg/eclipse/jgit/api/RebaseCommand;->setOperation(Lorg/eclipse/jgit/api/RebaseCommand$Operation;)Lorg/eclipse/jgit/api/RebaseCommand;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Lorg/eclipse/jgit/api/RebaseCommand;->setStrategy(Lorg/eclipse/jgit/merge/MergeStrategy;)Lorg/eclipse/jgit/api/RebaseCommand;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Lorg/eclipse/jgit/api/RebaseCommand;->call()Lorg/eclipse/jgit/api/RebaseResult;

    move-result-object v17

    .line 308
    .local v17, rebaseRes:Lorg/eclipse/jgit/api/RebaseResult;
    new-instance v20, Lorg/eclipse/jgit/api/PullResult;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->remote:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    move-object/from16 v2, v17

    invoke-direct {v0, v9, v1, v2}, Lorg/eclipse/jgit/api/PullResult;-><init>(Lorg/eclipse/jgit/transport/FetchResult;Ljava/lang/String;Lorg/eclipse/jgit/api/RebaseResult;)V

    .line 317
    .end local v16           #rebase:Lorg/eclipse/jgit/api/RebaseCommand;
    .end local v17           #rebaseRes:Lorg/eclipse/jgit/api/RebaseResult;
    .local v20, result:Lorg/eclipse/jgit/api/PullResult;
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 318
    return-object v20

    .line 286
    .end local v5           #commitToMerge:Lorg/eclipse/jgit/lib/AnyObjectId;
    .end local v20           #result:Lorg/eclipse/jgit/api/PullResult;
    .end local v21           #upstreamName:Ljava/lang/String;
    :cond_f
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->remoteBranchName:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    .line 287
    .restart local v5       #commitToMerge:Lorg/eclipse/jgit/lib/AnyObjectId;
    if-nez v5, :cond_e

    .line 288
    new-instance v22, Lorg/eclipse/jgit/api/errors/RefNotFoundException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v23

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->refNotResolved:Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->remoteBranchName:Ljava/lang/String;

    move-object/from16 v26, v0

    aput-object v26, v24, v25

    invoke-static/range {v23 .. v24}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Lorg/eclipse/jgit/api/errors/RefNotFoundException;-><init>(Ljava/lang/String;)V

    throw v22
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 290
    .end local v5           #commitToMerge:Lorg/eclipse/jgit/lib/AnyObjectId;
    :catch_1
    move-exception v7

    .line 291
    .restart local v7       #e:Ljava/io/IOException;
    new-instance v22, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v23

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->exceptionCaughtDuringExecutionOfPullCommand:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-direct {v0, v1, v7}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v22

    .line 310
    .end local v7           #e:Ljava/io/IOException;
    .restart local v5       #commitToMerge:Lorg/eclipse/jgit/lib/AnyObjectId;
    .restart local v21       #upstreamName:Ljava/lang/String;
    :cond_10
    new-instance v12, Lorg/eclipse/jgit/api/MergeCommand;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-direct {v12, v0}, Lorg/eclipse/jgit/api/MergeCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 311
    .local v12, merge:Lorg/eclipse/jgit/api/MergeCommand;
    move-object/from16 v0, v21

    invoke-virtual {v12, v0, v5}, Lorg/eclipse/jgit/api/MergeCommand;->include(Ljava/lang/String;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/MergeCommand;

    .line 312
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v12, v0}, Lorg/eclipse/jgit/api/MergeCommand;->setStrategy(Lorg/eclipse/jgit/merge/MergeStrategy;)Lorg/eclipse/jgit/api/MergeCommand;

    .line 313
    invoke-virtual {v12}, Lorg/eclipse/jgit/api/MergeCommand;->call()Lorg/eclipse/jgit/api/MergeResult;

    move-result-object v13

    .line 314
    .local v13, mergeRes:Lorg/eclipse/jgit/api/MergeResult;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v22, v0

    const/16 v23, 0x1

    invoke-interface/range {v22 .. v23}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 315
    new-instance v20, Lorg/eclipse/jgit/api/PullResult;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/PullCommand;->remote:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-direct {v0, v9, v1, v13}, Lorg/eclipse/jgit/api/PullResult;-><init>(Lorg/eclipse/jgit/transport/FetchResult;Ljava/lang/String;Lorg/eclipse/jgit/api/MergeResult;)V

    .restart local v20       #result:Lorg/eclipse/jgit/api/PullResult;
    goto/16 :goto_3

    .line 210
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public getRemote()Ljava/lang/String;
    .locals 1

    .prologue
    .line 359
    iget-object v0, p0, Lorg/eclipse/jgit/api/PullCommand;->remote:Ljava/lang/String;

    return-object v0
.end method

.method public getRemoteBranchName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 368
    iget-object v0, p0, Lorg/eclipse/jgit/api/PullCommand;->remoteBranchName:Ljava/lang/String;

    return-object v0
.end method

.method public setProgressMonitor(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/api/PullCommand;
    .locals 0
    .parameter "monitor"

    .prologue
    .line 111
    iput-object p1, p0, Lorg/eclipse/jgit/api/PullCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 112
    return-object p0
.end method

.method public setRebase(Z)Lorg/eclipse/jgit/api/PullCommand;
    .locals 1
    .parameter "useRebase"

    .prologue
    .line 134
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/PullCommand;->checkCallable()V

    .line 135
    if-eqz p1, :cond_0

    sget-object v0, Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;->REBASE:Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

    :goto_0
    iput-object v0, p0, Lorg/eclipse/jgit/api/PullCommand;->pullRebaseMode:Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

    .line 136
    return-object p0

    .line 135
    :cond_0
    sget-object v0, Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;->NO_REBASE:Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

    goto :goto_0
.end method

.method public setRemote(Ljava/lang/String;)Lorg/eclipse/jgit/api/PullCommand;
    .locals 0
    .parameter "remote"

    .prologue
    .line 333
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/PullCommand;->checkCallable()V

    .line 334
    iput-object p1, p0, Lorg/eclipse/jgit/api/PullCommand;->remote:Ljava/lang/String;

    .line 335
    return-object p0
.end method

.method public setRemoteBranchName(Ljava/lang/String;)Lorg/eclipse/jgit/api/PullCommand;
    .locals 0
    .parameter "remoteBranchName"

    .prologue
    .line 349
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/PullCommand;->checkCallable()V

    .line 350
    iput-object p1, p0, Lorg/eclipse/jgit/api/PullCommand;->remoteBranchName:Ljava/lang/String;

    .line 351
    return-object p0
.end method

.method public setStrategy(Lorg/eclipse/jgit/merge/MergeStrategy;)Lorg/eclipse/jgit/api/PullCommand;
    .locals 0
    .parameter "strategy"

    .prologue
    .line 378
    iput-object p1, p0, Lorg/eclipse/jgit/api/PullCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    .line 379
    return-object p0
.end method
