.class abstract Lorg/eclipse/jgit/transport/BasePackConnection;
.super Lorg/eclipse/jgit/transport/BaseConnection;
.source "BasePackConnection.java"


# instance fields
.field protected final additionalHaves:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field protected in:Ljava/io/InputStream;

.field protected final local:Lorg/eclipse/jgit/lib/Repository;

.field private myTimer:Lorg/eclipse/jgit/util/io/InterruptTimer;

.field protected out:Ljava/io/OutputStream;

.field protected outNeedsEnd:Z

.field protected pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

.field protected pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

.field private final remoteCapablities:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected statelessRPC:Z

.field protected timeoutIn:Lorg/eclipse/jgit/util/io/TimeoutInputStream;

.field protected timeoutOut:Lorg/eclipse/jgit/util/io/TimeoutOutputStream;

.field protected final transport:Lorg/eclipse/jgit/transport/Transport;

.field protected final uri:Lorg/eclipse/jgit/transport/URIish;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/PackTransport;)V
    .locals 1
    .parameter "packTransport"

    .prologue
    .line 123
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/BaseConnection;-><init>()V

    .line 118
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->remoteCapablities:Ljava/util/Set;

    .line 121
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->additionalHaves:Ljava/util/Set;

    .line 124
    check-cast p1, Lorg/eclipse/jgit/transport/Transport;

    .end local p1
    iput-object p1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    .line 125
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    iget-object v0, v0, Lorg/eclipse/jgit/transport/Transport;->local:Lorg/eclipse/jgit/lib/Repository;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->local:Lorg/eclipse/jgit/lib/Repository;

    .line 126
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    iget-object v0, v0, Lorg/eclipse/jgit/transport/Transport;->uri:Lorg/eclipse/jgit/transport/URIish;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    .line 127
    return-void
.end method

.method private duplicateAdvertisement(Ljava/lang/String;)Lorg/eclipse/jgit/errors/PackProtocolException;
    .locals 5
    .parameter "name"

    .prologue
    .line 279
    new-instance v0, Lorg/eclipse/jgit/errors/PackProtocolException;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->duplicateAdvertisementsOf:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    return-object v0
.end method

.method private readAdvertisedRefsImpl()V
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 190
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    .line 195
    .local v2, avail:Ljava/util/LinkedHashMap;,"Ljava/util/LinkedHashMap<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    :cond_0
    :goto_0
    :try_start_0
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/transport/BasePackConnection;->pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

    invoke-virtual {v12}, Lorg/eclipse/jgit/transport/PacketLineIn;->readString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    .line 201
    .local v8, line:Ljava/lang/String;
    sget-object v12, Lorg/eclipse/jgit/transport/PacketLineIn;->END:Ljava/lang/String;

    if-ne v8, v12, :cond_2

    .line 250
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/transport/BasePackConnection;->available(Ljava/util/Map;)V

    .line 251
    return-void

    .line 196
    .end local v8           #line:Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 197
    .local v4, eof:Ljava/io/EOFException;
    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v12

    if-eqz v12, :cond_1

    .line 198
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/transport/BasePackConnection;->noRepository()Lorg/eclipse/jgit/errors/TransportException;

    move-result-object v12

    throw v12

    .line 199
    :cond_1
    throw v4

    .line 204
    .end local v4           #eof:Ljava/io/EOFException;
    .restart local v8       #line:Ljava/lang/String;
    :cond_2
    const-string v12, "ERR "

    invoke-virtual {v8, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 207
    new-instance v12, Lorg/eclipse/jgit/errors/RemoteRepositoryException;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/transport/BasePackConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    const/4 v14, 0x4

    invoke-virtual {v8, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v13, v14}, Lorg/eclipse/jgit/errors/RemoteRepositoryException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v12

    .line 210
    :cond_3
    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v12

    if-eqz v12, :cond_5

    .line 211
    const/4 v12, 0x0

    invoke-virtual {v8, v12}, Ljava/lang/String;->indexOf(I)I

    move-result v10

    .line 212
    .local v10, nul:I
    if-ltz v10, :cond_5

    .line 215
    add-int/lit8 v12, v10, 0x1

    invoke-virtual {v8, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v12

    const-string v13, " "

    invoke-virtual {v12, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .local v1, arr$:[Ljava/lang/String;
    array-length v7, v1

    .local v7, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_1
    if-ge v5, v7, :cond_4

    aget-object v3, v1, v5

    .line 216
    .local v3, c:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/transport/BasePackConnection;->remoteCapablities:Ljava/util/Set;

    invoke-interface {v12, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 215
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 217
    .end local v3           #c:Ljava/lang/String;
    :cond_4
    const/4 v12, 0x0

    invoke-virtual {v8, v12, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 221
    .end local v1           #arr$:[Ljava/lang/String;
    .end local v5           #i$:I
    .end local v7           #len$:I
    .end local v10           #nul:I
    :cond_5
    const/16 v12, 0x29

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v13

    invoke-virtual {v8, v12, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 222
    .local v9, name:Ljava/lang/String;
    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v12

    if-eqz v12, :cond_6

    const-string v12, "capabilities^{}"

    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_0

    .line 228
    :cond_6
    const/4 v12, 0x0

    const/16 v13, 0x28

    invoke-virtual {v8, v12, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    .line 229
    .local v6, id:Lorg/eclipse/jgit/lib/ObjectId;
    const-string v12, ".have"

    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_7

    .line 230
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/transport/BasePackConnection;->additionalHaves:Ljava/util/Set;

    invoke-interface {v12, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 231
    :cond_7
    const-string v12, "^{}"

    invoke-virtual {v9, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_a

    .line 232
    const/4 v12, 0x0

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v13

    add-int/lit8 v13, v13, -0x3

    invoke-virtual {v9, v12, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 233
    invoke-virtual {v2, v9}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/eclipse/jgit/lib/Ref;

    .line 234
    .local v11, prior:Lorg/eclipse/jgit/lib/Ref;
    if-nez v11, :cond_8

    .line 235
    new-instance v12, Lorg/eclipse/jgit/errors/PackProtocolException;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/transport/BasePackConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v14

    iget-object v14, v14, Lorg/eclipse/jgit/internal/JGitText;->advertisementCameBefore:Ljava/lang/String;

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v9, v15, v16

    const/16 v16, 0x1

    aput-object v9, v15, v16

    invoke-static {v14, v15}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v13, v14}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v12

    .line 238
    :cond_8
    invoke-interface {v11}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v12

    if-eqz v12, :cond_9

    .line 239
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "^{}"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lorg/eclipse/jgit/transport/BasePackConnection;->duplicateAdvertisement(Ljava/lang/String;)Lorg/eclipse/jgit/errors/PackProtocolException;

    move-result-object v12

    throw v12

    .line 241
    :cond_9
    new-instance v12, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledTag;

    sget-object v13, Lorg/eclipse/jgit/lib/Ref$Storage;->NETWORK:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-interface {v11}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v14

    invoke-direct {v12, v13, v9, v14, v6}, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledTag;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V

    invoke-virtual {v2, v9, v12}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 244
    .end local v11           #prior:Lorg/eclipse/jgit/lib/Ref;
    :cond_a
    new-instance v12, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledNonTag;

    sget-object v13, Lorg/eclipse/jgit/lib/Ref$Storage;->NETWORK:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-direct {v12, v13, v9, v6}, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledNonTag;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    invoke-virtual {v2, v9, v12}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/eclipse/jgit/lib/Ref;

    .line 246
    .restart local v11       #prior:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v11, :cond_0

    .line 247
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lorg/eclipse/jgit/transport/BasePackConnection;->duplicateAdvertisement(Ljava/lang/String;)Lorg/eclipse/jgit/errors/PackProtocolException;

    move-result-object v12

    throw v12
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 284
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->out:Ljava/io/OutputStream;

    if-eqz v0, :cond_1

    .line 286
    :try_start_0
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->outNeedsEnd:Z

    if-eqz v0, :cond_0

    .line 287
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->outNeedsEnd:Z

    .line 288
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/PacketLineOut;->end()V

    .line 290
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 294
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->out:Ljava/io/OutputStream;

    .line 295
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    .line 299
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->in:Ljava/io/InputStream;

    if-eqz v0, :cond_2

    .line 301
    :try_start_1
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 305
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->in:Ljava/io/InputStream;

    .line 306
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

    .line 310
    :cond_2
    :goto_1
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->myTimer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    if-eqz v0, :cond_3

    .line 312
    :try_start_2
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->myTimer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/io/InterruptTimer;->terminate()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 314
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->myTimer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    .line 315
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->timeoutIn:Lorg/eclipse/jgit/util/io/TimeoutInputStream;

    .line 316
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->timeoutOut:Lorg/eclipse/jgit/util/io/TimeoutOutputStream;

    .line 319
    :cond_3
    return-void

    .line 291
    :catch_0
    move-exception v0

    .line 294
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->out:Ljava/io/OutputStream;

    .line 295
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    goto :goto_0

    .line 294
    :catchall_0
    move-exception v0

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->out:Ljava/io/OutputStream;

    .line 295
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    throw v0

    .line 302
    :catch_1
    move-exception v0

    .line 305
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->in:Ljava/io/InputStream;

    .line 306
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

    goto :goto_1

    .line 305
    :catchall_1
    move-exception v0

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->in:Ljava/io/InputStream;

    .line 306
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

    throw v0

    .line 314
    :catchall_2
    move-exception v0

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->myTimer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    .line 315
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->timeoutIn:Lorg/eclipse/jgit/util/io/TimeoutInputStream;

    .line 316
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->timeoutOut:Lorg/eclipse/jgit/util/io/TimeoutOutputStream;

    throw v0
.end method

.method protected endOut()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 323
    iget-boolean v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->outNeedsEnd:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->out:Ljava/io/OutputStream;

    if-eqz v1, :cond_0

    .line 325
    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->outNeedsEnd:Z

    .line 326
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/PacketLineOut;->end()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 338
    :cond_0
    :goto_0
    return-void

    .line 327
    :catch_0
    move-exception v0

    .line 329
    .local v0, e:Ljava/io/IOException;
    :try_start_1
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->out:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 333
    iput-object v2, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->out:Ljava/io/OutputStream;

    .line 334
    iput-object v2, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    goto :goto_0

    .line 330
    :catch_1
    move-exception v1

    .line 333
    iput-object v2, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->out:Ljava/io/OutputStream;

    .line 334
    iput-object v2, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    goto :goto_0

    .line 333
    :catchall_0
    move-exception v1

    iput-object v2, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->out:Ljava/io/OutputStream;

    .line 334
    iput-object v2, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    throw v1
.end method

.method protected final init(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 5
    .parameter "myIn"
    .parameter "myOut"

    .prologue
    .line 141
    iget-object v2, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/Transport;->getTimeout()I

    move-result v1

    .line 142
    .local v1, timeout:I
    if-lez v1, :cond_0

    .line 143
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    .line 144
    .local v0, caller:Ljava/lang/Thread;
    new-instance v2, Lorg/eclipse/jgit/util/io/InterruptTimer;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "-Timer"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/util/io/InterruptTimer;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->myTimer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    .line 145
    new-instance v2, Lorg/eclipse/jgit/util/io/TimeoutInputStream;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->myTimer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    invoke-direct {v2, p1, v3}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;-><init>(Ljava/io/InputStream;Lorg/eclipse/jgit/util/io/InterruptTimer;)V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->timeoutIn:Lorg/eclipse/jgit/util/io/TimeoutInputStream;

    .line 146
    new-instance v2, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->myTimer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    invoke-direct {v2, p2, v3}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;-><init>(Ljava/io/OutputStream;Lorg/eclipse/jgit/util/io/InterruptTimer;)V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->timeoutOut:Lorg/eclipse/jgit/util/io/TimeoutOutputStream;

    .line 147
    iget-object v2, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->timeoutIn:Lorg/eclipse/jgit/util/io/TimeoutInputStream;

    mul-int/lit16 v3, v1, 0x3e8

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->setTimeout(I)V

    .line 148
    iget-object v2, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->timeoutOut:Lorg/eclipse/jgit/util/io/TimeoutOutputStream;

    mul-int/lit16 v3, v1, 0x3e8

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->setTimeout(I)V

    .line 149
    iget-object p1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->timeoutIn:Lorg/eclipse/jgit/util/io/TimeoutInputStream;

    .line 150
    iget-object p2, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->timeoutOut:Lorg/eclipse/jgit/util/io/TimeoutOutputStream;

    .line 153
    .end local v0           #caller:Ljava/lang/Thread;
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->in:Ljava/io/InputStream;

    .line 154
    iput-object p2, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->out:Ljava/io/OutputStream;

    .line 156
    new-instance v2, Lorg/eclipse/jgit/transport/PacketLineIn;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->in:Ljava/io/InputStream;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/transport/PacketLineIn;-><init>(Ljava/io/InputStream;)V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

    .line 157
    new-instance v2, Lorg/eclipse/jgit/transport/PacketLineOut;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->out:Ljava/io/OutputStream;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/transport/PacketLineOut;-><init>(Ljava/io/OutputStream;)V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    .line 158
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->outNeedsEnd:Z

    .line 159
    return-void
.end method

.method protected isCapableOf(Ljava/lang/String;)Z
    .locals 1
    .parameter "option"

    .prologue
    .line 267
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->remoteCapablities:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected noRepository()Lorg/eclipse/jgit/errors/TransportException;
    .locals 3

    .prologue
    .line 263
    new-instance v0, Lorg/eclipse/jgit/errors/NoRemoteRepositoryException;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->notFound:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/errors/NoRemoteRepositoryException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    return-object v0
.end method

.method protected readAdvertisedRefs()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 176
    :try_start_0
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/BasePackConnection;->readAdvertisedRefsImpl()V
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_2

    .line 187
    return-void

    .line 177
    :catch_0
    move-exception v0

    .line 178
    .local v0, err:Lorg/eclipse/jgit/errors/TransportException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BasePackConnection;->close()V

    .line 179
    throw v0

    .line 180
    .end local v0           #err:Lorg/eclipse/jgit/errors/TransportException;
    :catch_1
    move-exception v0

    .line 181
    .local v0, err:Ljava/io/IOException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BasePackConnection;->close()V

    .line 182
    new-instance v1, Lorg/eclipse/jgit/errors/TransportException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 183
    .end local v0           #err:Ljava/io/IOException;
    :catch_2
    move-exception v0

    .line 184
    .local v0, err:Ljava/lang/RuntimeException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BasePackConnection;->close()V

    .line 185
    new-instance v1, Lorg/eclipse/jgit/errors/TransportException;

    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected wantCapability(Ljava/lang/StringBuilder;Ljava/lang/String;)Z
    .locals 1
    .parameter "b"
    .parameter "option"

    .prologue
    .line 271
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/transport/BasePackConnection;->isCapableOf(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 272
    const/4 v0, 0x0

    .line 275
    :goto_0
    return v0

    .line 273
    :cond_0
    const/16 v0, 0x20

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 274
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    const/4 v0, 0x1

    goto :goto_0
.end method
