.class public Lorg/eclipse/jgit/lib/BranchTrackingStatus;
.super Ljava/lang/Object;
.source "BranchTrackingStatus.java"


# instance fields
.field private final aheadCount:I

.field private final behindCount:I

.field private final remoteTrackingBranch:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .parameter "remoteTrackingBranch"
    .parameter "aheadCount"
    .parameter "behindCount"

    .prologue
    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    iput-object p1, p0, Lorg/eclipse/jgit/lib/BranchTrackingStatus;->remoteTrackingBranch:Ljava/lang/String;

    .line 117
    iput p2, p0, Lorg/eclipse/jgit/lib/BranchTrackingStatus;->aheadCount:I

    .line 118
    iput p3, p0, Lorg/eclipse/jgit/lib/BranchTrackingStatus;->behindCount:I

    .line 119
    return-void
.end method

.method public static of(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Lorg/eclipse/jgit/lib/BranchTrackingStatus;
    .locals 14
    .parameter "repository"
    .parameter "branchName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    invoke-static {p1}, Lorg/eclipse/jgit/lib/Repository;->shortenRefName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 74
    .local v7, shortBranchName:Ljava/lang/String;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "refs/heads/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 75
    .local v3, fullBranchName:Ljava/lang/String;
    new-instance v2, Lorg/eclipse/jgit/lib/BranchConfig;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v12

    invoke-direct {v2, v12, v7}, Lorg/eclipse/jgit/lib/BranchConfig;-><init>(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)V

    .line 78
    .local v2, branchConfig:Lorg/eclipse/jgit/lib/BranchConfig;
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/BranchConfig;->getTrackingBranch()Ljava/lang/String;

    move-result-object v9

    .line 79
    .local v9, trackingBranch:Ljava/lang/String;
    if-nez v9, :cond_0

    .line 80
    const/4 v12, 0x0

    .line 105
    :goto_0
    return-object v12

    .line 82
    :cond_0
    invoke-virtual {p0, v9}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v8

    .line 83
    .local v8, tracking:Lorg/eclipse/jgit/lib/Ref;
    if-nez v8, :cond_1

    .line 84
    const/4 v12, 0x0

    goto :goto_0

    .line 86
    :cond_1
    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v4

    .line 87
    .local v4, local:Lorg/eclipse/jgit/lib/Ref;
    if-nez v4, :cond_2

    .line 88
    const/4 v12, 0x0

    goto :goto_0

    .line 90
    :cond_2
    new-instance v11, Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-direct {v11, p0}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 92
    .local v11, walk:Lorg/eclipse/jgit/revwalk/RevWalk;
    invoke-interface {v4}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v12

    invoke-virtual {v11, v12}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v5

    .line 93
    .local v5, localCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-interface {v8}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v12

    invoke-virtual {v11, v12}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v10

    .line 95
    .local v10, trackingCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    sget-object v12, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->MERGE_BASE:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    invoke-virtual {v11, v12}, Lorg/eclipse/jgit/revwalk/RevWalk;->setRevFilter(Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V

    .line 96
    invoke-virtual {v11, v5}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 97
    invoke-virtual {v11, v10}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 98
    invoke-virtual {v11}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v6

    .line 100
    .local v6, mergeBase:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v11}, Lorg/eclipse/jgit/revwalk/RevWalk;->reset()V

    .line 101
    sget-object v12, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->ALL:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    invoke-virtual {v11, v12}, Lorg/eclipse/jgit/revwalk/RevWalk;->setRevFilter(Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V

    .line 102
    invoke-static {v11, v5, v6}, Lorg/eclipse/jgit/revwalk/RevWalkUtils;->count(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)I

    move-result v0

    .line 103
    .local v0, aheadCount:I
    invoke-static {v11, v10, v6}, Lorg/eclipse/jgit/revwalk/RevWalkUtils;->count(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)I

    move-result v1

    .line 105
    .local v1, behindCount:I
    new-instance v12, Lorg/eclipse/jgit/lib/BranchTrackingStatus;

    invoke-direct {v12, v9, v0, v1}, Lorg/eclipse/jgit/lib/BranchTrackingStatus;-><init>(Ljava/lang/String;II)V

    goto :goto_0
.end method


# virtual methods
.method public getAheadCount()I
    .locals 1

    .prologue
    .line 133
    iget v0, p0, Lorg/eclipse/jgit/lib/BranchTrackingStatus;->aheadCount:I

    return v0
.end method

.method public getBehindCount()I
    .locals 1

    .prologue
    .line 141
    iget v0, p0, Lorg/eclipse/jgit/lib/BranchTrackingStatus;->behindCount:I

    return v0
.end method

.method public getRemoteTrackingBranch()Ljava/lang/String;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BranchTrackingStatus;->remoteTrackingBranch:Ljava/lang/String;

    return-object v0
.end method
