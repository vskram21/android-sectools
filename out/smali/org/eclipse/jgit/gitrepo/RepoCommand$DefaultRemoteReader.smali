.class public Lorg/eclipse/jgit/gitrepo/RepoCommand$DefaultRemoteReader;
.super Ljava/lang/Object;
.source "RepoCommand.java"

# interfaces
.implements Lorg/eclipse/jgit/gitrepo/RepoCommand$RemoteReader;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/gitrepo/RepoCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DefaultRemoteReader"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 161
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public readFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[B
    .locals 9
    .parameter "uri"
    .parameter "ref"
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 179
    const-string v5, "jgit_"

    const-string v6, ".git"

    const/4 v7, 0x0

    invoke-static {v5, v6, v7}, Lorg/eclipse/jgit/util/FileUtils;->createTempDir(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    .line 180
    .local v0, dir:Ljava/io/File;
    invoke-static {}, Lorg/eclipse/jgit/api/Git;->cloneRepository()Lorg/eclipse/jgit/api/CloneCommand;

    move-result-object v5

    invoke-virtual {v5, v8}, Lorg/eclipse/jgit/api/CloneCommand;->setBare(Z)Lorg/eclipse/jgit/api/CloneCommand;

    move-result-object v5

    invoke-virtual {v5, v0}, Lorg/eclipse/jgit/api/CloneCommand;->setDirectory(Ljava/io/File;)Lorg/eclipse/jgit/api/CloneCommand;

    move-result-object v5

    invoke-virtual {v5, p1}, Lorg/eclipse/jgit/api/CloneCommand;->setURI(Ljava/lang/String;)Lorg/eclipse/jgit/api/CloneCommand;

    move-result-object v5

    invoke-virtual {v5}, Lorg/eclipse/jgit/api/CloneCommand;->call()Lorg/eclipse/jgit/api/Git;

    move-result-object v5

    invoke-virtual {v5}, Lorg/eclipse/jgit/api/Git;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v3

    .line 187
    .local v3, repo:Lorg/eclipse/jgit/lib/Repository;
    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v2

    .line 190
    .local v2, reader:Lorg/eclipse/jgit/lib/ObjectReader;
    :try_start_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    .line 191
    .local v1, oid:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {v2, v1}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v5

    const v6, 0x7fffffff

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/lib/ObjectLoader;->getBytes(I)[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v4

    .line 193
    .local v4, result:[B
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    .line 194
    invoke-static {v0, v8}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    .line 196
    return-object v4

    .line 193
    .end local v1           #oid:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v4           #result:[B
    :catchall_0
    move-exception v5

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    .line 194
    invoke-static {v0, v8}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    throw v5
.end method

.method public sha1(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 5
    .parameter "uri"
    .parameter "ref"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 163
    invoke-static {}, Lorg/eclipse/jgit/api/Git;->lsRemoteRepository()Lorg/eclipse/jgit/api/LsRemoteCommand;

    move-result-object v4

    invoke-virtual {v4, p1}, Lorg/eclipse/jgit/api/LsRemoteCommand;->setRemote(Ljava/lang/String;)Lorg/eclipse/jgit/api/LsRemoteCommand;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/api/LsRemoteCommand;->call()Ljava/util/Collection;

    move-result-object v3

    .line 169
    .local v3, refs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    new-instance v1, Ljava/util/HashMap;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v4

    invoke-direct {v1, v4}, Ljava/util/HashMap;-><init>(I)V

    .line 170
    .local v1, map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/Ref;

    .line 171
    .local v2, r:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 173
    .end local v2           #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_0
    invoke-static {v1, p2}, Lorg/eclipse/jgit/lib/RefDatabase;->findRef(Ljava/util/Map;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v2

    .line 174
    .restart local v2       #r:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v2, :cond_1

    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    :goto_1
    return-object v4

    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method
