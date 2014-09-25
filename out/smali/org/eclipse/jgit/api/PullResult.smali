.class public Lorg/eclipse/jgit/api/PullResult;
.super Ljava/lang/Object;
.source "PullResult.java"


# instance fields
.field private final fetchResult:Lorg/eclipse/jgit/transport/FetchResult;

.field private final fetchedFrom:Ljava/lang/String;

.field private final mergeResult:Lorg/eclipse/jgit/api/MergeResult;

.field private final rebaseResult:Lorg/eclipse/jgit/api/RebaseResult;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/FetchResult;Ljava/lang/String;Lorg/eclipse/jgit/api/MergeResult;)V
    .locals 1
    .parameter "fetchResult"
    .parameter "fetchedFrom"
    .parameter "mergeResult"

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Lorg/eclipse/jgit/api/PullResult;->fetchResult:Lorg/eclipse/jgit/transport/FetchResult;

    .line 62
    iput-object p2, p0, Lorg/eclipse/jgit/api/PullResult;->fetchedFrom:Ljava/lang/String;

    .line 63
    iput-object p3, p0, Lorg/eclipse/jgit/api/PullResult;->mergeResult:Lorg/eclipse/jgit/api/MergeResult;

    .line 64
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/api/PullResult;->rebaseResult:Lorg/eclipse/jgit/api/RebaseResult;

    .line 65
    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/transport/FetchResult;Ljava/lang/String;Lorg/eclipse/jgit/api/RebaseResult;)V
    .locals 1
    .parameter "fetchResult"
    .parameter "fetchedFrom"
    .parameter "rebaseResult"

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lorg/eclipse/jgit/api/PullResult;->fetchResult:Lorg/eclipse/jgit/transport/FetchResult;

    .line 70
    iput-object p2, p0, Lorg/eclipse/jgit/api/PullResult;->fetchedFrom:Ljava/lang/String;

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/api/PullResult;->mergeResult:Lorg/eclipse/jgit/api/MergeResult;

    .line 72
    iput-object p3, p0, Lorg/eclipse/jgit/api/PullResult;->rebaseResult:Lorg/eclipse/jgit/api/RebaseResult;

    .line 73
    return-void
.end method


# virtual methods
.method public getFetchResult()Lorg/eclipse/jgit/transport/FetchResult;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lorg/eclipse/jgit/api/PullResult;->fetchResult:Lorg/eclipse/jgit/transport/FetchResult;

    return-object v0
.end method

.method public getFetchedFrom()Ljava/lang/String;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lorg/eclipse/jgit/api/PullResult;->fetchedFrom:Ljava/lang/String;

    return-object v0
.end method

.method public getMergeResult()Lorg/eclipse/jgit/api/MergeResult;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lorg/eclipse/jgit/api/PullResult;->mergeResult:Lorg/eclipse/jgit/api/MergeResult;

    return-object v0
.end method

.method public getRebaseResult()Lorg/eclipse/jgit/api/RebaseResult;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lorg/eclipse/jgit/api/PullResult;->rebaseResult:Lorg/eclipse/jgit/api/RebaseResult;

    return-object v0
.end method

.method public isSuccessful()Z
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lorg/eclipse/jgit/api/PullResult;->mergeResult:Lorg/eclipse/jgit/api/MergeResult;

    if-eqz v0, :cond_0

    .line 109
    iget-object v0, p0, Lorg/eclipse/jgit/api/PullResult;->mergeResult:Lorg/eclipse/jgit/api/MergeResult;

    invoke-virtual {v0}, Lorg/eclipse/jgit/api/MergeResult;->getMergeStatus()Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->isSuccessful()Z

    move-result v0

    .line 112
    :goto_0
    return v0

    .line 110
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/api/PullResult;->rebaseResult:Lorg/eclipse/jgit/api/RebaseResult;

    if-eqz v0, :cond_1

    .line 111
    iget-object v0, p0, Lorg/eclipse/jgit/api/PullResult;->rebaseResult:Lorg/eclipse/jgit/api/RebaseResult;

    invoke-virtual {v0}, Lorg/eclipse/jgit/api/RebaseResult;->getStatus()Lorg/eclipse/jgit/api/RebaseResult$Status;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/api/RebaseResult$Status;->isSuccessful()Z

    move-result v0

    goto :goto_0

    .line 112
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 118
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 119
    .local v0, sb:Ljava/lang/StringBuilder;
    iget-object v1, p0, Lorg/eclipse/jgit/api/PullResult;->fetchResult:Lorg/eclipse/jgit/transport/FetchResult;

    if-eqz v1, :cond_0

    .line 120
    iget-object v1, p0, Lorg/eclipse/jgit/api/PullResult;->fetchResult:Lorg/eclipse/jgit/transport/FetchResult;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    :goto_0
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    iget-object v1, p0, Lorg/eclipse/jgit/api/PullResult;->mergeResult:Lorg/eclipse/jgit/api/MergeResult;

    if-eqz v1, :cond_1

    .line 125
    iget-object v1, p0, Lorg/eclipse/jgit/api/PullResult;->mergeResult:Lorg/eclipse/jgit/api/MergeResult;

    invoke-virtual {v1}, Lorg/eclipse/jgit/api/MergeResult;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 122
    :cond_0
    const-string v1, "No fetch result"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 126
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/api/PullResult;->rebaseResult:Lorg/eclipse/jgit/api/RebaseResult;

    if-eqz v1, :cond_2

    .line 127
    iget-object v1, p0, Lorg/eclipse/jgit/api/PullResult;->rebaseResult:Lorg/eclipse/jgit/api/RebaseResult;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 129
    :cond_2
    const-string v1, "No update result"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1
.end method
