.class public Lorg/eclipse/jgit/api/LsRemoteCommand;
.super Lorg/eclipse/jgit/api/TransportCommand;
.source "LsRemoteCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/TransportCommand",
        "<",
        "Lorg/eclipse/jgit/api/LsRemoteCommand;",
        "Ljava/util/Collection",
        "<",
        "Lorg/eclipse/jgit/lib/Ref;",
        ">;>;"
    }
.end annotation


# instance fields
.field private heads:Z

.field private remote:Ljava/lang/String;

.field private tags:Z

.field private uploadPack:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 90
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/TransportCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 76
    const-string v0, "origin"

    iput-object v0, p0, Lorg/eclipse/jgit/api/LsRemoteCommand;->remote:Ljava/lang/String;

    .line 91
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
    .line 73
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/LsRemoteCommand;->call()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/Collection;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/InvalidRemoteException;,
            Lorg/eclipse/jgit/api/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 156
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/LsRemoteCommand;->checkCallable()V

    .line 158
    const/4 v9, 0x0

    .line 159
    .local v9, transport:Lorg/eclipse/jgit/transport/Transport;
    const/4 v1, 0x0

    .line 161
    .local v1, fc:Lorg/eclipse/jgit/transport/FetchConnection;
    :try_start_0
    iget-object v10, p0, Lorg/eclipse/jgit/api/LsRemoteCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    if-eqz v10, :cond_4

    .line 162
    iget-object v10, p0, Lorg/eclipse/jgit/api/LsRemoteCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    iget-object v11, p0, Lorg/eclipse/jgit/api/LsRemoteCommand;->remote:Ljava/lang/String;

    invoke-static {v10, v11}, Lorg/eclipse/jgit/transport/Transport;->open(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Lorg/eclipse/jgit/transport/Transport;

    move-result-object v9

    .line 165
    :goto_0
    iget-object v10, p0, Lorg/eclipse/jgit/api/LsRemoteCommand;->uploadPack:Ljava/lang/String;

    invoke-virtual {v9, v10}, Lorg/eclipse/jgit/transport/Transport;->setOptionUploadPack(Ljava/lang/String;)V

    .line 166
    invoke-virtual {p0, v9}, Lorg/eclipse/jgit/api/LsRemoteCommand;->configure(Lorg/eclipse/jgit/transport/Transport;)Lorg/eclipse/jgit/api/GitCommand;

    .line 167
    new-instance v5, Ljava/util/ArrayList;

    const/4 v10, 0x1

    invoke-direct {v5, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 168
    .local v5, refSpecs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RefSpec;>;"
    iget-boolean v10, p0, Lorg/eclipse/jgit/api/LsRemoteCommand;->tags:Z

    if-eqz v10, :cond_0

    .line 169
    new-instance v10, Lorg/eclipse/jgit/transport/RefSpec;

    const-string v11, "refs/tags/*:refs/remotes/origin/tags/*"

    invoke-direct {v10, v11}, Lorg/eclipse/jgit/transport/RefSpec;-><init>(Ljava/lang/String;)V

    invoke-interface {v5, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 171
    :cond_0
    iget-boolean v10, p0, Lorg/eclipse/jgit/api/LsRemoteCommand;->heads:Z

    if-eqz v10, :cond_1

    .line 172
    new-instance v10, Lorg/eclipse/jgit/transport/RefSpec;

    const-string v11, "refs/heads/*:refs/remotes/origin/*"

    invoke-direct {v10, v11}, Lorg/eclipse/jgit/transport/RefSpec;-><init>(Ljava/lang/String;)V

    invoke-interface {v5, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 174
    :cond_1
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 175
    .local v6, refmap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-virtual {v9}, Lorg/eclipse/jgit/transport/Transport;->openFetch()Lorg/eclipse/jgit/transport/FetchConnection;

    move-result-object v1

    .line 176
    invoke-interface {v1}, Lorg/eclipse/jgit/transport/FetchConnection;->getRefs()Ljava/util/Collection;

    move-result-object v7

    .line 177
    .local v7, refs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-interface {v5}, Ljava/util/Collection;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_5

    .line 178
    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/lib/Ref;

    .line 179
    .local v4, r:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v4}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v6, v10, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/eclipse/jgit/errors/NotSupportedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_1

    .line 188
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v4           #r:Lorg/eclipse/jgit/lib/Ref;
    .end local v5           #refSpecs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RefSpec;>;"
    .end local v6           #refmap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    .end local v7           #refs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    :catch_0
    move-exception v0

    .line 189
    .local v0, e:Ljava/net/URISyntaxException;
    :try_start_1
    new-instance v10, Lorg/eclipse/jgit/api/errors/InvalidRemoteException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/JGitText;->invalidRemote:Ljava/lang/String;

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    iget-object v14, p0, Lorg/eclipse/jgit/api/LsRemoteCommand;->remote:Ljava/lang/String;

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lorg/eclipse/jgit/api/errors/InvalidRemoteException;-><init>(Ljava/lang/String;)V

    throw v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 200
    .end local v0           #e:Ljava/net/URISyntaxException;
    :catchall_0
    move-exception v10

    if-eqz v1, :cond_2

    .line 201
    invoke-interface {v1}, Lorg/eclipse/jgit/transport/FetchConnection;->close()V

    .line 202
    :cond_2
    if-eqz v9, :cond_3

    .line 203
    invoke-virtual {v9}, Lorg/eclipse/jgit/transport/Transport;->close()V

    :cond_3
    throw v10

    .line 164
    :cond_4
    :try_start_2
    new-instance v10, Lorg/eclipse/jgit/transport/URIish;

    iget-object v11, p0, Lorg/eclipse/jgit/api/LsRemoteCommand;->remote:Ljava/lang/String;

    invoke-direct {v10, v11}, Lorg/eclipse/jgit/transport/URIish;-><init>(Ljava/lang/String;)V

    invoke-static {v10}, Lorg/eclipse/jgit/transport/Transport;->open(Lorg/eclipse/jgit/transport/URIish;)Lorg/eclipse/jgit/transport/Transport;

    move-result-object v9

    goto/16 :goto_0

    .line 181
    .restart local v5       #refSpecs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RefSpec;>;"
    .restart local v6       #refmap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    .restart local v7       #refs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    :cond_5
    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_6
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/lib/Ref;

    .line 182
    .restart local v4       #r:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_7
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/eclipse/jgit/transport/RefSpec;

    .line 183
    .local v8, rs:Lorg/eclipse/jgit/transport/RefSpec;
    invoke-virtual {v8, v4}, Lorg/eclipse/jgit/transport/RefSpec;->matchSource(Lorg/eclipse/jgit/lib/Ref;)Z

    move-result v10

    if-eqz v10, :cond_7

    .line 184
    invoke-interface {v4}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v6, v10, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/net/URISyntaxException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/eclipse/jgit/errors/NotSupportedException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    .line 191
    .end local v3           #i$:Ljava/util/Iterator;
    .end local v4           #r:Lorg/eclipse/jgit/lib/Ref;
    .end local v5           #refSpecs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RefSpec;>;"
    .end local v6           #refmap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    .end local v7           #refs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    .end local v8           #rs:Lorg/eclipse/jgit/transport/RefSpec;
    :catch_1
    move-exception v0

    .line 192
    .local v0, e:Lorg/eclipse/jgit/errors/NotSupportedException;
    :try_start_3
    new-instance v10, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/JGitText;->exceptionCaughtDuringExecutionOfLsRemoteCommand:Ljava/lang/String;

    invoke-direct {v10, v11, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 187
    .end local v0           #e:Lorg/eclipse/jgit/errors/NotSupportedException;
    .restart local v5       #refSpecs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RefSpec;>;"
    .restart local v6       #refmap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    .restart local v7       #refs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    :cond_8
    :try_start_4
    invoke-interface {v6}, Ljava/util/Map;->values()Ljava/util/Collection;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/net/URISyntaxException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lorg/eclipse/jgit/errors/NotSupportedException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_4 .. :try_end_4} :catch_2

    move-result-object v10

    .line 200
    if-eqz v1, :cond_9

    .line 201
    invoke-interface {v1}, Lorg/eclipse/jgit/transport/FetchConnection;->close()V

    .line 202
    :cond_9
    if-eqz v9, :cond_a

    .line 203
    invoke-virtual {v9}, Lorg/eclipse/jgit/transport/Transport;->close()V

    :cond_a
    return-object v10

    .line 195
    .end local v5           #refSpecs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RefSpec;>;"
    .end local v6           #refmap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    .end local v7           #refs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    :catch_2
    move-exception v0

    .line 196
    .local v0, e:Lorg/eclipse/jgit/errors/TransportException;
    :try_start_5
    new-instance v10, Lorg/eclipse/jgit/api/errors/TransportException;

    invoke-virtual {v0}, Lorg/eclipse/jgit/errors/TransportException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v0}, Lorg/eclipse/jgit/api/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
.end method

.method public setHeads(Z)Lorg/eclipse/jgit/api/LsRemoteCommand;
    .locals 0
    .parameter "heads"

    .prologue
    .line 115
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/LsRemoteCommand;->heads:Z

    .line 116
    return-object p0
.end method

.method public setRemote(Ljava/lang/String;)Lorg/eclipse/jgit/api/LsRemoteCommand;
    .locals 0
    .parameter "remote"

    .prologue
    .line 103
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/LsRemoteCommand;->checkCallable()V

    .line 104
    iput-object p1, p0, Lorg/eclipse/jgit/api/LsRemoteCommand;->remote:Ljava/lang/String;

    .line 105
    return-object p0
.end method

.method public setTags(Z)Lorg/eclipse/jgit/api/LsRemoteCommand;
    .locals 0
    .parameter "tags"

    .prologue
    .line 126
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/LsRemoteCommand;->tags:Z

    .line 127
    return-object p0
.end method

.method public setUploadPack(Ljava/lang/String;)Lorg/eclipse/jgit/api/LsRemoteCommand;
    .locals 0
    .parameter "uploadPack"

    .prologue
    .line 137
    iput-object p1, p0, Lorg/eclipse/jgit/api/LsRemoteCommand;->uploadPack:Ljava/lang/String;

    .line 138
    return-object p0
.end method
