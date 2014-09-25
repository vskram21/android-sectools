.class public Lorg/eclipse/jgit/api/RebaseCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "RebaseCommand.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/api/RebaseCommand$1;,
        Lorg/eclipse/jgit/api/RebaseCommand$InteractiveHandler;,
        Lorg/eclipse/jgit/api/RebaseCommand$Operation;,
        Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Lorg/eclipse/jgit/api/RebaseResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final AMEND:Ljava/lang/String; = "amend"

.field private static final AUTHOR_SCRIPT:Ljava/lang/String; = "author-script"

.field private static final AUTOSTASH:Ljava/lang/String; = "autostash"

.field private static final AUTOSTASH_MSG:Ljava/lang/String; = "On {0}: autostash"

.field private static final DONE:Ljava/lang/String; = "done"

.field private static final GIT_AUTHOR_DATE:Ljava/lang/String; = "GIT_AUTHOR_DATE"

.field private static final GIT_AUTHOR_EMAIL:Ljava/lang/String; = "GIT_AUTHOR_EMAIL"

.field private static final GIT_AUTHOR_NAME:Ljava/lang/String; = "GIT_AUTHOR_NAME"

.field private static final GIT_REBASE_TODO:Ljava/lang/String; = "git-rebase-todo"

.field private static final HEAD_NAME:Ljava/lang/String; = "head-name"

.field private static final INTERACTIVE:Ljava/lang/String; = "interactive"

.field private static final MESSAGE:Ljava/lang/String; = "message"

.field private static final MESSAGE_FIXUP:Ljava/lang/String; = "message-fixup"

.field private static final MESSAGE_SQUASH:Ljava/lang/String; = "message-squash"

.field private static final ONTO:Ljava/lang/String; = "onto"

.field private static final ONTO_NAME:Ljava/lang/String; = "onto-name"

.field private static final PATCH:Ljava/lang/String; = "patch"

.field private static final QUIET:Ljava/lang/String; = "quiet"

.field private static final REBASE_APPLY:Ljava/lang/String; = "rebase-apply"

.field private static final REBASE_HEAD:Ljava/lang/String; = "head"

.field public static final REBASE_MERGE:Ljava/lang/String; = "rebase-merge"

.field public static final STOPPED_SHA:Ljava/lang/String; = "stopped-sha"


# instance fields
.field private interactiveHandler:Lorg/eclipse/jgit/api/RebaseCommand$InteractiveHandler;

.field private lastStepWasForward:Z

.field private monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

.field private newHead:Lorg/eclipse/jgit/revwalk/RevCommit;

.field private operation:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

.field private final rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

.field private stopAfterInitialization:Z

.field private strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

.field private upstreamCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

.field private upstreamCommitName:Ljava/lang/String;

.field private final walk:Lorg/eclipse/jgit/revwalk/RevWalk;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 2
    .parameter "repo"

    .prologue
    .line 223
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 197
    sget-object v0, Lorg/eclipse/jgit/api/RebaseCommand$Operation;->BEGIN:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    iput-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->operation:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    .line 203
    sget-object v0, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    iput-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 211
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->stopAfterInitialization:Z

    .line 217
    sget-object v0, Lorg/eclipse/jgit/merge/MergeStrategy;->RECURSIVE:Lorg/eclipse/jgit/merge/ThreeWayMergeStrategy;

    iput-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    .line 224
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 225
    new-instance v0, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    .line 226
    return-void
.end method

.method private abort(Lorg/eclipse/jgit/api/RebaseResult;)Lorg/eclipse/jgit/api/RebaseResult;
    .locals 14
    .parameter "result"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 1086
    :try_start_0
    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v10}, Lorg/eclipse/jgit/lib/Repository;->readOrigHead()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    .line 1087
    .local v6, origHead:Lorg/eclipse/jgit/lib/ObjectId;
    if-eqz v6, :cond_0

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v1

    .line 1088
    .local v1, commitId:Ljava/lang/String;
    :cond_0
    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/JGitText;->abortingRebase:Ljava/lang/String;

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v1, v12, v13

    invoke-static {v11, v12}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    invoke-interface {v10, v11, v12}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 1093
    if-nez v1, :cond_1

    .line 1094
    new-instance v10, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/JGitText;->abortingRebaseFailedNoOrigHead:Ljava/lang/String;

    invoke-direct {v10, v11}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1110
    .end local v1           #commitId:Ljava/lang/String;
    .end local v6           #origHead:Lorg/eclipse/jgit/lib/ObjectId;
    :catchall_0
    move-exception v10

    iget-object v11, p0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v11}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    throw v10

    .line 1096
    .restart local v1       #commitId:Ljava/lang/String;
    .restart local v6       #origHead:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_1
    :try_start_1
    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v10, v1}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    .line 1097
    .local v5, id:Lorg/eclipse/jgit/lib/ObjectId;
    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v10, v5}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 1098
    .local v0, commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {p1}, Lorg/eclipse/jgit/api/RebaseResult;->getStatus()Lorg/eclipse/jgit/api/RebaseResult$Status;

    move-result-object v10

    sget-object v11, Lorg/eclipse/jgit/api/RebaseResult$Status;->FAILED:Lorg/eclipse/jgit/api/RebaseResult$Status;

    invoke-virtual {v10, v11}, Lorg/eclipse/jgit/api/RebaseResult$Status;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 1099
    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v11, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v12, "HEAD"

    invoke-virtual {v11, v12}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v3

    .line 1100
    .local v3, head:Lorg/eclipse/jgit/revwalk/RevCommit;
    new-instance v2, Lorg/eclipse/jgit/dircache/DirCacheCheckout;

    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v3}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v11

    iget-object v12, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v12}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v12

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v13

    invoke-direct {v2, v10, v11, v12, v13}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 1106
    .end local v3           #head:Lorg/eclipse/jgit/revwalk/RevCommit;
    .local v2, dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    :goto_0
    const/4 v10, 0x0

    invoke-virtual {v2, v10}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->setFailOnConflict(Z)V

    .line 1107
    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->checkout()Z

    .line 1108
    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v10}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1110
    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v10}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 1113
    :try_start_2
    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v11, "head-name"

    invoke-virtual {v10, v11}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1114
    .local v4, headName:Ljava/lang/String;
    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/JGitText;->resettingHead:Ljava/lang/String;

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v4, v12, v13

    invoke-static {v11, v12}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    invoke-interface {v10, v11, v12}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 1118
    const/4 v8, 0x0

    .line 1119
    .local v8, res:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v11, "HEAD"

    const/4 v12, 0x0

    invoke-virtual {v10, v11, v12}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;Z)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v7

    .line 1120
    .local v7, refUpdate:Lorg/eclipse/jgit/lib/RefUpdate;
    const-string v10, "rebase: aborting"

    const/4 v11, 0x0

    invoke-virtual {v7, v10, v11}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogMessage(Ljava/lang/String;Z)V

    .line 1121
    const-string v10, "refs/"

    invoke-virtual {v4, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 1123
    invoke-virtual {v7, v4}, Lorg/eclipse/jgit/lib/RefUpdate;->link(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v8

    .line 1129
    :goto_1
    sget-object v10, Lorg/eclipse/jgit/api/RebaseCommand$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v11

    aget v10, v10, v11

    packed-switch v10, :pswitch_data_0

    .line 1135
    new-instance v10, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/JGitText;->abortingRebaseFailed:Ljava/lang/String;

    invoke-direct {v10, v11}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v10
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1147
    .end local v4           #headName:Ljava/lang/String;
    .end local v7           #refUpdate:Lorg/eclipse/jgit/lib/RefUpdate;
    .end local v8           #res:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :catchall_1
    move-exception v10

    iget-object v11, p0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v11}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    throw v10

    .line 1103
    .end local v2           #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    :cond_2
    :try_start_3
    new-instance v2, Lorg/eclipse/jgit/dircache/DirCacheCheckout;

    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    iget-object v11, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v11}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v11

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v12

    invoke-direct {v2, v10, v11, v12}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/lib/ObjectId;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .restart local v2       #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    goto :goto_0

    .line 1125
    .restart local v4       #headName:Ljava/lang/String;
    .restart local v7       #refUpdate:Lorg/eclipse/jgit/lib/RefUpdate;
    .restart local v8       #res:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :cond_3
    :try_start_4
    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v10}, Lorg/eclipse/jgit/lib/Repository;->readOrigHead()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v10

    invoke-virtual {v7, v10}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 1126
    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/RefUpdate;->forceUpdate()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v8

    goto :goto_1

    .line 1138
    :pswitch_0
    invoke-direct {p0}, Lorg/eclipse/jgit/api/RebaseCommand;->autoStashApply()Z

    move-result v9

    .line 1140
    .local v9, stashConflicts:Z
    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    invoke-virtual {v10}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getDir()Ljava/io/File;

    move-result-object v10

    const/4 v11, 0x1

    invoke-static {v10, v11}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    .line 1141
    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lorg/eclipse/jgit/lib/Repository;->writeCherryPickHead(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 1142
    if-eqz v9, :cond_4

    .line 1143
    sget-object p1, Lorg/eclipse/jgit/api/RebaseResult;->STASH_APPLY_CONFLICTS_RESULT:Lorg/eclipse/jgit/api/RebaseResult;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 1147
    .end local p1
    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v10}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    :goto_2
    return-object p1

    .restart local p1
    :cond_4
    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v10}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    goto :goto_2

    .line 1129
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private autoStash()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 360
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v2

    const-string v3, "rebase"

    const-string v4, "autostash"

    invoke-virtual {v2, v3, v4, v5}, Lorg/eclipse/jgit/lib/StoredConfig;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 362
    const-string v2, "On {0}: autostash"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-direct {p0}, Lorg/eclipse/jgit/api/RebaseCommand;->getHead()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v4

    invoke-static {v4}, Lorg/eclipse/jgit/api/RebaseCommand;->getHeadName(Lorg/eclipse/jgit/lib/Ref;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/eclipse/jgit/lib/Repository;->shortenRefName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 366
    .local v0, message:Ljava/lang/String;
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-static {v2}, Lorg/eclipse/jgit/api/Git;->wrap(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/api/Git;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/api/Git;->stashCreate()Lorg/eclipse/jgit/api/StashCreateCommand;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/api/StashCreateCommand;->setRef(Ljava/lang/String;)Lorg/eclipse/jgit/api/StashCreateCommand;

    move-result-object v2

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/api/StashCreateCommand;->setWorkingDirectoryMessage(Ljava/lang/String;)Lorg/eclipse/jgit/api/StashCreateCommand;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/api/StashCreateCommand;->call()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    .line 370
    .local v1, stashCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-eqz v1, :cond_0

    .line 371
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    invoke-virtual {v2}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getDir()Ljava/io/File;

    move-result-object v2

    invoke-static {v2}, Lorg/eclipse/jgit/util/FileUtils;->mkdir(Ljava/io/File;)V

    .line 372
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v3, "autostash"

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->createFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 375
    .end local v0           #message:Ljava/lang/String;
    .end local v1           #stashCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_0
    return-void
.end method

.method private autoStashApply()Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 378
    const/4 v1, 0x0

    .line 379
    .local v1, conflicts:Z
    iget-object v6, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v7, "autostash"

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 380
    iget-object v6, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v7, "autostash"

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 382
    .local v4, stash:Ljava/lang/String;
    :try_start_0
    iget-object v6, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-static {v6}, Lorg/eclipse/jgit/api/Git;->wrap(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/api/Git;

    move-result-object v6

    invoke-virtual {v6}, Lorg/eclipse/jgit/api/Git;->stashApply()Lorg/eclipse/jgit/api/StashApplyCommand;

    move-result-object v6

    invoke-virtual {v6, v4}, Lorg/eclipse/jgit/api/StashApplyCommand;->setStashRef(Ljava/lang/String;)Lorg/eclipse/jgit/api/StashApplyCommand;

    move-result-object v6

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/api/StashApplyCommand;->ignoreRepositoryState(Z)Lorg/eclipse/jgit/api/StashApplyCommand;

    move-result-object v6

    iget-object v7, p0, Lorg/eclipse/jgit/api/RebaseCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/api/StashApplyCommand;->setStrategy(Lorg/eclipse/jgit/merge/MergeStrategy;)Lorg/eclipse/jgit/api/StashApplyCommand;

    move-result-object v6

    invoke-virtual {v6}, Lorg/eclipse/jgit/api/StashApplyCommand;->call()Lorg/eclipse/jgit/lib/ObjectId;
    :try_end_0
    .catch Lorg/eclipse/jgit/api/errors/StashApplyFailureException; {:try_start_0 .. :try_end_0} :catch_0

    .line 394
    .end local v4           #stash:Ljava/lang/String;
    :cond_0
    :goto_0
    return v1

    .line 385
    .restart local v4       #stash:Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 386
    .local v2, e:Lorg/eclipse/jgit/api/errors/StashApplyFailureException;
    const/4 v1, 0x1

    .line 387
    new-instance v3, Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v6, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v3, v6}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 388
    .local v3, rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    iget-object v6, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6, v4}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    .line 389
    .local v5, stashId:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {v3, v5}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 390
    .local v0, commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getAuthorIdent()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v6

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getShortMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v0, v6, v7}, Lorg/eclipse/jgit/api/RebaseCommand;->updateStashRef(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/PersonIdent;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private checkParameters()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v4, 0x0

    .line 1048
    iget-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->operation:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    sget-object v1, Lorg/eclipse/jgit/api/RebaseCommand$Operation;->PROCESS_STEPS:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    if-ne v0, v1, :cond_0

    .line 1049
    iget-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v1, "done"

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1050
    new-instance v0, Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->wrongRepositoryState:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/Repository;->getRepositoryState()Lorg/eclipse/jgit/lib/RepositoryState;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/RepositoryState;->name()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1054
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->operation:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    sget-object v1, Lorg/eclipse/jgit/api/RebaseCommand$Operation;->BEGIN:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    if-eq v0, v1, :cond_1

    .line 1056
    sget-object v0, Lorg/eclipse/jgit/api/RebaseCommand$1;->$SwitchMap$org$eclipse$jgit$lib$RepositoryState:[I

    iget-object v1, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->getRepositoryState()Lorg/eclipse/jgit/lib/RepositoryState;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RepositoryState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 1063
    new-instance v0, Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->wrongRepositoryState:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/Repository;->getRepositoryState()Lorg/eclipse/jgit/lib/RepositoryState;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/RepositoryState;->name()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1068
    :cond_1
    sget-object v0, Lorg/eclipse/jgit/api/RebaseCommand$1;->$SwitchMap$org$eclipse$jgit$lib$RepositoryState:[I

    iget-object v1, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->getRepositoryState()Lorg/eclipse/jgit/lib/RepositoryState;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RepositoryState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_1

    .line 1076
    new-instance v0, Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->wrongRepositoryState:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/Repository;->getRepositoryState()Lorg/eclipse/jgit/lib/RepositoryState;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/RepositoryState;->name()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1070
    :pswitch_0
    iget-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    if-nez v0, :cond_2

    .line 1071
    new-instance v0, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->missingRequiredParameter:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "upstream"

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1081
    :cond_2
    :pswitch_1
    return-void

    .line 1056
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch

    .line 1068
    :pswitch_data_1
    .packed-switch 0x5
        :pswitch_0
    .end packed-switch
.end method

.method private checkSteps(Ljava/util/List;)V
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/RebaseTodoLine;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/InvalidRebaseStepException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p1, steps:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/RebaseTodoLine;>;"
    const/4 v4, 0x0

    .line 518
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 530
    :cond_0
    return-void

    .line 520
    :cond_1
    sget-object v1, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->SQUASH:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/RebaseTodoLine;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/RebaseTodoLine;->getAction()Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    move-result-object v0

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v1, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->FIXUP:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/RebaseTodoLine;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/RebaseTodoLine;->getAction()Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    move-result-object v0

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 522
    :cond_2
    iget-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v1, "done"

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v1, "done"

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 524
    :cond_3
    new-instance v1, Lorg/eclipse/jgit/api/errors/InvalidRebaseStepException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v2, v0, Lorg/eclipse/jgit/internal/JGitText;->cannotSquashFixupWithoutPreviousCommit:Ljava/lang/String;

    const/4 v0, 0x1

    new-array v3, v0, [Ljava/lang/Object;

    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/RebaseTodoLine;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/RebaseTodoLine;->getAction()Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->name()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lorg/eclipse/jgit/api/errors/InvalidRebaseStepException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private checkoutCommit(Ljava/lang/String;Lorg/eclipse/jgit/revwalk/RevCommit;)Z
    .locals 10
    .parameter "headName"
    .parameter "commit"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/CheckoutConflictException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    .line 1155
    :try_start_0
    iget-object v5, p0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v6, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v7, "HEAD"

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v2

    .line 1156
    .local v2, head:Lorg/eclipse/jgit/revwalk/RevCommit;
    new-instance v1, Lorg/eclipse/jgit/dircache/DirCacheCheckout;

    iget-object v5, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v6

    iget-object v7, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v7

    invoke-virtual {p2}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v8

    invoke-direct {v1, v5, v6, v7, v8}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 1158
    .local v1, dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->setFailOnConflict(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1160
    :try_start_1
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->checkout()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Lorg/eclipse/jgit/errors/CheckoutConflictException; {:try_start_1 .. :try_end_1} :catch_0

    .line 1165
    :try_start_2
    iget-object v5, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v6, "HEAD"

    const/4 v7, 0x1

    invoke-virtual {v5, v6, v7}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;Z)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v3

    .line 1166
    .local v3, refUpdate:Lorg/eclipse/jgit/lib/RefUpdate;
    invoke-virtual {v3, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 1167
    invoke-virtual {v3, p2}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 1168
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "checkout: moving from "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {p1}, Lorg/eclipse/jgit/lib/Repository;->shortenRefName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Lorg/eclipse/jgit/revwalk/RevCommit;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v3, v5, v6}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogMessage(Ljava/lang/String;Z)V

    .line 1172
    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/RefUpdate;->forceUpdate()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v4

    .line 1173
    .local v4, res:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    sget-object v5, Lorg/eclipse/jgit/api/RebaseCommand$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    .line 1179
    new-instance v5, Ljava/io/IOException;

    const-string v6, "Could not rewind to upstream commit"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1182
    .end local v1           #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .end local v2           #head:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v3           #refUpdate:Lorg/eclipse/jgit/lib/RefUpdate;
    .end local v4           #res:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :catchall_0
    move-exception v5

    iget-object v6, p0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    .line 1183
    iget-object v6, p0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v6}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    throw v5

    .line 1161
    .restart local v1       #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .restart local v2       #head:Lorg/eclipse/jgit/revwalk/RevCommit;
    :catch_0
    move-exception v0

    .line 1162
    .local v0, cce:Lorg/eclipse/jgit/errors/CheckoutConflictException;
    :try_start_3
    new-instance v5, Lorg/eclipse/jgit/api/errors/CheckoutConflictException;

    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->getConflicts()Ljava/util/List;

    move-result-object v6

    invoke-direct {v5, v6, v0}, Lorg/eclipse/jgit/api/errors/CheckoutConflictException;-><init>(Ljava/util/List;Lorg/eclipse/jgit/errors/CheckoutConflictException;)V

    throw v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1182
    .end local v0           #cce:Lorg/eclipse/jgit/errors/CheckoutConflictException;
    .restart local v3       #refUpdate:Lorg/eclipse/jgit/lib/RefUpdate;
    .restart local v4       #res:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :pswitch_0
    iget-object v5, p0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v5}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    .line 1183
    iget-object v5, p0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v5}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 1185
    return v9

    .line 1173
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private checkoutCurrentHead()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/NoHeadException;
        }
    .end annotation

    .prologue
    .line 727
    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v11, "HEAD^{tree}"

    invoke-virtual {v10, v11}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    .line 728
    .local v6, headTree:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v6, :cond_0

    .line 729
    new-instance v10, Lorg/eclipse/jgit/api/errors/NoHeadException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/JGitText;->cannotRebaseWithoutCurrentHead:Ljava/lang/String;

    invoke-direct {v10, v11}, Lorg/eclipse/jgit/api/errors/NoHeadException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 731
    :cond_0
    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v10}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v1

    .line 733
    .local v1, dc:Lorg/eclipse/jgit/dircache/DirCache;
    :try_start_0
    new-instance v2, Lorg/eclipse/jgit/dircache/DirCacheCheckout;

    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v2, v10, v1, v6}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 734
    .local v2, dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    const/4 v10, 0x0

    invoke-virtual {v2, v10}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->setFailOnConflict(Z)V

    .line 735
    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->checkout()Z

    move-result v8

    .line 736
    .local v8, needsDeleteFiles:Z
    if-eqz v8, :cond_2

    .line 737
    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->getToBeDeleted()Ljava/util/List;

    move-result-object v3

    .line 738
    .local v3, fileList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 739
    .local v4, filePath:Ljava/lang/String;
    new-instance v5, Ljava/io/File;

    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v10}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v10

    invoke-direct {v5, v10, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 740
    .local v5, fileToDelete:Ljava/io/File;
    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v10}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v10

    invoke-virtual {v10, v5}, Lorg/eclipse/jgit/util/FS;->exists(Ljava/io/File;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 741
    const/4 v10, 0x3

    invoke-static {v5, v10}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 746
    .end local v2           #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .end local v3           #fileList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    .end local v4           #filePath:Ljava/lang/String;
    .end local v5           #fileToDelete:Ljava/io/File;
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v8           #needsDeleteFiles:Z
    :catchall_0
    move-exception v10

    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    throw v10

    .restart local v2       #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .restart local v8       #needsDeleteFiles:Z
    :cond_2
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    .line 748
    new-instance v9, Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v9, v10}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 749
    .local v9, rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    iget-object v10, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v11, "HEAD"

    invoke-virtual {v10, v11}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 750
    .local v0, commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v9}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    .line 751
    return-object v0
.end method

.method private cherryPickCommit(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/api/RebaseResult;
    .locals 9
    .parameter "commitToPick"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/NoMessageException;,
            Lorg/eclipse/jgit/api/errors/UnmergedPathsException;,
            Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;,
            Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;,
            Lorg/eclipse/jgit/api/errors/NoHeadException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 468
    :try_start_0
    iget-object v4, p0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->applyingCommit:Ljava/lang/String;

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getShortMessage()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-interface {v4, v5, v6}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 474
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/api/RebaseCommand;->tryFastForward(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v4

    iput-object v4, p0, Lorg/eclipse/jgit/api/RebaseCommand;->newHead:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 475
    iget-object v4, p0, Lorg/eclipse/jgit/api/RebaseCommand;->newHead:Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v4, :cond_1

    :goto_0
    iput-boolean v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->lastStepWasForward:Z

    .line 476
    iget-boolean v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->lastStepWasForward:Z

    if-nez v2, :cond_0

    .line 480
    invoke-direct {p0}, Lorg/eclipse/jgit/api/RebaseCommand;->getOurCommitName()Ljava/lang/String;

    move-result-object v1

    .line 481
    .local v1, ourCommitName:Ljava/lang/String;
    new-instance v2, Lorg/eclipse/jgit/api/Git;

    iget-object v3, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-virtual {v2}, Lorg/eclipse/jgit/api/Git;->cherryPick()Lorg/eclipse/jgit/api/CherryPickCommand;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/api/CherryPickCommand;->include(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/CherryPickCommand;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/eclipse/jgit/api/CherryPickCommand;->setOurCommitName(Ljava/lang/String;)Lorg/eclipse/jgit/api/CherryPickCommand;

    move-result-object v2

    const-string v3, "rebase:"

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/api/CherryPickCommand;->setReflogPrefix(Ljava/lang/String;)Lorg/eclipse/jgit/api/CherryPickCommand;

    move-result-object v2

    iget-object v3, p0, Lorg/eclipse/jgit/api/RebaseCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/api/CherryPickCommand;->setStrategy(Lorg/eclipse/jgit/merge/MergeStrategy;)Lorg/eclipse/jgit/api/CherryPickCommand;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/api/CherryPickCommand;->call()Lorg/eclipse/jgit/api/CherryPickResult;

    move-result-object v0

    .line 484
    .local v0, cherryPickResult:Lorg/eclipse/jgit/api/CherryPickResult;
    sget-object v2, Lorg/eclipse/jgit/api/RebaseCommand$1;->$SwitchMap$org$eclipse$jgit$api$CherryPickResult$CherryPickStatus:[I

    invoke-virtual {v0}, Lorg/eclipse/jgit/api/CherryPickResult;->getStatus()Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;->ordinal()I

    move-result v3

    aget v2, v2, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    packed-switch v2, :pswitch_data_0

    .line 497
    .end local v0           #cherryPickResult:Lorg/eclipse/jgit/api/CherryPickResult;
    .end local v1           #ourCommitName:Ljava/lang/String;
    :cond_0
    :goto_1
    const/4 v2, 0x0

    .line 499
    iget-object v3, p0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v3}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    :goto_2
    return-object v2

    :cond_1
    move v2, v3

    .line 475
    goto :goto_0

    .line 486
    .restart local v0       #cherryPickResult:Lorg/eclipse/jgit/api/CherryPickResult;
    .restart local v1       #ourCommitName:Ljava/lang/String;
    :pswitch_0
    :try_start_1
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->operation:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    sget-object v3, Lorg/eclipse/jgit/api/RebaseCommand$Operation;->BEGIN:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    if-ne v2, v3, :cond_2

    .line 487
    invoke-virtual {v0}, Lorg/eclipse/jgit/api/CherryPickResult;->getFailingPaths()Ljava/util/Map;

    move-result-object v2

    invoke-static {v2}, Lorg/eclipse/jgit/api/RebaseResult;->failed(Ljava/util/Map;)Lorg/eclipse/jgit/api/RebaseResult;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/eclipse/jgit/api/RebaseCommand;->abort(Lorg/eclipse/jgit/api/RebaseResult;)Lorg/eclipse/jgit/api/RebaseResult;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v2

    .line 499
    iget-object v3, p0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v3}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    goto :goto_2

    .line 490
    :cond_2
    :try_start_2
    sget-object v2, Lorg/eclipse/jgit/api/RebaseResult$Status;->STOPPED:Lorg/eclipse/jgit/api/RebaseResult$Status;

    invoke-direct {p0, p1, v2}, Lorg/eclipse/jgit/api/RebaseCommand;->stop(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/api/RebaseResult$Status;)Lorg/eclipse/jgit/api/RebaseResult;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v2

    .line 499
    iget-object v3, p0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v3}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    goto :goto_2

    .line 492
    :pswitch_1
    :try_start_3
    sget-object v2, Lorg/eclipse/jgit/api/RebaseResult$Status;->STOPPED:Lorg/eclipse/jgit/api/RebaseResult$Status;

    invoke-direct {p0, p1, v2}, Lorg/eclipse/jgit/api/RebaseCommand;->stop(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/api/RebaseResult$Status;)Lorg/eclipse/jgit/api/RebaseResult;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v2

    .line 499
    iget-object v3, p0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v3}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    goto :goto_2

    .line 494
    :pswitch_2
    :try_start_4
    invoke-virtual {v0}, Lorg/eclipse/jgit/api/CherryPickResult;->getNewHead()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->newHead:Lorg/eclipse/jgit/revwalk/RevCommit;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 499
    .end local v0           #cherryPickResult:Lorg/eclipse/jgit/api/CherryPickResult;
    .end local v1           #ourCommitName:Ljava/lang/String;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v3}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    throw v2

    .line 484
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private static composeSquashMessage(ZLorg/eclipse/jgit/revwalk/RevCommit;Ljava/lang/String;I)Ljava/lang/String;
    .locals 5
    .parameter "isSquash"
    .parameter "commitToPick"
    .parameter "currSquashMessage"
    .parameter "count"

    .prologue
    .line 625
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 626
    .local v1, sb:Ljava/lang/StringBuilder;
    invoke-static {p3}, Lorg/eclipse/jgit/api/RebaseCommand;->getOrdinal(I)Ljava/lang/String;

    move-result-object v0

    .line 627
    .local v0, ordinal:Ljava/lang/String;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 628
    const-string v2, "# This is a combination of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " commits.\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 631
    const-string v2, "\n"

    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p2, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 632
    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 633
    if-eqz p0, :cond_0

    .line 634
    const-string v2, "# This is the "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " commit message:\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 636
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getFullMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 643
    :goto_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 638
    :cond_0
    const-string v2, "# The "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " commit message will be skipped:\n# "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 640
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getFullMessage()Ljava/lang/String;

    move-result-object v2

    const-string v3, "([\n\r])"

    const-string v4, "$1# "

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method private continueRebase()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 761
    iget-object v6, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Repository;->readDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v1

    .line 762
    .local v1, dc:Lorg/eclipse/jgit/dircache/DirCache;
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCache;->hasUnmergedPaths()Z

    move-result v2

    .line 763
    .local v2, hasUnmergedPaths:Z
    if-eqz v2, :cond_0

    .line 764
    new-instance v6, Lorg/eclipse/jgit/api/errors/UnmergedPathsException;

    invoke-direct {v6}, Lorg/eclipse/jgit/api/errors/UnmergedPathsException;-><init>()V

    throw v6

    .line 767
    :cond_0
    new-instance v5, Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v6, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v5, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 768
    .local v5, treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->reset()V

    .line 769
    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setRecursive(Z)V

    .line 770
    new-instance v6, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    invoke-direct {v6, v1}, Lorg/eclipse/jgit/dircache/DirCacheIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCache;)V

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 771
    iget-object v6, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v7, "HEAD^{tree}"

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    .line 772
    .local v3, id:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v3, :cond_1

    .line 773
    new-instance v6, Lorg/eclipse/jgit/api/errors/NoHeadException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->cannotRebaseWithoutCurrentHead:Ljava/lang/String;

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/api/errors/NoHeadException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 776
    :cond_1
    invoke-virtual {v5, v3}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    .line 778
    sget-object v6, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->ANY_DIFF:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 780
    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v4

    .line 781
    .local v4, needsCommit:Z
    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->release()V

    .line 783
    if-eqz v4, :cond_2

    .line 784
    new-instance v6, Lorg/eclipse/jgit/api/Git;

    iget-object v7, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-virtual {v6}, Lorg/eclipse/jgit/api/Git;->commit()Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v0

    .line 785
    .local v0, commit:Lorg/eclipse/jgit/api/CommitCommand;
    iget-object v6, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v7, "message"

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/api/CommitCommand;->setMessage(Ljava/lang/String;)Lorg/eclipse/jgit/api/CommitCommand;

    .line 786
    invoke-direct {p0}, Lorg/eclipse/jgit/api/RebaseCommand;->parseAuthor()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v6

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/api/CommitCommand;->setAuthor(Lorg/eclipse/jgit/lib/PersonIdent;)Lorg/eclipse/jgit/api/CommitCommand;

    .line 787
    invoke-virtual {v0}, Lorg/eclipse/jgit/api/CommitCommand;->call()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v6

    .line 789
    .end local v0           #commit:Lorg/eclipse/jgit/api/CommitCommand;
    :goto_0
    return-object v6

    :cond_2
    const/4 v6, 0x0

    goto :goto_0
.end method

.method private doSquashFixup(ZLorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/lib/RebaseTodoLine;Ljava/io/File;Ljava/io/File;)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 7
    .parameter "isSquash"
    .parameter "commitToPick"
    .parameter "nextStep"
    .parameter "messageFixup"
    .parameter "messageSquash"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 536
    invoke-virtual {p5}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    .line 538
    iget-object v5, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v6, "HEAD"

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    .line 539
    .local v3, headId:Lorg/eclipse/jgit/lib/ObjectId;
    iget-object v5, p0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v5, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v4

    .line 541
    .local v4, previousCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    const-string v5, "message-squash"

    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->getFullMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v5, v6}, Lorg/eclipse/jgit/api/RebaseCommand;->initializeSquashFixupFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 543
    if-nez p1, :cond_0

    .line 544
    const-string v5, "message-fixup"

    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->getFullMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v5, v6}, Lorg/eclipse/jgit/api/RebaseCommand;->initializeSquashFixupFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 547
    .end local v3           #headId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v4           #previousCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_0
    iget-object v5, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v6, "message-squash"

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 550
    .local v2, currSquashMessage:Ljava/lang/String;
    invoke-static {v2}, Lorg/eclipse/jgit/api/RebaseCommand;->parseSquashFixupSequenceCount(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v1, v5, 0x1

    .line 552
    .local v1, count:I
    invoke-static {p1, p2, v2, v1}, Lorg/eclipse/jgit/api/RebaseCommand;->composeSquashMessage(ZLorg/eclipse/jgit/revwalk/RevCommit;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 554
    .local v0, content:Ljava/lang/String;
    iget-object v5, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v6, "message-squash"

    invoke-virtual {v5, v6, v0}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->createFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 555
    invoke-virtual {p4}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 556
    iget-object v5, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v6, "message-fixup"

    invoke-virtual {v5, v6, v0}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->createFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 558
    :cond_1
    invoke-virtual {p4}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_2

    const/4 v5, 0x1

    :goto_0
    invoke-direct {p0, v5, p3}, Lorg/eclipse/jgit/api/RebaseCommand;->squashIntoPrevious(ZLorg/eclipse/jgit/lib/RebaseTodoLine;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v5

    return-object v5

    :cond_2
    const/4 v5, 0x0

    goto :goto_0
.end method

.method private finishRebase(Lorg/eclipse/jgit/revwalk/RevCommit;Z)Lorg/eclipse/jgit/api/RebaseResult;
    .locals 4
    .parameter "newHead"
    .parameter "lastStepWasForward"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 505
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v3, "head-name"

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 506
    .local v0, headName:Ljava/lang/String;
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-direct {p0, v0, p1, v2}, Lorg/eclipse/jgit/api/RebaseCommand;->updateHead(Ljava/lang/String;Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 507
    invoke-direct {p0}, Lorg/eclipse/jgit/api/RebaseCommand;->autoStashApply()Z

    move-result v1

    .line 508
    .local v1, stashConflicts:Z
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    invoke-virtual {v2}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getDir()Ljava/io/File;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    .line 509
    if-eqz v1, :cond_0

    .line 510
    sget-object v2, Lorg/eclipse/jgit/api/RebaseResult;->STASH_APPLY_CONFLICTS_RESULT:Lorg/eclipse/jgit/api/RebaseResult;

    .line 513
    :goto_0
    return-object v2

    .line 511
    :cond_0
    if-nez p2, :cond_1

    if-nez p1, :cond_2

    .line 512
    :cond_1
    sget-object v2, Lorg/eclipse/jgit/api/RebaseResult;->FAST_FORWARD_RESULT:Lorg/eclipse/jgit/api/RebaseResult;

    goto :goto_0

    .line 513
    :cond_2
    sget-object v2, Lorg/eclipse/jgit/api/RebaseResult;->OK_RESULT:Lorg/eclipse/jgit/api/RebaseResult;

    goto :goto_0
.end method

.method private getHead()Lorg/eclipse/jgit/lib/Ref;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/RefNotFoundException;
        }
    .end annotation

    .prologue
    .line 972
    iget-object v1, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v2, "HEAD"

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 973
    .local v0, head:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    if-nez v1, :cond_1

    .line 974
    :cond_0
    new-instance v1, Lorg/eclipse/jgit/api/errors/RefNotFoundException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->refNotResolved:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "HEAD"

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/api/errors/RefNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 976
    :cond_1
    return-object v0
.end method

.method private static getHeadName(Lorg/eclipse/jgit/lib/Ref;)Ljava/lang/String;
    .locals 2
    .parameter "head"

    .prologue
    .line 964
    invoke-interface {p0}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 965
    invoke-interface {p0}, Lorg/eclipse/jgit/lib/Ref;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    .line 968
    .local v0, headName:Ljava/lang/String;
    :goto_0
    return-object v0

    .line 967
    .end local v0           #headName:Ljava/lang/String;
    :cond_0
    invoke-interface {p0}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectId;->getName()Ljava/lang/String;

    move-result-object v0

    .restart local v0       #headName:Ljava/lang/String;
    goto :goto_0
.end method

.method private static getOrdinal(I)Ljava/lang/String;
    .locals 1
    .parameter "count"

    .prologue
    .line 647
    rem-int/lit8 v0, p0, 0xa

    packed-switch v0, :pswitch_data_0

    .line 655
    const-string v0, "th"

    :goto_0
    return-object v0

    .line 649
    :pswitch_0
    const-string v0, "st"

    goto :goto_0

    .line 651
    :pswitch_1
    const-string v0, "nd"

    goto :goto_0

    .line 653
    :pswitch_2
    const-string v0, "rd"

    goto :goto_0

    .line 647
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private getOurCommitName()Ljava/lang/String;
    .locals 3

    .prologue
    .line 688
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Upstream, based on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommitName:Ljava/lang/String;

    invoke-static {v2}, Lorg/eclipse/jgit/lib/Repository;->shortenRefName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 690
    .local v0, ourCommitName:Ljava/lang/String;
    return-object v0
.end method

.method private initFilesAndRewind()Lorg/eclipse/jgit/api/RebaseResult;
    .locals 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 884
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/RebaseCommand;->getHead()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v6

    .line 886
    .local v6, head:Lorg/eclipse/jgit/lib/Ref;
    invoke-static {v6}, Lorg/eclipse/jgit/api/RebaseCommand;->getHeadName(Lorg/eclipse/jgit/lib/Ref;)Ljava/lang/String;

    move-result-object v9

    .line 887
    .local v9, headName:Ljava/lang/String;
    invoke-interface {v6}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v8

    .line 888
    .local v8, headId:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v8, :cond_0

    .line 889
    new-instance v14, Lorg/eclipse/jgit/api/errors/RefNotFoundException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v15

    iget-object v15, v15, Lorg/eclipse/jgit/internal/JGitText;->refNotResolved:Ljava/lang/String;

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    const-string v18, "HEAD"

    aput-object v18, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lorg/eclipse/jgit/api/errors/RefNotFoundException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 891
    :cond_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v14, v8}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v7

    .line 892
    .local v7, headCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-virtual {v15}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v15

    invoke-virtual {v14, v15}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v13

    .line 894
    .local v13, upstream:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/RebaseCommand;->isInteractive()Z

    move-result v14

    if-nez v14, :cond_1

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v14, v13, v7}, Lorg/eclipse/jgit/revwalk/RevWalk;->isMergedInto(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v14

    if-eqz v14, :cond_1

    .line 895
    sget-object v14, Lorg/eclipse/jgit/api/RebaseResult;->UP_TO_DATE_RESULT:Lorg/eclipse/jgit/api/RebaseResult;

    .line 959
    :goto_0
    return-object v14

    .line 896
    :cond_1
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/RebaseCommand;->isInteractive()Z

    move-result v14

    if-nez v14, :cond_2

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v14, v7, v13}, Lorg/eclipse/jgit/revwalk/RevWalk;->isMergedInto(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 898
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v15

    iget-object v15, v15, Lorg/eclipse/jgit/internal/JGitText;->resettingHead:Ljava/lang/String;

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/revwalk/RevCommit;->getShortMessage()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x0

    invoke-interface/range {v14 .. v16}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 901
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    move-object/from16 v0, p0

    invoke-direct {v0, v9, v14}, Lorg/eclipse/jgit/api/RebaseCommand;->checkoutCommit(Ljava/lang/String;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    .line 902
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v14}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 904
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    move-object/from16 v0, p0

    invoke-direct {v0, v9, v14, v13}, Lorg/eclipse/jgit/api/RebaseCommand;->updateHead(Ljava/lang/String;Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 905
    sget-object v14, Lorg/eclipse/jgit/api/RebaseResult;->FAST_FORWARD_RESULT:Lorg/eclipse/jgit/api/RebaseResult;

    goto :goto_0

    .line 908
    :cond_2
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v15

    iget-object v15, v15, Lorg/eclipse/jgit/internal/JGitText;->obtainingCommitsForCherryPick:Ljava/lang/String;

    const/16 v16, 0x0

    invoke-interface/range {v14 .. v16}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 912
    new-instance v14, Lorg/eclipse/jgit/api/Git;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v14, v15}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-virtual {v14}, Lorg/eclipse/jgit/api/Git;->log()Lorg/eclipse/jgit/api/LogCommand;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-virtual {v14, v15, v7}, Lorg/eclipse/jgit/api/LogCommand;->addRange(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/LogCommand;

    move-result-object v3

    .line 914
    .local v3, cmd:Lorg/eclipse/jgit/api/LogCommand;
    invoke-virtual {v3}, Lorg/eclipse/jgit/api/LogCommand;->call()Ljava/lang/Iterable;

    move-result-object v5

    .line 916
    .local v5, commitsToUse:Ljava/lang/Iterable;,"Ljava/lang/Iterable<Lorg/eclipse/jgit/revwalk/RevCommit;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 917
    .local v2, cherryPickList:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevCommit;>;"
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, i$:Ljava/util/Iterator;
    :cond_3
    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_4

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 918
    .local v4, commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParentCount()I

    move-result v14

    const/4 v15, 0x1

    if-ne v14, v15, :cond_3

    .line 920
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 923
    .end local v4           #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_4
    invoke-static {v2}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 925
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    invoke-virtual {v14}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getDir()Ljava/io/File;

    move-result-object v14

    const/4 v15, 0x1

    invoke-static {v14, v15}, Lorg/eclipse/jgit/util/FileUtils;->mkdir(Ljava/io/File;Z)V

    .line 927
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v14, v8}, Lorg/eclipse/jgit/lib/Repository;->writeOrigHead(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 928
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v15, "head"

    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v14 .. v16}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->createFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 929
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v15, "head-name"

    invoke-virtual {v14, v15, v9}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->createFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 930
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v15, "onto"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v14 .. v16}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->createFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 931
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v15, "onto-name"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommitName:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v14 .. v16}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->createFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 932
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v15, "interactive"

    const-string v16, ""

    invoke-virtual/range {v14 .. v16}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->createFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 933
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v15, "quiet"

    const-string v16, ""

    invoke-virtual/range {v14 .. v16}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->createFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 935
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 936
    .local v12, toDoSteps:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/eclipse/jgit/lib/RebaseTodoLine;>;"
    new-instance v14, Lorg/eclipse/jgit/lib/RebaseTodoLine;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "# Created by EGit: rebasing "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " onto "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lorg/eclipse/jgit/lib/RebaseTodoLine;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 938
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v14}, Lorg/eclipse/jgit/revwalk/RevWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v11

    .line 939
    .local v11, reader:Lorg/eclipse/jgit/lib/ObjectReader;
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_5

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 940
    .restart local v4       #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    new-instance v14, Lorg/eclipse/jgit/lib/RebaseTodoLine;

    sget-object v15, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->PICK:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    invoke-virtual {v11, v4}, Lorg/eclipse/jgit/lib/ObjectReader;->abbreviate(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v16

    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->getShortMessage()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v14 .. v17}, Lorg/eclipse/jgit/lib/RebaseTodoLine;-><init>(Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;Lorg/eclipse/jgit/lib/AbbreviatedObjectId;Ljava/lang/String;)V

    invoke-virtual {v12, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 942
    .end local v4           #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_5
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v16, "git-rebase-todo"

    invoke-virtual/range {v15 .. v16}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v14, v15, v12, v0}, Lorg/eclipse/jgit/lib/Repository;->writeRebaseTodoFile(Ljava/lang/String;Ljava/util/List;Z)V

    .line 945
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v14}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 948
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v15

    iget-object v15, v15, Lorg/eclipse/jgit/internal/JGitText;->rewinding:Ljava/lang/String;

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/revwalk/RevCommit;->getShortMessage()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x0

    invoke-interface/range {v14 .. v16}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 950
    const/4 v1, 0x0

    .line 952
    .local v1, checkoutOk:Z
    :try_start_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    move-object/from16 v0, p0

    invoke-direct {v0, v9, v14}, Lorg/eclipse/jgit/api/RebaseCommand;->checkoutCommit(Ljava/lang/String;Lorg/eclipse/jgit/revwalk/RevCommit;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 954
    if-nez v1, :cond_6

    .line 955
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    invoke-virtual {v14}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getDir()Ljava/io/File;

    move-result-object v14

    const/4 v15, 0x1

    invoke-static {v14, v15}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    .line 957
    :cond_6
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v14}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 959
    const/4 v14, 0x0

    goto/16 :goto_0

    .line 954
    :catchall_0
    move-exception v14

    if-nez v1, :cond_7

    .line 955
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    invoke-virtual {v15}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getDir()Ljava/io/File;

    move-result-object v15

    const/16 v16, 0x1

    invoke-static/range {v15 .. v16}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    :cond_7
    throw v14
.end method

.method private initializeSquashFixupFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .parameter "messageFile"
    .parameter "fullMessage"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 679
    iget-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "# This is a combination of 1 commits.\n# The first commit\'s message is:\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->createFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 683
    return-void
.end method

.method private isInteractive()Z
    .locals 1

    .prologue
    .line 980
    iget-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->interactiveHandler:Lorg/eclipse/jgit/api/RebaseCommand$InteractiveHandler;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private parseAuthor()Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 793
    iget-object v3, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v4, "author-script"

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 796
    .local v0, authorScriptFile:Ljava/io/File;
    :try_start_0
    invoke-static {v0}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/File;)[B
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 800
    .local v2, raw:[B
    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/api/RebaseCommand;->parseAuthor([B)Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v3

    .end local v2           #raw:[B
    :goto_0
    return-object v3

    .line 797
    :catch_0
    move-exception v1

    .line 798
    .local v1, notFound:Ljava/io/FileNotFoundException;
    const/4 v3, 0x0

    goto :goto_0
.end method

.method static parseSquashFixupSequenceCount(Ljava/lang/String;)I
    .locals 6
    .parameter "currSquashMessage"

    .prologue
    .line 667
    const-string v3, "This is a combination of (.*) commits"

    .line 668
    .local v3, regex:Ljava/lang/String;
    const/4 v4, 0x0

    const-string v5, "\n"

    invoke-virtual {p0, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 670
    .local v0, firstLine:Ljava/lang/String;
    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    .line 671
    .local v2, pattern:Ljava/util/regex/Pattern;
    invoke-virtual {v2, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 672
    .local v1, matcher:Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-nez v4, :cond_0

    .line 673
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v4

    .line 674
    :cond_0
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    return v4
.end method

.method private popSteps(I)V
    .locals 8
    .parameter "numSteps"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    .line 857
    if-nez p1, :cond_1

    .line 877
    :cond_0
    :goto_0
    return-void

    .line 859
    :cond_1
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 860
    .local v3, todoLines:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/RebaseTodoLine;>;"
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 862
    .local v2, poppedLines:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/RebaseTodoLine;>;"
    iget-object v4, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    iget-object v5, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v6, "git-rebase-todo"

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v7}, Lorg/eclipse/jgit/lib/Repository;->readRebaseTodo(Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/RebaseTodoLine;

    .line 864
    .local v1, line:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-ge v4, p1, :cond_2

    sget-object v4, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->COMMENT:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RebaseTodoLine;->getAction()Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 866
    :cond_2
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 868
    :cond_3
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 871
    .end local v1           #line:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    :cond_4
    iget-object v4, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    iget-object v5, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v6, "git-rebase-todo"

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v3, v6}, Lorg/eclipse/jgit/lib/Repository;->writeRebaseTodoFile(Ljava/lang/String;Ljava/util/List;Z)V

    .line 873
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_0

    .line 874
    iget-object v4, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    iget-object v5, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v6, "done"

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v2, v7}, Lorg/eclipse/jgit/lib/Repository;->writeRebaseTodoFile(Ljava/lang/String;Ljava/util/List;Z)V

    goto :goto_0
.end method

.method private processStep(Lorg/eclipse/jgit/lib/RebaseTodoLine;Z)Lorg/eclipse/jgit/api/RebaseResult;
    .locals 14
    .parameter "step"
    .parameter "shouldPick"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 413
    sget-object v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->COMMENT:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/RebaseTodoLine;->getAction()Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    move-result-object v12

    invoke-virtual {v0, v12}, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 414
    const/4 v10, 0x0

    .line 460
    :cond_0
    :goto_0
    return-object v10

    .line 415
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v9

    .line 417
    .local v9, or:Lorg/eclipse/jgit/lib/ObjectReader;
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/RebaseTodoLine;->getCommit()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v0

    invoke-virtual {v9, v0}, Lorg/eclipse/jgit/lib/ObjectReader;->resolve(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;)Ljava/util/Collection;

    move-result-object v6

    .line 418
    .local v6, ids:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-interface {v6}, Ljava/util/Collection;->size()I

    move-result v0

    const/4 v12, 0x1

    if-eq v0, v12, :cond_2

    .line 419
    new-instance v0, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    const-string v12, "Could not resolve uniquely the abbreviated object ID"

    invoke-direct {v0, v12}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 421
    :cond_2
    iget-object v12, p0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/AnyObjectId;

    invoke-virtual {v12, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v2

    .line 422
    .local v2, commitToPick:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-eqz p2, :cond_4

    .line 423
    iget-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/ProgressMonitor;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 424
    sget-object v0, Lorg/eclipse/jgit/api/RebaseResult$Status;->STOPPED:Lorg/eclipse/jgit/api/RebaseResult$Status;

    invoke-static {v0, v2}, Lorg/eclipse/jgit/api/RebaseResult;->result(Lorg/eclipse/jgit/api/RebaseResult$Status;Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/api/RebaseResult;

    move-result-object v10

    goto :goto_0

    .line 425
    :cond_3
    invoke-direct {p0, v2}, Lorg/eclipse/jgit/api/RebaseCommand;->cherryPickCommit(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/api/RebaseResult;

    move-result-object v10

    .line 426
    .local v10, result:Lorg/eclipse/jgit/api/RebaseResult;
    if-nez v10, :cond_0

    .line 429
    .end local v10           #result:Lorg/eclipse/jgit/api/RebaseResult;
    :cond_4
    const/4 v1, 0x0

    .line 430
    .local v1, isSquash:Z
    sget-object v0, Lorg/eclipse/jgit/api/RebaseCommand$1;->$SwitchMap$org$eclipse$jgit$lib$RebaseTodoLine$Action:[I

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/RebaseTodoLine;->getAction()Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    move-result-object v12

    invoke-virtual {v12}, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->ordinal()I

    move-result v12

    aget v0, v0, v12

    packed-switch v0, :pswitch_data_0

    .line 460
    :goto_1
    :pswitch_0
    const/4 v10, 0x0

    goto :goto_0

    .line 432
    :pswitch_1
    const/4 v10, 0x0

    goto :goto_0

    .line 434
    :pswitch_2
    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevCommit;->getFullMessage()Ljava/lang/String;

    move-result-object v8

    .line 435
    .local v8, oldMessage:Ljava/lang/String;
    iget-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->interactiveHandler:Lorg/eclipse/jgit/api/RebaseCommand$InteractiveHandler;

    invoke-interface {v0, v8}, Lorg/eclipse/jgit/api/RebaseCommand$InteractiveHandler;->modifyCommitMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 437
    .local v7, newMessage:Ljava/lang/String;
    new-instance v0, Lorg/eclipse/jgit/api/Git;

    iget-object v12, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v12}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-virtual {v0}, Lorg/eclipse/jgit/api/Git;->commit()Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v0

    invoke-virtual {v0, v7}, Lorg/eclipse/jgit/api/CommitCommand;->setMessage(Ljava/lang/String;)Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v0

    const/4 v12, 0x1

    invoke-virtual {v0, v12}, Lorg/eclipse/jgit/api/CommitCommand;->setAmend(Z)Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/api/CommitCommand;->call()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->newHead:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 439
    const/4 v10, 0x0

    goto :goto_0

    .line 441
    .end local v7           #newMessage:Ljava/lang/String;
    .end local v8           #oldMessage:Ljava/lang/String;
    :pswitch_3
    iget-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v12, "amend"

    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v0, v12, v13}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->createFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 442
    sget-object v0, Lorg/eclipse/jgit/api/RebaseResult$Status;->EDIT:Lorg/eclipse/jgit/api/RebaseResult$Status;

    invoke-direct {p0, v2, v0}, Lorg/eclipse/jgit/api/RebaseCommand;->stop(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/api/RebaseResult$Status;)Lorg/eclipse/jgit/api/RebaseResult;

    move-result-object v10

    goto/16 :goto_0

    .line 446
    :pswitch_4
    const/4 v1, 0x1

    .line 449
    :pswitch_5
    invoke-direct {p0}, Lorg/eclipse/jgit/api/RebaseCommand;->resetSoftToParent()V

    .line 450
    iget-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    iget-object v12, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v13, "git-rebase-todo"

    invoke-virtual {v12, v13}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v0, v12, v13}, Lorg/eclipse/jgit/lib/Repository;->readRebaseTodo(Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v11

    .line 452
    .local v11, steps:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/RebaseTodoLine;>;"
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_6

    const/4 v0, 0x0

    invoke-interface {v11, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/RebaseTodoLine;

    move-object v3, v0

    .line 453
    .local v3, nextStep:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    :goto_2
    iget-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v12, "message-fixup"

    invoke-virtual {v0, v12}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    .line 454
    .local v4, messageFixupFile:Ljava/io/File;
    iget-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v12, "message-squash"

    invoke-virtual {v0, v12}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    .line 455
    .local v5, messageSquashFile:Ljava/io/File;
    if-eqz v1, :cond_5

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 456
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    :cond_5
    move-object v0, p0

    .line 457
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/api/RebaseCommand;->doSquashFixup(ZLorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/lib/RebaseTodoLine;Ljava/io/File;Ljava/io/File;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->newHead:Lorg/eclipse/jgit/revwalk/RevCommit;

    goto :goto_1

    .line 452
    .end local v3           #nextStep:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    .end local v4           #messageFixupFile:Ljava/io/File;
    .end local v5           #messageSquashFile:Ljava/io/File;
    :cond_6
    const/4 v3, 0x0

    goto :goto_2

    .line 430
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method private resetSoftToParent()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/CheckoutConflictException;
        }
    .end annotation

    .prologue
    .line 565
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v3, "ORIG_HEAD"

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 566
    .local v0, orig_head:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    .line 572
    .local v1, orig_headId:Lorg/eclipse/jgit/lib/ObjectId;
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-static {v2}, Lorg/eclipse/jgit/api/Git;->wrap(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/api/Git;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/api/Git;->reset()Lorg/eclipse/jgit/api/ResetCommand;

    move-result-object v2

    sget-object v3, Lorg/eclipse/jgit/api/ResetCommand$ResetType;->SOFT:Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/api/ResetCommand;->setMode(Lorg/eclipse/jgit/api/ResetCommand$ResetType;)Lorg/eclipse/jgit/api/ResetCommand;

    move-result-object v2

    const-string v3, "HEAD~1"

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/api/ResetCommand;->setRef(Ljava/lang/String;)Lorg/eclipse/jgit/api/ResetCommand;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/api/ResetCommand;->call()Lorg/eclipse/jgit/lib/Ref;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 577
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2, v1}, Lorg/eclipse/jgit/lib/Repository;->writeOrigHead(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 579
    return-void

    .line 577
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v3, v1}, Lorg/eclipse/jgit/lib/Repository;->writeOrigHead(Lorg/eclipse/jgit/lib/ObjectId;)V

    throw v2
.end method

.method private squashIntoPrevious(ZLorg/eclipse/jgit/lib/RebaseTodoLine;)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 5
    .parameter "sequenceContainsSquash"
    .parameter "nextStep"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 585
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v3, "message-squash"

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 588
    .local v0, commitMessage:Ljava/lang/String;
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/RebaseTodoLine;->getAction()Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    move-result-object v2

    sget-object v3, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->FIXUP:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    if-eq v2, v3, :cond_2

    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/RebaseTodoLine;->getAction()Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    move-result-object v2

    sget-object v3, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->SQUASH:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    if-eq v2, v3, :cond_2

    .line 592
    :cond_0
    if-eqz p1, :cond_1

    .line 593
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->interactiveHandler:Lorg/eclipse/jgit/api/RebaseCommand$InteractiveHandler;

    invoke-interface {v2, v0}, Lorg/eclipse/jgit/api/RebaseCommand$InteractiveHandler;->modifyCommitMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 596
    :cond_1
    new-instance v2, Lorg/eclipse/jgit/api/Git;

    iget-object v3, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-virtual {v2}, Lorg/eclipse/jgit/api/Git;->commit()Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v2

    invoke-static {v0}, Lorg/eclipse/jgit/api/RebaseCommand;->stripCommentLines(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/api/CommitCommand;->setMessage(Ljava/lang/String;)Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v2

    invoke-virtual {v2, v4}, Lorg/eclipse/jgit/api/CommitCommand;->setAmend(Z)Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/api/CommitCommand;->call()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    .line 599
    .local v1, newHead:Lorg/eclipse/jgit/revwalk/RevCommit;
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v3, "message-squash"

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 600
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v3, "message-fixup"

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 608
    :goto_0
    return-object v1

    .line 604
    .end local v1           #newHead:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_2
    new-instance v2, Lorg/eclipse/jgit/api/Git;

    iget-object v3, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-virtual {v2}, Lorg/eclipse/jgit/api/Git;->commit()Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v2

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/api/CommitCommand;->setMessage(Ljava/lang/String;)Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v2

    invoke-virtual {v2, v4}, Lorg/eclipse/jgit/api/CommitCommand;->setAmend(Z)Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/api/CommitCommand;->call()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    .restart local v1       #newHead:Lorg/eclipse/jgit/revwalk/RevCommit;
    goto :goto_0
.end method

.method private stop(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/api/RebaseResult$Status;)Lorg/eclipse/jgit/api/RebaseResult;
    .locals 9
    .parameter "commitToPick"
    .parameter "status"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 805
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getAuthorIdent()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v0

    .line 806
    .local v0, author:Lorg/eclipse/jgit/lib/PersonIdent;
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/api/RebaseCommand;->toAuthorScript(Lorg/eclipse/jgit/lib/PersonIdent;)Ljava/lang/String;

    move-result-object v1

    .line 807
    .local v1, authorScript:Ljava/lang/String;
    iget-object v4, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v5, "author-script"

    invoke-virtual {v4, v5, v1}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->createFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 808
    iget-object v4, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v5, "message"

    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getFullMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->createFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 809
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 810
    .local v2, bos:Ljava/io/ByteArrayOutputStream;
    new-instance v3, Lorg/eclipse/jgit/diff/DiffFormatter;

    invoke-direct {v3, v2}, Lorg/eclipse/jgit/diff/DiffFormatter;-><init>(Ljava/io/OutputStream;)V

    .line 811
    .local v3, df:Lorg/eclipse/jgit/diff/DiffFormatter;
    iget-object v4, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/diff/DiffFormatter;->setRepository(Lorg/eclipse/jgit/lib/Repository;)V

    .line 812
    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v4

    invoke-virtual {v3, v4, p1}, Lorg/eclipse/jgit/diff/DiffFormatter;->format(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 813
    iget-object v4, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v5, "patch"

    new-instance v6, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v7

    const-string v8, "UTF-8"

    invoke-direct {v6, v7, v8}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v4, v5, v6}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->createFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 815
    iget-object v4, p0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    const-string v5, "stopped-sha"

    iget-object v6, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v6

    invoke-virtual {v6, p1}, Lorg/eclipse/jgit/lib/ObjectReader;->abbreviate(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v6

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->createFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 821
    iget-object v4, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/lib/Repository;->writeCherryPickHead(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 822
    invoke-static {p2, p1}, Lorg/eclipse/jgit/api/RebaseResult;->result(Lorg/eclipse/jgit/api/RebaseResult$Status;Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/api/RebaseResult;

    move-result-object v4

    return-object v4
.end method

.method private static stripCommentLines(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .parameter "commitMessage"

    .prologue
    .line 612
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 613
    .local v4, result:Ljava/lang/StringBuilder;
    const-string v5, "\n"

    invoke-virtual {p0, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, arr$:[Ljava/lang/String;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 614
    .local v3, line:Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    const-string v6, "#"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 615
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 613
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 617
    .end local v3           #line:Ljava/lang/String;
    :cond_1
    const-string v5, "\n"

    invoke-virtual {p0, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 618
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 619
    :cond_2
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method private tryFastForward(Ljava/lang/String;Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 11
    .parameter "headName"
    .parameter "oldCommit"
    .parameter "newCommit"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 1009
    const/4 v8, 0x0

    .line 1010
    .local v8, tryRebase:Z
    invoke-virtual {p3}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParents()[Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .local v0, arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v5, v0, v3

    .line 1011
    .local v5, parentCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v5, p2}, Lorg/eclipse/jgit/revwalk/RevCommit;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 1012
    const/4 v8, 0x1

    .line 1010
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1013
    .end local v5           #parentCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_1
    if-nez v8, :cond_3

    .line 1014
    const/4 p3, 0x0

    .line 1035
    .end local p3
    :cond_2
    :pswitch_0
    return-object p3

    .line 1016
    .restart local p3
    :cond_3
    new-instance v1, Lorg/eclipse/jgit/api/CheckoutCommand;

    iget-object v9, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v1, v9}, Lorg/eclipse/jgit/api/CheckoutCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 1018
    .local v1, co:Lorg/eclipse/jgit/api/CheckoutCommand;
    :try_start_0
    invoke-virtual {p3}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v9}, Lorg/eclipse/jgit/api/CheckoutCommand;->setName(Ljava/lang/String;)Lorg/eclipse/jgit/api/CheckoutCommand;

    move-result-object v9

    invoke-virtual {v9}, Lorg/eclipse/jgit/api/CheckoutCommand;->call()Lorg/eclipse/jgit/lib/Ref;

    .line 1019
    const-string v9, "refs/heads/"

    invoke-virtual {p1, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 1020
    iget-object v9, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v9, p1}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v7

    .line 1021
    .local v7, rup:Lorg/eclipse/jgit/lib/RefUpdate;
    invoke-virtual {v7, p2}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 1022
    invoke-virtual {v7, p3}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 1023
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Fast-foward from "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p2}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " to "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p3}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v7, v9, v10}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogMessage(Ljava/lang/String;Z)V

    .line 1025
    iget-object v9, p0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v7, v9}, Lorg/eclipse/jgit/lib/RefUpdate;->update(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v6

    .line 1026
    .local v6, res:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    sget-object v9, Lorg/eclipse/jgit/api/RebaseCommand$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v10

    aget v9, v9, v10

    packed-switch v9, :pswitch_data_0

    .line 1032
    new-instance v9, Ljava/io/IOException;

    const-string v10, "Could not fast-forward"

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_0
    .catch Lorg/eclipse/jgit/api/errors/RefAlreadyExistsException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/eclipse/jgit/api/errors/RefNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/eclipse/jgit/api/errors/InvalidRefNameException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/eclipse/jgit/api/errors/CheckoutConflictException; {:try_start_0 .. :try_end_0} :catch_3

    .line 1036
    .end local v6           #res:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .end local v7           #rup:Lorg/eclipse/jgit/lib/RefUpdate;
    :catch_0
    move-exception v2

    .line 1037
    .local v2, e:Lorg/eclipse/jgit/api/errors/RefAlreadyExistsException;
    new-instance v9, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v2}, Lorg/eclipse/jgit/api/errors/RefAlreadyExistsException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v2}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 1038
    .end local v2           #e:Lorg/eclipse/jgit/api/errors/RefAlreadyExistsException;
    :catch_1
    move-exception v2

    .line 1039
    .local v2, e:Lorg/eclipse/jgit/api/errors/RefNotFoundException;
    new-instance v9, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v2}, Lorg/eclipse/jgit/api/errors/RefNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v2}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 1040
    .end local v2           #e:Lorg/eclipse/jgit/api/errors/RefNotFoundException;
    :catch_2
    move-exception v2

    .line 1041
    .local v2, e:Lorg/eclipse/jgit/api/errors/InvalidRefNameException;
    new-instance v9, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v2}, Lorg/eclipse/jgit/api/errors/InvalidRefNameException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v2}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 1042
    .end local v2           #e:Lorg/eclipse/jgit/api/errors/InvalidRefNameException;
    :catch_3
    move-exception v2

    .line 1043
    .local v2, e:Lorg/eclipse/jgit/api/errors/CheckoutConflictException;
    new-instance v9, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v2}, Lorg/eclipse/jgit/api/errors/CheckoutConflictException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v2}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 1026
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private updateHead(Ljava/lang/String;Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 5
    .parameter "headName"
    .parameter "newHead"
    .parameter "onto"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 697
    const-string v2, "refs/"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 698
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v1

    .line 699
    .local v1, rup:Lorg/eclipse/jgit/lib/RefUpdate;
    invoke-virtual {v1, p2}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 700
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "rebase finished: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " onto "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p3}, Lorg/eclipse/jgit/revwalk/RevCommit;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v4}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogMessage(Ljava/lang/String;Z)V

    .line 702
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RefUpdate;->forceUpdate()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v0

    .line 703
    .local v0, res:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    sget-object v2, Lorg/eclipse/jgit/api/RebaseCommand$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 709
    new-instance v2, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    const-string v3, "Updating HEAD failed"

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 711
    :pswitch_0
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v3, "HEAD"

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v1

    .line 712
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "rebase finished: returning to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v4}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogMessage(Ljava/lang/String;Z)V

    .line 714
    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/RefUpdate;->link(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v0

    .line 715
    sget-object v2, Lorg/eclipse/jgit/api/RebaseCommand$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_1

    .line 721
    new-instance v2, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    const-string v3, "Updating HEAD failed"

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 724
    .end local v0           #res:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .end local v1           #rup:Lorg/eclipse/jgit/lib/RefUpdate;
    :cond_0
    :pswitch_1
    return-void

    .line 703
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    .line 715
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method private updateStashRef(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/PersonIdent;Ljava/lang/String;)V
    .locals 4
    .parameter "commitId"
    .parameter "refLogIdent"
    .parameter "refLogMessage"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 399
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v3, "refs/stash"

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 400
    .local v0, currentRef:Lorg/eclipse/jgit/lib/Ref;
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v3, "refs/stash"

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v1

    .line 401
    .local v1, refUpdate:Lorg/eclipse/jgit/lib/RefUpdate;
    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 402
    invoke-virtual {v1, p2}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogIdent(Lorg/eclipse/jgit/lib/PersonIdent;)V

    .line 403
    const/4 v2, 0x0

    invoke-virtual {v1, p3, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogMessage(Ljava/lang/String;Z)V

    .line 404
    if-eqz v0, :cond_0

    .line 405
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 408
    :goto_0
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RefUpdate;->forceUpdate()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 409
    return-void

    .line 407
    :cond_0
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    goto :goto_0
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
    .line 116
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/RebaseCommand;->call()Lorg/eclipse/jgit/api/RebaseResult;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/api/RebaseResult;
    .locals 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/NoHeadException;,
            Lorg/eclipse/jgit/api/errors/RefNotFoundException;,
            Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;
        }
    .end annotation

    .prologue
    .line 242
    const/16 v19, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/api/RebaseCommand;->newHead:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 243
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/eclipse/jgit/api/RebaseCommand;->lastStepWasForward:Z

    .line 244
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/api/RebaseCommand;->checkCallable()V

    .line 245
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/RebaseCommand;->checkParameters()V

    .line 247
    :try_start_0
    sget-object v19, Lorg/eclipse/jgit/api/RebaseCommand$1;->$SwitchMap$org$eclipse$jgit$api$RebaseCommand$Operation:[I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->operation:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/eclipse/jgit/api/RebaseCommand$Operation;->ordinal()I

    move-result v20

    aget v19, v19, v20

    packed-switch v19, :pswitch_data_0

    .line 296
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Lorg/eclipse/jgit/lib/ProgressMonitor;->isCancelled()Z

    move-result v19

    if-eqz v19, :cond_6

    .line 297
    sget-object v19, Lorg/eclipse/jgit/api/RebaseResult;->ABORTED_RESULT:Lorg/eclipse/jgit/api/RebaseResult;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/RebaseCommand;->abort(Lorg/eclipse/jgit/api/RebaseResult;)Lorg/eclipse/jgit/api/RebaseResult;
    :try_end_0
    .catch Lorg/eclipse/jgit/api/errors/CheckoutConflictException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v14

    .line 353
    :cond_1
    :goto_1
    return-object v14

    .line 250
    :pswitch_0
    :try_start_1
    sget-object v19, Lorg/eclipse/jgit/api/RebaseResult;->ABORTED_RESULT:Lorg/eclipse/jgit/api/RebaseResult;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/RebaseCommand;->abort(Lorg/eclipse/jgit/api/RebaseResult;)Lorg/eclipse/jgit/api/RebaseResult;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/eclipse/jgit/api/errors/CheckoutConflictException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v14

    goto :goto_1

    .line 251
    :catch_0
    move-exception v10

    .line 252
    .local v10, ioe:Ljava/io/IOException;
    :try_start_2
    new-instance v19, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v10}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v0, v1, v10}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v19
    :try_end_2
    .catch Lorg/eclipse/jgit/api/errors/CheckoutConflictException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 352
    .end local v10           #ioe:Ljava/io/IOException;
    :catch_1
    move-exception v6

    .line 353
    .local v6, cce:Lorg/eclipse/jgit/api/errors/CheckoutConflictException;
    invoke-virtual {v6}, Lorg/eclipse/jgit/api/errors/CheckoutConflictException;->getConflictingPaths()Ljava/util/List;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lorg/eclipse/jgit/api/RebaseResult;->conflicts(Ljava/util/List;)Lorg/eclipse/jgit/api/RebaseResult;

    move-result-object v14

    goto :goto_1

    .line 259
    .end local v6           #cce:Lorg/eclipse/jgit/api/errors/CheckoutConflictException;
    :pswitch_1
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    move-object/from16 v19, v0

    const-string v20, "onto"

    invoke-virtual/range {v19 .. v20}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->readFile(Ljava/lang/String;)Ljava/lang/String;
    :try_end_3
    .catch Lorg/eclipse/jgit/api/errors/CheckoutConflictException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    move-result-object v18

    .line 261
    .local v18, upstreamCommitId:Ljava/lang/String;
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    move-object/from16 v19, v0

    const-string v20, "onto-name"

    invoke-virtual/range {v19 .. v20}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommitName:Ljava/lang/String;
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Lorg/eclipse/jgit/api/errors/CheckoutConflictException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 267
    :goto_2
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :try_end_5
    .catch Lorg/eclipse/jgit/api/errors/CheckoutConflictException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_0

    .line 354
    .end local v18           #upstreamCommitId:Ljava/lang/String;
    :catch_2
    move-exception v10

    .line 355
    .restart local v10       #ioe:Ljava/io/IOException;
    new-instance v19, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v10}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v0, v1, v10}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v19

    .line 262
    .end local v10           #ioe:Ljava/io/IOException;
    .restart local v18       #upstreamCommitId:Ljava/lang/String;
    :catch_3
    move-exception v8

    .line 265
    .local v8, e:Ljava/io/FileNotFoundException;
    :try_start_6
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommitName:Ljava/lang/String;

    goto :goto_2

    .line 271
    .end local v8           #e:Ljava/io/FileNotFoundException;
    .end local v18           #upstreamCommitId:Ljava/lang/String;
    :pswitch_2
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/RebaseCommand;->autoStash()V

    .line 272
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->stopAfterInitialization:Z

    move/from16 v19, v0

    if-nez v19, :cond_2

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v21, v0

    const-string v22, "HEAD"

    invoke-virtual/range {v21 .. v22}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    move-object/from16 v21, v0

    invoke-virtual/range {v19 .. v21}, Lorg/eclipse/jgit/revwalk/RevWalk;->isMergedInto(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v19

    if-nez v19, :cond_3

    .line 276
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lorg/eclipse/jgit/api/Git;->wrap(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/api/Git;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/api/Git;->status()Lorg/eclipse/jgit/api/StatusCommand;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/api/StatusCommand;->call()Lorg/eclipse/jgit/api/Status;

    move-result-object v15

    .line 278
    .local v15, status:Lorg/eclipse/jgit/api/Status;
    invoke-virtual {v15}, Lorg/eclipse/jgit/api/Status;->hasUncommittedChanges()Z

    move-result v19

    if-eqz v19, :cond_3

    .line 279
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 280
    .local v11, list:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {v15}, Lorg/eclipse/jgit/api/Status;->getUncommittedChanges()Ljava/util/Set;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v11, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 281
    invoke-static {v11}, Lorg/eclipse/jgit/api/RebaseResult;->uncommittedChanges(Ljava/util/List;)Lorg/eclipse/jgit/api/RebaseResult;

    move-result-object v14

    goto/16 :goto_1

    .line 284
    .end local v11           #list:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    .end local v15           #status:Lorg/eclipse/jgit/api/Status;
    :cond_3
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/RebaseCommand;->initFilesAndRewind()Lorg/eclipse/jgit/api/RebaseResult;

    move-result-object v13

    .line 285
    .local v13, res:Lorg/eclipse/jgit/api/RebaseResult;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->stopAfterInitialization:Z

    move/from16 v19, v0

    if-eqz v19, :cond_4

    .line 286
    sget-object v14, Lorg/eclipse/jgit/api/RebaseResult;->INTERACTIVE_PREPARED_RESULT:Lorg/eclipse/jgit/api/RebaseResult;

    goto/16 :goto_1

    .line 287
    :cond_4
    if-eqz v13, :cond_0

    .line 288
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/RebaseCommand;->autoStashApply()Z

    .line 289
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getDir()Ljava/io/File;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->exists()Z

    move-result v19

    if-eqz v19, :cond_5

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getDir()Ljava/io/File;

    move-result-object v19

    const/16 v20, 0x1

    invoke-static/range {v19 .. v20}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    :cond_5
    move-object v14, v13

    .line 292
    goto/16 :goto_1

    .line 299
    .end local v13           #res:Lorg/eclipse/jgit/api/RebaseResult;
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->operation:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    move-object/from16 v19, v0

    sget-object v20, Lorg/eclipse/jgit/api/RebaseCommand$Operation;->CONTINUE:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_9

    .line 300
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/RebaseCommand;->continueRebase()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/api/RebaseCommand;->newHead:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 301
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    move-object/from16 v20, v0

    const-string v21, "done"

    invoke-virtual/range {v20 .. v21}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x1

    invoke-virtual/range {v19 .. v21}, Lorg/eclipse/jgit/lib/Repository;->readRebaseTodo(Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v7

    .line 303
    .local v7, doneLines:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/RebaseTodoLine;>;"
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v19

    add-int/lit8 v19, v19, -0x1

    move/from16 v0, v19

    invoke-interface {v7, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lorg/eclipse/jgit/lib/RebaseTodoLine;

    .line 304
    .local v16, step:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->newHead:Lorg/eclipse/jgit/revwalk/RevCommit;

    move-object/from16 v19, v0

    if-eqz v19, :cond_7

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/lib/RebaseTodoLine;->getAction()Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    move-result-object v19

    sget-object v20, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->PICK:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-eq v0, v1, :cond_7

    .line 306
    new-instance v12, Lorg/eclipse/jgit/lib/RebaseTodoLine;

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/lib/RebaseTodoLine;->getAction()Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->newHead:Lorg/eclipse/jgit/revwalk/RevCommit;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->fromObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v20

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/lib/RebaseTodoLine;->getShortMessage()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v12, v0, v1, v2}, Lorg/eclipse/jgit/lib/RebaseTodoLine;-><init>(Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;Lorg/eclipse/jgit/lib/AbbreviatedObjectId;Ljava/lang/String;)V

    .line 310
    .local v12, newStep:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    const/16 v19, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v12, v1}, Lorg/eclipse/jgit/api/RebaseCommand;->processStep(Lorg/eclipse/jgit/lib/RebaseTodoLine;Z)Lorg/eclipse/jgit/api/RebaseResult;

    move-result-object v14

    .line 311
    .local v14, result:Lorg/eclipse/jgit/api/RebaseResult;
    if-nez v14, :cond_1

    .line 314
    .end local v12           #newStep:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    .end local v14           #result:Lorg/eclipse/jgit/api/RebaseResult;
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    move-object/from16 v19, v0

    const-string v20, "amend"

    invoke-virtual/range {v19 .. v20}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    .line 315
    .local v5, amendFile:Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v4

    .line 316
    .local v4, amendExists:Z
    if-eqz v4, :cond_8

    .line 317
    invoke-static {v5}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V

    .line 319
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->newHead:Lorg/eclipse/jgit/revwalk/RevCommit;

    move-object/from16 v19, v0

    if-nez v19, :cond_9

    if-nez v4, :cond_9

    .line 325
    sget-object v14, Lorg/eclipse/jgit/api/RebaseResult;->NOTHING_TO_COMMIT_RESULT:Lorg/eclipse/jgit/api/RebaseResult;

    goto/16 :goto_1

    .line 329
    .end local v4           #amendExists:Z
    .end local v5           #amendFile:Ljava/io/File;
    .end local v7           #doneLines:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/RebaseTodoLine;>;"
    .end local v16           #step:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->operation:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    move-object/from16 v19, v0

    sget-object v20, Lorg/eclipse/jgit/api/RebaseCommand$Operation;->SKIP:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_a

    .line 330
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/RebaseCommand;->checkoutCurrentHead()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/api/RebaseCommand;->newHead:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 332
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    move-object/from16 v20, v0

    const-string v21, "git-rebase-todo"

    invoke-virtual/range {v20 .. v21}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x0

    invoke-virtual/range {v19 .. v21}, Lorg/eclipse/jgit/lib/Repository;->readRebaseTodo(Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v17

    .line 334
    .local v17, steps:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/RebaseTodoLine;>;"
    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v19

    if-nez v19, :cond_b

    .line 335
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v20, v0

    const-string v21, "HEAD"

    invoke-virtual/range {v20 .. v21}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v19

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/RebaseCommand;->finishRebase(Lorg/eclipse/jgit/revwalk/RevCommit;Z)Lorg/eclipse/jgit/api/RebaseResult;

    move-result-object v14

    goto/16 :goto_1

    .line 337
    :cond_b
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/RebaseCommand;->isInteractive()Z

    move-result v19

    if-eqz v19, :cond_c

    .line 338
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->interactiveHandler:Lorg/eclipse/jgit/api/RebaseCommand$InteractiveHandler;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/api/RebaseCommand$InteractiveHandler;->prepareSteps(Ljava/util/List;)V

    .line 339
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->rebaseState:Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;

    move-object/from16 v20, v0

    const-string v21, "git-rebase-todo"

    invoke-virtual/range {v20 .. v21}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v17

    move/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/lib/Repository;->writeRebaseTodoFile(Ljava/lang/String;Ljava/util/List;Z)V

    .line 342
    :cond_c
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/RebaseCommand;->checkSteps(Ljava/util/List;)V

    .line 343
    const/4 v9, 0x0

    .local v9, i:I
    :goto_3
    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v9, v0, :cond_d

    .line 344
    move-object/from16 v0, v17

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lorg/eclipse/jgit/lib/RebaseTodoLine;

    .line 345
    .restart local v16       #step:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    const/16 v19, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/RebaseCommand;->popSteps(I)V

    .line 346
    const/16 v19, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/RebaseCommand;->processStep(Lorg/eclipse/jgit/lib/RebaseTodoLine;Z)Lorg/eclipse/jgit/api/RebaseResult;

    move-result-object v14

    .line 347
    .restart local v14       #result:Lorg/eclipse/jgit/api/RebaseResult;
    if-nez v14, :cond_1

    .line 343
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 351
    .end local v14           #result:Lorg/eclipse/jgit/api/RebaseResult;
    .end local v16           #step:Lorg/eclipse/jgit/lib/RebaseTodoLine;
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->newHead:Lorg/eclipse/jgit/revwalk/RevCommit;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/RebaseCommand;->lastStepWasForward:Z

    move/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/RebaseCommand;->finishRebase(Lorg/eclipse/jgit/revwalk/RevCommit;Z)Lorg/eclipse/jgit/api/RebaseResult;
    :try_end_6
    .catch Lorg/eclipse/jgit/api/errors/CheckoutConflictException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    move-result-object v14

    goto/16 :goto_1

    .line 247
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method parseAuthor([B)Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 24
    .parameter "raw"

    .prologue
    .line 1346
    move-object/from16 v0, p1

    array-length v2, v0

    if-nez v2, :cond_0

    .line 1347
    const/4 v2, 0x0

    .line 1386
    :goto_0
    return-object v2

    .line 1349
    :cond_0
    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    .line 1350
    .local v12, keyValueMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v15, 0x0

    .local v15, p:I
    :goto_1
    move-object/from16 v0, p1

    array-length v2, v0

    if-ge v15, v2, :cond_1

    .line 1351
    move-object/from16 v0, p1

    invoke-static {v0, v15}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v8

    .line 1352
    .local v8, end:I
    if-ne v8, v15, :cond_3

    .line 1363
    .end local v8           #end:I
    :cond_1
    const-string v2, "GIT_AUTHOR_NAME"

    invoke-interface {v12, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 1364
    .local v3, name:Ljava/lang/String;
    const-string v2, "GIT_AUTHOR_EMAIL"

    invoke-interface {v12, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 1365
    .local v4, email:Ljava/lang/String;
    const-string v2, "GIT_AUTHOR_DATE"

    invoke-interface {v12, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    .line 1368
    .local v16, time:Ljava/lang/String;
    const/16 v17, 0x0

    .line 1369
    .local v17, timeStart:I
    const-string v2, "@"

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1370
    const/16 v17, 0x1

    .line 1373
    :goto_2
    const/16 v2, 0x20

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v20

    const-wide/16 v22, 0x3e8

    mul-long v5, v20, v22

    .line 1375
    .local v5, when:J
    const/16 v2, 0x20

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v18

    .line 1376
    .local v18, tzOffsetString:Ljava/lang/String;
    const/4 v14, -0x1

    .line 1377
    .local v14, multiplier:I
    const/4 v2, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v20, 0x2b

    move/from16 v0, v20

    if-ne v2, v0, :cond_2

    .line 1378
    const/4 v14, 0x1

    .line 1379
    :cond_2
    const/4 v2, 0x1

    const/16 v20, 0x3

    move-object/from16 v0, v18

    move/from16 v1, v20

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    .line 1380
    .local v10, hours:I
    const/4 v2, 0x3

    const/16 v20, 0x5

    move-object/from16 v0, v18

    move/from16 v1, v20

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v13

    .line 1383
    .local v13, minutes:I
    mul-int/lit8 v2, v10, 0x3c

    add-int/2addr v2, v13

    mul-int v7, v2, v14

    .line 1384
    .local v7, tz:I
    if-eqz v3, :cond_5

    if-eqz v4, :cond_5

    .line 1385
    new-instance v2, Lorg/eclipse/jgit/lib/PersonIdent;

    invoke-direct/range {v2 .. v7}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Ljava/lang/String;Ljava/lang/String;JI)V

    goto/16 :goto_0

    .line 1354
    .end local v3           #name:Ljava/lang/String;
    .end local v4           #email:Ljava/lang/String;
    .end local v5           #when:J
    .end local v7           #tz:I
    .end local v10           #hours:I
    .end local v13           #minutes:I
    .end local v14           #multiplier:I
    .end local v16           #time:Ljava/lang/String;
    .end local v17           #timeStart:I
    .end local v18           #tzOffsetString:Ljava/lang/String;
    .restart local v8       #end:I
    :cond_3
    const/16 v2, 0x3d

    move-object/from16 v0, p1

    invoke-static {v0, v15, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->next([BIC)I

    move-result v9

    .line 1355
    .local v9, equalsIndex:I
    if-eq v9, v8, :cond_1

    .line 1357
    add-int/lit8 v2, v9, -0x1

    move-object/from16 v0, p1

    invoke-static {v0, v15, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object v11

    .line 1358
    .local v11, key:Ljava/lang/String;
    add-int/lit8 v2, v9, 0x1

    add-int/lit8 v20, v8, -0x2

    move-object/from16 v0, p1

    move/from16 v1, v20

    invoke-static {v0, v2, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object v19

    .line 1359
    .local v19, value:Ljava/lang/String;
    move v15, v8

    .line 1360
    move-object/from16 v0, v19

    invoke-interface {v12, v11, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1

    .line 1372
    .end local v8           #end:I
    .end local v9           #equalsIndex:I
    .end local v11           #key:Ljava/lang/String;
    .end local v19           #value:Ljava/lang/String;
    .restart local v3       #name:Ljava/lang/String;
    .restart local v4       #email:Ljava/lang/String;
    .restart local v16       #time:Ljava/lang/String;
    .restart local v17       #timeStart:I
    :cond_4
    const/16 v17, 0x0

    goto/16 :goto_2

    .line 1386
    .restart local v5       #when:J
    .restart local v7       #tz:I
    .restart local v10       #hours:I
    .restart local v13       #minutes:I
    .restart local v14       #multiplier:I
    .restart local v18       #tzOffsetString:Ljava/lang/String;
    :cond_5
    const/4 v2, 0x0

    goto/16 :goto_0
.end method

.method public runInteractively(Lorg/eclipse/jgit/api/RebaseCommand$InteractiveHandler;)Lorg/eclipse/jgit/api/RebaseCommand;
    .locals 1
    .parameter "handler"

    .prologue
    .line 1288
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/api/RebaseCommand;->runInteractively(Lorg/eclipse/jgit/api/RebaseCommand$InteractiveHandler;Z)Lorg/eclipse/jgit/api/RebaseCommand;

    move-result-object v0

    return-object v0
.end method

.method public runInteractively(Lorg/eclipse/jgit/api/RebaseCommand$InteractiveHandler;Z)Lorg/eclipse/jgit/api/RebaseCommand;
    .locals 0
    .parameter "handler"
    .parameter "stopAfterRebaseInteractiveInitialization"

    .prologue
    .line 1307
    iput-boolean p2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->stopAfterInitialization:Z

    .line 1308
    iput-object p1, p0, Lorg/eclipse/jgit/api/RebaseCommand;->interactiveHandler:Lorg/eclipse/jgit/api/RebaseCommand$InteractiveHandler;

    .line 1309
    return-object p0
.end method

.method public setOperation(Lorg/eclipse/jgit/api/RebaseCommand$Operation;)Lorg/eclipse/jgit/api/RebaseCommand;
    .locals 0
    .parameter "operation"

    .prologue
    .line 1261
    iput-object p1, p0, Lorg/eclipse/jgit/api/RebaseCommand;->operation:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    .line 1262
    return-object p0
.end method

.method public setProgressMonitor(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/api/RebaseCommand;
    .locals 0
    .parameter "monitor"

    .prologue
    .line 1271
    iput-object p1, p0, Lorg/eclipse/jgit/api/RebaseCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 1272
    return-object p0
.end method

.method public setStrategy(Lorg/eclipse/jgit/merge/MergeStrategy;)Lorg/eclipse/jgit/api/RebaseCommand;
    .locals 0
    .parameter "strategy"

    .prologue
    .line 1319
    iput-object p1, p0, Lorg/eclipse/jgit/api/RebaseCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    .line 1320
    return-object p0
.end method

.method public setUpstream(Ljava/lang/String;)Lorg/eclipse/jgit/api/RebaseCommand;
    .locals 6
    .parameter "upstream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/RefNotFoundException;
        }
    .end annotation

    .prologue
    .line 1226
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    .line 1227
    .local v1, upstreamId:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v1, :cond_0

    .line 1228
    new-instance v2, Lorg/eclipse/jgit/api/errors/RefNotFoundException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->refNotResolved:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/api/errors/RefNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1233
    .end local v1           #upstreamId:Lorg/eclipse/jgit/lib/ObjectId;
    :catch_0
    move-exception v0

    .line 1234
    .local v0, ioe:Ljava/io/IOException;
    new-instance v2, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 1230
    .end local v0           #ioe:Ljava/io/IOException;
    .restart local v1       #upstreamId:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_0
    :try_start_1
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v3, p0, Lorg/eclipse/jgit/api/RebaseCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v3, p1}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 1231
    iput-object p1, p0, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommitName:Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 1232
    return-object p0
.end method

.method public setUpstream(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/RebaseCommand;
    .locals 6
    .parameter "upstream"

    .prologue
    .line 1207
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 1208
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->name()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommitName:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1214
    return-object p0

    .line 1209
    :catch_0
    move-exception v0

    .line 1210
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->couldNotReadObjectWhileParsingCommit:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->name()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setUpstream(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/api/RebaseCommand;
    .locals 1
    .parameter "upstream"

    .prologue
    .line 1195
    iput-object p1, p0, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 1196
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommitName:Ljava/lang/String;

    .line 1197
    return-object p0
.end method

.method public setUpstreamName(Ljava/lang/String;)Lorg/eclipse/jgit/api/RebaseCommand;
    .locals 2
    .parameter "upstreamName"

    .prologue
    .line 1247
    iget-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    if-nez v0, :cond_0

    .line 1248
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "setUpstreamName must be called after setUpstream."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1251
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jgit/api/RebaseCommand;->upstreamCommitName:Ljava/lang/String;

    .line 1252
    return-object p0
.end method

.method toAuthorScript(Lorg/eclipse/jgit/lib/PersonIdent;)Ljava/lang/String;
    .locals 3
    .parameter "author"

    .prologue
    .line 826
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x64

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 827
    .local v1, sb:Ljava/lang/StringBuilder;
    const-string v2, "GIT_AUTHOR_NAME"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 828
    const-string v2, "=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 829
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 830
    const-string v2, "\'\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 831
    const-string v2, "GIT_AUTHOR_EMAIL"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 832
    const-string v2, "=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 833
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->getEmailAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 834
    const-string v2, "\'\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 837
    const-string v2, "GIT_AUTHOR_DATE"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 838
    const-string v2, "=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 839
    const-string v2, "@"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 840
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/PersonIdent;->toExternalString()Ljava/lang/String;

    move-result-object v0

    .line 841
    .local v0, externalString:Ljava/lang/String;
    const/16 v2, 0x3e

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    add-int/lit8 v2, v2, 0x2

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 844
    const-string v2, "\'\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 845
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public tryFastForward(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 9
    .parameter "newCommit"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 993
    invoke-direct {p0}, Lorg/eclipse/jgit/api/RebaseCommand;->getHead()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 995
    .local v0, head:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    .line 996
    .local v2, headId:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v2, :cond_0

    .line 997
    new-instance v4, Lorg/eclipse/jgit/api/errors/RefNotFoundException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->refNotResolved:Ljava/lang/String;

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-string v8, "HEAD"

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/api/errors/RefNotFoundException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 999
    :cond_0
    iget-object v4, p0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v4, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    .line 1000
    .local v1, headCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    iget-object v4, p0, Lorg/eclipse/jgit/api/RebaseCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v4, p1, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->isMergedInto(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1004
    .end local p1
    :goto_0
    return-object p1

    .line 1003
    .restart local p1
    :cond_1
    invoke-static {v0}, Lorg/eclipse/jgit/api/RebaseCommand;->getHeadName(Lorg/eclipse/jgit/lib/Ref;)Ljava/lang/String;

    move-result-object v3

    .line 1004
    .local v3, headName:Ljava/lang/String;
    invoke-direct {p0, v3, v1, p1}, Lorg/eclipse/jgit/api/RebaseCommand;->tryFastForward(Ljava/lang/String;Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object p1

    goto :goto_0
.end method
