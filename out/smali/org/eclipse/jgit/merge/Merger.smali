.class public abstract Lorg/eclipse/jgit/merge/Merger;
.super Ljava/lang/Object;
.source "Merger.java"


# instance fields
.field protected final db:Lorg/eclipse/jgit/lib/Repository;

.field private inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

.field protected final reader:Lorg/eclipse/jgit/lib/ObjectReader;

.field protected sourceCommits:[Lorg/eclipse/jgit/revwalk/RevCommit;

.field protected sourceObjects:[Lorg/eclipse/jgit/revwalk/RevObject;

.field protected sourceTrees:[Lorg/eclipse/jgit/revwalk/RevTree;

.field protected final walk:Lorg/eclipse/jgit/revwalk/RevWalk;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 2
    .parameter "local"

    .prologue
    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    iput-object p1, p0, Lorg/eclipse/jgit/merge/Merger;->db:Lorg/eclipse/jgit/lib/Repository;

    .line 99
    iget-object v0, p0, Lorg/eclipse/jgit/merge/Merger;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/merge/Merger;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    .line 100
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v1, p0, Lorg/eclipse/jgit/merge/Merger;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    iput-object v0, p0, Lorg/eclipse/jgit/merge/Merger;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 101
    return-void
.end method


# virtual methods
.method public getBaseCommit(II)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 3
    .parameter "aIdx"
    .parameter "bIdx"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 213
    iget-object v0, p0, Lorg/eclipse/jgit/merge/Merger;->sourceCommits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    aget-object v0, v0, p1

    if-nez v0, :cond_0

    .line 214
    new-instance v0, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;

    iget-object v1, p0, Lorg/eclipse/jgit/merge/Merger;->sourceObjects:[Lorg/eclipse/jgit/revwalk/RevObject;

    aget-object v1, v1, p1

    const-string v2, "commit"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v0

    .line 216
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/merge/Merger;->sourceCommits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    aget-object v0, v0, p2

    if-nez v0, :cond_1

    .line 217
    new-instance v0, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;

    iget-object v1, p0, Lorg/eclipse/jgit/merge/Merger;->sourceObjects:[Lorg/eclipse/jgit/revwalk/RevObject;

    aget-object v1, v1, p2

    const-string v2, "commit"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v0

    .line 219
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/merge/Merger;->sourceCommits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    aget-object v0, v0, p1

    iget-object v1, p0, Lorg/eclipse/jgit/merge/Merger;->sourceCommits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    aget-object v1, v1, p2

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/merge/Merger;->getBaseCommit(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    return-object v0
.end method

.method protected getBaseCommit(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 8
    .parameter "a"
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 238
    iget-object v2, p0, Lorg/eclipse/jgit/merge/Merger;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->reset()V

    .line 239
    iget-object v2, p0, Lorg/eclipse/jgit/merge/Merger;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    sget-object v3, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->MERGE_BASE:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->setRevFilter(Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V

    .line 240
    iget-object v2, p0, Lorg/eclipse/jgit/merge/Merger;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 241
    iget-object v2, p0, Lorg/eclipse/jgit/merge/Merger;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v2, p2}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 242
    iget-object v2, p0, Lorg/eclipse/jgit/merge/Merger;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 243
    .local v0, base:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v0, :cond_1

    .line 244
    const/4 v0, 0x0

    .line 253
    .end local v0           #base:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_0
    return-object v0

    .line 245
    .restart local v0       #base:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_1
    iget-object v2, p0, Lorg/eclipse/jgit/merge/Merger;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    .line 246
    .local v1, base2:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-eqz v1, :cond_0

    .line 247
    new-instance v2, Lorg/eclipse/jgit/errors/NoMergeBaseException;

    sget-object v3, Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;->MULTIPLE_MERGE_BASES_NOT_SUPPORTED:Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->multipleMergeBasesFor:Ljava/lang/String;

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-virtual {p2}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x3

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/eclipse/jgit/errors/NoMergeBaseException;-><init>(Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;Ljava/lang/String;)V

    throw v2
.end method

.method public abstract getBaseCommitId()Lorg/eclipse/jgit/lib/ObjectId;
.end method

.method public getObjectInserter()Lorg/eclipse/jgit/lib/ObjectInserter;
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lorg/eclipse/jgit/merge/Merger;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    if-nez v0, :cond_0

    .line 117
    invoke-virtual {p0}, Lorg/eclipse/jgit/merge/Merger;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->newObjectInserter()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/merge/Merger;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    .line 118
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/merge/Merger;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    return-object v0
.end method

.method public getRepository()Lorg/eclipse/jgit/lib/Repository;
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lorg/eclipse/jgit/merge/Merger;->db:Lorg/eclipse/jgit/lib/Repository;

    return-object v0
.end method

.method public abstract getResultTreeId()Lorg/eclipse/jgit/lib/ObjectId;
.end method

.method public varargs merge([Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 6
    .parameter "tips"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 158
    array-length v3, p1

    new-array v3, v3, [Lorg/eclipse/jgit/revwalk/RevObject;

    iput-object v3, p0, Lorg/eclipse/jgit/merge/Merger;->sourceObjects:[Lorg/eclipse/jgit/revwalk/RevObject;

    .line 159
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, p1

    if-ge v1, v3, :cond_0

    .line 160
    iget-object v3, p0, Lorg/eclipse/jgit/merge/Merger;->sourceObjects:[Lorg/eclipse/jgit/revwalk/RevObject;

    iget-object v4, p0, Lorg/eclipse/jgit/merge/Merger;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    aget-object v5, p1, v1

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v4

    aput-object v4, v3, v1

    .line 159
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 162
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/merge/Merger;->sourceObjects:[Lorg/eclipse/jgit/revwalk/RevObject;

    array-length v3, v3

    new-array v3, v3, [Lorg/eclipse/jgit/revwalk/RevCommit;

    iput-object v3, p0, Lorg/eclipse/jgit/merge/Merger;->sourceCommits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 163
    const/4 v1, 0x0

    :goto_1
    iget-object v3, p0, Lorg/eclipse/jgit/merge/Merger;->sourceObjects:[Lorg/eclipse/jgit/revwalk/RevObject;

    array-length v3, v3

    if-ge v1, v3, :cond_1

    .line 165
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/merge/Merger;->sourceCommits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    iget-object v4, p0, Lorg/eclipse/jgit/merge/Merger;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v5, p0, Lorg/eclipse/jgit/merge/Merger;->sourceObjects:[Lorg/eclipse/jgit/revwalk/RevObject;

    aget-object v5, v5, v1

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v4

    aput-object v4, v3, v1
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/IncorrectObjectTypeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 163
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 166
    :catch_0
    move-exception v0

    .line 167
    .local v0, err:Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;
    iget-object v3, p0, Lorg/eclipse/jgit/merge/Merger;->sourceCommits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    const/4 v4, 0x0

    aput-object v4, v3, v1

    goto :goto_2

    .line 171
    .end local v0           #err:Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/merge/Merger;->sourceObjects:[Lorg/eclipse/jgit/revwalk/RevObject;

    array-length v3, v3

    new-array v3, v3, [Lorg/eclipse/jgit/revwalk/RevTree;

    iput-object v3, p0, Lorg/eclipse/jgit/merge/Merger;->sourceTrees:[Lorg/eclipse/jgit/revwalk/RevTree;

    .line 172
    const/4 v1, 0x0

    :goto_3
    iget-object v3, p0, Lorg/eclipse/jgit/merge/Merger;->sourceObjects:[Lorg/eclipse/jgit/revwalk/RevObject;

    array-length v3, v3

    if-ge v1, v3, :cond_2

    .line 173
    iget-object v3, p0, Lorg/eclipse/jgit/merge/Merger;->sourceTrees:[Lorg/eclipse/jgit/revwalk/RevTree;

    iget-object v4, p0, Lorg/eclipse/jgit/merge/Merger;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v5, p0, Lorg/eclipse/jgit/merge/Merger;->sourceObjects:[Lorg/eclipse/jgit/revwalk/RevObject;

    aget-object v5, v5, v1

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v4

    aput-object v4, v3, v1

    .line 172
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 176
    :cond_2
    :try_start_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/merge/Merger;->mergeImpl()Z

    move-result v2

    .line 177
    .local v2, ok:Z
    if-eqz v2, :cond_3

    iget-object v3, p0, Lorg/eclipse/jgit/merge/Merger;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    if-eqz v3, :cond_3

    .line 178
    iget-object v3, p0, Lorg/eclipse/jgit/merge/Merger;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/ObjectInserter;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 181
    :cond_3
    iget-object v3, p0, Lorg/eclipse/jgit/merge/Merger;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    if-eqz v3, :cond_4

    .line 182
    iget-object v3, p0, Lorg/eclipse/jgit/merge/Merger;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    .line 183
    :cond_4
    iget-object v3, p0, Lorg/eclipse/jgit/merge/Merger;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    return v2

    .line 181
    .end local v2           #ok:Z
    :catchall_0
    move-exception v3

    iget-object v4, p0, Lorg/eclipse/jgit/merge/Merger;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    if-eqz v4, :cond_5

    .line 182
    iget-object v4, p0, Lorg/eclipse/jgit/merge/Merger;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    .line 183
    :cond_5
    iget-object v4, p0, Lorg/eclipse/jgit/merge/Merger;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    throw v3
.end method

.method protected abstract mergeImpl()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected openTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .locals 3
    .parameter "treeId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 269
    new-instance v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    const/4 v1, 0x0

    iget-object v2, p0, Lorg/eclipse/jgit/merge/Merger;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-direct {v0, v1, v2, p1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;-><init>([BLorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    return-object v0
.end method

.method public setObjectInserter(Lorg/eclipse/jgit/lib/ObjectInserter;)V
    .locals 1
    .parameter "oi"

    .prologue
    .line 133
    iget-object v0, p0, Lorg/eclipse/jgit/merge/Merger;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    if-eqz v0, :cond_0

    .line 134
    iget-object v0, p0, Lorg/eclipse/jgit/merge/Merger;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    .line 135
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jgit/merge/Merger;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    .line 136
    return-void
.end method
