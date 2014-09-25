.class Lorg/eclipse/jgit/transport/BundleFetchConnection;
.super Lorg/eclipse/jgit/transport/BaseFetchConnection;
.source "BundleFetchConnection.java"


# instance fields
.field bin:Ljava/io/InputStream;

.field private lockMessage:Ljava/lang/String;

.field private packLock:Lorg/eclipse/jgit/internal/storage/file/PackLock;

.field final prereqs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final transport:Lorg/eclipse/jgit/transport/Transport;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/Transport;Ljava/io/InputStream;)V
    .locals 4
    .parameter "transportBundle"
    .parameter "src"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 101
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/BaseFetchConnection;-><init>()V

    .line 95
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->prereqs:Ljava/util/Map;

    .line 102
    iput-object p1, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    .line 103
    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-direct {v1, p2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->bin:Ljava/io/InputStream;

    .line 105
    :try_start_0
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/BundleFetchConnection;->readSignature()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 110
    new-instance v1, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    iget-object v2, v2, Lorg/eclipse/jgit/transport/Transport;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->notABundle:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_2

    .line 112
    :catch_0
    move-exception v0

    .line 113
    .local v0, err:Lorg/eclipse/jgit/errors/TransportException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BundleFetchConnection;->close()V

    .line 114
    throw v0

    .line 107
    .end local v0           #err:Lorg/eclipse/jgit/errors/TransportException;
    :pswitch_0
    :try_start_1
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/BundleFetchConnection;->readBundleV2()V
    :try_end_1
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_2

    .line 122
    return-void

    .line 115
    :catch_1
    move-exception v0

    .line 116
    .local v0, err:Ljava/io/IOException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BundleFetchConnection;->close()V

    .line 117
    new-instance v1, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    iget-object v2, v2, Lorg/eclipse/jgit/transport/Transport;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 118
    .end local v0           #err:Ljava/io/IOException;
    :catch_2
    move-exception v0

    .line 119
    .local v0, err:Ljava/lang/RuntimeException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BundleFetchConnection;->close()V

    .line 120
    new-instance v1, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    iget-object v2, v2, Lorg/eclipse/jgit/transport/Transport;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 105
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method private duplicateAdvertisement(Ljava/lang/String;)Lorg/eclipse/jgit/errors/PackProtocolException;
    .locals 5
    .parameter "name"

    .prologue
    .line 159
    new-instance v0, Lorg/eclipse/jgit/errors/PackProtocolException;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    iget-object v1, v1, Lorg/eclipse/jgit/transport/Transport;->uri:Lorg/eclipse/jgit/transport/URIish;

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

.method private readBundleV2()V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v11, 0x2a

    const/16 v10, 0x29

    const/4 v9, 0x0

    .line 132
    const/16 v7, 0x400

    new-array v1, v7, [B

    .line 133
    .local v1, hdrbuf:[B
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 135
    .local v0, avail:Ljava/util/LinkedHashMap;,"Ljava/util/LinkedHashMap<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    :cond_0
    :goto_0
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/transport/BundleFetchConnection;->readLine([B)Ljava/lang/String;

    move-result-object v3

    .line 136
    .local v3, line:Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_1

    .line 155
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/BundleFetchConnection;->available(Ljava/util/Map;)V

    .line 156
    return-void

    .line 139
    :cond_1
    invoke-virtual {v3, v9}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x2d

    if-ne v7, v8, :cond_3

    .line 140
    const/4 v7, 0x1

    invoke-virtual {v3, v7, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    .line 141
    .local v2, id:Lorg/eclipse/jgit/lib/ObjectId;
    const/4 v6, 0x0

    .line 142
    .local v6, shortDesc:Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    if-le v7, v11, :cond_2

    .line 143
    invoke-virtual {v3, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 144
    :cond_2
    iget-object v7, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->prereqs:Ljava/util/Map;

    invoke-interface {v7, v2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 148
    .end local v2           #id:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v6           #shortDesc:Ljava/lang/String;
    :cond_3
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v3, v10, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 149
    .local v4, name:Ljava/lang/String;
    const/16 v7, 0x28

    invoke-virtual {v3, v9, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    .line 150
    .restart local v2       #id:Lorg/eclipse/jgit/lib/ObjectId;
    new-instance v7, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;

    sget-object v8, Lorg/eclipse/jgit/lib/Ref$Storage;->NETWORK:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-direct {v7, v8, v4, v2}, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    invoke-virtual {v0, v4, v7}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/lib/Ref;

    .line 152
    .local v5, prior:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v5, :cond_0

    .line 153
    invoke-direct {p0, v4}, Lorg/eclipse/jgit/transport/BundleFetchConnection;->duplicateAdvertisement(Ljava/lang/String;)Lorg/eclipse/jgit/errors/PackProtocolException;

    move-result-object v7

    throw v7
.end method

.method private readLine([B)Ljava/lang/String;
    .locals 6
    .parameter "hdrbuf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0xa

    .line 164
    iget-object v2, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->bin:Ljava/io/InputStream;

    array-length v3, p1

    invoke-virtual {v2, v3}, Ljava/io/InputStream;->mark(I)V

    .line 165
    iget-object v2, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->bin:Ljava/io/InputStream;

    invoke-virtual {v2, p1}, Ljava/io/InputStream;->read([B)I

    move-result v0

    .line 166
    .local v0, cnt:I
    const/4 v1, 0x0

    .line 167
    .local v1, lf:I
    :goto_0
    if-ge v1, v0, :cond_0

    aget-byte v2, p1, v1

    if-eq v2, v5, :cond_0

    .line 168
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 169
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->bin:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->reset()V

    .line 170
    iget-object v2, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->bin:Ljava/io/InputStream;

    int-to-long v3, v1

    invoke-static {v2, v3, v4}, Lorg/eclipse/jgit/util/IO;->skipFully(Ljava/io/InputStream;J)V

    .line 171
    if-ge v1, v0, :cond_1

    aget-byte v2, p1, v1

    if-ne v2, v5, :cond_1

    .line 172
    iget-object v2, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->bin:Ljava/io/InputStream;

    const-wide/16 v3, 0x1

    invoke-static {v2, v3, v4}, Lorg/eclipse/jgit/util/IO;->skipFully(Ljava/io/InputStream;J)V

    .line 173
    :cond_1
    sget-object v2, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    const/4 v3, 0x0

    invoke-static {v2, p1, v3, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private readSignature()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    const/16 v1, 0x400

    new-array v1, v1, [B

    invoke-direct {p0, v1}, Lorg/eclipse/jgit/transport/BundleFetchConnection;->readLine([B)Ljava/lang/String;

    move-result-object v0

    .line 126
    .local v0, rev:Ljava/lang/String;
    const-string v1, "# v2 git bundle"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 127
    const/4 v1, 0x2

    return v1

    .line 128
    :cond_0
    new-instance v1, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    iget-object v2, v2, Lorg/eclipse/jgit/transport/Transport;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->notABundle:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v1
.end method

.method private verifyPrerequisites()V
    .locals 25
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 217
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->prereqs:Ljava/util/Map;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/Map;->isEmpty()Z

    move-result v19

    if-eqz v19, :cond_0

    .line 287
    :goto_0
    return-void

    .line 220
    :cond_0
    new-instance v18, Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/eclipse/jgit/transport/Transport;->local:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    invoke-direct/range {v18 .. v19}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 222
    .local v18, rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    :try_start_0
    const-string v19, "PREREQ"

    invoke-virtual/range {v18 .. v19}, Lorg/eclipse/jgit/revwalk/RevWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v3

    .line 223
    .local v3, PREREQ:Lorg/eclipse/jgit/revwalk/RevFlag;
    const-string v19, "SEEN"

    invoke-virtual/range {v18 .. v19}, Lorg/eclipse/jgit/revwalk/RevWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v4

    .line 225
    .local v4, SEEN:Lorg/eclipse/jgit/revwalk/RevFlag;
    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    .line 226
    .local v12, missing:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 227
    .local v6, commits:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevObject;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->prereqs:Ljava/util/Map;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, i$:Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_2

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map$Entry;

    .line 228
    .local v8, e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;>;"
    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/eclipse/jgit/lib/ObjectId;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 230
    .local v15, p:Lorg/eclipse/jgit/lib/ObjectId;
    :try_start_1
    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v5

    .line 231
    .local v5, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v5, v3}, Lorg/eclipse/jgit/revwalk/RevCommit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v19

    if-nez v19, :cond_1

    .line 232
    invoke-virtual {v5, v3}, Lorg/eclipse/jgit/revwalk/RevCommit;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 233
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 235
    .end local v5           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    :catch_0
    move-exception v13

    .line 236
    .local v13, notFound:Lorg/eclipse/jgit/errors/MissingObjectException;
    :try_start_2
    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v12, v15, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 285
    .end local v3           #PREREQ:Lorg/eclipse/jgit/revwalk/RevFlag;
    .end local v4           #SEEN:Lorg/eclipse/jgit/revwalk/RevFlag;
    .end local v6           #commits:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevObject;>;"
    .end local v8           #e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;>;"
    .end local v10           #i$:Ljava/util/Iterator;
    .end local v12           #missing:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;>;"
    .end local v13           #notFound:Lorg/eclipse/jgit/errors/MissingObjectException;
    .end local v15           #p:Lorg/eclipse/jgit/lib/ObjectId;
    :catchall_0
    move-exception v19

    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v19

    .line 237
    .restart local v3       #PREREQ:Lorg/eclipse/jgit/revwalk/RevFlag;
    .restart local v4       #SEEN:Lorg/eclipse/jgit/revwalk/RevFlag;
    .restart local v6       #commits:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevObject;>;"
    .restart local v8       #e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;>;"
    .restart local v10       #i$:Ljava/util/Iterator;
    .restart local v12       #missing:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;>;"
    .restart local v15       #p:Lorg/eclipse/jgit/lib/ObjectId;
    :catch_1
    move-exception v9

    .line 238
    .local v9, err:Ljava/io/IOException;
    :try_start_3
    new-instance v19, Lorg/eclipse/jgit/errors/TransportException;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/eclipse/jgit/transport/Transport;->uri:Lorg/eclipse/jgit/transport/URIish;

    move-object/from16 v20, v0

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v21

    move-object/from16 v0, v21

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->cannotReadCommit:Ljava/lang/String;

    move-object/from16 v21, v0

    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-virtual {v15}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v24

    aput-object v24, v22, v23

    invoke-static/range {v21 .. v22}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2, v9}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v19

    .line 243
    .end local v8           #e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;>;"
    .end local v9           #err:Ljava/io/IOException;
    .end local v15           #p:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_2
    invoke-interface {v12}, Ljava/util/Map;->isEmpty()Z

    move-result v19

    if-nez v19, :cond_3

    .line 244
    new-instance v19, Lorg/eclipse/jgit/errors/MissingBundlePrerequisiteException;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/eclipse/jgit/transport/Transport;->uri:Lorg/eclipse/jgit/transport/URIish;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v0, v1, v12}, Lorg/eclipse/jgit/errors/MissingBundlePrerequisiteException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/util/Map;)V

    throw v19
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 249
    :cond_3
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/eclipse/jgit/transport/Transport;->local:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v19

    const-string v20, ""

    invoke-virtual/range {v19 .. v20}, Lorg/eclipse/jgit/lib/RefDatabase;->getRefs(Ljava/lang/String;)Ljava/util/Map;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    move-result-object v11

    .line 253
    .local v11, localRefs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    :try_start_5
    invoke-interface {v11}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_4

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lorg/eclipse/jgit/lib/Ref;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 255
    .local v16, r:Lorg/eclipse/jgit/lib/Ref;
    :try_start_6
    invoke-interface/range {v16 .. v16}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevCommit;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    goto :goto_2

    .line 256
    :catch_2
    move-exception v19

    goto :goto_2

    .line 250
    .end local v11           #localRefs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    .end local v16           #r:Lorg/eclipse/jgit/lib/Ref;
    :catch_3
    move-exception v7

    .line 251
    .local v7, e:Ljava/io/IOException;
    :try_start_7
    new-instance v19, Lorg/eclipse/jgit/errors/TransportException;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/eclipse/jgit/transport/Transport;->uri:Lorg/eclipse/jgit/transport/URIish;

    move-object/from16 v20, v0

    invoke-virtual {v7}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2, v7}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v19

    .line 261
    .end local v7           #e:Ljava/io/IOException;
    .restart local v11       #localRefs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    :cond_4
    invoke-interface {v6}, Ljava/util/List;->size()I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    move-result v17

    .line 264
    .local v17, remaining:I
    :cond_5
    :try_start_8
    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v5

    .restart local v5       #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-eqz v5, :cond_6

    .line 265
    invoke-virtual {v5, v3}, Lorg/eclipse/jgit/revwalk/RevCommit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v19

    if-eqz v19, :cond_5

    .line 266
    invoke-virtual {v5, v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4

    .line 267
    add-int/lit8 v17, v17, -0x1

    if-nez v17, :cond_5

    .line 276
    :cond_6
    if-lez v17, :cond_9

    .line 277
    :try_start_9
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_7
    :goto_3
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_8

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/eclipse/jgit/revwalk/RevObject;

    .line 278
    .local v14, o:Lorg/eclipse/jgit/revwalk/RevObject;
    invoke-virtual {v14, v4}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v19

    if-nez v19, :cond_7

    .line 279
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->prereqs:Ljava/util/Map;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v12, v14, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 271
    .end local v5           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v14           #o:Lorg/eclipse/jgit/revwalk/RevObject;
    :catch_4
    move-exception v9

    .line 272
    .restart local v9       #err:Ljava/io/IOException;
    new-instance v19, Lorg/eclipse/jgit/errors/TransportException;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/eclipse/jgit/transport/Transport;->uri:Lorg/eclipse/jgit/transport/URIish;

    move-object/from16 v20, v0

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v21

    move-object/from16 v0, v21

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->cannotReadObject:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2, v9}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v19

    .line 281
    .end local v9           #err:Ljava/io/IOException;
    .restart local v5       #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_8
    new-instance v19, Lorg/eclipse/jgit/errors/MissingBundlePrerequisiteException;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/eclipse/jgit/transport/Transport;->uri:Lorg/eclipse/jgit/transport/URIish;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v0, v1, v12}, Lorg/eclipse/jgit/errors/MissingBundlePrerequisiteException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/util/Map;)V

    throw v19
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 285
    :cond_9
    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    goto/16 :goto_0
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 291
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->bin:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    .line 293
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->bin:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 297
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->bin:Ljava/io/InputStream;

    .line 300
    :cond_0
    :goto_0
    return-void

    .line 294
    :catch_0
    move-exception v0

    .line 297
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->bin:Ljava/io/InputStream;

    goto :goto_0

    :catchall_0
    move-exception v0

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->bin:Ljava/io/InputStream;

    throw v0
.end method

.method public didFetchTestConnectivity()Z
    .locals 1

    .prologue
    .line 177
    const/4 v0, 0x0

    return v0
.end method

.method protected doFetch(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;Ljava/util/Set;)V
    .locals 6
    .parameter "monitor"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 184
    .local p2, want:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    .local p3, have:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/BundleFetchConnection;->verifyPrerequisites()V

    .line 186
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    iget-object v3, v3, Lorg/eclipse/jgit/transport/Transport;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/Repository;->newObjectInserter()Lorg/eclipse/jgit/lib/ObjectInserter;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    .line 188
    .local v1, ins:Lorg/eclipse/jgit/lib/ObjectInserter;
    :try_start_1
    iget-object v3, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->bin:Ljava/io/InputStream;

    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/lib/ObjectInserter;->newPackParser(Ljava/io/InputStream;)Lorg/eclipse/jgit/transport/PackParser;

    move-result-object v2

    .line 189
    .local v2, parser:Lorg/eclipse/jgit/transport/PackParser;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/transport/PackParser;->setAllowThin(Z)V

    .line 190
    iget-object v3, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v3}, Lorg/eclipse/jgit/transport/Transport;->isCheckFetchedObjects()Z

    move-result v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/transport/PackParser;->setObjectChecking(Z)V

    .line 191
    iget-object v3, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->lockMessage:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/transport/PackParser;->setLockMessage(Ljava/lang/String;)V

    .line 192
    sget-object v3, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/transport/PackParser;->parse(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/internal/storage/file/PackLock;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->packLock:Lorg/eclipse/jgit/internal/storage/file/PackLock;

    .line 193
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectInserter;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 195
    :try_start_2
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    .line 204
    return-void

    .line 195
    .end local v2           #parser:Lorg/eclipse/jgit/transport/PackParser;
    :catchall_0
    move-exception v3

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    throw v3
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1

    .line 197
    .end local v1           #ins:Lorg/eclipse/jgit/lib/ObjectInserter;
    :catch_0
    move-exception v0

    .line 198
    .local v0, err:Ljava/io/IOException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BundleFetchConnection;->close()V

    .line 199
    new-instance v3, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    iget-object v4, v4, Lorg/eclipse/jgit/transport/Transport;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 200
    .end local v0           #err:Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 201
    .local v0, err:Ljava/lang/RuntimeException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BundleFetchConnection;->close()V

    .line 202
    new-instance v3, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    iget-object v4, v4, Lorg/eclipse/jgit/transport/Transport;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public getPackLocks()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackLock;",
            ">;"
        }
    .end annotation

    .prologue
    .line 211
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->packLock:Lorg/eclipse/jgit/internal/storage/file/PackLock;

    if-eqz v0, :cond_0

    .line 212
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->packLock:Lorg/eclipse/jgit/internal/storage/file/PackLock;

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    .line 213
    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public setPackLockMessage(Ljava/lang/String;)V
    .locals 0
    .parameter "message"

    .prologue
    .line 207
    iput-object p1, p0, Lorg/eclipse/jgit/transport/BundleFetchConnection;->lockMessage:Ljava/lang/String;

    .line 208
    return-void
.end method
