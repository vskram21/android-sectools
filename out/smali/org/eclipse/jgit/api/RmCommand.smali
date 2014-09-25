.class public Lorg/eclipse/jgit/api/RmCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "RmCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Lorg/eclipse/jgit/dircache/DirCache;",
        ">;"
    }
.end annotation


# instance fields
.field private cached:Z

.field private filepatterns:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 101
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 94
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/api/RmCommand;->cached:Z

    .line 102
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/api/RmCommand;->filepatterns:Ljava/util/Collection;

    .line 103
    return-void
.end method

.method private delete(Ljava/io/File;)V
    .locals 1
    .parameter "p"

    .prologue
    .line 182
    :goto_0
    if-eqz p1, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/api/RmCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 183
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p1

    goto :goto_0

    .line 184
    :cond_0
    return-void
.end method


# virtual methods
.method public addFilepattern(Ljava/lang/String;)Lorg/eclipse/jgit/api/RmCommand;
    .locals 1
    .parameter "filepattern"

    .prologue
    .line 112
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/RmCommand;->checkCallable()V

    .line 113
    iget-object v0, p0, Lorg/eclipse/jgit/api/RmCommand;->filepatterns:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 114
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 89
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/RmCommand;->call()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/dircache/DirCache;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/NoFilepatternException;
        }
    .end annotation

    .prologue
    .line 142
    iget-object v6, p0, Lorg/eclipse/jgit/api/RmCommand;->filepatterns:Ljava/util/Collection;

    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 143
    new-instance v6, Lorg/eclipse/jgit/api/errors/NoFilepatternException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->atLeastOnePatternIsRequired:Ljava/lang/String;

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/api/errors/NoFilepatternException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 144
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/RmCommand;->checkCallable()V

    .line 145
    const/4 v1, 0x0

    .line 148
    .local v1, dc:Lorg/eclipse/jgit/dircache/DirCache;
    :try_start_0
    iget-object v6, p0, Lorg/eclipse/jgit/api/RmCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v1

    .line 149
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCache;->builder()Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    move-result-object v0

    .line 150
    .local v0, builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    new-instance v5, Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v6, p0, Lorg/eclipse/jgit/api/RmCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v5, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 151
    .local v5, tw:Lorg/eclipse/jgit/treewalk/TreeWalk;
    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->reset()V

    .line 152
    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setRecursive(Z)V

    .line 153
    iget-object v6, p0, Lorg/eclipse/jgit/api/RmCommand;->filepatterns:Ljava/util/Collection;

    invoke-static {v6}, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup;->createFromStrings(Ljava/util/Collection;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 154
    new-instance v6, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;

    invoke-direct {v6, v0}, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCacheBuilder;)V

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 156
    :cond_1
    :goto_0
    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 157
    iget-boolean v6, p0, Lorg/eclipse/jgit/api/RmCommand;->cached:Z

    if-nez v6, :cond_1

    .line 158
    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getFileMode(I)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v3

    .line 159
    .local v3, mode:Lorg/eclipse/jgit/lib/FileMode;
    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/FileMode;->getObjectType()I

    move-result v6

    const/4 v7, 0x3

    if-ne v6, v7, :cond_1

    .line 160
    new-instance v4, Ljava/io/File;

    iget-object v6, p0, Lorg/eclipse/jgit/api/RmCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v6, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 164
    .local v4, path:Ljava/io/File;
    invoke-direct {p0, v4}, Lorg/eclipse/jgit/api/RmCommand;->delete(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 170
    .end local v0           #builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    .end local v3           #mode:Lorg/eclipse/jgit/lib/FileMode;
    .end local v4           #path:Ljava/io/File;
    .end local v5           #tw:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :catch_0
    move-exception v2

    .line 171
    .local v2, e:Ljava/io/IOException;
    :try_start_1
    new-instance v6, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->exceptionCaughtDuringExecutionOfRmCommand:Ljava/lang/String;

    invoke-direct {v6, v7, v2}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 174
    .end local v2           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v6

    if-eqz v1, :cond_2

    .line 175
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    :cond_2
    throw v6

    .line 168
    .restart local v0       #builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    .restart local v5       #tw:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :cond_3
    :try_start_2
    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->commit()Z

    .line 169
    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Lorg/eclipse/jgit/api/RmCommand;->setCallable(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 174
    if-eqz v1, :cond_4

    .line 175
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    .line 178
    :cond_4
    return-object v1
.end method

.method public setCached(Z)Lorg/eclipse/jgit/api/RmCommand;
    .locals 0
    .parameter "cached"

    .prologue
    .line 127
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/RmCommand;->checkCallable()V

    .line 128
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/RmCommand;->cached:Z

    .line 129
    return-object p0
.end method
