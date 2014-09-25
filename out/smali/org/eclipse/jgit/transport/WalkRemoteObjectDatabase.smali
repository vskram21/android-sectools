.class abstract Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
.super Ljava/lang/Object;
.source "WalkRemoteObjectDatabase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;
    }
.end annotation


# static fields
.field static final INFO_ALTERNATES:Ljava/lang/String; = "info/alternates"

.field static final INFO_HTTP_ALTERNATES:Ljava/lang/String; = "info/http-alternates"

.field static final INFO_PACKS:Ljava/lang/String; = "info/packs"

.field static final INFO_REFS:Ljava/lang/String; = "../info/refs"

.field static final ROOT_DIR:Ljava/lang/String; = "../"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 475
    return-void
.end method

.method private readPackedRefsImpl(Ljava/util/Map;Ljava/io/BufferedReader;)V
    .locals 12
    .parameter
    .parameter "br"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;",
            "Ljava/io/BufferedReader;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p1, avail:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 439
    const/4 v1, 0x0

    .line 440
    .local v1, last:Lorg/eclipse/jgit/lib/Ref;
    const/4 v5, 0x0

    .line 442
    .local v5, peeled:Z
    :cond_0
    :goto_0
    invoke-virtual {p2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 443
    .local v3, line:Ljava/lang/String;
    if-nez v3, :cond_1

    .line 473
    return-void

    .line 445
    :cond_1
    invoke-virtual {v3, v10}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x23

    if-ne v7, v8, :cond_2

    .line 446
    const-string v7, "# pack-refs with:"

    invoke-virtual {v3, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 447
    const-string v7, "# pack-refs with:"

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v3, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 448
    const-string v7, " peeled"

    invoke-virtual {v3, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    goto :goto_0

    .line 452
    :cond_2
    invoke-virtual {v3, v10}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x5e

    if-ne v7, v8, :cond_4

    .line 453
    if-nez v1, :cond_3

    .line 454
    new-instance v7, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->peeledLineBeforeRef:Ljava/lang/String;

    invoke-direct {v7, v8}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 455
    :cond_3
    invoke-virtual {v3, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    .line 456
    .local v0, id:Lorg/eclipse/jgit/lib/ObjectId;
    new-instance v2, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledTag;

    sget-object v7, Lorg/eclipse/jgit/lib/Ref$Storage;->PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v9

    invoke-direct {v2, v7, v8, v9, v0}, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledTag;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 458
    .end local v1           #last:Lorg/eclipse/jgit/lib/Ref;
    .local v2, last:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-interface {p1, v7, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v2

    .line 459
    .end local v2           #last:Lorg/eclipse/jgit/lib/Ref;
    .restart local v1       #last:Lorg/eclipse/jgit/lib/Ref;
    goto :goto_0

    .line 462
    .end local v0           #id:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_4
    const/16 v7, 0x20

    invoke-virtual {v3, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    .line 463
    .local v6, sp:I
    if-gez v6, :cond_5

    .line 464
    new-instance v7, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->unrecognizedRef:Ljava/lang/String;

    new-array v9, v11, [Ljava/lang/Object;

    aput-object v3, v9, v10

    invoke-static {v8, v9}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 465
    :cond_5
    invoke-virtual {v3, v10, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    .line 466
    .restart local v0       #id:Lorg/eclipse/jgit/lib/ObjectId;
    add-int/lit8 v7, v6, 0x1

    invoke-virtual {v3, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 467
    .local v4, name:Ljava/lang/String;
    if-eqz v5, :cond_6

    .line 468
    new-instance v1, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledNonTag;

    .end local v1           #last:Lorg/eclipse/jgit/lib/Ref;
    sget-object v7, Lorg/eclipse/jgit/lib/Ref$Storage;->PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-direct {v1, v7, v4, v0}, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledNonTag;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 471
    .restart local v1       #last:Lorg/eclipse/jgit/lib/Ref;
    :goto_1
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-interface {p1, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 470
    :cond_6
    new-instance v1, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;

    .end local v1           #last:Lorg/eclipse/jgit/lib/Ref;
    sget-object v7, Lorg/eclipse/jgit/lib/Ref$Storage;->PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-direct {v1, v7, v4, v0}, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .restart local v1       #last:Lorg/eclipse/jgit/lib/Ref;
    goto :goto_1
.end method


# virtual methods
.method abstract close()V
.end method

.method deleteFile(Ljava/lang/String;)V
    .locals 4
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 203
    new-instance v0, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->deletingNotSupported:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method deleteRef(Ljava/lang/String;)V
    .locals 2
    .parameter "name"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 282
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "../"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->deleteFile(Ljava/lang/String;)V

    .line 283
    return-void
.end method

.method deleteRefLog(Ljava/lang/String;)V
    .locals 2
    .parameter "name"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 295
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "../logs/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->deleteFile(Ljava/lang/String;)V

    .line 296
    return-void
.end method

.method abstract getAlternates()Ljava/util/Collection;
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
.end method

.method abstract getPackNames()Ljava/util/Collection;
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
.end method

.method abstract getURI()Lorg/eclipse/jgit/transport/URIish;
.end method

.method abstract open(Ljava/lang/String;)Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method abstract openAlternate(Ljava/lang/String;)Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method openReader(Ljava/lang/String;)Ljava/io/BufferedReader;
    .locals 4
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 365
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->open(Ljava/lang/String;)Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;

    move-result-object v1

    iget-object v0, v1, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;->in:Ljava/io/InputStream;

    .line 366
    .local v0, is:Ljava/io/InputStream;
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    sget-object v3, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {v2, v0, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    return-object v1
.end method

.method readAlternates(Ljava/lang/String;)Ljava/util/Collection;
    .locals 5
    .parameter "listPath"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
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
    .line 394
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->openReader(Ljava/lang/String;)Ljava/io/BufferedReader;

    move-result-object v1

    .line 396
    .local v1, br:Ljava/io/BufferedReader;
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 398
    .local v0, alts:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;>;"
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 399
    .local v2, line:Ljava/lang/String;
    if-nez v2, :cond_0

    .line 407
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    return-object v0

    .line 401
    :cond_0
    :try_start_1
    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 402
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 403
    :cond_1
    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->openAlternate(Ljava/lang/String;)Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 407
    .end local v0           #alts:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;>;"
    .end local v2           #line:Ljava/lang/String;
    :catchall_0
    move-exception v3

    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    throw v3
.end method

.method protected readPackedRefs(Ljava/util/Map;)V
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 423
    .local p1, avail:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    :try_start_0
    const-string v2, "../packed-refs"

    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->openReader(Ljava/lang/String;)Ljava/io/BufferedReader;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 426
    .local v0, br:Ljava/io/BufferedReader;
    :try_start_1
    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->readPackedRefsImpl(Ljava/util/Map;Ljava/io/BufferedReader;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 428
    :try_start_2
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 435
    .end local v0           #br:Ljava/io/BufferedReader;
    :goto_0
    return-void

    .line 428
    .restart local v0       #br:Ljava/io/BufferedReader;
    :catchall_0
    move-exception v2

    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    throw v2
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 430
    .end local v0           #br:Ljava/io/BufferedReader;
    :catch_0
    move-exception v2

    goto :goto_0

    .line 432
    :catch_1
    move-exception v1

    .line 433
    .local v1, e:Ljava/io/IOException;
    new-instance v2, Lorg/eclipse/jgit/errors/TransportException;

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->getURI()Lorg/eclipse/jgit/transport/URIish;

    move-result-object v3

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->errorInPackedRefs:Ljava/lang/String;

    invoke-direct {v2, v3, v4, v1}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method writeFile(Ljava/lang/String;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/String;)Ljava/io/OutputStream;
    .locals 4
    .parameter "path"
    .parameter "monitor"
    .parameter "monitorTask"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 235
    new-instance v0, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->writingNotSupported:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method writeFile(Ljava/lang/String;[B)V
    .locals 2
    .parameter "path"
    .parameter "data"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 264
    invoke-virtual {p0, p1, v1, v1}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->writeFile(Ljava/lang/String;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v0

    .line 266
    .local v0, os:Ljava/io/OutputStream;
    :try_start_0
    invoke-virtual {v0, p2}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 268
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 270
    return-void

    .line 268
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    throw v1
.end method

.method writeInfoPacks(Ljava/util/Collection;)V
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 337
    .local p1, packNames:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 338
    .local v2, w:Ljava/lang/StringBuilder;
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 339
    .local v1, n:Ljava/lang/String;
    const-string v3, "P "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 341
    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 343
    .end local v1           #n:Ljava/lang/String;
    :cond_0
    const-string v3, "info/packs"

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->writeFile(Ljava/lang/String;[B)V

    .line 344
    return-void
.end method

.method writeRef(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 3
    .parameter "name"
    .parameter "value"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 315
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/16 v1, 0x29

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 316
    .local v0, b:Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p2, v0}, Lorg/eclipse/jgit/lib/ObjectId;->copyTo(Ljava/io/OutputStream;)V

    .line 317
    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 319
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "../"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->writeFile(Ljava/lang/String;[B)V

    .line 320
    return-void
.end method
