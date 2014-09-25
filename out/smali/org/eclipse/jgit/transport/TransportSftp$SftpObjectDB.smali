.class Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;
.super Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
.source "TransportSftp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportSftp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SftpObjectDB"
.end annotation


# instance fields
.field private ftp:Lcom/jcraft/jsch/ChannelSftp;

.field private final objectsPath:Ljava/lang/String;

.field final synthetic this$0:Lorg/eclipse/jgit/transport/TransportSftp;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/TransportSftp;Ljava/lang/String;)V
    .locals 5
    .parameter
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 168
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->this$0:Lorg/eclipse/jgit/transport/TransportSftp;

    invoke-direct {p0}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;-><init>()V

    .line 169
    const-string v2, "/~"

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 170
    const/4 v2, 0x1

    invoke-virtual {p2, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    .line 171
    :cond_0
    const-string v2, "~/"

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 172
    const/4 v2, 0x2

    invoke-virtual {p2, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    .line 174
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/TransportSftp;->newSftp()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    .line 175
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    invoke-virtual {v2, p2}, Lcom/jcraft/jsch/ChannelSftp;->cd(Ljava/lang/String;)V

    .line 176
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    const-string v3, "objects"

    invoke-virtual {v2, v3}, Lcom/jcraft/jsch/ChannelSftp;->cd(Ljava/lang/String;)V

    .line 177
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    invoke-virtual {v2}, Lcom/jcraft/jsch/ChannelSftp;->pwd()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->objectsPath:Ljava/lang/String;
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_0 .. :try_end_0} :catch_1

    .line 185
    return-void

    .line 178
    :catch_0
    move-exception v0

    .line 179
    .local v0, err:Lorg/eclipse/jgit/errors/TransportException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->close()V

    .line 180
    throw v0

    .line 181
    .end local v0           #err:Lorg/eclipse/jgit/errors/TransportException;
    :catch_1
    move-exception v1

    .line 182
    .local v1, je:Lcom/jcraft/jsch/SftpException;
    new-instance v2, Lorg/eclipse/jgit/errors/TransportException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Can\'t enter "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/objects"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lcom/jcraft/jsch/SftpException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method constructor <init>(Lorg/eclipse/jgit/transport/TransportSftp;Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;Ljava/lang/String;)V
    .locals 5
    .parameter
    .parameter "parent"
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 188
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->this$0:Lorg/eclipse/jgit/transport/TransportSftp;

    invoke-direct {p0}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;-><init>()V

    .line 190
    :try_start_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/TransportSftp;->newSftp()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    .line 191
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    iget-object v3, p2, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->objectsPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/jcraft/jsch/ChannelSftp;->cd(Ljava/lang/String;)V

    .line 192
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    invoke-virtual {v2, p3}, Lcom/jcraft/jsch/ChannelSftp;->cd(Ljava/lang/String;)V

    .line 193
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    invoke-virtual {v2}, Lcom/jcraft/jsch/ChannelSftp;->pwd()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->objectsPath:Ljava/lang/String;
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_0 .. :try_end_0} :catch_1

    .line 201
    return-void

    .line 194
    :catch_0
    move-exception v0

    .line 195
    .local v0, err:Lorg/eclipse/jgit/errors/TransportException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->close()V

    .line 196
    throw v0

    .line 197
    .end local v0           #err:Lorg/eclipse/jgit/errors/TransportException;
    :catch_1
    move-exception v1

    .line 198
    .local v1, je:Lcom/jcraft/jsch/SftpException;
    new-instance v2, Lorg/eclipse/jgit/errors/TransportException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Can\'t enter "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p2, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->objectsPath:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lcom/jcraft/jsch/SftpException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private loose(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref$Storage;
    .locals 2
    .parameter "r"

    .prologue
    .line 447
    if-eqz p1, :cond_0

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getStorage()Lorg/eclipse/jgit/lib/Ref$Storage;

    move-result-object v0

    sget-object v1, Lorg/eclipse/jgit/lib/Ref$Storage;->PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

    if-ne v0, v1, :cond_0

    .line 448
    sget-object v0, Lorg/eclipse/jgit/lib/Ref$Storage;->LOOSE_PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

    .line 449
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lorg/eclipse/jgit/lib/Ref$Storage;->LOOSE:Lorg/eclipse/jgit/lib/Ref$Storage;

    goto :goto_0
.end method

.method private mkdir_p(Ljava/lang/String;)V
    .locals 6
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 349
    const/16 v3, 0x2f

    invoke-virtual {p1, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 350
    .local v2, s:I
    if-gtz v2, :cond_0

    .line 370
    :goto_0
    return-void

    .line 353
    :cond_0
    const/4 v3, 0x0

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 355
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    invoke-virtual {v3, p1}, Lcom/jcraft/jsch/ChannelSftp;->mkdir(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 356
    :catch_0
    move-exception v0

    .line 357
    .local v0, je:Lcom/jcraft/jsch/SftpException;
    iget v3, v0, Lcom/jcraft/jsch/SftpException;->id:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 358
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->mkdir_p(Ljava/lang/String;)V

    .line 360
    :try_start_1
    iget-object v3, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    invoke-virtual {v3, p1}, Lcom/jcraft/jsch/ChannelSftp;->mkdir(Ljava/lang/String;)V
    :try_end_1
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 362
    :catch_1
    move-exception v1

    .line 363
    .local v1, je2:Lcom/jcraft/jsch/SftpException;
    move-object v0, v1

    .line 367
    .end local v1           #je2:Lcom/jcraft/jsch/SftpException;
    :cond_1
    new-instance v3, Lorg/eclipse/jgit/errors/TransportException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Can\'t mkdir "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->objectsPath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/jcraft/jsch/SftpException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method private readLooseRefs(Ljava/util/TreeMap;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .parameter
    .parameter "dir"
    .parameter "prefix"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 385
    .local p1, avail:Ljava/util/TreeMap;,"Ljava/util/TreeMap<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    :try_start_0
    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    invoke-virtual {v6, p2}, Lcom/jcraft/jsch/ChannelSftp;->ls(Ljava/lang/String;)Ljava/util/Vector;
    :try_end_0
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 391
    .local v3, list:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/jcraft/jsch/ChannelSftp$LsEntry;>;"
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jcraft/jsch/ChannelSftp$LsEntry;

    .line 392
    .local v0, ent:Lcom/jcraft/jsch/ChannelSftp$LsEntry;
    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->getFilename()Ljava/lang/String;

    move-result-object v4

    .line 393
    .local v4, n:Ljava/lang/String;
    const-string v6, "."

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    const-string v6, ".."

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 396
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 397
    .local v5, nPath:Ljava/lang/String;
    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->getAttrs()Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v6

    invoke-virtual {v6}, Lcom/jcraft/jsch/SftpATTRS;->isDir()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 398
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, p1, v5, v6}, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->readLooseRefs(Ljava/util/TreeMap;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 386
    .end local v0           #ent:Lcom/jcraft/jsch/ChannelSftp$LsEntry;
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v3           #list:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/jcraft/jsch/ChannelSftp$LsEntry;>;"
    .end local v4           #n:Ljava/lang/String;
    .end local v5           #nPath:Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 387
    .local v2, je:Lcom/jcraft/jsch/SftpException;
    new-instance v6, Lorg/eclipse/jgit/errors/TransportException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Can\'t ls "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->objectsPath:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Lcom/jcraft/jsch/SftpException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v2}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 400
    .end local v2           #je:Lcom/jcraft/jsch/SftpException;
    .restart local v0       #ent:Lcom/jcraft/jsch/ChannelSftp$LsEntry;
    .restart local v1       #i$:Ljava/util/Iterator;
    .restart local v3       #list:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/jcraft/jsch/ChannelSftp$LsEntry;>;"
    .restart local v4       #n:Ljava/lang/String;
    .restart local v5       #nPath:Ljava/lang/String;
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, p1, v5, v6}, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->readRef(Ljava/util/TreeMap;Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    goto/16 :goto_0

    .line 402
    .end local v0           #ent:Lcom/jcraft/jsch/ChannelSftp$LsEntry;
    .end local v4           #n:Ljava/lang/String;
    .end local v5           #nPath:Ljava/lang/String;
    :cond_2
    return-void
.end method

.method private readRef(Ljava/util/TreeMap;Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;
    .locals 10
    .parameter
    .parameter "path"
    .parameter "name"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lorg/eclipse/jgit/lib/Ref;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .local p1, avail:Ljava/util/TreeMap;,"Ljava/util/TreeMap<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    const/4 v5, 0x0

    .line 408
    :try_start_0
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->openReader(Ljava/lang/String;)Ljava/io/BufferedReader;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 410
    .local v0, br:Ljava/io/BufferedReader;
    :try_start_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v2

    .line 412
    .local v2, line:Ljava/lang/String;
    :try_start_2
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 421
    if-nez v2, :cond_0

    .line 422
    new-instance v7, Lorg/eclipse/jgit/errors/TransportException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Empty ref: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 412
    .end local v2           #line:Ljava/lang/String;
    :catchall_0
    move-exception v7

    :try_start_3
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    throw v7
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 414
    .end local v0           #br:Ljava/io/BufferedReader;
    :catch_0
    move-exception v3

    .line 440
    :goto_0
    return-object v5

    .line 416
    :catch_1
    move-exception v1

    .line 417
    .local v1, err:Ljava/io/IOException;
    new-instance v7, Lorg/eclipse/jgit/errors/TransportException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Cannot read "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->objectsPath:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ": "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v1}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 424
    .end local v1           #err:Ljava/io/IOException;
    .restart local v0       #br:Ljava/io/BufferedReader;
    .restart local v2       #line:Ljava/lang/String;
    :cond_0
    const-string v7, "ref: "

    invoke-virtual {v2, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 425
    const-string v7, "ref: "

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v2, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 426
    .local v6, target:Ljava/lang/String;
    invoke-virtual {p1, v6}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/lib/Ref;

    .line 427
    .local v4, r:Lorg/eclipse/jgit/lib/Ref;
    if-nez v4, :cond_1

    .line 428
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "../"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, p1, v7, v6}, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->readRef(Ljava/util/TreeMap;Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v4

    .line 429
    :cond_1
    if-nez v4, :cond_2

    .line 430
    new-instance v4, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;

    .end local v4           #r:Lorg/eclipse/jgit/lib/Ref;
    sget-object v7, Lorg/eclipse/jgit/lib/Ref$Storage;->NEW:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-direct {v4, v7, v6, v5}, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 431
    .restart local v4       #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_2
    new-instance v5, Lorg/eclipse/jgit/lib/SymbolicRef;

    invoke-direct {v5, p3, v4}, Lorg/eclipse/jgit/lib/SymbolicRef;-><init>(Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;)V

    .line 432
    .end local v4           #r:Lorg/eclipse/jgit/lib/Ref;
    .local v5, r:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7, v5}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 436
    .end local v5           #r:Lorg/eclipse/jgit/lib/Ref;
    .end local v6           #target:Ljava/lang/String;
    :cond_3
    invoke-static {v2}, Lorg/eclipse/jgit/lib/ObjectId;->isId(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 437
    new-instance v4, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;

    invoke-virtual {p1, p3}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/eclipse/jgit/lib/Ref;

    invoke-direct {p0, v7}, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->loose(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref$Storage;

    move-result-object v7

    invoke-static {v2}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v8

    invoke-direct {v4, v7, p3, v8}, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 439
    .restart local v4       #r:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v4}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7, v4}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v5, v4

    .line 440
    goto/16 :goto_0

    .line 443
    .end local v4           #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_4
    new-instance v7, Lorg/eclipse/jgit/errors/TransportException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Bad ref: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ": "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;)V

    throw v7
.end method


# virtual methods
.method close()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 454
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    if-eqz v0, :cond_1

    .line 456
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelSftp;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 457
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelSftp;->disconnect()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 459
    :cond_0
    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    .line 462
    :cond_1
    return-void

    .line 459
    :catchall_0
    move-exception v0

    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    throw v0
.end method

.method deleteFile(Ljava/lang/String;)V
    .locals 6
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x2f

    .line 278
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    invoke-virtual {v3, p1}, Lcom/jcraft/jsch/ChannelSftp;->rm(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_0 .. :try_end_0} :catch_0

    .line 288
    move-object v0, p1

    .line 289
    .local v0, dir:Ljava/lang/String;
    invoke-virtual {v0, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 290
    .local v2, s:I
    :goto_0
    if-lez v2, :cond_0

    .line 292
    const/4 v3, 0x0

    :try_start_1
    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 293
    iget-object v3, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/ChannelSftp;->rmdir(Ljava/lang/String;)V

    .line 294
    const/16 v3, 0x2f

    invoke-virtual {v0, v3}, Ljava/lang/String;->lastIndexOf(I)I
    :try_end_1
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v2

    goto :goto_0

    .line 279
    .end local v0           #dir:Ljava/lang/String;
    .end local v2           #s:I
    :catch_0
    move-exception v1

    .line 280
    .local v1, je:Lcom/jcraft/jsch/SftpException;
    iget v3, v1, Lcom/jcraft/jsch/SftpException;->id:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 303
    .end local v1           #je:Lcom/jcraft/jsch/SftpException;
    :cond_0
    :goto_1
    return-void

    .line 282
    .restart local v1       #je:Lcom/jcraft/jsch/SftpException;
    :cond_1
    new-instance v3, Lorg/eclipse/jgit/errors/TransportException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Can\'t delete "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->objectsPath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Lcom/jcraft/jsch/SftpException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 295
    .end local v1           #je:Lcom/jcraft/jsch/SftpException;
    .restart local v0       #dir:Ljava/lang/String;
    .restart local v2       #s:I
    :catch_1
    move-exception v1

    .line 300
    .restart local v1       #je:Lcom/jcraft/jsch/SftpException;
    goto :goto_1
.end method

.method getAlternates()Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 211
    :try_start_0
    const-string v1, "info/alternates"

    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->readAlternates(Ljava/lang/String;)Ljava/util/Collection;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 213
    :goto_0
    return-object v1

    .line 212
    :catch_0
    move-exception v0

    .line 213
    .local v0, err:Ljava/io/FileNotFoundException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method getPackNames()Ljava/util/Collection;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 225
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 227
    .local v8, packs:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    :try_start_0
    iget-object v9, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    const-string v10, "pack"

    invoke-virtual {v9, v10}, Lcom/jcraft/jsch/ChannelSftp;->ls(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v5

    .line 231
    .local v5, list:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/jcraft/jsch/ChannelSftp$LsEntry;>;"
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 232
    .local v1, files:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/jcraft/jsch/ChannelSftp$LsEntry;>;"
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 234
    .local v6, mtimes:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jcraft/jsch/ChannelSftp$LsEntry;

    .line 235
    .local v0, ent:Lcom/jcraft/jsch/ChannelSftp$LsEntry;
    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->getFilename()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v9, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 255
    .end local v0           #ent:Lcom/jcraft/jsch/ChannelSftp$LsEntry;
    .end local v1           #files:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/jcraft/jsch/ChannelSftp$LsEntry;>;"
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v5           #list:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/jcraft/jsch/ChannelSftp$LsEntry;>;"
    .end local v6           #mtimes:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    :catch_0
    move-exception v4

    .line 256
    .local v4, je:Lcom/jcraft/jsch/SftpException;
    new-instance v9, Lorg/eclipse/jgit/errors/TransportException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Can\'t ls "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->objectsPath:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "/pack: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v4}, Lcom/jcraft/jsch/SftpException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v4}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 236
    .end local v4           #je:Lcom/jcraft/jsch/SftpException;
    .restart local v1       #files:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/jcraft/jsch/ChannelSftp$LsEntry;>;"
    .restart local v2       #i$:Ljava/util/Iterator;
    .restart local v5       #list:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/jcraft/jsch/ChannelSftp$LsEntry;>;"
    .restart local v6       #mtimes:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    :cond_0
    :try_start_1
    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jcraft/jsch/ChannelSftp$LsEntry;

    .line 237
    .restart local v0       #ent:Lcom/jcraft/jsch/ChannelSftp$LsEntry;
    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->getFilename()Ljava/lang/String;

    move-result-object v7

    .line 238
    .local v7, n:Ljava/lang/String;
    const-string v9, "pack-"

    invoke-virtual {v7, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    const-string v9, ".pack"

    invoke-virtual {v7, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 241
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v10, 0x0

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v11

    add-int/lit8 v11, v11, -0x5

    invoke-virtual {v7, v10, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ".idx"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 242
    .local v3, in:Ljava/lang/String;
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 245
    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->getAttrs()Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v9

    invoke-virtual {v9}, Lcom/jcraft/jsch/SftpATTRS;->getMTime()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v6, v7, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    invoke-interface {v8, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 249
    .end local v0           #ent:Lcom/jcraft/jsch/ChannelSftp$LsEntry;
    .end local v3           #in:Ljava/lang/String;
    .end local v7           #n:Ljava/lang/String;
    :cond_2
    new-instance v9, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB$1;

    invoke-direct {v9, p0, v6}, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB$1;-><init>(Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;Ljava/util/HashMap;)V

    invoke-static {v8, v9}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
    :try_end_1
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_1 .. :try_end_1} :catch_0

    .line 259
    return-object v8
.end method

.method getURI()Lorg/eclipse/jgit/transport/URIish;
    .locals 2

    .prologue
    .line 205
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->this$0:Lorg/eclipse/jgit/transport/TransportSftp;

    iget-object v0, v0, Lorg/eclipse/jgit/transport/TransportSftp;->uri:Lorg/eclipse/jgit/transport/URIish;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->objectsPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/URIish;->setPath(Ljava/lang/String;)Lorg/eclipse/jgit/transport/URIish;

    move-result-object v0

    return-object v0
.end method

.method open(Ljava/lang/String;)Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;
    .locals 6
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 265
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    invoke-virtual {v2, p1}, Lcom/jcraft/jsch/ChannelSftp;->lstat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v0

    .line 266
    .local v0, a:Lcom/jcraft/jsch/SftpATTRS;
    new-instance v2, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    invoke-virtual {v3, p1}, Lcom/jcraft/jsch/ChannelSftp;->get(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    invoke-virtual {v0}, Lcom/jcraft/jsch/SftpATTRS;->getSize()J

    move-result-wide v4

    invoke-direct {v2, v3, v4, v5}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;-><init>(Ljava/io/InputStream;J)V
    :try_end_0
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 267
    .end local v0           #a:Lcom/jcraft/jsch/SftpATTRS;
    :catch_0
    move-exception v1

    .line 268
    .local v1, je:Lcom/jcraft/jsch/SftpException;
    iget v2, v1, Lcom/jcraft/jsch/SftpException;->id:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    .line 269
    new-instance v2, Ljava/io/FileNotFoundException;

    invoke-direct {v2, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 270
    :cond_0
    new-instance v2, Lorg/eclipse/jgit/errors/TransportException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Can\'t get "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->objectsPath:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lcom/jcraft/jsch/SftpException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method openAlternate(Ljava/lang/String;)Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
    .locals 2
    .parameter "location"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 220
    new-instance v0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->this$0:Lorg/eclipse/jgit/transport/TransportSftp;

    invoke-direct {v0, v1, p0, p1}, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;-><init>(Lorg/eclipse/jgit/transport/TransportSftp;Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;Ljava/lang/String;)V

    return-object v0
.end method

.method readAdvertisedRefs()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 373
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 374
    .local v0, avail:Ljava/util/TreeMap;,"Ljava/util/TreeMap<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->readPackedRefs(Ljava/util/Map;)V

    .line 375
    const-string v1, "../HEAD"

    const-string v2, "HEAD"

    invoke-direct {p0, v0, v1, v2}, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->readRef(Ljava/util/TreeMap;Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    .line 376
    const-string v1, "../refs"

    const-string v2, "refs/"

    invoke-direct {p0, v0, v1, v2}, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->readLooseRefs(Ljava/util/TreeMap;Ljava/lang/String;Ljava/lang/String;)V

    .line 377
    return-object v0
.end method

.method writeFile(Ljava/lang/String;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/String;)Ljava/io/OutputStream;
    .locals 5
    .parameter "path"
    .parameter "monitor"
    .parameter "monitorTask"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 310
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    invoke-virtual {v2, p1}, Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/lang/String;)Ljava/io/OutputStream;
    :try_end_0
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 315
    :goto_0
    return-object v2

    .line 311
    :catch_0
    move-exception v0

    .line 312
    .local v0, je:Lcom/jcraft/jsch/SftpException;
    iget v2, v0, Lcom/jcraft/jsch/SftpException;->id:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    .line 313
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->mkdir_p(Ljava/lang/String;)V

    .line 315
    :try_start_1
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    invoke-virtual {v2, p1}, Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/lang/String;)Ljava/io/OutputStream;
    :try_end_1
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    goto :goto_0

    .line 316
    :catch_1
    move-exception v1

    .line 317
    .local v1, je2:Lcom/jcraft/jsch/SftpException;
    move-object v0, v1

    .line 321
    .end local v1           #je2:Lcom/jcraft/jsch/SftpException;
    :cond_0
    new-instance v2, Lorg/eclipse/jgit/errors/TransportException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Can\'t write "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->objectsPath:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/jcraft/jsch/SftpException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method writeFile(Ljava/lang/String;[B)V
    .locals 6
    .parameter "path"
    .parameter "data"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 328
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".lock"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 330
    .local v2, lock:Ljava/lang/String;
    :try_start_0
    invoke-super {p0, v2, p2}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->writeFile(Ljava/lang/String;[B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 332
    :try_start_1
    iget-object v3, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    invoke-virtual {v3, v2, p1}, Lcom/jcraft/jsch/ChannelSftp;->rename(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 346
    return-void

    .line 333
    :catch_0
    move-exception v1

    .line 334
    .local v1, je:Lcom/jcraft/jsch/SftpException;
    :try_start_2
    new-instance v3, Lorg/eclipse/jgit/errors/TransportException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Can\'t write "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->objectsPath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Lcom/jcraft/jsch/SftpException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 337
    .end local v1           #je:Lcom/jcraft/jsch/SftpException;
    :catch_1
    move-exception v0

    .line 339
    .local v0, err:Ljava/io/IOException;
    :try_start_3
    iget-object v3, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->ftp:Lcom/jcraft/jsch/ChannelSftp;

    invoke-virtual {v3, v2}, Lcom/jcraft/jsch/ChannelSftp;->rm(Ljava/lang/String;)V
    :try_end_3
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_3 .. :try_end_3} :catch_2

    .line 344
    :goto_0
    throw v0

    .line 340
    :catch_2
    move-exception v3

    goto :goto_0
.end method
