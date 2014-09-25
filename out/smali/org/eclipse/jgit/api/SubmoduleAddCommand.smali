.class public Lorg/eclipse/jgit/api/SubmoduleAddCommand;
.super Lorg/eclipse/jgit/api/TransportCommand;
.source "SubmoduleAddCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/TransportCommand",
        "<",
        "Lorg/eclipse/jgit/api/SubmoduleAddCommand;",
        "Lorg/eclipse/jgit/lib/Repository;",
        ">;"
    }
.end annotation


# instance fields
.field private monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

.field private path:Ljava/lang/String;

.field private uri:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 0
    .parameter "repo"

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/TransportCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 90
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
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->call()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/lib/Repository;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 140
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->checkCallable()V

    .line 141
    iget-object v8, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->path:Ljava/lang/String;

    if-eqz v8, :cond_0

    iget-object v8, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->path:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_1

    .line 142
    :cond_0
    new-instance v8, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v9

    iget-object v9, v9, Lorg/eclipse/jgit/internal/JGitText;->pathNotConfigured:Ljava/lang/String;

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 143
    :cond_1
    iget-object v8, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->uri:Ljava/lang/String;

    if-eqz v8, :cond_2

    iget-object v8, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->uri:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_3

    .line 144
    :cond_2
    new-instance v8, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v9

    iget-object v9, v9, Lorg/eclipse/jgit/internal/JGitText;->uriNotConfigured:Ljava/lang/String;

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 147
    :cond_3
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->submoduleExists()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 148
    new-instance v8, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v9

    iget-object v9, v9, Lorg/eclipse/jgit/internal/JGitText;->submoduleExists:Ljava/lang/String;

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    iget-object v12, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->path:Ljava/lang/String;

    aput-object v12, v10, v11

    invoke-static {v9, v10}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    :catch_0
    move-exception v3

    .line 151
    .local v3, e:Ljava/io/IOException;
    new-instance v8, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v3}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 156
    .end local v3           #e:Ljava/io/IOException;
    :cond_4
    :try_start_1
    iget-object v8, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    iget-object v9, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->uri:Ljava/lang/String;

    invoke-static {v8, v9}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getSubmoduleRemoteUrl(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v6

    .line 161
    .local v6, resolvedUri:Ljava/lang/String;
    iget-object v8, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    iget-object v9, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->path:Ljava/lang/String;

    invoke-static {v8, v9}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getSubmoduleDirectory(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    .line 162
    .local v4, moduleDirectory:Ljava/io/File;
    invoke-static {}, Lorg/eclipse/jgit/api/Git;->cloneRepository()Lorg/eclipse/jgit/api/CloneCommand;

    move-result-object v1

    .line 163
    .local v1, clone:Lorg/eclipse/jgit/api/CloneCommand;
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->configure(Lorg/eclipse/jgit/api/TransportCommand;)Lorg/eclipse/jgit/api/GitCommand;

    .line 164
    invoke-virtual {v1, v4}, Lorg/eclipse/jgit/api/CloneCommand;->setDirectory(Ljava/io/File;)Lorg/eclipse/jgit/api/CloneCommand;

    .line 165
    invoke-virtual {v1, v6}, Lorg/eclipse/jgit/api/CloneCommand;->setURI(Ljava/lang/String;)Lorg/eclipse/jgit/api/CloneCommand;

    .line 166
    iget-object v8, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    if-eqz v8, :cond_5

    .line 167
    iget-object v8, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-virtual {v1, v8}, Lorg/eclipse/jgit/api/CloneCommand;->setProgressMonitor(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/api/CloneCommand;

    .line 168
    :cond_5
    invoke-virtual {v1}, Lorg/eclipse/jgit/api/CloneCommand;->call()Lorg/eclipse/jgit/api/Git;

    move-result-object v8

    invoke-virtual {v8}, Lorg/eclipse/jgit/api/Git;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v7

    .line 171
    .local v7, subRepo:Lorg/eclipse/jgit/lib/Repository;
    iget-object v8, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v2

    .line 172
    .local v2, config:Lorg/eclipse/jgit/lib/StoredConfig;
    const-string v8, "submodule"

    iget-object v9, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->path:Ljava/lang/String;

    const-string v10, "url"

    invoke-virtual {v2, v8, v9, v10, v6}, Lorg/eclipse/jgit/lib/StoredConfig;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    :try_start_2
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/StoredConfig;->save()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 181
    new-instance v5, Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    new-instance v8, Ljava/io/File;

    iget-object v9, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v9}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v9

    const-string v10, ".gitmodules"

    invoke-direct {v8, v9, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iget-object v9, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v9}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v9

    invoke-direct {v5, v8, v9}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;-><init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    .line 184
    .local v5, modulesConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;
    :try_start_3
    invoke-virtual {v5}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->load()V

    .line 185
    const-string v8, "submodule"

    iget-object v9, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->path:Ljava/lang/String;

    const-string v10, "path"

    iget-object v11, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->path:Ljava/lang/String;

    invoke-virtual {v5, v8, v9, v10, v11}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    const-string v8, "submodule"

    iget-object v9, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->path:Ljava/lang/String;

    const-string v10, "url"

    iget-object v11, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->uri:Ljava/lang/String;

    invoke-virtual {v5, v8, v9, v10, v11}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    invoke-virtual {v5}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->save()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Lorg/eclipse/jgit/errors/ConfigInvalidException; {:try_start_3 .. :try_end_3} :catch_4

    .line 196
    new-instance v0, Lorg/eclipse/jgit/api/AddCommand;

    iget-object v8, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v8}, Lorg/eclipse/jgit/api/AddCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 198
    .local v0, add:Lorg/eclipse/jgit/api/AddCommand;
    const-string v8, ".gitmodules"

    invoke-virtual {v0, v8}, Lorg/eclipse/jgit/api/AddCommand;->addFilepattern(Ljava/lang/String;)Lorg/eclipse/jgit/api/AddCommand;

    .line 200
    iget-object v8, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->path:Ljava/lang/String;

    invoke-virtual {v0, v8}, Lorg/eclipse/jgit/api/AddCommand;->addFilepattern(Ljava/lang/String;)Lorg/eclipse/jgit/api/AddCommand;

    .line 202
    :try_start_4
    invoke-virtual {v0}, Lorg/eclipse/jgit/api/AddCommand;->call()Lorg/eclipse/jgit/dircache/DirCache;
    :try_end_4
    .catch Lorg/eclipse/jgit/api/errors/NoFilepatternException; {:try_start_4 .. :try_end_4} :catch_5

    .line 207
    return-object v7

    .line 157
    .end local v0           #add:Lorg/eclipse/jgit/api/AddCommand;
    .end local v1           #clone:Lorg/eclipse/jgit/api/CloneCommand;
    .end local v2           #config:Lorg/eclipse/jgit/lib/StoredConfig;
    .end local v4           #moduleDirectory:Ljava/io/File;
    .end local v5           #modulesConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;
    .end local v6           #resolvedUri:Ljava/lang/String;
    .end local v7           #subRepo:Lorg/eclipse/jgit/lib/Repository;
    :catch_1
    move-exception v3

    .line 158
    .restart local v3       #e:Ljava/io/IOException;
    new-instance v8, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v3}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 176
    .end local v3           #e:Ljava/io/IOException;
    .restart local v1       #clone:Lorg/eclipse/jgit/api/CloneCommand;
    .restart local v2       #config:Lorg/eclipse/jgit/lib/StoredConfig;
    .restart local v4       #moduleDirectory:Ljava/io/File;
    .restart local v6       #resolvedUri:Ljava/lang/String;
    .restart local v7       #subRepo:Lorg/eclipse/jgit/lib/Repository;
    :catch_2
    move-exception v3

    .line 177
    .restart local v3       #e:Ljava/io/IOException;
    new-instance v8, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v3}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 190
    .end local v3           #e:Ljava/io/IOException;
    .restart local v5       #modulesConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;
    :catch_3
    move-exception v3

    .line 191
    .restart local v3       #e:Ljava/io/IOException;
    new-instance v8, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v3}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 192
    .end local v3           #e:Ljava/io/IOException;
    :catch_4
    move-exception v3

    .line 193
    .local v3, e:Lorg/eclipse/jgit/errors/ConfigInvalidException;
    new-instance v8, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v3}, Lorg/eclipse/jgit/errors/ConfigInvalidException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v3}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 203
    .end local v3           #e:Lorg/eclipse/jgit/errors/ConfigInvalidException;
    .restart local v0       #add:Lorg/eclipse/jgit/api/AddCommand;
    :catch_5
    move-exception v3

    .line 204
    .local v3, e:Lorg/eclipse/jgit/api/errors/NoFilepatternException;
    new-instance v8, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v3}, Lorg/eclipse/jgit/api/errors/NoFilepatternException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v3}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8
.end method

.method public setPath(Ljava/lang/String;)Lorg/eclipse/jgit/api/SubmoduleAddCommand;
    .locals 0
    .parameter "path"

    .prologue
    .line 100
    iput-object p1, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->path:Ljava/lang/String;

    .line 101
    return-object p0
.end method

.method public setProgressMonitor(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/api/SubmoduleAddCommand;
    .locals 0
    .parameter "monitor"

    .prologue
    .line 124
    iput-object p1, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 125
    return-object p0
.end method

.method public setURI(Ljava/lang/String;)Lorg/eclipse/jgit/api/SubmoduleAddCommand;
    .locals 0
    .parameter "uri"

    .prologue
    .line 111
    iput-object p1, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->uri:Ljava/lang/String;

    .line 112
    return-object p0
.end method

.method protected submoduleExists()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    iget-object v1, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->path:Ljava/lang/String;

    invoke-static {v1}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->create(Ljava/lang/String;)Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-result-object v0

    .line 136
    .local v0, filter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    iget-object v1, p0, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-static {v1}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->forIndex(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->next()Z

    move-result v1

    return v1
.end method
