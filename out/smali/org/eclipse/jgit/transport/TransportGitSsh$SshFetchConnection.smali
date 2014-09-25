.class Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;
.super Lorg/eclipse/jgit/transport/BasePackFetchConnection;
.source "TransportGitSsh.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportGitSsh;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SshFetchConnection"
.end annotation


# instance fields
.field private errorThread:Lorg/eclipse/jgit/util/io/StreamCopyThread;

.field private final process:Ljava/lang/Process;

.field final synthetic this$0:Lorg/eclipse/jgit/transport/TransportGitSsh;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/TransportGitSsh;)V
    .locals 8
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 245
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->this$0:Lorg/eclipse/jgit/transport/TransportGitSsh;

    .line 246
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;-><init>(Lorg/eclipse/jgit/transport/PackTransport;)V

    .line 248
    :try_start_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/TransportGitSsh;->getSession()Lorg/eclipse/jgit/transport/RemoteSession;

    move-result-object v5

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/TransportGitSsh;->getOptionUploadPack()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Lorg/eclipse/jgit/transport/TransportGitSsh;->commandFor(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/TransportGitSsh;->getTimeout()I

    move-result v7

    invoke-interface {v5, v6, v7}, Lorg/eclipse/jgit/transport/RemoteSession;->exec(Ljava/lang/String;I)Ljava/lang/Process;

    move-result-object v5

    iput-object v5, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->process:Ljava/lang/Process;

    .line 250
    new-instance v1, Lorg/eclipse/jgit/util/io/MessageWriter;

    invoke-direct {v1}, Lorg/eclipse/jgit/util/io/MessageWriter;-><init>()V

    .line 251
    .local v1, msg:Lorg/eclipse/jgit/util/io/MessageWriter;
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->setMessageWriter(Ljava/io/Writer;)V

    .line 253
    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->process:Ljava/lang/Process;

    invoke-virtual {v5}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v4

    .line 254
    .local v4, upErr:Ljava/io/InputStream;
    new-instance v5, Lorg/eclipse/jgit/util/io/StreamCopyThread;

    invoke-virtual {v1}, Lorg/eclipse/jgit/util/io/MessageWriter;->getRawStream()Ljava/io/OutputStream;

    move-result-object v6

    invoke-direct {v5, v4, v6}, Lorg/eclipse/jgit/util/io/StreamCopyThread;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    iput-object v5, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->errorThread:Lorg/eclipse/jgit/util/io/StreamCopyThread;

    .line 255
    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->errorThread:Lorg/eclipse/jgit/util/io/StreamCopyThread;

    invoke-virtual {v5}, Lorg/eclipse/jgit/util/io/StreamCopyThread;->start()V

    .line 257
    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->process:Ljava/lang/Process;

    invoke-virtual {v5}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->process:Ljava/lang/Process;

    invoke-virtual {v6}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->init(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 269
    :try_start_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->readAdvertisedRefs()V
    :try_end_1
    .catch Lorg/eclipse/jgit/errors/NoRemoteRepositoryException; {:try_start_1 .. :try_end_1} :catch_2

    .line 276
    return-void

    .line 259
    .end local v1           #msg:Lorg/eclipse/jgit/util/io/MessageWriter;
    .end local v4           #upErr:Ljava/io/InputStream;
    :catch_0
    move-exception v0

    .line 260
    .local v0, err:Lorg/eclipse/jgit/errors/TransportException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->close()V

    .line 261
    throw v0

    .line 262
    .end local v0           #err:Lorg/eclipse/jgit/errors/TransportException;
    :catch_1
    move-exception v0

    .line 263
    .local v0, err:Ljava/io/IOException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->close()V

    .line 264
    new-instance v5, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->remoteHungUpUnexpectedly:Ljava/lang/String;

    invoke-direct {v5, v6, v7, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 270
    .end local v0           #err:Ljava/io/IOException;
    .restart local v1       #msg:Lorg/eclipse/jgit/util/io/MessageWriter;
    .restart local v4       #upErr:Ljava/io/InputStream;
    :catch_2
    move-exception v3

    .line 271
    .local v3, notFound:Lorg/eclipse/jgit/errors/NoRemoteRepositoryException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->getMessages()Ljava/lang/String;

    move-result-object v2

    .line 272
    .local v2, msgs:Ljava/lang/String;
    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->process:Ljava/lang/Process;

    invoke-virtual {v5}, Ljava/lang/Process;->exitValue()I

    move-result v5

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/TransportGitSsh;->getOptionUploadPack()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v5, v6, v2}, Lorg/eclipse/jgit/transport/TransportGitSsh;->checkExecFailure(ILjava/lang/String;Ljava/lang/String;)V

    .line 274
    invoke-virtual {p1, v3, v2}, Lorg/eclipse/jgit/transport/TransportGitSsh;->cleanNotFound(Lorg/eclipse/jgit/errors/NoRemoteRepositoryException;Ljava/lang/String;)Lorg/eclipse/jgit/errors/NoRemoteRepositoryException;

    move-result-object v5

    throw v5
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 280
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->endOut()V

    .line 282
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->errorThread:Lorg/eclipse/jgit/util/io/StreamCopyThread;

    if-eqz v0, :cond_0

    .line 284
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->errorThread:Lorg/eclipse/jgit/util/io/StreamCopyThread;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/io/StreamCopyThread;->halt()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 288
    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->errorThread:Lorg/eclipse/jgit/util/io/StreamCopyThread;

    .line 292
    :cond_0
    :goto_0
    invoke-super {p0}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->close()V

    .line 293
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->process:Ljava/lang/Process;

    if-eqz v0, :cond_1

    .line 294
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->process:Ljava/lang/Process;

    invoke-virtual {v0}, Ljava/lang/Process;->destroy()V

    .line 295
    :cond_1
    return-void

    .line 285
    :catch_0
    move-exception v0

    .line 288
    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->errorThread:Lorg/eclipse/jgit/util/io/StreamCopyThread;

    goto :goto_0

    :catchall_0
    move-exception v0

    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;->errorThread:Lorg/eclipse/jgit/util/io/StreamCopyThread;

    throw v0
.end method
