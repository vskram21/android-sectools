.class public Lorg/eclipse/jgit/lib/BranchConfig;
.super Ljava/lang/Object;
.source "BranchConfig.java"


# instance fields
.field private final branchName:Ljava/lang/String;

.field private final config:Lorg/eclipse/jgit/lib/Config;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)V
    .locals 0
    .parameter "config"
    .parameter "branchName"

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput-object p1, p0, Lorg/eclipse/jgit/lib/BranchConfig;->config:Lorg/eclipse/jgit/lib/Config;

    .line 71
    iput-object p2, p0, Lorg/eclipse/jgit/lib/BranchConfig;->branchName:Ljava/lang/String;

    .line 72
    return-void
.end method

.method private findRemoteTrackingBranch(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .parameter "remote"
    .parameter "mergeRef"

    .prologue
    const/4 v5, 0x0

    .line 117
    :try_start_0
    new-instance v4, Lorg/eclipse/jgit/transport/RemoteConfig;

    iget-object v6, p0, Lorg/eclipse/jgit/lib/BranchConfig;->config:Lorg/eclipse/jgit/lib/Config;

    invoke-direct {v4, v6, p1}, Lorg/eclipse/jgit/transport/RemoteConfig;-><init>(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 121
    .local v4, remoteConfig:Lorg/eclipse/jgit/transport/RemoteConfig;
    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/RemoteConfig;->getFetchRefSpecs()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/transport/RefSpec;

    .line 122
    .local v3, refSpec:Lorg/eclipse/jgit/transport/RefSpec;
    invoke-virtual {v3, p2}, Lorg/eclipse/jgit/transport/RefSpec;->matchSource(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 123
    invoke-virtual {v3, p2}, Lorg/eclipse/jgit/transport/RefSpec;->expandFromSource(Ljava/lang/String;)Lorg/eclipse/jgit/transport/RefSpec;

    move-result-object v1

    .line 124
    .local v1, expanded:Lorg/eclipse/jgit/transport/RefSpec;
    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/RefSpec;->getDestination()Ljava/lang/String;

    move-result-object v5

    .line 127
    .end local v1           #expanded:Lorg/eclipse/jgit/transport/RefSpec;
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v3           #refSpec:Lorg/eclipse/jgit/transport/RefSpec;
    .end local v4           #remoteConfig:Lorg/eclipse/jgit/transport/RemoteConfig;
    :cond_1
    :goto_0
    return-object v5

    .line 118
    :catch_0
    move-exception v0

    .line 119
    .local v0, e:Ljava/net/URISyntaxException;
    goto :goto_0
.end method

.method private getMergeBranch()Ljava/lang/String;
    .locals 5

    .prologue
    .line 141
    iget-object v1, p0, Lorg/eclipse/jgit/lib/BranchConfig;->config:Lorg/eclipse/jgit/lib/Config;

    const-string v2, "branch"

    iget-object v3, p0, Lorg/eclipse/jgit/lib/BranchConfig;->branchName:Ljava/lang/String;

    const-string v4, "merge"

    invoke-virtual {v1, v2, v3, v4}, Lorg/eclipse/jgit/lib/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 144
    .local v0, mergeRef:Ljava/lang/String;
    return-object v0
.end method

.method private getRemote()Ljava/lang/String;
    .locals 5

    .prologue
    .line 131
    iget-object v1, p0, Lorg/eclipse/jgit/lib/BranchConfig;->config:Lorg/eclipse/jgit/lib/Config;

    const-string v2, "branch"

    iget-object v3, p0, Lorg/eclipse/jgit/lib/BranchConfig;->branchName:Ljava/lang/String;

    const-string v4, "remote"

    invoke-virtual {v1, v2, v3, v4}, Lorg/eclipse/jgit/lib/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 134
    .local v0, remoteName:Ljava/lang/String;
    if-nez v0, :cond_0

    .line 135
    const-string v0, "origin"

    .line 137
    .end local v0           #remoteName:Ljava/lang/String;
    :cond_0
    return-object v0
.end method


# virtual methods
.method public getRemoteTrackingBranch()Ljava/lang/String;
    .locals 3

    .prologue
    .line 96
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/BranchConfig;->getRemote()Ljava/lang/String;

    move-result-object v1

    .line 97
    .local v1, remote:Ljava/lang/String;
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/BranchConfig;->getMergeBranch()Ljava/lang/String;

    move-result-object v0

    .line 98
    .local v0, mergeRef:Ljava/lang/String;
    if-eqz v1, :cond_0

    if-nez v0, :cond_1

    .line 99
    :cond_0
    const/4 v2, 0x0

    .line 101
    :goto_0
    return-object v2

    :cond_1
    invoke-direct {p0, v1, v0}, Lorg/eclipse/jgit/lib/BranchConfig;->findRemoteTrackingBranch(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public getTrackingBranch()Ljava/lang/String;
    .locals 3

    .prologue
    .line 79
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/BranchConfig;->getRemote()Ljava/lang/String;

    move-result-object v1

    .line 80
    .local v1, remote:Ljava/lang/String;
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/BranchConfig;->getMergeBranch()Ljava/lang/String;

    move-result-object v0

    .line 81
    .local v0, mergeRef:Ljava/lang/String;
    if-eqz v1, :cond_0

    if-nez v0, :cond_2

    .line 82
    :cond_0
    const/4 v0, 0x0

    .line 87
    .end local v0           #mergeRef:Ljava/lang/String;
    :cond_1
    :goto_0
    return-object v0

    .line 84
    .restart local v0       #mergeRef:Ljava/lang/String;
    :cond_2
    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 87
    invoke-direct {p0, v1, v0}, Lorg/eclipse/jgit/lib/BranchConfig;->findRemoteTrackingBranch(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
