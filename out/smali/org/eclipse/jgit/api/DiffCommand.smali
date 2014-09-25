.class public Lorg/eclipse/jgit/api/DiffCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "DiffCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Ljava/util/List",
        "<",
        "Lorg/eclipse/jgit/diff/DiffEntry;",
        ">;>;"
    }
.end annotation


# instance fields
.field private cached:Z

.field private contextLines:I

.field private destinationPrefix:Ljava/lang/String;

.field private monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

.field private newTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

.field private oldTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

.field private out:Ljava/io/OutputStream;

.field private pathFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

.field private showNameAndStatusOnly:Z

.field private sourcePrefix:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 101
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 83
    sget-object v0, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->ALL:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    iput-object v0, p0, Lorg/eclipse/jgit/api/DiffCommand;->pathFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .line 89
    const/4 v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/api/DiffCommand;->contextLines:I

    .line 95
    sget-object v0, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    iput-object v0, p0, Lorg/eclipse/jgit/api/DiffCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 102
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
    .line 76
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/DiffCommand;->call()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 114
    iget-object v6, p0, Lorg/eclipse/jgit/api/DiffCommand;->out:Ljava/io/OutputStream;

    if-eqz v6, :cond_0

    iget-boolean v6, p0, Lorg/eclipse/jgit/api/DiffCommand;->showNameAndStatusOnly:Z

    if-nez v6, :cond_0

    .line 115
    new-instance v0, Lorg/eclipse/jgit/diff/DiffFormatter;

    new-instance v6, Ljava/io/BufferedOutputStream;

    iget-object v7, p0, Lorg/eclipse/jgit/api/DiffCommand;->out:Ljava/io/OutputStream;

    invoke-direct {v6, v7}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v0, v6}, Lorg/eclipse/jgit/diff/DiffFormatter;-><init>(Ljava/io/OutputStream;)V

    .line 118
    .local v0, diffFmt:Lorg/eclipse/jgit/diff/DiffFormatter;
    :goto_0
    iget-object v6, p0, Lorg/eclipse/jgit/api/DiffCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/diff/DiffFormatter;->setRepository(Lorg/eclipse/jgit/lib/Repository;)V

    .line 119
    iget-object v6, p0, Lorg/eclipse/jgit/api/DiffCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/diff/DiffFormatter;->setProgressMonitor(Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 121
    :try_start_0
    iget-boolean v6, p0, Lorg/eclipse/jgit/api/DiffCommand;->cached:Z

    if-eqz v6, :cond_4

    .line 122
    iget-object v6, p0, Lorg/eclipse/jgit/api/DiffCommand;->oldTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-nez v6, :cond_2

    .line 123
    iget-object v6, p0, Lorg/eclipse/jgit/api/DiffCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v7, "HEAD^{tree}"

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    .line 124
    .local v2, head:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v2, :cond_1

    .line 125
    new-instance v6, Lorg/eclipse/jgit/api/errors/NoHeadException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->cannotReadTree:Ljava/lang/String;

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/api/errors/NoHeadException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    .end local v2           #head:Lorg/eclipse/jgit/lib/ObjectId;
    :catch_0
    move-exception v1

    .line 160
    .local v1, e:Ljava/io/IOException;
    :try_start_1
    new-instance v6, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v1}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 162
    .end local v1           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v6

    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/DiffFormatter;->release()V

    throw v6

    .line 117
    .end local v0           #diffFmt:Lorg/eclipse/jgit/diff/DiffFormatter;
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/diff/DiffFormatter;

    sget-object v6, Lorg/eclipse/jgit/util/io/NullOutputStream;->INSTANCE:Lorg/eclipse/jgit/util/io/NullOutputStream;

    invoke-direct {v0, v6}, Lorg/eclipse/jgit/diff/DiffFormatter;-><init>(Ljava/io/OutputStream;)V

    .restart local v0       #diffFmt:Lorg/eclipse/jgit/diff/DiffFormatter;
    goto :goto_0

    .line 126
    .restart local v2       #head:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_1
    :try_start_2
    new-instance v3, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-direct {v3}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;-><init>()V

    .line 127
    .local v3, p:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    iget-object v6, p0, Lorg/eclipse/jgit/api/DiffCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v4

    .line 129
    .local v4, reader:Lorg/eclipse/jgit/lib/ObjectReader;
    :try_start_3
    invoke-virtual {v3, v4, v2}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->reset(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 131
    :try_start_4
    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    .line 133
    iput-object v3, p0, Lorg/eclipse/jgit/api/DiffCommand;->oldTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 135
    .end local v2           #head:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v3           #p:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    .end local v4           #reader:Lorg/eclipse/jgit/lib/ObjectReader;
    :cond_2
    new-instance v6, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    iget-object v7, p0, Lorg/eclipse/jgit/api/DiffCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/Repository;->readDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/dircache/DirCacheIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCache;)V

    iput-object v6, p0, Lorg/eclipse/jgit/api/DiffCommand;->newTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 143
    :cond_3
    :goto_1
    iget-object v6, p0, Lorg/eclipse/jgit/api/DiffCommand;->pathFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/diff/DiffFormatter;->setPathFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 145
    iget-object v6, p0, Lorg/eclipse/jgit/api/DiffCommand;->oldTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    iget-object v7, p0, Lorg/eclipse/jgit/api/DiffCommand;->newTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    invoke-virtual {v0, v6, v7}, Lorg/eclipse/jgit/diff/DiffFormatter;->scan(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Ljava/util/List;

    move-result-object v5

    .line 146
    .local v5, result:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    iget-boolean v6, p0, Lorg/eclipse/jgit/api/DiffCommand;->showNameAndStatusOnly:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    if-eqz v6, :cond_6

    .line 162
    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/DiffFormatter;->release()V

    :goto_2
    return-object v5

    .line 131
    .end local v5           #result:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    .restart local v2       #head:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v3       #p:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    .restart local v4       #reader:Lorg/eclipse/jgit/lib/ObjectReader;
    :catchall_1
    move-exception v6

    :try_start_5
    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    throw v6

    .line 137
    .end local v2           #head:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v3           #p:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    .end local v4           #reader:Lorg/eclipse/jgit/lib/ObjectReader;
    :cond_4
    iget-object v6, p0, Lorg/eclipse/jgit/api/DiffCommand;->oldTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-nez v6, :cond_5

    .line 138
    new-instance v6, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    iget-object v7, p0, Lorg/eclipse/jgit/api/DiffCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/Repository;->readDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/dircache/DirCacheIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCache;)V

    iput-object v6, p0, Lorg/eclipse/jgit/api/DiffCommand;->oldTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 139
    :cond_5
    iget-object v6, p0, Lorg/eclipse/jgit/api/DiffCommand;->newTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-nez v6, :cond_3

    .line 140
    new-instance v6, Lorg/eclipse/jgit/treewalk/FileTreeIterator;

    iget-object v7, p0, Lorg/eclipse/jgit/api/DiffCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v6, p0, Lorg/eclipse/jgit/api/DiffCommand;->newTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    goto :goto_1

    .line 149
    .restart local v5       #result:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    :cond_6
    iget v6, p0, Lorg/eclipse/jgit/api/DiffCommand;->contextLines:I

    if-ltz v6, :cond_7

    .line 150
    iget v6, p0, Lorg/eclipse/jgit/api/DiffCommand;->contextLines:I

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/diff/DiffFormatter;->setContext(I)V

    .line 151
    :cond_7
    iget-object v6, p0, Lorg/eclipse/jgit/api/DiffCommand;->destinationPrefix:Ljava/lang/String;

    if-eqz v6, :cond_8

    .line 152
    iget-object v6, p0, Lorg/eclipse/jgit/api/DiffCommand;->destinationPrefix:Ljava/lang/String;

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/diff/DiffFormatter;->setNewPrefix(Ljava/lang/String;)V

    .line 153
    :cond_8
    iget-object v6, p0, Lorg/eclipse/jgit/api/DiffCommand;->sourcePrefix:Ljava/lang/String;

    if-eqz v6, :cond_9

    .line 154
    iget-object v6, p0, Lorg/eclipse/jgit/api/DiffCommand;->sourcePrefix:Ljava/lang/String;

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/diff/DiffFormatter;->setOldPrefix(Ljava/lang/String;)V

    .line 155
    :cond_9
    invoke-virtual {v0, v5}, Lorg/eclipse/jgit/diff/DiffFormatter;->format(Ljava/util/List;)V

    .line 156
    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/DiffFormatter;->flush()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    .line 162
    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/DiffFormatter;->release()V

    goto :goto_2
.end method

.method public setCached(Z)Lorg/eclipse/jgit/api/DiffCommand;
    .locals 0
    .parameter "cached"

    .prologue
    .line 173
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/DiffCommand;->cached:Z

    .line 174
    return-object p0
.end method

.method public setContextLines(I)Lorg/eclipse/jgit/api/DiffCommand;
    .locals 0
    .parameter "contextLines"

    .prologue
    .line 235
    iput p1, p0, Lorg/eclipse/jgit/api/DiffCommand;->contextLines:I

    .line 236
    return-object p0
.end method

.method public setDestinationPrefix(Ljava/lang/String;)Lorg/eclipse/jgit/api/DiffCommand;
    .locals 0
    .parameter "destinationPrefix"

    .prologue
    .line 259
    iput-object p1, p0, Lorg/eclipse/jgit/api/DiffCommand;->destinationPrefix:Ljava/lang/String;

    .line 260
    return-object p0
.end method

.method public setNewTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Lorg/eclipse/jgit/api/DiffCommand;
    .locals 0
    .parameter "newTree"

    .prologue
    .line 203
    iput-object p1, p0, Lorg/eclipse/jgit/api/DiffCommand;->newTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 204
    return-object p0
.end method

.method public setOldTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Lorg/eclipse/jgit/api/DiffCommand;
    .locals 0
    .parameter "oldTree"

    .prologue
    .line 193
    iput-object p1, p0, Lorg/eclipse/jgit/api/DiffCommand;->oldTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 194
    return-object p0
.end method

.method public setOutputStream(Ljava/io/OutputStream;)Lorg/eclipse/jgit/api/DiffCommand;
    .locals 0
    .parameter "out"

    .prologue
    .line 223
    iput-object p1, p0, Lorg/eclipse/jgit/api/DiffCommand;->out:Ljava/io/OutputStream;

    .line 224
    return-object p0
.end method

.method public setPathFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)Lorg/eclipse/jgit/api/DiffCommand;
    .locals 0
    .parameter "pathFilter"

    .prologue
    .line 183
    iput-object p1, p0, Lorg/eclipse/jgit/api/DiffCommand;->pathFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .line 184
    return-object p0
.end method

.method public setProgressMonitor(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/api/DiffCommand;
    .locals 0
    .parameter "monitor"

    .prologue
    .line 274
    iput-object p1, p0, Lorg/eclipse/jgit/api/DiffCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 275
    return-object p0
.end method

.method public setShowNameAndStatusOnly(Z)Lorg/eclipse/jgit/api/DiffCommand;
    .locals 0
    .parameter "showNameAndStatusOnly"

    .prologue
    .line 213
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/DiffCommand;->showNameAndStatusOnly:Z

    .line 214
    return-object p0
.end method

.method public setSourcePrefix(Ljava/lang/String;)Lorg/eclipse/jgit/api/DiffCommand;
    .locals 0
    .parameter "sourcePrefix"

    .prologue
    .line 247
    iput-object p1, p0, Lorg/eclipse/jgit/api/DiffCommand;->sourcePrefix:Ljava/lang/String;

    .line 248
    return-object p0
.end method
