.class public Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;
.super Ljava/lang/Object;
.source "DfsRepositoryDescription.java"


# instance fields
.field private final repositoryName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 52
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;-><init>(Ljava/lang/String;)V

    .line 53
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "repositoryName"

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;->repositoryName:Ljava/lang/String;

    .line 63
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .parameter "b"

    .prologue
    const/4 v3, 0x0

    .line 79
    instance-of v2, p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;

    if-eqz v2, :cond_2

    .line 80
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;->getRepositoryName()Ljava/lang/String;

    move-result-object v0

    .local v0, name:Ljava/lang/String;
    move-object v2, p1

    .line 81
    check-cast v2, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;->getRepositoryName()Ljava/lang/String;

    move-result-object v1

    .line 82
    .local v1, otherName:Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 84
    .end local v0           #name:Ljava/lang/String;
    .end local v1           #otherName:Ljava/lang/String;
    :goto_0
    return v2

    .line 82
    .restart local v0       #name:Ljava/lang/String;
    .restart local v1       #otherName:Ljava/lang/String;
    :cond_0
    if-ne p0, p1, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    move v2, v3

    goto :goto_0

    .end local v0           #name:Ljava/lang/String;
    .end local v1           #otherName:Ljava/lang/String;
    :cond_2
    move v2, v3

    .line 84
    goto :goto_0
.end method

.method public getRepositoryName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;->repositoryName:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 72
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;->getRepositoryName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 73
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;->getRepositoryName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 74
    :goto_0
    return v0

    :cond_0
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 90
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DfsRepositoryDescription["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;->getRepositoryName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
