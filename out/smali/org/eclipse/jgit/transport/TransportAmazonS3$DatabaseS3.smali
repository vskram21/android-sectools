.class Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;
.super Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
.source "TransportAmazonS3.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportAmazonS3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DatabaseS3"
.end annotation


# instance fields
.field private final bucketName:Ljava/lang/String;

.field private final objectsKey:Ljava/lang/String;

.field final synthetic this$0:Lorg/eclipse/jgit/transport/TransportAmazonS3;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/TransportAmazonS3;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter "b"
    .parameter "o"

    .prologue
    .line 220
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->this$0:Lorg/eclipse/jgit/transport/TransportAmazonS3;

    invoke-direct {p0}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;-><init>()V

    .line 221
    iput-object p2, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->bucketName:Ljava/lang/String;

    .line 222
    iput-object p3, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->objectsKey:Ljava/lang/String;

    .line 223
    return-void
.end method

.method private loose(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref$Storage;
    .locals 2
    .parameter "r"

    .prologue
    .line 367
    if-eqz p1, :cond_0

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getStorage()Lorg/eclipse/jgit/lib/Ref$Storage;

    move-result-object v0

    sget-object v1, Lorg/eclipse/jgit/lib/Ref$Storage;->PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

    if-ne v0, v1, :cond_0

    .line 368
    sget-object v0, Lorg/eclipse/jgit/lib/Ref$Storage;->LOOSE_PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

    .line 369
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lorg/eclipse/jgit/lib/Ref$Storage;->LOOSE:Lorg/eclipse/jgit/lib/Ref$Storage;

    goto :goto_0
.end method

.method private readLooseRefs(Ljava/util/TreeMap;)V
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/TreeMap",
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
    .line 315
    .local p1, avail:Ljava/util/TreeMap;,"Ljava/util/TreeMap<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->this$0:Lorg/eclipse/jgit/transport/TransportAmazonS3;

    #getter for: Lorg/eclipse/jgit/transport/TransportAmazonS3;->s3:Lorg/eclipse/jgit/transport/AmazonS3;
    invoke-static {v3}, Lorg/eclipse/jgit/transport/TransportAmazonS3;->access$100(Lorg/eclipse/jgit/transport/TransportAmazonS3;)Lorg/eclipse/jgit/transport/AmazonS3;

    move-result-object v3

    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->this$0:Lorg/eclipse/jgit/transport/TransportAmazonS3;

    #getter for: Lorg/eclipse/jgit/transport/TransportAmazonS3;->bucket:Ljava/lang/String;
    invoke-static {v4}, Lorg/eclipse/jgit/transport/TransportAmazonS3;->access$000(Lorg/eclipse/jgit/transport/TransportAmazonS3;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "../refs"

    invoke-direct {p0, v5}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->resolveKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/eclipse/jgit/transport/AmazonS3;->list(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 317
    .local v2, n:Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "refs/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, p1, v3}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->readRef(Ljava/util/TreeMap;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 318
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #n:Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 319
    .local v0, e:Ljava/io/IOException;
    new-instance v3, Lorg/eclipse/jgit/errors/TransportException;

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->getURI()Lorg/eclipse/jgit/transport/URIish;

    move-result-object v4

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->cannotListRefs:Ljava/lang/String;

    invoke-direct {v3, v4, v5, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 321
    .end local v0           #e:Ljava/io/IOException;
    .restart local v1       #i$:Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method private readRef(Ljava/util/TreeMap;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;
    .locals 13
    .parameter
    .parameter "rn"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;",
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
    .line 326
    .local p1, avail:Ljava/util/TreeMap;,"Ljava/util/TreeMap<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "../"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 328
    .local v5, ref:Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0, v5}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->openReader(Ljava/lang/String;)Ljava/io/BufferedReader;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 330
    .local v0, br:Ljava/io/BufferedReader;
    :try_start_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v6

    .line 332
    .local v6, s:Ljava/lang/String;
    :try_start_2
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 341
    if-nez v6, :cond_0

    .line 342
    new-instance v8, Lorg/eclipse/jgit/errors/TransportException;

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->getURI()Lorg/eclipse/jgit/transport/URIish;

    move-result-object v9

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v10

    iget-object v10, v10, Lorg/eclipse/jgit/internal/JGitText;->transportExceptionEmptyRef:Ljava/lang/String;

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object p2, v11, v12

    invoke-static {v10, v11}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v8

    .line 332
    .end local v6           #s:Ljava/lang/String;
    :catchall_0
    move-exception v8

    :try_start_3
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    throw v8
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 334
    .end local v0           #br:Ljava/io/BufferedReader;
    :catch_0
    move-exception v2

    .line 335
    .local v2, noRef:Ljava/io/FileNotFoundException;
    const/4 v4, 0x0

    .line 360
    .end local v2           #noRef:Ljava/io/FileNotFoundException;
    :goto_0
    return-object v4

    .line 336
    :catch_1
    move-exception v1

    .line 337
    .local v1, err:Ljava/io/IOException;
    new-instance v8, Lorg/eclipse/jgit/errors/TransportException;

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->getURI()Lorg/eclipse/jgit/transport/URIish;

    move-result-object v9

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v10

    iget-object v10, v10, Lorg/eclipse/jgit/internal/JGitText;->transportExceptionReadRef:Ljava/lang/String;

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v5, v11, v12

    invoke-static {v10, v11}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v9, v10, v1}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 344
    .end local v1           #err:Ljava/io/IOException;
    .restart local v0       #br:Ljava/io/BufferedReader;
    .restart local v6       #s:Ljava/lang/String;
    :cond_0
    const-string v8, "ref: "

    invoke-virtual {v6, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 345
    const-string v8, "ref: "

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {v6, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .line 346
    .local v7, target:Ljava/lang/String;
    invoke-virtual {p1, v7}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/lib/Ref;

    .line 347
    .local v3, r:Lorg/eclipse/jgit/lib/Ref;
    if-nez v3, :cond_1

    .line 348
    invoke-direct {p0, p1, v7}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->readRef(Ljava/util/TreeMap;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v3

    .line 349
    :cond_1
    if-nez v3, :cond_2

    .line 350
    new-instance v3, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;

    .end local v3           #r:Lorg/eclipse/jgit/lib/Ref;
    sget-object v8, Lorg/eclipse/jgit/lib/Ref$Storage;->NEW:Lorg/eclipse/jgit/lib/Ref$Storage;

    const/4 v9, 0x0

    invoke-direct {v3, v8, v7, v9}, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 351
    .restart local v3       #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_2
    new-instance v4, Lorg/eclipse/jgit/lib/SymbolicRef;

    invoke-direct {v4, p2, v3}, Lorg/eclipse/jgit/lib/SymbolicRef;-><init>(Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;)V

    .line 352
    .end local v3           #r:Lorg/eclipse/jgit/lib/Ref;
    .local v4, r:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v4}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8, v4}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 356
    .end local v4           #r:Lorg/eclipse/jgit/lib/Ref;
    .end local v7           #target:Ljava/lang/String;
    :cond_3
    invoke-static {v6}, Lorg/eclipse/jgit/lib/ObjectId;->isId(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 357
    new-instance v3, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;

    invoke-virtual {p1, p2}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/eclipse/jgit/lib/Ref;

    invoke-direct {p0, v8}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->loose(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref$Storage;

    move-result-object v8

    invoke-static {v6}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v9

    invoke-direct {v3, v8, p2, v9}, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 359
    .restart local v3       #r:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8, v3}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v4, v3

    .line 360
    goto :goto_0

    .line 363
    .end local v3           #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_4
    new-instance v8, Lorg/eclipse/jgit/errors/TransportException;

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->getURI()Lorg/eclipse/jgit/transport/URIish;

    move-result-object v9

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v10

    iget-object v10, v10, Lorg/eclipse/jgit/internal/JGitText;->transportExceptionBadRef:Ljava/lang/String;

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object p2, v11, v12

    const/4 v12, 0x1

    aput-object v6, v11, v12

    invoke-static {v10, v11}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v8
.end method

.method private resolveKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "subpath"

    .prologue
    const/4 v2, 0x0

    .line 226
    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 227
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 228
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->objectsKey:Ljava/lang/String;

    .line 229
    .local v0, k:Ljava/lang/String;
    :goto_0
    const-string v1, "../"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 230
    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 231
    const/4 v1, 0x3

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 233
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method close()V
    .locals 0

    .prologue
    .line 375
    return-void
.end method

.method deleteFile(Ljava/lang/String;)V
    .locals 3
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 289
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->this$0:Lorg/eclipse/jgit/transport/TransportAmazonS3;

    #getter for: Lorg/eclipse/jgit/transport/TransportAmazonS3;->s3:Lorg/eclipse/jgit/transport/AmazonS3;
    invoke-static {v0}, Lorg/eclipse/jgit/transport/TransportAmazonS3;->access$100(Lorg/eclipse/jgit/transport/TransportAmazonS3;)Lorg/eclipse/jgit/transport/AmazonS3;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->this$0:Lorg/eclipse/jgit/transport/TransportAmazonS3;

    #getter for: Lorg/eclipse/jgit/transport/TransportAmazonS3;->bucket:Ljava/lang/String;
    invoke-static {v1}, Lorg/eclipse/jgit/transport/TransportAmazonS3;->access$000(Lorg/eclipse/jgit/transport/TransportAmazonS3;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->resolveKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/transport/AmazonS3;->delete(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    return-void
.end method

.method getAlternates()Ljava/util/Collection;
    .locals 1
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
    .line 248
    :try_start_0
    const-string v0, "info/alternates"

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->readAlternates(Ljava/lang/String;)Ljava/util/Collection;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 252
    :goto_0
    return-object v0

    .line 249
    :catch_0
    move-exception v0

    .line 252
    const/4 v0, 0x0

    goto :goto_0
.end method

.method getPackNames()Ljava/util/Collection;
    .locals 8
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
    .line 263
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 264
    .local v0, have:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->this$0:Lorg/eclipse/jgit/transport/TransportAmazonS3;

    #getter for: Lorg/eclipse/jgit/transport/TransportAmazonS3;->s3:Lorg/eclipse/jgit/transport/AmazonS3;
    invoke-static {v5}, Lorg/eclipse/jgit/transport/TransportAmazonS3;->access$100(Lorg/eclipse/jgit/transport/TransportAmazonS3;)Lorg/eclipse/jgit/transport/AmazonS3;

    move-result-object v5

    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->this$0:Lorg/eclipse/jgit/transport/TransportAmazonS3;

    #getter for: Lorg/eclipse/jgit/transport/TransportAmazonS3;->bucket:Ljava/lang/String;
    invoke-static {v6}, Lorg/eclipse/jgit/transport/TransportAmazonS3;->access$000(Lorg/eclipse/jgit/transport/TransportAmazonS3;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "pack"

    invoke-direct {p0, v7}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->resolveKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lorg/eclipse/jgit/transport/AmazonS3;->list(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 266
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 267
    .local v4, packs:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 268
    .local v3, n:Ljava/lang/String;
    const-string v5, "pack-"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    const-string v5, ".pack"

    invoke-virtual {v3, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 271
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v6, 0x0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x5

    invoke-virtual {v3, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".idx"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 272
    .local v2, in:Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 273
    invoke-interface {v4, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 275
    .end local v2           #in:Ljava/lang/String;
    .end local v3           #n:Ljava/lang/String;
    :cond_1
    return-object v4
.end method

.method getURI()Lorg/eclipse/jgit/transport/URIish;
    .locals 3

    .prologue
    .line 238
    new-instance v0, Lorg/eclipse/jgit/transport/URIish;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/URIish;-><init>()V

    .line 239
    .local v0, u:Lorg/eclipse/jgit/transport/URIish;
    const-string v1, "amazon-s3"

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/URIish;->setScheme(Ljava/lang/String;)Lorg/eclipse/jgit/transport/URIish;

    move-result-object v0

    .line 240
    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->bucketName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/URIish;->setHost(Ljava/lang/String;)Lorg/eclipse/jgit/transport/URIish;

    move-result-object v0

    .line 241
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->objectsKey:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/URIish;->setPath(Ljava/lang/String;)Lorg/eclipse/jgit/transport/URIish;

    move-result-object v0

    .line 242
    return-object v0
.end method

.method open(Ljava/lang/String;)Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;
    .locals 7
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 280
    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->this$0:Lorg/eclipse/jgit/transport/TransportAmazonS3;

    #getter for: Lorg/eclipse/jgit/transport/TransportAmazonS3;->s3:Lorg/eclipse/jgit/transport/AmazonS3;
    invoke-static {v4}, Lorg/eclipse/jgit/transport/TransportAmazonS3;->access$100(Lorg/eclipse/jgit/transport/TransportAmazonS3;)Lorg/eclipse/jgit/transport/AmazonS3;

    move-result-object v4

    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->this$0:Lorg/eclipse/jgit/transport/TransportAmazonS3;

    #getter for: Lorg/eclipse/jgit/transport/TransportAmazonS3;->bucket:Ljava/lang/String;
    invoke-static {v5}, Lorg/eclipse/jgit/transport/TransportAmazonS3;->access$000(Lorg/eclipse/jgit/transport/TransportAmazonS3;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->resolveKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/eclipse/jgit/transport/AmazonS3;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/net/URLConnection;

    move-result-object v0

    .line 281
    .local v0, c:Ljava/net/URLConnection;
    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    .line 282
    .local v3, raw:Ljava/io/InputStream;
    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->this$0:Lorg/eclipse/jgit/transport/TransportAmazonS3;

    #getter for: Lorg/eclipse/jgit/transport/TransportAmazonS3;->s3:Lorg/eclipse/jgit/transport/AmazonS3;
    invoke-static {v4}, Lorg/eclipse/jgit/transport/TransportAmazonS3;->access$100(Lorg/eclipse/jgit/transport/TransportAmazonS3;)Lorg/eclipse/jgit/transport/AmazonS3;

    move-result-object v4

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/transport/AmazonS3;->decrypt(Ljava/net/URLConnection;)Ljava/io/InputStream;

    move-result-object v1

    .line 283
    .local v1, in:Ljava/io/InputStream;
    invoke-virtual {v0}, Ljava/net/URLConnection;->getContentLength()I

    move-result v2

    .line 284
    .local v2, len:I
    new-instance v6, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;

    if-ne v3, v1, :cond_0

    int-to-long v4, v2

    :goto_0
    invoke-direct {v6, v1, v4, v5}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;-><init>(Ljava/io/InputStream;J)V

    return-object v6

    :cond_0
    const-wide/16 v4, -0x1

    goto :goto_0
.end method

.method openAlternate(Ljava/lang/String;)Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
    .locals 4
    .parameter "location"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 258
    new-instance v0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->this$0:Lorg/eclipse/jgit/transport/TransportAmazonS3;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->bucketName:Ljava/lang/String;

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->resolveKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;-><init>(Lorg/eclipse/jgit/transport/TransportAmazonS3;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method readAdvertisedRefs()Ljava/util/Map;
    .locals 2
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
    .line 305
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 306
    .local v0, avail:Ljava/util/TreeMap;,"Ljava/util/TreeMap<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->readPackedRefs(Ljava/util/Map;)V

    .line 307
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->readLooseRefs(Ljava/util/TreeMap;)V

    .line 308
    const-string v1, "HEAD"

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->readRef(Ljava/util/TreeMap;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    .line 309
    return-object v0
.end method

.method writeFile(Ljava/lang/String;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/String;)Ljava/io/OutputStream;
    .locals 3
    .parameter "path"
    .parameter "monitor"
    .parameter "monitorTask"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 296
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->this$0:Lorg/eclipse/jgit/transport/TransportAmazonS3;

    #getter for: Lorg/eclipse/jgit/transport/TransportAmazonS3;->s3:Lorg/eclipse/jgit/transport/AmazonS3;
    invoke-static {v0}, Lorg/eclipse/jgit/transport/TransportAmazonS3;->access$100(Lorg/eclipse/jgit/transport/TransportAmazonS3;)Lorg/eclipse/jgit/transport/AmazonS3;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->this$0:Lorg/eclipse/jgit/transport/TransportAmazonS3;

    #getter for: Lorg/eclipse/jgit/transport/TransportAmazonS3;->bucket:Ljava/lang/String;
    invoke-static {v1}, Lorg/eclipse/jgit/transport/TransportAmazonS3;->access$000(Lorg/eclipse/jgit/transport/TransportAmazonS3;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->resolveKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2, p2, p3}, Lorg/eclipse/jgit/transport/AmazonS3;->beginPut(Ljava/lang/String;Ljava/lang/String;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method writeFile(Ljava/lang/String;[B)V
    .locals 3
    .parameter "path"
    .parameter "data"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 301
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->this$0:Lorg/eclipse/jgit/transport/TransportAmazonS3;

    #getter for: Lorg/eclipse/jgit/transport/TransportAmazonS3;->s3:Lorg/eclipse/jgit/transport/AmazonS3;
    invoke-static {v0}, Lorg/eclipse/jgit/transport/TransportAmazonS3;->access$100(Lorg/eclipse/jgit/transport/TransportAmazonS3;)Lorg/eclipse/jgit/transport/AmazonS3;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->this$0:Lorg/eclipse/jgit/transport/TransportAmazonS3;

    #getter for: Lorg/eclipse/jgit/transport/TransportAmazonS3;->bucket:Ljava/lang/String;
    invoke-static {v1}, Lorg/eclipse/jgit/transport/TransportAmazonS3;->access$000(Lorg/eclipse/jgit/transport/TransportAmazonS3;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->resolveKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2, p2}, Lorg/eclipse/jgit/transport/AmazonS3;->put(Ljava/lang/String;Ljava/lang/String;[B)V

    .line 302
    return-void
.end method
