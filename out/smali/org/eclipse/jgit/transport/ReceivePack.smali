.class public Lorg/eclipse/jgit/transport/ReceivePack;
.super Lorg/eclipse/jgit/transport/BaseReceivePack;
.source "ReceivePack.java"


# instance fields
.field private echoCommandFailures:Z

.field private postReceive:Lorg/eclipse/jgit/transport/PostReceiveHook;

.field private preReceive:Lorg/eclipse/jgit/transport/PreReceiveHook;

.field private reportStatus:Z


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "into"

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/BaseReceivePack;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 81
    sget-object v0, Lorg/eclipse/jgit/transport/PreReceiveHook;->NULL:Lorg/eclipse/jgit/transport/PreReceiveHook;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/ReceivePack;->preReceive:Lorg/eclipse/jgit/transport/PreReceiveHook;

    .line 82
    sget-object v0, Lorg/eclipse/jgit/transport/PostReceiveHook;->NULL:Lorg/eclipse/jgit/transport/PostReceiveHook;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/ReceivePack;->postReceive:Lorg/eclipse/jgit/transport/PostReceiveHook;

    .line 83
    return-void
.end method

.method private service()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 177
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceivePack;->isBiDirectionalPipe()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 178
    new-instance v2, Lorg/eclipse/jgit/transport/RefAdvertiser$PacketLineOutRefAdvertiser;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/ReceivePack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/transport/RefAdvertiser$PacketLineOutRefAdvertiser;-><init>(Lorg/eclipse/jgit/transport/PacketLineOut;)V

    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/transport/ReceivePack;->sendAdvertisedRefs(Lorg/eclipse/jgit/transport/RefAdvertiser;)V

    .line 179
    iget-object v2, p0, Lorg/eclipse/jgit/transport/ReceivePack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/PacketLineOut;->flush()V

    .line 182
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceivePack;->hasError()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 241
    :cond_0
    return-void

    .line 181
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceivePack;->getAdvertisedOrDefaultRefs()Ljava/util/Map;

    goto :goto_0

    .line 184
    :cond_2
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceivePack;->recvCommands()V

    .line 185
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceivePack;->hasCommands()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 186
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceivePack;->enableCapabilities()V

    .line 188
    const/4 v1, 0x0

    .line 189
    .local v1, unpackError:Ljava/lang/Throwable;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceivePack;->needPack()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 191
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceivePack;->receivePackAndCheckConnectivity()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_2

    .line 201
    :cond_3
    :goto_1
    if-nez v1, :cond_4

    .line 202
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceivePack;->validateCommands()V

    .line 203
    iget-object v2, p0, Lorg/eclipse/jgit/transport/ReceivePack;->preReceive:Lorg/eclipse/jgit/transport/PreReceiveHook;

    sget-object v3, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->NOT_ATTEMPTED:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/transport/ReceivePack;->filterCommands(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, p0, v3}, Lorg/eclipse/jgit/transport/PreReceiveHook;->onPreReceive(Lorg/eclipse/jgit/transport/ReceivePack;Ljava/util/Collection;)V

    .line 204
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceivePack;->executeCommands()V

    .line 206
    :cond_4
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceivePack;->unlockPack()V

    .line 208
    iget-boolean v2, p0, Lorg/eclipse/jgit/transport/ReceivePack;->reportStatus:Z

    if-eqz v2, :cond_7

    .line 209
    iget-boolean v2, p0, Lorg/eclipse/jgit/transport/ReceivePack;->echoCommandFailures:Z

    if-eqz v2, :cond_5

    iget-object v2, p0, Lorg/eclipse/jgit/transport/ReceivePack;->msgOut:Ljava/io/OutputStream;

    if-eqz v2, :cond_5

    .line 210
    new-instance v2, Lorg/eclipse/jgit/transport/ReceivePack$1;

    invoke-direct {v2, p0}, Lorg/eclipse/jgit/transport/ReceivePack$1;-><init>(Lorg/eclipse/jgit/transport/ReceivePack;)V

    invoke-virtual {p0, v4, v1, v2}, Lorg/eclipse/jgit/transport/ReceivePack;->sendStatusReport(ZLjava/lang/Throwable;Lorg/eclipse/jgit/transport/BaseReceivePack$Reporter;)V

    .line 215
    iget-object v2, p0, Lorg/eclipse/jgit/transport/ReceivePack;->msgOut:Ljava/io/OutputStream;

    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V

    .line 217
    const-wide/16 v2, 0x1f4

    :try_start_1
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_3

    .line 222
    :cond_5
    :goto_2
    const/4 v2, 0x1

    new-instance v3, Lorg/eclipse/jgit/transport/ReceivePack$2;

    invoke-direct {v3, p0}, Lorg/eclipse/jgit/transport/ReceivePack$2;-><init>(Lorg/eclipse/jgit/transport/ReceivePack;)V

    invoke-virtual {p0, v2, v1, v3}, Lorg/eclipse/jgit/transport/ReceivePack;->sendStatusReport(ZLjava/lang/Throwable;Lorg/eclipse/jgit/transport/BaseReceivePack$Reporter;)V

    .line 227
    iget-object v2, p0, Lorg/eclipse/jgit/transport/ReceivePack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/PacketLineOut;->end()V

    .line 236
    :cond_6
    :goto_3
    iget-object v2, p0, Lorg/eclipse/jgit/transport/ReceivePack;->postReceive:Lorg/eclipse/jgit/transport/PostReceiveHook;

    sget-object v3, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->OK:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/transport/ReceivePack;->filterCommands(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, p0, v3}, Lorg/eclipse/jgit/transport/PostReceiveHook;->onPostReceive(Lorg/eclipse/jgit/transport/ReceivePack;Ljava/util/Collection;)V

    .line 238
    if-eqz v1, :cond_0

    .line 239
    new-instance v2, Lorg/eclipse/jgit/errors/UnpackException;

    invoke-direct {v2, v1}, Lorg/eclipse/jgit/errors/UnpackException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 192
    :catch_0
    move-exception v0

    .line 193
    .local v0, err:Ljava/io/IOException;
    move-object v1, v0

    .line 198
    goto :goto_1

    .line 194
    .end local v0           #err:Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 195
    .local v0, err:Ljava/lang/RuntimeException;
    move-object v1, v0

    .line 198
    goto :goto_1

    .line 196
    .end local v0           #err:Ljava/lang/RuntimeException;
    :catch_2
    move-exception v0

    .line 197
    .local v0, err:Ljava/lang/Error;
    move-object v1, v0

    goto :goto_1

    .line 228
    .end local v0           #err:Ljava/lang/Error;
    :cond_7
    iget-object v2, p0, Lorg/eclipse/jgit/transport/ReceivePack;->msgOut:Ljava/io/OutputStream;

    if-eqz v2, :cond_6

    .line 229
    new-instance v2, Lorg/eclipse/jgit/transport/ReceivePack$3;

    invoke-direct {v2, p0}, Lorg/eclipse/jgit/transport/ReceivePack$3;-><init>(Lorg/eclipse/jgit/transport/ReceivePack;)V

    invoke-virtual {p0, v4, v1, v2}, Lorg/eclipse/jgit/transport/ReceivePack;->sendStatusReport(ZLjava/lang/Throwable;Lorg/eclipse/jgit/transport/BaseReceivePack$Reporter;)V

    goto :goto_3

    .line 218
    :catch_3
    move-exception v2

    goto :goto_2
.end method


# virtual methods
.method protected enableCapabilities()V
    .locals 1

    .prologue
    .line 172
    const-string v0, "report-status"

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/ReceivePack;->isCapabilityEnabled(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/ReceivePack;->reportStatus:Z

    .line 173
    invoke-super {p0}, Lorg/eclipse/jgit/transport/BaseReceivePack;->enableCapabilities()V

    .line 174
    return-void
.end method

.method protected getLockMessageProcessName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 245
    const-string v0, "jgit receive-pack"

    return-object v0
.end method

.method public getPostReceiveHook()Lorg/eclipse/jgit/transport/PostReceiveHook;
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lorg/eclipse/jgit/transport/ReceivePack;->postReceive:Lorg/eclipse/jgit/transport/PostReceiveHook;

    return-object v0
.end method

.method public getPreReceiveHook()Lorg/eclipse/jgit/transport/PreReceiveHook;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lorg/eclipse/jgit/transport/ReceivePack;->preReceive:Lorg/eclipse/jgit/transport/PreReceiveHook;

    return-object v0
.end method

.method public receive(Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/io/OutputStream;)V
    .locals 1
    .parameter "input"
    .parameter "output"
    .parameter "messages"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 158
    invoke-virtual {p0, p1, p2, p3}, Lorg/eclipse/jgit/transport/ReceivePack;->init(Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/io/OutputStream;)V

    .line 160
    :try_start_0
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/ReceivePack;->service()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 163
    :try_start_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceivePack;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 165
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceivePack;->release()V

    .line 168
    return-void

    .line 165
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceivePack;->release()V

    throw v0

    .line 162
    :catchall_1
    move-exception v0

    .line 163
    :try_start_2
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceivePack;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 165
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceivePack;->release()V

    throw v0

    :catchall_2
    move-exception v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceivePack;->release()V

    throw v0
.end method

.method public setEchoCommandFailures(Z)V
    .locals 0
    .parameter "echo"

    .prologue
    .line 135
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/ReceivePack;->echoCommandFailures:Z

    .line 136
    return-void
.end method

.method public setPostReceiveHook(Lorg/eclipse/jgit/transport/PostReceiveHook;)V
    .locals 0
    .parameter "h"

    .prologue
    .line 124
    if-eqz p1, :cond_0

    .end local p1
    :goto_0
    iput-object p1, p0, Lorg/eclipse/jgit/transport/ReceivePack;->postReceive:Lorg/eclipse/jgit/transport/PostReceiveHook;

    .line 125
    return-void

    .line 124
    .restart local p1
    :cond_0
    sget-object p1, Lorg/eclipse/jgit/transport/PostReceiveHook;->NULL:Lorg/eclipse/jgit/transport/PostReceiveHook;

    goto :goto_0
.end method

.method public setPreReceiveHook(Lorg/eclipse/jgit/transport/PreReceiveHook;)V
    .locals 0
    .parameter "h"

    .prologue
    .line 105
    if-eqz p1, :cond_0

    .end local p1
    :goto_0
    iput-object p1, p0, Lorg/eclipse/jgit/transport/ReceivePack;->preReceive:Lorg/eclipse/jgit/transport/PreReceiveHook;

    .line 106
    return-void

    .line 105
    .restart local p1
    :cond_0
    sget-object p1, Lorg/eclipse/jgit/transport/PreReceiveHook;->NULL:Lorg/eclipse/jgit/transport/PreReceiveHook;

    goto :goto_0
.end method
