.class public Lorg/eclipse/jgit/api/AddCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "AddCommand.java"


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

.field private update:Z

.field private workingTreeIterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 91
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 84
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/api/AddCommand;->update:Z

    .line 92
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/api/AddCommand;->filepatterns:Ljava/util/Collection;

    .line 93
    return-void
.end method


# virtual methods
.method public addFilepattern(Ljava/lang/String;)Lorg/eclipse/jgit/api/AddCommand;
    .locals 1
    .parameter "filepattern"

    .prologue
    .line 108
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/AddCommand;->checkCallable()V

    .line 109
    iget-object v0, p0, Lorg/eclipse/jgit/api/AddCommand;->filepatterns:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 110
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
    .line 78
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/AddCommand;->call()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/dircache/DirCache;
    .locals 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/NoFilepatternException;
        }
    .end annotation

    .prologue
    .line 132
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/AddCommand;->filepatterns:Ljava/util/Collection;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/Collection;->isEmpty()Z

    move-result v19

    if-eqz v19, :cond_0

    .line 133
    new-instance v19, Lorg/eclipse/jgit/api/errors/NoFilepatternException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v20

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->atLeastOnePatternIsRequired:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-direct/range {v19 .. v20}, Lorg/eclipse/jgit/api/errors/NoFilepatternException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 134
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/api/AddCommand;->checkCallable()V

    .line 135
    const/4 v7, 0x0

    .line 136
    .local v7, dc:Lorg/eclipse/jgit/dircache/DirCache;
    const/4 v2, 0x0

    .line 137
    .local v2, addAll:Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/AddCommand;->filepatterns:Ljava/util/Collection;

    move-object/from16 v19, v0

    const-string v20, "."

    invoke-interface/range {v19 .. v20}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 138
    const/4 v2, 0x1

    .line 140
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/AddCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/lib/Repository;->newObjectInserter()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v12

    .line 142
    .local v12, inserter:Lorg/eclipse/jgit/lib/ObjectInserter;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/AddCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v7

    .line 145
    invoke-virtual {v7}, Lorg/eclipse/jgit/dircache/DirCache;->builder()Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    move-result-object v3

    .line 146
    .local v3, builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    new-instance v18, Lorg/eclipse/jgit/treewalk/TreeWalk;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/AddCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    invoke-direct/range {v18 .. v19}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 147
    .local v18, tw:Lorg/eclipse/jgit/treewalk/TreeWalk;
    new-instance v19, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;

    move-object/from16 v0, v19

    invoke-direct {v0, v3}, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCacheBuilder;)V

    invoke-virtual/range {v18 .. v19}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 148
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/AddCommand;->workingTreeIterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    move-object/from16 v19, v0

    if-nez v19, :cond_2

    .line 149
    new-instance v19, Lorg/eclipse/jgit/treewalk/FileTreeIterator;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/AddCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v20, v0

    invoke-direct/range {v19 .. v20}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/api/AddCommand;->workingTreeIterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    .line 150
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/AddCommand;->workingTreeIterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 151
    const/16 v19, 0x1

    invoke-virtual/range {v18 .. v19}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setRecursive(Z)V

    .line 152
    if-nez v2, :cond_3

    .line 153
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/AddCommand;->filepatterns:Ljava/util/Collection;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup;->createFromStrings(Ljava/util/Collection;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 155
    :cond_3
    const/4 v13, 0x0

    .line 157
    .local v13, lastAddedFile:Ljava/lang/String;
    :cond_4
    :goto_0
    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v19

    if-eqz v19, :cond_d

    .line 158
    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v15

    .line 160
    .local v15, path:Ljava/lang/String;
    const/16 v19, 0x1

    const-class v20, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    invoke-virtual/range {v18 .. v20}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v10

    check-cast v10, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    .line 161
    .local v10, f:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    const/16 v19, 0x0

    const-class v20, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    invoke-virtual/range {v18 .. v20}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v19

    if-nez v19, :cond_5

    if-eqz v10, :cond_5

    invoke-virtual {v10}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->isEntryIgnored()Z

    move-result v19

    if-nez v19, :cond_4

    .line 169
    :cond_5
    invoke-virtual {v15, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_4

    .line 170
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/AddCommand;->update:Z

    move/from16 v19, v0

    if-eqz v19, :cond_6

    const/16 v19, 0x0

    const-class v20, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    invoke-virtual/range {v18 .. v20}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v19

    if-eqz v19, :cond_4

    .line 171
    :cond_6
    const/16 v19, 0x0

    const-class v20, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    invoke-virtual/range {v18 .. v20}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    .line 172
    .local v4, c:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    if-eqz v10, :cond_b

    .line 173
    invoke-virtual {v10}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryLength()J

    move-result-wide v16

    .line 174
    .local v16, sz:J
    new-instance v9, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    invoke-direct {v9, v15}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>(Ljava/lang/String;)V

    .line 175
    .local v9, entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    if-eqz v4, :cond_7

    invoke-virtual {v4}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v19

    if-eqz v19, :cond_7

    invoke-virtual {v4}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->isAssumeValid()Z

    move-result v19

    if-nez v19, :cond_a

    .line 177
    :cond_7
    invoke-virtual {v10, v4}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getIndexFileMode(Lorg/eclipse/jgit/dircache/DirCacheIterator;)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v14

    .line 178
    .local v14, mode:Lorg/eclipse/jgit/lib/FileMode;
    invoke-virtual {v9, v14}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V

    .line 180
    sget-object v19, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    move-object/from16 v0, v19

    if-eq v0, v14, :cond_9

    .line 181
    move-wide/from16 v0, v16

    invoke-virtual {v9, v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLength(J)V

    .line 182
    invoke-virtual {v10}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryLastModified()J

    move-result-wide v19

    move-wide/from16 v0, v19

    invoke-virtual {v9, v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLastModified(J)V

    .line 184
    invoke-virtual {v10}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryContentLength()J

    move-result-wide v5

    .line 186
    .local v5, contentSize:J
    invoke-virtual {v10}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->openEntryStream()Ljava/io/InputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v11

    .line 188
    .local v11, in:Ljava/io/InputStream;
    const/16 v19, 0x3

    :try_start_1
    move/from16 v0, v19

    invoke-virtual {v12, v0, v5, v6, v11}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(IJLjava/io/InputStream;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v9, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 191
    :try_start_2
    invoke-virtual {v11}, Ljava/io/InputStream;->close()V

    .line 195
    .end local v5           #contentSize:J
    .end local v11           #in:Ljava/io/InputStream;
    :goto_1
    invoke-virtual {v3, v9}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 196
    move-object v13, v15

    .line 197
    goto/16 :goto_0

    .line 191
    .restart local v5       #contentSize:J
    .restart local v11       #in:Ljava/io/InputStream;
    :catchall_0
    move-exception v19

    invoke-virtual {v11}, Ljava/io/InputStream;->close()V

    throw v19
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 211
    .end local v3           #builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    .end local v4           #c:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    .end local v5           #contentSize:J
    .end local v9           #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .end local v10           #f:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    .end local v11           #in:Ljava/io/InputStream;
    .end local v13           #lastAddedFile:Ljava/lang/String;
    .end local v14           #mode:Lorg/eclipse/jgit/lib/FileMode;
    .end local v15           #path:Ljava/lang/String;
    .end local v16           #sz:J
    .end local v18           #tw:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :catch_0
    move-exception v8

    .line 212
    .local v8, e:Ljava/io/IOException;
    :try_start_3
    new-instance v19, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v20

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->exceptionCaughtDuringExecutionOfAddCommand:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v0, v1, v8}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v19
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 215
    .end local v8           #e:Ljava/io/IOException;
    :catchall_1
    move-exception v19

    invoke-virtual {v12}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    .line 216
    if-eqz v7, :cond_8

    .line 217
    invoke-virtual {v7}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    :cond_8
    throw v19

    .line 194
    .restart local v3       #builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    .restart local v4       #c:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    .restart local v9       #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .restart local v10       #f:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    .restart local v13       #lastAddedFile:Ljava/lang/String;
    .restart local v14       #mode:Lorg/eclipse/jgit/lib/FileMode;
    .restart local v15       #path:Ljava/lang/String;
    .restart local v16       #sz:J
    .restart local v18       #tw:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :cond_9
    :try_start_4
    invoke-virtual {v10}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v9, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    goto :goto_1

    .line 198
    .end local v14           #mode:Lorg/eclipse/jgit/lib/FileMode;
    :cond_a
    invoke-virtual {v4}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    goto/16 :goto_0

    .line 201
    .end local v9           #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .end local v16           #sz:J
    :cond_b
    if-eqz v4, :cond_4

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/AddCommand;->update:Z

    move/from16 v19, v0

    if-eqz v19, :cond_c

    sget-object v19, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v4}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_4

    .line 204
    :cond_c
    invoke-virtual {v4}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    goto/16 :goto_0

    .line 208
    .end local v4           #c:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    .end local v10           #f:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    .end local v15           #path:Ljava/lang/String;
    :cond_d
    invoke-virtual {v12}, Lorg/eclipse/jgit/lib/ObjectInserter;->flush()V

    .line 209
    invoke-virtual {v3}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->commit()Z

    .line 210
    const/16 v19, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/api/AddCommand;->setCallable(Z)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 215
    invoke-virtual {v12}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    .line 216
    if-eqz v7, :cond_e

    .line 217
    invoke-virtual {v7}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    .line 220
    :cond_e
    return-object v7
.end method

.method public isUpdate()Z
    .locals 1

    .prologue
    .line 246
    iget-boolean v0, p0, Lorg/eclipse/jgit/api/AddCommand;->update:Z

    return v0
.end method

.method public setUpdate(Z)Lorg/eclipse/jgit/api/AddCommand;
    .locals 0
    .parameter "update"

    .prologue
    .line 238
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/AddCommand;->update:Z

    .line 239
    return-object p0
.end method

.method public setWorkingTreeIterator(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)Lorg/eclipse/jgit/api/AddCommand;
    .locals 0
    .parameter "f"

    .prologue
    .line 119
    iput-object p1, p0, Lorg/eclipse/jgit/api/AddCommand;->workingTreeIterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    .line 120
    return-object p0
.end method
