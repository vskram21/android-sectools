.class final Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;
.super Lorg/eclipse/jgit/lib/RefUpdate;
.source "DfsRefUpdate.java"


# instance fields
.field private dstRef:Lorg/eclipse/jgit/lib/Ref;

.field private final refdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;

.field private rw:Lorg/eclipse/jgit/revwalk/RevWalk;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;Lorg/eclipse/jgit/lib/Ref;)V
    .locals 0
    .parameter "refdb"
    .parameter "ref"

    .prologue
    .line 65
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/lib/RefUpdate;-><init>(Lorg/eclipse/jgit/lib/Ref;)V

    .line 66
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->refdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;

    .line 67
    return-void
.end method


# virtual methods
.method protected doDelete(Lorg/eclipse/jgit/lib/RefUpdate$Result;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 2
    .parameter "desiredResult"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 134
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->getRefDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->dstRef:Lorg/eclipse/jgit/lib/Ref;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->compareAndRemove(Lorg/eclipse/jgit/lib/Ref;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 135
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->getRefDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->dstRef:Lorg/eclipse/jgit/lib/Ref;

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->removed(Ljava/lang/String;)V

    .line 138
    .end local p1
    :goto_0
    return-object p1

    .restart local p1
    :cond_0
    sget-object p1, Lorg/eclipse/jgit/lib/RefUpdate$Result;->LOCK_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    goto :goto_0
.end method

.method protected doLink(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 5
    .parameter "target"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    new-instance v0, Lorg/eclipse/jgit/lib/SymbolicRef;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->dstRef:Lorg/eclipse/jgit/lib/Ref;

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;

    sget-object v3, Lorg/eclipse/jgit/lib/Ref$Storage;->NEW:Lorg/eclipse/jgit/lib/Ref$Storage;

    const/4 v4, 0x0

    invoke-direct {v2, v3, p1, v4}, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/SymbolicRef;-><init>(Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;)V

    .line 149
    .local v0, newRef:Lorg/eclipse/jgit/lib/SymbolicRef;
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->getRefDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->dstRef:Lorg/eclipse/jgit/lib/Ref;

    invoke-virtual {v1, v2, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->compareAndPut(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 150
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->getRefDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->stored(Lorg/eclipse/jgit/lib/Ref;)V

    .line 151
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->dstRef:Lorg/eclipse/jgit/lib/Ref;

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getStorage()Lorg/eclipse/jgit/lib/Ref$Storage;

    move-result-object v1

    sget-object v2, Lorg/eclipse/jgit/lib/Ref$Storage;->NEW:Lorg/eclipse/jgit/lib/Ref$Storage;

    if-ne v1, v2, :cond_0

    .line 152
    sget-object v1, Lorg/eclipse/jgit/lib/RefUpdate$Result;->NEW:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 155
    :goto_0
    return-object v1

    .line 153
    :cond_0
    sget-object v1, Lorg/eclipse/jgit/lib/RefUpdate$Result;->FORCED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    goto :goto_0

    .line 155
    :cond_1
    sget-object v1, Lorg/eclipse/jgit/lib/RefUpdate$Result;->LOCK_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    goto :goto_0
.end method

.method protected doUpdate(Lorg/eclipse/jgit/lib/RefUpdate$Result;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 6
    .parameter "desiredResult"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->rw:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->getNewObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v1

    .line 112
    .local v1, obj:Lorg/eclipse/jgit/revwalk/RevObject;
    instance-of v2, v1, Lorg/eclipse/jgit/revwalk/RevTag;

    if-eqz v2, :cond_0

    .line 113
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledTag;

    sget-object v2, Lorg/eclipse/jgit/lib/Ref$Storage;->PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->dstRef:Lorg/eclipse/jgit/lib/Ref;

    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->getNewObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->rw:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v5, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->peel(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v5

    invoke-virtual {v5}, Lorg/eclipse/jgit/revwalk/RevObject;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-direct {v0, v2, v3, v4, v5}, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledTag;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 125
    .local v0, newRef:Lorg/eclipse/jgit/lib/ObjectIdRef;
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->getRefDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;

    move-result-object v2

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->dstRef:Lorg/eclipse/jgit/lib/Ref;

    invoke-virtual {v2, v3, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->compareAndPut(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 126
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->getRefDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;

    move-result-object v2

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->stored(Lorg/eclipse/jgit/lib/Ref;)V

    .line 129
    .end local p1
    :goto_1
    return-object p1

    .line 119
    .end local v0           #newRef:Lorg/eclipse/jgit/lib/ObjectIdRef;
    .restart local p1
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledNonTag;

    sget-object v2, Lorg/eclipse/jgit/lib/Ref$Storage;->PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->dstRef:Lorg/eclipse/jgit/lib/Ref;

    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->getNewObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-direct {v0, v2, v3, v4}, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledNonTag;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .restart local v0       #newRef:Lorg/eclipse/jgit/lib/ObjectIdRef;
    goto :goto_0

    .line 129
    :cond_1
    sget-object p1, Lorg/eclipse/jgit/lib/RefUpdate$Result;->LOCK_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    goto :goto_1
.end method

.method protected getRefDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->refdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;

    return-object v0
.end method

.method protected bridge synthetic getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;
    .locals 1

    .prologue
    .line 57
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->getRefDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;

    move-result-object v0

    return-object v0
.end method

.method protected getRepository()Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->refdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->getRepository()Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic getRepository()Lorg/eclipse/jgit/lib/Repository;
    .locals 1

    .prologue
    .line 57
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->getRepository()Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

    move-result-object v0

    return-object v0
.end method

.method protected tryLock(Z)Z
    .locals 1
    .parameter "deref"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->getRef()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->dstRef:Lorg/eclipse/jgit/lib/Ref;

    .line 82
    if-eqz p1, :cond_0

    .line 83
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->dstRef:Lorg/eclipse/jgit/lib/Ref;

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getLeaf()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->dstRef:Lorg/eclipse/jgit/lib/Ref;

    .line 85
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->dstRef:Lorg/eclipse/jgit/lib/Ref;

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 86
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->setOldObjectId(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 90
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 88
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->dstRef:Lorg/eclipse/jgit/lib/Ref;

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->setOldObjectId(Lorg/eclipse/jgit/lib/ObjectId;)V

    goto :goto_0
.end method

.method protected unlock()V
    .locals 0

    .prologue
    .line 96
    return-void
.end method

.method public update(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 2
    .parameter "walk"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 101
    :try_start_0
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->rw:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 102
    invoke-super {p0, p1}, Lorg/eclipse/jgit/lib/RefUpdate;->update(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 104
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->rw:Lorg/eclipse/jgit/revwalk/RevWalk;

    return-object v0

    :catchall_0
    move-exception v0

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->rw:Lorg/eclipse/jgit/revwalk/RevWalk;

    throw v0
.end method
