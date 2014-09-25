.class public abstract Lorg/eclipse/jgit/transport/PackParser;
.super Ljava/lang/Object;
.source "PackParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/PackParser$1;,
        Lorg/eclipse/jgit/transport/PackParser$DeltaChain;,
        Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;,
        Lorg/eclipse/jgit/transport/PackParser$InflaterStream;,
        Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;,
        Lorg/eclipse/jgit/transport/PackParser$Source;,
        Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    }
.end annotation


# static fields
.field private static final BUFFER_SIZE:I = 0x2000


# instance fields
.field private allowThin:Z

.field private bAvail:I

.field private bBase:J

.field private bOffset:I

.field private baseById:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/ObjectIdOwnerMap",
            "<",
            "Lorg/eclipse/jgit/transport/PackParser$DeltaChain;",
            ">;"
        }
    .end annotation
.end field

.field private baseByPos:Lorg/eclipse/jgit/transport/LongMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/transport/LongMap",
            "<",
            "Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;",
            ">;"
        }
    .end annotation
.end field

.field private baseObjectIds:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/ObjectIdSubclassMap",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private buf:[B

.field private checkEofAfterPackFooter:Z

.field private deferredCheckBlobs:Lorg/eclipse/jgit/util/BlockList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/util/BlockList",
            "<",
            "Lorg/eclipse/jgit/transport/PackedObjectInfo;",
            ">;"
        }
    .end annotation
.end field

.field private deltaCount:I

.field private entries:[Lorg/eclipse/jgit/transport/PackedObjectInfo;

.field private entryCount:I

.field private expectDataAfterPackFooter:Z

.field private hdrBuf:[B

.field private in:Ljava/io/InputStream;

.field private inflater:Lorg/eclipse/jgit/transport/PackParser$InflaterStream;

.field private lockMessage:Ljava/lang/String;

.field private maxObjectSizeLimit:J

.field private needBaseObjectIds:Z

.field private newObjectIds:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/ObjectIdSubclassMap",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private objCheck:Lorg/eclipse/jgit/lib/ObjectChecker;

.field private objectCount:J

.field private final objectDatabase:Lorg/eclipse/jgit/lib/ObjectDatabase;

.field private final objectDigest:Ljava/security/MessageDigest;

.field private packDigest:Ljava/security/MessageDigest;

.field private readCurs:Lorg/eclipse/jgit/lib/ObjectReader;

.field private tempBuffer:[B

.field private final tempObjectId:Lorg/eclipse/jgit/lib/MutableObjectId;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/ObjectDatabase;Ljava/io/InputStream;)V
    .locals 2
    .parameter "odb"
    .parameter "src"

    .prologue
    const/16 v1, 0x2000

    .line 195
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 196
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/ObjectDatabase;->newCachedDatabase()Lorg/eclipse/jgit/lib/ObjectDatabase;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->objectDatabase:Lorg/eclipse/jgit/lib/ObjectDatabase;

    .line 197
    iput-object p2, p0, Lorg/eclipse/jgit/transport/PackParser;->in:Ljava/io/InputStream;

    .line 199
    new-instance v0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;-><init>(Lorg/eclipse/jgit/transport/PackParser;)V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->inflater:Lorg/eclipse/jgit/transport/PackParser$InflaterStream;

    .line 200
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->objectDatabase:Lorg/eclipse/jgit/lib/ObjectDatabase;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectDatabase;->newReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->readCurs:Lorg/eclipse/jgit/lib/ObjectReader;

    .line 201
    new-array v0, v1, [B

    iput-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    .line 202
    new-array v0, v1, [B

    iput-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->tempBuffer:[B

    .line 203
    const/16 v0, 0x40

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->hdrBuf:[B

    .line 204
    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->objectDigest:Ljava/security/MessageDigest;

    .line 205
    new-instance v0, Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/MutableObjectId;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->tempObjectId:Lorg/eclipse/jgit/lib/MutableObjectId;

    .line 206
    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->packDigest:Ljava/security/MessageDigest;

    .line 207
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/transport/PackParser;Lorg/eclipse/jgit/transport/PackParser$Source;I)I
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/PackParser;->fill(Lorg/eclipse/jgit/transport/PackParser$Source;I)I

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/transport/PackParser;)[B
    .locals 1
    .parameter "x0"

    .prologue
    .line 97
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    return-object v0
.end method

.method static synthetic access$200(Lorg/eclipse/jgit/transport/PackParser;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 97
    iget v0, p0, Lorg/eclipse/jgit/transport/PackParser;->bAvail:I

    return v0
.end method

.method static synthetic access$300(Lorg/eclipse/jgit/transport/PackParser;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 97
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/PackParser;->use(I)V

    return-void
.end method

.method private addObjectAndTrack(Lorg/eclipse/jgit/transport/PackedObjectInfo;)V
    .locals 3
    .parameter "oe"

    .prologue
    .line 1594
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->entries:[Lorg/eclipse/jgit/transport/PackedObjectInfo;

    iget v1, p0, Lorg/eclipse/jgit/transport/PackParser;->entryCount:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/eclipse/jgit/transport/PackParser;->entryCount:I

    aput-object p1, v0, v1

    .line 1595
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/PackParser;->needNewObjectIds()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1596
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->newObjectIds:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->add(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 1597
    :cond_0
    return-void
.end method

.method private final checkIfTooLarge(IJ)V
    .locals 5
    .parameter "typeCode"
    .parameter "size"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 641
    const-wide/16 v0, 0x0

    iget-wide v2, p0, Lorg/eclipse/jgit/transport/PackParser;->maxObjectSizeLimit:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    iget-wide v0, p0, Lorg/eclipse/jgit/transport/PackParser;->maxObjectSizeLimit:J

    cmp-long v0, v0, p2

    if-gez v0, :cond_0

    .line 642
    packed-switch p1, :pswitch_data_0

    .line 654
    :pswitch_0
    new-instance v0, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->unknownObjectType:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 647
    :pswitch_1
    new-instance v0, Lorg/eclipse/jgit/errors/TooLargeObjectInPackException;

    iget-wide v1, p0, Lorg/eclipse/jgit/transport/PackParser;->maxObjectSizeLimit:J

    invoke-direct {v0, p2, p3, v1, v2}, Lorg/eclipse/jgit/errors/TooLargeObjectInPackException;-><init>(JJ)V

    throw v0

    .line 651
    :pswitch_2
    new-instance v0, Lorg/eclipse/jgit/errors/TooLargeObjectInPackException;

    iget-wide v1, p0, Lorg/eclipse/jgit/transport/PackParser;->maxObjectSizeLimit:J

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/errors/TooLargeObjectInPackException;-><init>(J)V

    throw v0

    .line 658
    :cond_0
    return-void

    .line 642
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method private doDeferredCheckBlobs()V
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1040
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/transport/PackParser;->buffer()[B

    move-result-object v9

    .line 1041
    .local v9, readBuffer:[B
    array-length v12, v9

    new-array v2, v12, [B

    .line 1042
    .local v2, curBuffer:[B
    new-instance v5, Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;

    invoke-direct {v5}, Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;-><init>()V

    .line 1044
    .local v5, info:Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/transport/PackParser;->deferredCheckBlobs:Lorg/eclipse/jgit/util/BlockList;

    invoke-virtual {v12}, Lorg/eclipse/jgit/util/BlockList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/eclipse/jgit/transport/PackedObjectInfo;

    .line 1045
    .local v7, obj:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    move-object/from16 v0, p0

    invoke-direct {v0, v7, v5}, Lorg/eclipse/jgit/transport/PackParser;->openDatabase(Lorg/eclipse/jgit/transport/PackedObjectInfo;Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;)Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;

    move-result-object v5

    .line 1047
    iget v12, v5, Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;->type:I

    const/4 v13, 0x3

    if-eq v12, v13, :cond_0

    .line 1048
    new-instance v12, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v13

    iget-object v13, v13, Lorg/eclipse/jgit/internal/JGitText;->unknownObjectType:Ljava/lang/String;

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    iget v0, v5, Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;->type:I

    move/from16 v16, v0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 1052
    :cond_0
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/transport/PackParser;->readCurs:Lorg/eclipse/jgit/lib/ObjectReader;

    iget v13, v5, Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;->type:I

    invoke-virtual {v12, v7, v13}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v12

    invoke-virtual {v12}, Lorg/eclipse/jgit/lib/ObjectLoader;->openStream()Lorg/eclipse/jgit/lib/ObjectStream;

    move-result-object v1

    .line 1054
    .local v1, cur:Lorg/eclipse/jgit/lib/ObjectStream;
    :try_start_0
    iget-wide v10, v5, Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;->size:J

    .line 1055
    .local v10, sz:J
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectStream;->getSize()J

    move-result-wide v12

    cmp-long v12, v12, v10

    if-eqz v12, :cond_1

    .line 1056
    new-instance v12, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v13

    iget-object v13, v13, Lorg/eclipse/jgit/internal/JGitText;->collisionOn:Ljava/lang/String;

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-virtual {v7}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->name()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1072
    .end local v10           #sz:J
    :catchall_0
    move-exception v12

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectStream;->close()V

    throw v12

    .line 1058
    .restart local v10       #sz:J
    :cond_1
    :try_start_1
    sget-object v12, Lorg/eclipse/jgit/transport/PackParser$Source;->DATABASE:Lorg/eclipse/jgit/transport/PackParser$Source;

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v10, v11}, Lorg/eclipse/jgit/transport/PackParser;->inflate(Lorg/eclipse/jgit/transport/PackParser$Source;J)Ljava/io/InputStream;

    move-result-object v8

    .line 1059
    .local v8, pck:Ljava/io/InputStream;
    :goto_1
    const-wide/16 v12, 0x0

    cmp-long v12, v12, v10

    if-gez v12, :cond_4

    .line 1060
    array-length v12, v9

    int-to-long v12, v12

    invoke-static {v12, v13, v10, v11}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v12

    long-to-int v6, v12

    .line 1061
    .local v6, n:I
    const/4 v12, 0x0

    invoke-static {v1, v2, v12, v6}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 1062
    const/4 v12, 0x0

    invoke-static {v8, v9, v12, v6}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 1063
    const/4 v3, 0x0

    .local v3, i:I
    :goto_2
    if-ge v3, v6, :cond_3

    .line 1064
    aget-byte v12, v2, v3

    aget-byte v13, v9, v3

    if-eq v12, v13, :cond_2

    .line 1065
    new-instance v12, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v13

    iget-object v13, v13, Lorg/eclipse/jgit/internal/JGitText;->collisionOn:Ljava/lang/String;

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-virtual {v7}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->name()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 1063
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 1068
    :cond_3
    int-to-long v12, v6

    sub-long/2addr v10, v12

    .line 1069
    goto :goto_1

    .line 1070
    .end local v3           #i:I
    .end local v6           #n:I
    :cond_4
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1072
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectStream;->close()V

    goto/16 :goto_0

    .line 1075
    .end local v1           #cur:Lorg/eclipse/jgit/lib/ObjectStream;
    .end local v7           #obj:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    .end local v8           #pck:Ljava/io/InputStream;
    .end local v10           #sz:J
    :cond_5
    return-void
.end method

.method private endInput()V
    .locals 1

    .prologue
    .line 886
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->in:Ljava/io/InputStream;

    .line 887
    return-void
.end method

.method private fill(Lorg/eclipse/jgit/transport/PackParser$Source;I)I
    .locals 7
    .parameter "src"
    .parameter "need"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 1112
    :goto_0
    iget v2, p0, Lorg/eclipse/jgit/transport/PackParser;->bAvail:I

    if-ge v2, p2, :cond_3

    .line 1113
    iget v2, p0, Lorg/eclipse/jgit/transport/PackParser;->bOffset:I

    iget v3, p0, Lorg/eclipse/jgit/transport/PackParser;->bAvail:I

    add-int v1, v2, v3

    .line 1114
    .local v1, next:I
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    array-length v2, v2

    sub-int v0, v2, v1

    .line 1115
    .local v0, free:I
    iget v2, p0, Lorg/eclipse/jgit/transport/PackParser;->bAvail:I

    add-int/2addr v2, v0

    if-ge v2, p2, :cond_0

    .line 1116
    sget-object v2, Lorg/eclipse/jgit/transport/PackParser$1;->$SwitchMap$org$eclipse$jgit$transport$PackParser$Source:[I

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/PackParser$Source;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 1126
    :goto_1
    iget v1, p0, Lorg/eclipse/jgit/transport/PackParser;->bAvail:I

    .line 1127
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    array-length v2, v2

    sub-int v0, v2, v1

    .line 1129
    :cond_0
    sget-object v2, Lorg/eclipse/jgit/transport/PackParser$1;->$SwitchMap$org$eclipse$jgit$transport$PackParser$Source:[I

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/PackParser$Source;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_1

    .line 1137
    :goto_2
    if-gtz v1, :cond_2

    .line 1138
    new-instance v2, Ljava/io/EOFException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->packfileIsTruncated:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1118
    :pswitch_0
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/PackParser;->sync()V

    goto :goto_1

    .line 1121
    :pswitch_1
    iget v2, p0, Lorg/eclipse/jgit/transport/PackParser;->bAvail:I

    if-lez v2, :cond_1

    .line 1122
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    iget v3, p0, Lorg/eclipse/jgit/transport/PackParser;->bOffset:I

    iget-object v4, p0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    iget v5, p0, Lorg/eclipse/jgit/transport/PackParser;->bAvail:I

    invoke-static {v2, v3, v4, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1123
    :cond_1
    iput v6, p0, Lorg/eclipse/jgit/transport/PackParser;->bOffset:I

    goto :goto_1

    .line 1131
    :pswitch_2
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->in:Ljava/io/InputStream;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    invoke-virtual {v2, v3, v1, v0}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 1132
    goto :goto_2

    .line 1134
    :pswitch_3
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    invoke-virtual {p0, v2, v1, v0}, Lorg/eclipse/jgit/transport/PackParser;->readDatabase([BII)I

    move-result v1

    goto :goto_2

    .line 1139
    :cond_2
    iget v2, p0, Lorg/eclipse/jgit/transport/PackParser;->bAvail:I

    add-int/2addr v2, v1

    iput v2, p0, Lorg/eclipse/jgit/transport/PackParser;->bAvail:I

    goto :goto_0

    .line 1141
    .end local v0           #free:I
    .end local v1           #next:I
    :cond_3
    iget v2, p0, Lorg/eclipse/jgit/transport/PackParser;->bOffset:I

    return v2

    .line 1116
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch

    .line 1129
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private firstChildOf(Lorg/eclipse/jgit/transport/PackedObjectInfo;)Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    .locals 9
    .parameter "oe"

    .prologue
    .line 743
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/PackParser;->removeBaseById(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    move-result-object v5

    invoke-static {v5}, Lorg/eclipse/jgit/transport/PackParser;->reverse(Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;)Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    move-result-object v0

    .line 744
    .local v0, a:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    iget-object v5, p0, Lorg/eclipse/jgit/transport/PackParser;->baseByPos:Lorg/eclipse/jgit/transport/LongMap;

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->getOffset()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/eclipse/jgit/transport/LongMap;->remove(J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    invoke-static {v5}, Lorg/eclipse/jgit/transport/PackParser;->reverse(Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;)Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    move-result-object v1

    .line 746
    .local v1, b:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    if-nez v0, :cond_1

    move-object v3, v1

    .line 769
    :cond_0
    :goto_0
    return-object v3

    .line 748
    :cond_1
    if-nez v1, :cond_2

    move-object v3, v0

    .line 749
    goto :goto_0

    .line 751
    :cond_2
    const/4 v3, 0x0

    .line 752
    .local v3, first:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    const/4 v4, 0x0

    .line 753
    .local v4, last:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    :goto_1
    if-nez v0, :cond_3

    if-eqz v1, :cond_0

    .line 755
    :cond_3
    if-eqz v1, :cond_4

    if-eqz v0, :cond_5

    iget-wide v5, v0, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->position:J

    iget-wide v7, v1, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->position:J

    cmp-long v5, v5, v7

    if-gez v5, :cond_5

    .line 756
    :cond_4
    move-object v2, v0

    .line 757
    .local v2, curr:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    iget-object v0, v0, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->next:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    .line 762
    :goto_2
    if-eqz v4, :cond_6

    .line 763
    iput-object v2, v4, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->next:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    .line 766
    :goto_3
    move-object v4, v2

    .line 767
    const/4 v5, 0x0

    iput-object v5, v2, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->next:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    goto :goto_1

    .line 759
    .end local v2           #curr:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    :cond_5
    move-object v2, v1

    .line 760
    .restart local v2       #curr:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    iget-object v1, v1, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->next:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    goto :goto_2

    .line 765
    :cond_6
    move-object v3, v2

    goto :goto_3
.end method

.method private growEntries(I)V
    .locals 4
    .parameter "extraObjects"

    .prologue
    const/4 v3, 0x0

    .line 824
    iget-wide v1, p0, Lorg/eclipse/jgit/transport/PackParser;->objectCount:J

    long-to-int v1, v1

    add-int/2addr v1, p1

    new-array v0, v1, [Lorg/eclipse/jgit/transport/PackedObjectInfo;

    .line 825
    .local v0, ne:[Lorg/eclipse/jgit/transport/PackedObjectInfo;
    iget-object v1, p0, Lorg/eclipse/jgit/transport/PackParser;->entries:[Lorg/eclipse/jgit/transport/PackedObjectInfo;

    iget v2, p0, Lorg/eclipse/jgit/transport/PackParser;->entryCount:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 826
    iput-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->entries:[Lorg/eclipse/jgit/transport/PackedObjectInfo;

    .line 827
    return-void
.end method

.method private indexOneObject()V
    .locals 27
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 891
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/transport/PackParser;->streamPosition()J

    move-result-wide v3

    .line 893
    .local v3, streamPosition:J
    const/16 v20, 0x0

    .line 894
    .local v20, hdrPtr:I
    sget-object v2, Lorg/eclipse/jgit/transport/PackParser$Source;->INPUT:Lorg/eclipse/jgit/transport/PackParser$Source;

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/eclipse/jgit/transport/PackParser;->readFrom(Lorg/eclipse/jgit/transport/PackParser$Source;)I

    move-result v19

    .line 895
    .local v19, c:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/transport/PackParser;->hdrBuf:[B

    add-int/lit8 v21, v20, 0x1

    .end local v20           #hdrPtr:I
    .local v21, hdrPtr:I
    move/from16 v0, v19

    int-to-byte v8, v0

    aput-byte v8, v2, v20

    .line 897
    shr-int/lit8 v2, v19, 0x4

    and-int/lit8 v5, v2, 0x7

    .line 898
    .local v5, typeCode:I
    and-int/lit8 v2, v19, 0xf

    int-to-long v6, v2

    .line 899
    .local v6, sz:J
    const/16 v26, 0x4

    .line 900
    .local v26, shift:I
    :goto_0
    move/from16 v0, v19

    and-int/lit16 v2, v0, 0x80

    if-eqz v2, :cond_0

    .line 901
    sget-object v2, Lorg/eclipse/jgit/transport/PackParser$Source;->INPUT:Lorg/eclipse/jgit/transport/PackParser$Source;

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/eclipse/jgit/transport/PackParser;->readFrom(Lorg/eclipse/jgit/transport/PackParser$Source;)I

    move-result v19

    .line 902
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/transport/PackParser;->hdrBuf:[B

    add-int/lit8 v20, v21, 0x1

    .end local v21           #hdrPtr:I
    .restart local v20       #hdrPtr:I
    move/from16 v0, v19

    int-to-byte v8, v0

    aput-byte v8, v2, v21

    .line 903
    and-int/lit8 v2, v19, 0x7f

    int-to-long v8, v2

    shl-long v8, v8, v26

    add-long/2addr v6, v8

    .line 904
    add-int/lit8 v26, v26, 0x7

    move/from16 v21, v20

    .end local v20           #hdrPtr:I
    .restart local v21       #hdrPtr:I
    goto :goto_0

    .line 907
    :cond_0
    move-object/from16 v0, p0

    invoke-direct {v0, v5, v6, v7}, Lorg/eclipse/jgit/transport/PackParser;->checkIfTooLarge(IJ)V

    .line 909
    packed-switch v5, :pswitch_data_0

    .line 963
    :pswitch_0
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->unknownObjectType:Ljava/lang/String;

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v9, v10

    invoke-static {v8, v9}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v2, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    :pswitch_1
    move-object/from16 v2, p0

    .line 914
    invoke-virtual/range {v2 .. v7}, Lorg/eclipse/jgit/transport/PackParser;->onBeginWholeObject(JIJ)V

    .line 915
    sget-object v2, Lorg/eclipse/jgit/transport/PackParser$Source;->INPUT:Lorg/eclipse/jgit/transport/PackParser$Source;

    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/eclipse/jgit/transport/PackParser;->hdrBuf:[B

    const/4 v9, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v2, v8, v9, v1}, Lorg/eclipse/jgit/transport/PackParser;->onObjectHeader(Lorg/eclipse/jgit/transport/PackParser$Source;[BII)V

    move-object/from16 v2, p0

    .line 916
    invoke-direct/range {v2 .. v7}, Lorg/eclipse/jgit/transport/PackParser;->whole(JIJ)V

    move/from16 v20, v21

    .line 967
    .end local v21           #hdrPtr:I
    .restart local v20       #hdrPtr:I
    :goto_1
    return-void

    .line 920
    .end local v20           #hdrPtr:I
    .restart local v21       #hdrPtr:I
    :pswitch_2
    sget-object v2, Lorg/eclipse/jgit/transport/PackParser$Source;->INPUT:Lorg/eclipse/jgit/transport/PackParser$Source;

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/eclipse/jgit/transport/PackParser;->readFrom(Lorg/eclipse/jgit/transport/PackParser$Source;)I

    move-result v19

    .line 921
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/transport/PackParser;->hdrBuf:[B

    add-int/lit8 v20, v21, 0x1

    .end local v21           #hdrPtr:I
    .restart local v20       #hdrPtr:I
    move/from16 v0, v19

    int-to-byte v8, v0

    aput-byte v8, v2, v21

    .line 922
    and-int/lit8 v2, v19, 0x7f

    int-to-long v0, v2

    move-wide/from16 v23, v0

    .local v23, ofs:J
    move/from16 v21, v20

    .line 923
    .end local v20           #hdrPtr:I
    .restart local v21       #hdrPtr:I
    :goto_2
    move/from16 v0, v19

    and-int/lit16 v2, v0, 0x80

    if-eqz v2, :cond_1

    .line 924
    const-wide/16 v8, 0x1

    add-long v23, v23, v8

    .line 925
    sget-object v2, Lorg/eclipse/jgit/transport/PackParser$Source;->INPUT:Lorg/eclipse/jgit/transport/PackParser$Source;

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/eclipse/jgit/transport/PackParser;->readFrom(Lorg/eclipse/jgit/transport/PackParser$Source;)I

    move-result v19

    .line 926
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/transport/PackParser;->hdrBuf:[B

    add-int/lit8 v20, v21, 0x1

    .end local v21           #hdrPtr:I
    .restart local v20       #hdrPtr:I
    move/from16 v0, v19

    int-to-byte v8, v0

    aput-byte v8, v2, v21

    .line 927
    const/4 v2, 0x7

    shl-long v23, v23, v2

    .line 928
    and-int/lit8 v2, v19, 0x7f

    int-to-long v8, v2

    add-long v23, v23, v8

    move/from16 v21, v20

    .end local v20           #hdrPtr:I
    .restart local v21       #hdrPtr:I
    goto :goto_2

    .line 930
    :cond_1
    sub-long v11, v3, v23

    .local v11, base:J
    move-object/from16 v8, p0

    move-wide v9, v3

    move-wide v13, v6

    .line 931
    invoke-virtual/range {v8 .. v14}, Lorg/eclipse/jgit/transport/PackParser;->onBeginOfsDelta(JJJ)V

    .line 932
    sget-object v2, Lorg/eclipse/jgit/transport/PackParser$Source;->INPUT:Lorg/eclipse/jgit/transport/PackParser$Source;

    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/eclipse/jgit/transport/PackParser;->hdrBuf:[B

    const/4 v9, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v2, v8, v9, v1}, Lorg/eclipse/jgit/transport/PackParser;->onObjectHeader(Lorg/eclipse/jgit/transport/PackParser$Source;[BII)V

    .line 933
    sget-object v2, Lorg/eclipse/jgit/transport/PackParser$Source;->INPUT:Lorg/eclipse/jgit/transport/PackParser$Source;

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v6, v7}, Lorg/eclipse/jgit/transport/PackParser;->inflateAndSkip(Lorg/eclipse/jgit/transport/PackParser$Source;J)V

    .line 934
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/transport/PackParser;->onEndDelta()Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    move-result-object v22

    .line 935
    .local v22, n:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    move-object/from16 v0, v22

    iput-wide v3, v0, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->position:J

    .line 936
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/transport/PackParser;->baseByPos:Lorg/eclipse/jgit/transport/LongMap;

    move-object/from16 v0, v22

    invoke-virtual {v2, v11, v12, v0}, Lorg/eclipse/jgit/transport/LongMap;->put(JLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    move-object/from16 v0, v22

    iput-object v2, v0, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->next:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    .line 937
    move-object/from16 v0, p0

    iget v2, v0, Lorg/eclipse/jgit/transport/PackParser;->deltaCount:I

    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, p0

    iput v2, v0, Lorg/eclipse/jgit/transport/PackParser;->deltaCount:I

    move/from16 v20, v21

    .line 938
    .end local v21           #hdrPtr:I
    .restart local v20       #hdrPtr:I
    goto/16 :goto_1

    .line 942
    .end local v11           #base:J
    .end local v20           #hdrPtr:I
    .end local v22           #n:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    .end local v23           #ofs:J
    .restart local v21       #hdrPtr:I
    :pswitch_3
    sget-object v2, Lorg/eclipse/jgit/transport/PackParser$Source;->INPUT:Lorg/eclipse/jgit/transport/PackParser$Source;

    const/16 v8, 0x14

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v8}, Lorg/eclipse/jgit/transport/PackParser;->fill(Lorg/eclipse/jgit/transport/PackParser$Source;I)I

    move-result v19

    .line 943
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    move/from16 v0, v19

    invoke-static {v2, v0}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([BI)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v11

    .line 944
    .local v11, base:Lorg/eclipse/jgit/lib/ObjectId;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/eclipse/jgit/transport/PackParser;->hdrBuf:[B

    const/16 v9, 0x14

    move/from16 v0, v19

    move/from16 v1, v21

    invoke-static {v2, v0, v8, v1, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 945
    add-int/lit8 v20, v21, 0x14

    .line 946
    .end local v21           #hdrPtr:I
    .restart local v20       #hdrPtr:I
    const/16 v2, 0x14

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/eclipse/jgit/transport/PackParser;->use(I)V

    .line 947
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/transport/PackParser;->baseById:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v2, v11}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v25

    check-cast v25, Lorg/eclipse/jgit/transport/PackParser$DeltaChain;

    .line 948
    .local v25, r:Lorg/eclipse/jgit/transport/PackParser$DeltaChain;
    if-nez v25, :cond_2

    .line 949
    new-instance v25, Lorg/eclipse/jgit/transport/PackParser$DeltaChain;

    .end local v25           #r:Lorg/eclipse/jgit/transport/PackParser$DeltaChain;
    move-object/from16 v0, v25

    invoke-direct {v0, v11}, Lorg/eclipse/jgit/transport/PackParser$DeltaChain;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 950
    .restart local v25       #r:Lorg/eclipse/jgit/transport/PackParser$DeltaChain;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/transport/PackParser;->baseById:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    move-object/from16 v0, v25

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->add(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)V

    :cond_2
    move-object/from16 v13, p0

    move-wide v14, v3

    move-object/from16 v16, v11

    move-wide/from16 v17, v6

    .line 952
    invoke-virtual/range {v13 .. v18}, Lorg/eclipse/jgit/transport/PackParser;->onBeginRefDelta(JLorg/eclipse/jgit/lib/AnyObjectId;J)V

    .line 953
    sget-object v2, Lorg/eclipse/jgit/transport/PackParser$Source;->INPUT:Lorg/eclipse/jgit/transport/PackParser$Source;

    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/eclipse/jgit/transport/PackParser;->hdrBuf:[B

    const/4 v9, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v2, v8, v9, v1}, Lorg/eclipse/jgit/transport/PackParser;->onObjectHeader(Lorg/eclipse/jgit/transport/PackParser$Source;[BII)V

    .line 954
    sget-object v2, Lorg/eclipse/jgit/transport/PackParser$Source;->INPUT:Lorg/eclipse/jgit/transport/PackParser$Source;

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v6, v7}, Lorg/eclipse/jgit/transport/PackParser;->inflateAndSkip(Lorg/eclipse/jgit/transport/PackParser$Source;J)V

    .line 955
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/transport/PackParser;->onEndDelta()Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    move-result-object v22

    .line 956
    .restart local v22       #n:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    move-object/from16 v0, v22

    iput-wide v3, v0, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->position:J

    .line 957
    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/PackParser$DeltaChain;->add(Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;)V

    .line 958
    move-object/from16 v0, p0

    iget v2, v0, Lorg/eclipse/jgit/transport/PackParser;->deltaCount:I

    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, p0

    iput v2, v0, Lorg/eclipse/jgit/transport/PackParser;->deltaCount:I

    goto/16 :goto_1

    .line 909
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private inflate(Lorg/eclipse/jgit/transport/PackParser$Source;J)Ljava/io/InputStream;
    .locals 1
    .parameter "src"
    .parameter "inflatedSize"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1503
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->inflater:Lorg/eclipse/jgit/transport/PackParser$InflaterStream;

    invoke-virtual {v0, p1, p2, p3}, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->open(Lorg/eclipse/jgit/transport/PackParser$Source;J)V

    .line 1504
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->inflater:Lorg/eclipse/jgit/transport/PackParser$InflaterStream;

    return-object v0
.end method

.method private inflateAndReturn(Lorg/eclipse/jgit/transport/PackParser$Source;J)[B
    .locals 4
    .parameter "src"
    .parameter "inflatedSize"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1494
    long-to-int v2, p2

    new-array v0, v2, [B

    .line 1495
    .local v0, dst:[B
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/transport/PackParser;->inflate(Lorg/eclipse/jgit/transport/PackParser$Source;J)Ljava/io/InputStream;

    move-result-object v1

    .line 1496
    .local v1, inf:Ljava/io/InputStream;
    const/4 v2, 0x0

    array-length v3, v0

    invoke-static {v1, v0, v2, v3}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 1497
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 1498
    return-object v0
.end method

.method private inflateAndSkip(Lorg/eclipse/jgit/transport/PackParser$Source;J)V
    .locals 1
    .parameter "src"
    .parameter "inflatedSize"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1487
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/transport/PackParser;->inflate(Lorg/eclipse/jgit/transport/PackParser$Source;J)Ljava/io/InputStream;

    move-result-object v0

    .line 1488
    .local v0, inf:Ljava/io/InputStream;
    invoke-static {v0, p2, p3}, Lorg/eclipse/jgit/util/IO;->skipFully(Ljava/io/InputStream;J)V

    .line 1489
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 1490
    return-void
.end method

.method private needNewObjectIds()Z
    .locals 1

    .prologue
    .line 245
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->newObjectIds:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private openDatabase(Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;)Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;
    .locals 1
    .parameter "delta"
    .parameter "info"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 1091
    iput v0, p0, Lorg/eclipse/jgit/transport/PackParser;->bOffset:I

    .line 1092
    iput v0, p0, Lorg/eclipse/jgit/transport/PackParser;->bAvail:I

    .line 1093
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/transport/PackParser;->seekDatabase(Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;)Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;

    move-result-object v0

    return-object v0
.end method

.method private openDatabase(Lorg/eclipse/jgit/transport/PackedObjectInfo;Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;)Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;
    .locals 1
    .parameter "obj"
    .parameter "info"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 1084
    iput v0, p0, Lorg/eclipse/jgit/transport/PackParser;->bOffset:I

    .line 1085
    iput v0, p0, Lorg/eclipse/jgit/transport/PackParser;->bAvail:I

    .line 1086
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/transport/PackParser;->seekDatabase(Lorg/eclipse/jgit/transport/PackedObjectInfo;Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;)Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;

    move-result-object v0

    return-object v0
.end method

.method private readFrom(Lorg/eclipse/jgit/transport/PackParser$Source;)I
    .locals 3
    .parameter "src"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1098
    iget v0, p0, Lorg/eclipse/jgit/transport/PackParser;->bAvail:I

    if-nez v0, :cond_0

    .line 1099
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/transport/PackParser;->fill(Lorg/eclipse/jgit/transport/PackParser$Source;I)I

    .line 1100
    :cond_0
    iget v0, p0, Lorg/eclipse/jgit/transport/PackParser;->bAvail:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/transport/PackParser;->bAvail:I

    .line 1101
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    iget v1, p0, Lorg/eclipse/jgit/transport/PackParser;->bOffset:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/eclipse/jgit/transport/PackParser;->bOffset:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method private readPackFooter()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v10, 0x0

    const/16 v5, 0x14

    .line 854
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/PackParser;->sync()V

    .line 855
    iget-object v4, p0, Lorg/eclipse/jgit/transport/PackParser;->packDigest:Ljava/security/MessageDigest;

    invoke-virtual {v4}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    .line 857
    .local v0, actHash:[B
    sget-object v4, Lorg/eclipse/jgit/transport/PackParser$Source;->INPUT:Lorg/eclipse/jgit/transport/PackParser$Source;

    invoke-direct {p0, v4, v5}, Lorg/eclipse/jgit/transport/PackParser;->fill(Lorg/eclipse/jgit/transport/PackParser$Source;I)I

    move-result v1

    .line 858
    .local v1, c:I
    new-array v3, v5, [B

    .line 859
    .local v3, srcHash:[B
    iget-object v4, p0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    invoke-static {v4, v1, v3, v10, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 860
    invoke-direct {p0, v5}, Lorg/eclipse/jgit/transport/PackParser;->use(I)V

    .line 862
    iget v4, p0, Lorg/eclipse/jgit/transport/PackParser;->bAvail:I

    if-eqz v4, :cond_0

    iget-boolean v4, p0, Lorg/eclipse/jgit/transport/PackParser;->expectDataAfterPackFooter:Z

    if-nez v4, :cond_0

    .line 863
    new-instance v4, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->expectedEOFReceived:Ljava/lang/String;

    new-array v6, v6, [Ljava/lang/Object;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\\x"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    iget v9, p0, Lorg/eclipse/jgit/transport/PackParser;->bOffset:I

    aget-byte v8, v8, v9

    and-int/lit16 v8, v8, 0xff

    invoke-static {v8}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 866
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/PackParser;->isCheckEofAfterPackFooter()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 867
    iget-object v4, p0, Lorg/eclipse/jgit/transport/PackParser;->in:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->read()I

    move-result v2

    .line 868
    .local v2, eof:I
    if-ltz v2, :cond_2

    .line 869
    new-instance v4, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->expectedEOFReceived:Ljava/lang/String;

    new-array v6, v6, [Ljava/lang/Object;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\\x"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 872
    .end local v2           #eof:I
    :cond_1
    iget v4, p0, Lorg/eclipse/jgit/transport/PackParser;->bAvail:I

    if-lez v4, :cond_2

    iget-boolean v4, p0, Lorg/eclipse/jgit/transport/PackParser;->expectDataAfterPackFooter:Z

    if-eqz v4, :cond_2

    .line 873
    iget-object v4, p0, Lorg/eclipse/jgit/transport/PackParser;->in:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->reset()V

    .line 874
    iget-object v4, p0, Lorg/eclipse/jgit/transport/PackParser;->in:Ljava/io/InputStream;

    iget v5, p0, Lorg/eclipse/jgit/transport/PackParser;->bOffset:I

    int-to-long v5, v5

    invoke-static {v4, v5, v6}, Lorg/eclipse/jgit/util/IO;->skipFully(Ljava/io/InputStream;J)V

    .line 877
    :cond_2
    invoke-static {v0, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v4

    if-nez v4, :cond_3

    .line 878
    new-instance v4, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectPackfileChecksumIncorrect:Ljava/lang/String;

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 881
    :cond_3
    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/transport/PackParser;->onPackFooter([B)V

    .line 882
    return-void
.end method

.method private readPackHeader()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 830
    iget-boolean v5, p0, Lorg/eclipse/jgit/transport/PackParser;->expectDataAfterPackFooter:Z

    if-eqz v5, :cond_1

    .line 831
    iget-object v5, p0, Lorg/eclipse/jgit/transport/PackParser;->in:Ljava/io/InputStream;

    invoke-virtual {v5}, Ljava/io/InputStream;->markSupported()Z

    move-result v5

    if-nez v5, :cond_0

    .line 832
    new-instance v5, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->inputStreamMustSupportMark:Ljava/lang/String;

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 834
    :cond_0
    iget-object v5, p0, Lorg/eclipse/jgit/transport/PackParser;->in:Ljava/io/InputStream;

    iget-object v6, p0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    array-length v6, v6

    invoke-virtual {v5, v6}, Ljava/io/InputStream;->mark(I)V

    .line 837
    :cond_1
    sget-object v5, Lorg/eclipse/jgit/lib/Constants;->PACK_SIGNATURE:[B

    array-length v5, v5

    add-int/lit8 v5, v5, 0x4

    add-int/lit8 v0, v5, 0x4

    .line 838
    .local v0, hdrln:I
    sget-object v5, Lorg/eclipse/jgit/transport/PackParser$Source;->INPUT:Lorg/eclipse/jgit/transport/PackParser$Source;

    invoke-direct {p0, v5, v0}, Lorg/eclipse/jgit/transport/PackParser;->fill(Lorg/eclipse/jgit/transport/PackParser$Source;I)I

    move-result v2

    .line 839
    .local v2, p:I
    const/4 v1, 0x0

    .local v1, k:I
    :goto_0
    sget-object v5, Lorg/eclipse/jgit/lib/Constants;->PACK_SIGNATURE:[B

    array-length v5, v5

    if-ge v1, v5, :cond_3

    .line 840
    iget-object v5, p0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    add-int v6, v2, v1

    aget-byte v5, v5, v6

    sget-object v6, Lorg/eclipse/jgit/lib/Constants;->PACK_SIGNATURE:[B

    aget-byte v6, v6, v1

    if-eq v5, v6, :cond_2

    .line 841
    new-instance v5, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->notAPACKFile:Ljava/lang/String;

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 839
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 843
    :cond_3
    iget-object v5, p0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    add-int/lit8 v6, v2, 0x4

    invoke-static {v5, v6}, Lorg/eclipse/jgit/util/NB;->decodeUInt32([BI)J

    move-result-wide v3

    .line 844
    .local v3, vers:J
    const-wide/16 v5, 0x2

    cmp-long v5, v3, v5

    if-eqz v5, :cond_4

    const-wide/16 v5, 0x3

    cmp-long v5, v3, v5

    if-eqz v5, :cond_4

    .line 845
    new-instance v5, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->unsupportedPackVersion:Ljava/lang/String;

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 847
    :cond_4
    iget-object v5, p0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    add-int/lit8 v6, v2, 0x8

    invoke-static {v5, v6}, Lorg/eclipse/jgit/util/NB;->decodeUInt32([BI)J

    move-result-wide v5

    iput-wide v5, p0, Lorg/eclipse/jgit/transport/PackParser;->objectCount:J

    .line 848
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/PackParser;->use(I)V

    .line 850
    iget-wide v5, p0, Lorg/eclipse/jgit/transport/PackParser;->objectCount:J

    invoke-virtual {p0, v5, v6}, Lorg/eclipse/jgit/transport/PackParser;->onPackHeader(J)V

    .line 851
    return-void
.end method

.method private removeBaseById(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    .locals 2
    .parameter "id"

    .prologue
    .line 727
    iget-object v1, p0, Lorg/eclipse/jgit/transport/PackParser;->baseById:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/PackParser$DeltaChain;

    .line 728
    .local v0, d:Lorg/eclipse/jgit/transport/PackParser$DeltaChain;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/PackParser$DeltaChain;->remove()Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private resolveDeltas(Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 4
    .parameter "progress"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 548
    iget v1, p0, Lorg/eclipse/jgit/transport/PackParser;->entryCount:I

    .line 549
    .local v1, last:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 550
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->entries:[Lorg/eclipse/jgit/transport/PackedObjectInfo;

    aget-object v2, v2, v0

    invoke-direct {p0, v2, p1}, Lorg/eclipse/jgit/transport/PackParser;->resolveDeltas(Lorg/eclipse/jgit/transport/PackedObjectInfo;Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 551
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->isCancelled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 552
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->downloadCancelledDuringIndexing:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 549
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 555
    :cond_1
    return-void
.end method

.method private resolveDeltas(Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;ILorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 8
    .parameter "visit"
    .parameter "type"
    .parameter "info"
    .parameter "progress"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v7, 0x0

    .line 594
    :cond_0
    invoke-interface {p4, v5}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 595
    iget-object v2, p1, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->delta:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    invoke-direct {p0, v2, p3}, Lorg/eclipse/jgit/transport/PackParser;->openDatabase(Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;)Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;

    move-result-object p3

    .line 596
    iget v2, p3, Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;->type:I

    packed-switch v2, :pswitch_data_0

    .line 602
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->unknownObjectType:Ljava/lang/String;

    new-array v4, v5, [Ljava/lang/Object;

    iget v5, p3, Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;->type:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 607
    :pswitch_0
    sget-object v2, Lorg/eclipse/jgit/transport/PackParser$Source;->DATABASE:Lorg/eclipse/jgit/transport/PackParser$Source;

    iget-wide v3, p3, Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;->size:J

    invoke-direct {p0, v2, v3, v4}, Lorg/eclipse/jgit/transport/PackParser;->inflateAndReturn(Lorg/eclipse/jgit/transport/PackParser$Source;J)[B

    move-result-object v0

    .line 608
    .local v0, delta:[B
    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/pack/BinaryDelta;->getResultSize([B)J

    move-result-wide v2

    invoke-direct {p0, p2, v2, v3}, Lorg/eclipse/jgit/transport/PackParser;->checkIfTooLarge(IJ)V

    .line 610
    iget-object v2, p1, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->parent:Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;

    iget-object v2, v2, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->data:[B

    invoke-static {v2, v0}, Lorg/eclipse/jgit/internal/storage/pack/BinaryDelta;->apply([B[B)[B

    move-result-object v2

    iput-object v2, p1, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->data:[B

    .line 611
    const/4 v0, 0x0

    .line 613
    iget-object v2, p1, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->delta:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    iget v2, v2, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->crc:I

    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/transport/PackParser;->checkCRC(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 614
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->corruptionDetectedReReadingAt:Ljava/lang/String;

    new-array v4, v5, [Ljava/lang/Object;

    iget-object v5, p1, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->delta:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    iget-wide v5, v5, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->position:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 618
    :cond_1
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->objectDigest:Ljava/security/MessageDigest;

    invoke-static {p2}, Lorg/eclipse/jgit/lib/Constants;->encodedTypeString(I)[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/security/MessageDigest;->update([B)V

    .line 619
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->objectDigest:Ljava/security/MessageDigest;

    const/16 v3, 0x20

    invoke-virtual {v2, v3}, Ljava/security/MessageDigest;->update(B)V

    .line 620
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->objectDigest:Ljava/security/MessageDigest;

    iget-object v3, p1, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->data:[B

    array-length v3, v3

    int-to-long v3, v3

    invoke-static {v3, v4}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(J)[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/security/MessageDigest;->update([B)V

    .line 621
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->objectDigest:Ljava/security/MessageDigest;

    invoke-virtual {v2, v7}, Ljava/security/MessageDigest;->update(B)V

    .line 622
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->objectDigest:Ljava/security/MessageDigest;

    iget-object v3, p1, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->data:[B

    invoke-virtual {v2, v3}, Ljava/security/MessageDigest;->update([B)V

    .line 623
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->tempObjectId:Lorg/eclipse/jgit/lib/MutableObjectId;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/PackParser;->objectDigest:Ljava/security/MessageDigest;

    invoke-virtual {v3}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v3

    invoke-virtual {v2, v3, v7}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromRaw([BI)V

    .line 625
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->tempObjectId:Lorg/eclipse/jgit/lib/MutableObjectId;

    iget-object v3, p1, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->data:[B

    invoke-direct {p0, v2, p2, v3}, Lorg/eclipse/jgit/transport/PackParser;->verifySafeObject(Lorg/eclipse/jgit/lib/AnyObjectId;I[B)V

    .line 628
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->tempObjectId:Lorg/eclipse/jgit/lib/MutableObjectId;

    iget-object v3, p1, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->delta:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    iget-object v4, p1, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->parent:Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;

    iget-object v4, v4, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->id:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {p0, v2, v3, v4}, Lorg/eclipse/jgit/transport/PackParser;->newInfo(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/transport/PackedObjectInfo;

    move-result-object v1

    .line 629
    .local v1, oe:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    iget-object v2, p1, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->delta:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    iget-wide v2, v2, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->position:J

    invoke-virtual {v1, v2, v3}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->setOffset(J)V

    .line 630
    iget-object v2, p1, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->data:[B

    invoke-virtual {p0, v1, p2, v2}, Lorg/eclipse/jgit/transport/PackParser;->onInflatedObjectData(Lorg/eclipse/jgit/transport/PackedObjectInfo;I[B)V

    .line 631
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/transport/PackParser;->addObjectAndTrack(Lorg/eclipse/jgit/transport/PackedObjectInfo;)V

    .line 632
    iput-object v1, p1, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->id:Lorg/eclipse/jgit/lib/ObjectId;

    .line 634
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/transport/PackParser;->firstChildOf(Lorg/eclipse/jgit/transport/PackedObjectInfo;)Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    move-result-object v2

    iput-object v2, p1, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->nextChild:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    .line 635
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->next()Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;

    move-result-object p1

    .line 636
    if-nez p1, :cond_0

    .line 637
    return-void

    .line 596
    nop

    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private resolveDeltas(Lorg/eclipse/jgit/transport/PackedObjectInfo;Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 9
    .parameter "oe"
    .parameter "progress"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v8, 0x0

    .line 559
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/PackParser;->firstChildOf(Lorg/eclipse/jgit/transport/PackedObjectInfo;)Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    move-result-object v0

    .line 560
    .local v0, children:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    if-nez v0, :cond_0

    .line 588
    :goto_0
    return-void

    .line 563
    :cond_0
    new-instance v2, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;

    invoke-direct {v2}, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;-><init>()V

    .line 564
    .local v2, visit:Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;
    iput-object v0, v2, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->nextChild:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    .line 566
    new-instance v3, Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;

    invoke-direct {v3}, Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;-><init>()V

    invoke-direct {p0, p1, v3}, Lorg/eclipse/jgit/transport/PackParser;->openDatabase(Lorg/eclipse/jgit/transport/PackedObjectInfo;Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;)Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;

    move-result-object v1

    .line 567
    .local v1, info:Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;
    iget v3, v1, Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;->type:I

    packed-switch v3, :pswitch_data_0

    .line 576
    new-instance v3, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->unknownObjectType:Ljava/lang/String;

    new-array v5, v6, [Ljava/lang/Object;

    iget v6, v1, Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;->type:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 572
    :pswitch_0
    sget-object v3, Lorg/eclipse/jgit/transport/PackParser$Source;->DATABASE:Lorg/eclipse/jgit/transport/PackParser$Source;

    iget-wide v4, v1, Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;->size:J

    invoke-direct {p0, v3, v4, v5}, Lorg/eclipse/jgit/transport/PackParser;->inflateAndReturn(Lorg/eclipse/jgit/transport/PackParser$Source;J)[B

    move-result-object v3

    iput-object v3, v2, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->data:[B

    .line 573
    iput-object p1, v2, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->id:Lorg/eclipse/jgit/lib/ObjectId;

    .line 581
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->getCRC()I

    move-result v3

    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/transport/PackParser;->checkCRC(I)Z

    move-result v3

    if-nez v3, :cond_1

    .line 582
    new-instance v3, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->corruptionDetectedReReadingAt:Ljava/lang/String;

    new-array v5, v6, [Ljava/lang/Object;

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->getOffset()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 587
    :cond_1
    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->next()Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;

    move-result-object v3

    iget v4, v1, Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;->type:I

    invoke-direct {p0, v3, v4, v1, p2}, Lorg/eclipse/jgit/transport/PackParser;->resolveDeltas(Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;ILorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    goto :goto_0

    .line 567
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private resolveDeltasWithExternalBases(Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 13
    .parameter "progress"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    .line 774
    iget-object v9, p0, Lorg/eclipse/jgit/transport/PackParser;->baseById:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v9}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->size()I

    move-result v9

    invoke-direct {p0, v9}, Lorg/eclipse/jgit/transport/PackParser;->growEntries(I)V

    .line 776
    iget-boolean v9, p0, Lorg/eclipse/jgit/transport/PackParser;->needBaseObjectIds:Z

    if-eqz v9, :cond_0

    .line 777
    new-instance v9, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;

    invoke-direct {v9}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;-><init>()V

    iput-object v9, p0, Lorg/eclipse/jgit/transport/PackParser;->baseObjectIds:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;

    .line 779
    :cond_0
    new-instance v4, Ljava/util/ArrayList;

    const/16 v9, 0x40

    invoke-direct {v4, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 780
    .local v4, missing:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/PackParser$DeltaChain;>;"
    iget-object v9, p0, Lorg/eclipse/jgit/transport/PackParser;->baseById:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v9}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/transport/PackParser$DeltaChain;

    .line 781
    .local v1, baseId:Lorg/eclipse/jgit/transport/PackParser$DeltaChain;
    iget-object v9, v1, Lorg/eclipse/jgit/transport/PackParser$DeltaChain;->head:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    if-eqz v9, :cond_1

    .line 784
    iget-boolean v9, p0, Lorg/eclipse/jgit/transport/PackParser;->needBaseObjectIds:Z

    if-eqz v9, :cond_2

    .line 785
    iget-object v9, p0, Lorg/eclipse/jgit/transport/PackParser;->baseObjectIds:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;

    invoke-virtual {v9, v1}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->add(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 789
    :cond_2
    :try_start_0
    iget-object v9, p0, Lorg/eclipse/jgit/transport/PackParser;->readCurs:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v9, v1}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 795
    .local v3, ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    new-instance v8, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;

    invoke-direct {v8}, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;-><init>()V

    .line 796
    .local v8, visit:Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;
    const v9, 0x7fffffff

    invoke-virtual {v3, v9}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes(I)[B

    move-result-object v9

    iput-object v9, v8, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->data:[B

    .line 797
    iput-object v1, v8, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->id:Lorg/eclipse/jgit/lib/ObjectId;

    .line 798
    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/ObjectLoader;->getType()I

    move-result v7

    .line 799
    .local v7, typeCode:I
    invoke-virtual {p0, v1, v12, v12}, Lorg/eclipse/jgit/transport/PackParser;->newInfo(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/transport/PackedObjectInfo;

    move-result-object v6

    .line 801
    .local v6, oe:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    iget-object v9, v8, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->data:[B

    invoke-virtual {p0, v7, v9, v6}, Lorg/eclipse/jgit/transport/PackParser;->onAppendBase(I[BLorg/eclipse/jgit/transport/PackedObjectInfo;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 802
    iget-object v9, p0, Lorg/eclipse/jgit/transport/PackParser;->entries:[Lorg/eclipse/jgit/transport/PackedObjectInfo;

    iget v10, p0, Lorg/eclipse/jgit/transport/PackParser;->entryCount:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lorg/eclipse/jgit/transport/PackParser;->entryCount:I

    aput-object v6, v9, v10

    .line 804
    :cond_3
    invoke-direct {p0, v6}, Lorg/eclipse/jgit/transport/PackParser;->firstChildOf(Lorg/eclipse/jgit/transport/PackedObjectInfo;)Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    move-result-object v9

    iput-object v9, v8, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->nextChild:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    .line 805
    invoke-virtual {v8}, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->next()Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;

    move-result-object v9

    new-instance v10, Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;

    invoke-direct {v10}, Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;-><init>()V

    invoke-direct {p0, v9, v7, v10, p1}, Lorg/eclipse/jgit/transport/PackParser;->resolveDeltas(Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;ILorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 808
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->isCancelled()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 809
    new-instance v9, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v10

    iget-object v10, v10, Lorg/eclipse/jgit/internal/JGitText;->downloadCancelledDuringIndexing:Ljava/lang/String;

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 790
    .end local v3           #ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    .end local v6           #oe:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    .end local v7           #typeCode:I
    .end local v8           #visit:Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;
    :catch_0
    move-exception v5

    .line 791
    .local v5, notFound:Lorg/eclipse/jgit/errors/MissingObjectException;
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 813
    .end local v1           #baseId:Lorg/eclipse/jgit/transport/PackParser$DeltaChain;
    .end local v5           #notFound:Lorg/eclipse/jgit/errors/MissingObjectException;
    :cond_4
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/PackParser$DeltaChain;

    .line 814
    .local v0, base:Lorg/eclipse/jgit/transport/PackParser$DeltaChain;
    iget-object v9, v0, Lorg/eclipse/jgit/transport/PackParser$DeltaChain;->head:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    if-eqz v9, :cond_5

    .line 815
    new-instance v9, Lorg/eclipse/jgit/errors/MissingObjectException;

    const-string v10, "delta base"

    invoke-direct {v9, v0, v10}, Lorg/eclipse/jgit/errors/MissingObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v9

    .line 818
    .end local v0           #base:Lorg/eclipse/jgit/transport/PackParser$DeltaChain;
    :cond_6
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/PackParser;->onEndThinPack()V

    .line 819
    return-void
.end method

.method private static reverse(Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;)Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    .locals 2
    .parameter "c"

    .prologue
    .line 732
    const/4 v1, 0x0

    .line 733
    .local v1, tail:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    :goto_0
    if-eqz p0, :cond_0

    .line 734
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->next:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    .line 735
    .local v0, n:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    iput-object v1, p0, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->next:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    .line 736
    move-object v1, p0

    .line 737
    move-object p0, v0

    .line 738
    goto :goto_0

    .line 739
    .end local v0           #n:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    :cond_0
    return-object v1
.end method

.method private streamPosition()J
    .locals 4

    .prologue
    .line 1079
    iget-wide v0, p0, Lorg/eclipse/jgit/transport/PackParser;->bBase:J

    iget v2, p0, Lorg/eclipse/jgit/transport/PackParser;->bOffset:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    return-wide v0
.end method

.method private sync()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 1146
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->packDigest:Ljava/security/MessageDigest;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    iget v2, p0, Lorg/eclipse/jgit/transport/PackParser;->bOffset:I

    invoke-virtual {v0, v1, v4, v2}, Ljava/security/MessageDigest;->update([BII)V

    .line 1147
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    iget v1, p0, Lorg/eclipse/jgit/transport/PackParser;->bOffset:I

    invoke-virtual {p0, v0, v4, v1}, Lorg/eclipse/jgit/transport/PackParser;->onStoreStream([BII)V

    .line 1148
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/PackParser;->expectDataAfterPackFooter:Z

    if-eqz v0, :cond_2

    .line 1149
    iget v0, p0, Lorg/eclipse/jgit/transport/PackParser;->bAvail:I

    if-lez v0, :cond_0

    .line 1150
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->reset()V

    .line 1151
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->in:Ljava/io/InputStream;

    iget v1, p0, Lorg/eclipse/jgit/transport/PackParser;->bOffset:I

    int-to-long v1, v1

    invoke-static {v0, v1, v2}, Lorg/eclipse/jgit/util/IO;->skipFully(Ljava/io/InputStream;J)V

    .line 1152
    iput v4, p0, Lorg/eclipse/jgit/transport/PackParser;->bAvail:I

    .line 1154
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->in:Ljava/io/InputStream;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    array-length v1, v1

    invoke-virtual {v0, v1}, Ljava/io/InputStream;->mark(I)V

    .line 1157
    :cond_1
    :goto_0
    iget-wide v0, p0, Lorg/eclipse/jgit/transport/PackParser;->bBase:J

    iget v2, p0, Lorg/eclipse/jgit/transport/PackParser;->bOffset:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/eclipse/jgit/transport/PackParser;->bBase:J

    .line 1158
    iput v4, p0, Lorg/eclipse/jgit/transport/PackParser;->bOffset:I

    .line 1159
    return-void

    .line 1155
    :cond_2
    iget v0, p0, Lorg/eclipse/jgit/transport/PackParser;->bAvail:I

    if-lez v0, :cond_1

    .line 1156
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    iget v1, p0, Lorg/eclipse/jgit/transport/PackParser;->bOffset:I

    iget-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    iget v3, p0, Lorg/eclipse/jgit/transport/PackParser;->bAvail:I

    invoke-static {v0, v1, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method private use(I)V
    .locals 1
    .parameter "cnt"

    .prologue
    .line 1106
    iget v0, p0, Lorg/eclipse/jgit/transport/PackParser;->bOffset:I

    add-int/2addr v0, p1

    iput v0, p0, Lorg/eclipse/jgit/transport/PackParser;->bOffset:I

    .line 1107
    iget v0, p0, Lorg/eclipse/jgit/transport/PackParser;->bAvail:I

    sub-int/2addr v0, p1

    iput v0, p0, Lorg/eclipse/jgit/transport/PackParser;->bAvail:I

    .line 1108
    return-void
.end method

.method private verifySafeObject(Lorg/eclipse/jgit/lib/AnyObjectId;I[B)V
    .locals 9
    .parameter "id"
    .parameter "type"
    .parameter "data"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 1013
    iget-object v3, p0, Lorg/eclipse/jgit/transport/PackParser;->objCheck:Lorg/eclipse/jgit/lib/ObjectChecker;

    if-eqz v3, :cond_0

    .line 1015
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/transport/PackParser;->objCheck:Lorg/eclipse/jgit/lib/ObjectChecker;

    invoke-virtual {v3, p2, p3}, Lorg/eclipse/jgit/lib/ObjectChecker;->check(I[B)V
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/CorruptObjectException; {:try_start_0 .. :try_end_0} :catch_1

    .line 1026
    :cond_0
    :try_start_1
    iget-object v3, p0, Lorg/eclipse/jgit/transport/PackParser;->readCurs:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v3, p1, p2}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v2

    .line 1027
    .local v2, ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    array-length v3, p3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes(I)[B

    move-result-object v1

    .line 1028
    .local v1, existingData:[B
    invoke-static {p3, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v3

    if-nez v3, :cond_1

    .line 1029
    new-instance v3, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->collisionOn:Ljava/lang/String;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->name()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_1
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_1 .. :try_end_1} :catch_0

    .line 1032
    .end local v1           #existingData:[B
    .end local v2           #ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    :catch_0
    move-exception v3

    .line 1037
    :cond_1
    return-void

    .line 1016
    :catch_1
    move-exception v0

    .line 1017
    .local v0, e:Lorg/eclipse/jgit/errors/CorruptObjectException;
    new-instance v3, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->invalidObject:Ljava/lang/String;

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {p2}, Lorg/eclipse/jgit/lib/Constants;->typeString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    iget-object v6, p0, Lorg/eclipse/jgit/transport/PackParser;->readCurs:Lorg/eclipse/jgit/lib/ObjectReader;

    const/16 v7, 0xa

    invoke-virtual {v6, p1, v7}, Lorg/eclipse/jgit/lib/ObjectReader;->abbreviate(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v6

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->name()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v8

    const/4 v6, 0x2

    invoke-virtual {v0}, Lorg/eclipse/jgit/errors/CorruptObjectException;->getMessage()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method private whole(JIJ)V
    .locals 13
    .parameter "pos"
    .parameter "type"
    .parameter "sz"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 971
    iget-object v10, p0, Lorg/eclipse/jgit/transport/PackParser;->objectDigest:Ljava/security/MessageDigest;

    invoke-static/range {p3 .. p3}, Lorg/eclipse/jgit/lib/Constants;->encodedTypeString(I)[B

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/security/MessageDigest;->update([B)V

    .line 972
    iget-object v10, p0, Lorg/eclipse/jgit/transport/PackParser;->objectDigest:Ljava/security/MessageDigest;

    const/16 v11, 0x20

    invoke-virtual {v10, v11}, Ljava/security/MessageDigest;->update(B)V

    .line 973
    iget-object v10, p0, Lorg/eclipse/jgit/transport/PackParser;->objectDigest:Ljava/security/MessageDigest;

    invoke-static/range {p4 .. p5}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(J)[B

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/security/MessageDigest;->update([B)V

    .line 974
    iget-object v10, p0, Lorg/eclipse/jgit/transport/PackParser;->objectDigest:Ljava/security/MessageDigest;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Ljava/security/MessageDigest;->update(B)V

    .line 977
    const/4 v2, 0x0

    .line 978
    .local v2, checkContentLater:Z
    const/4 v10, 0x3

    move/from16 v0, p3

    if-ne v0, v10, :cond_4

    .line 979
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/PackParser;->buffer()[B

    move-result-object v9

    .line 980
    .local v9, readBuffer:[B
    sget-object v10, Lorg/eclipse/jgit/transport/PackParser$Source;->INPUT:Lorg/eclipse/jgit/transport/PackParser$Source;

    move-wide/from16 v0, p4

    invoke-direct {p0, v10, v0, v1}, Lorg/eclipse/jgit/transport/PackParser;->inflate(Lorg/eclipse/jgit/transport/PackParser$Source;J)Ljava/io/InputStream;

    move-result-object v6

    .line 981
    .local v6, inf:Ljava/io/InputStream;
    const-wide/16 v3, 0x0

    .line 982
    .local v3, cnt:J
    :goto_0
    cmp-long v10, v3, p4

    if-gez v10, :cond_0

    .line 983
    invoke-virtual {v6, v9}, Ljava/io/InputStream;->read([B)I

    move-result v8

    .line 984
    .local v8, r:I
    if-gtz v8, :cond_3

    .line 989
    .end local v8           #r:I
    :cond_0
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 990
    iget-object v10, p0, Lorg/eclipse/jgit/transport/PackParser;->tempObjectId:Lorg/eclipse/jgit/lib/MutableObjectId;

    iget-object v11, p0, Lorg/eclipse/jgit/transport/PackParser;->objectDigest:Ljava/security/MessageDigest;

    invoke-virtual {v11}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v11

    const/4 v12, 0x0

    invoke-virtual {v10, v11, v12}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromRaw([BI)V

    .line 991
    iget-object v10, p0, Lorg/eclipse/jgit/transport/PackParser;->readCurs:Lorg/eclipse/jgit/lib/ObjectReader;

    iget-object v11, p0, Lorg/eclipse/jgit/transport/PackParser;->tempObjectId:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v10, v11}, Lorg/eclipse/jgit/lib/ObjectReader;->has(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v2

    .line 992
    const/4 v5, 0x0

    .line 1001
    .end local v3           #cnt:J
    .end local v6           #inf:Ljava/io/InputStream;
    .end local v9           #readBuffer:[B
    .local v5, data:[B
    :goto_1
    iget-object v10, p0, Lorg/eclipse/jgit/transport/PackParser;->tempObjectId:Lorg/eclipse/jgit/lib/MutableObjectId;

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual {p0, v10, v11, v12}, Lorg/eclipse/jgit/transport/PackParser;->newInfo(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/transport/PackedObjectInfo;

    move-result-object v7

    .line 1002
    .local v7, obj:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    invoke-virtual {v7, p1, p2}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->setOffset(J)V

    .line 1003
    invoke-virtual {p0, v7}, Lorg/eclipse/jgit/transport/PackParser;->onEndWholeObject(Lorg/eclipse/jgit/transport/PackedObjectInfo;)V

    .line 1004
    if-eqz v5, :cond_1

    .line 1005
    move/from16 v0, p3

    invoke-virtual {p0, v7, v0, v5}, Lorg/eclipse/jgit/transport/PackParser;->onInflatedObjectData(Lorg/eclipse/jgit/transport/PackedObjectInfo;I[B)V

    .line 1006
    :cond_1
    invoke-direct {p0, v7}, Lorg/eclipse/jgit/transport/PackParser;->addObjectAndTrack(Lorg/eclipse/jgit/transport/PackedObjectInfo;)V

    .line 1007
    if-eqz v2, :cond_2

    .line 1008
    iget-object v10, p0, Lorg/eclipse/jgit/transport/PackParser;->deferredCheckBlobs:Lorg/eclipse/jgit/util/BlockList;

    invoke-virtual {v10, v7}, Lorg/eclipse/jgit/util/BlockList;->add(Ljava/lang/Object;)Z

    .line 1009
    :cond_2
    return-void

    .line 986
    .end local v5           #data:[B
    .end local v7           #obj:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    .restart local v3       #cnt:J
    .restart local v6       #inf:Ljava/io/InputStream;
    .restart local v8       #r:I
    .restart local v9       #readBuffer:[B
    :cond_3
    iget-object v10, p0, Lorg/eclipse/jgit/transport/PackParser;->objectDigest:Ljava/security/MessageDigest;

    const/4 v11, 0x0

    invoke-virtual {v10, v9, v11, v8}, Ljava/security/MessageDigest;->update([BII)V

    .line 987
    int-to-long v10, v8

    add-long/2addr v3, v10

    .line 988
    goto :goto_0

    .line 995
    .end local v3           #cnt:J
    .end local v6           #inf:Ljava/io/InputStream;
    .end local v8           #r:I
    .end local v9           #readBuffer:[B
    :cond_4
    sget-object v10, Lorg/eclipse/jgit/transport/PackParser$Source;->INPUT:Lorg/eclipse/jgit/transport/PackParser$Source;

    move-wide/from16 v0, p4

    invoke-direct {p0, v10, v0, v1}, Lorg/eclipse/jgit/transport/PackParser;->inflateAndReturn(Lorg/eclipse/jgit/transport/PackParser$Source;J)[B

    move-result-object v5

    .line 996
    .restart local v5       #data:[B
    iget-object v10, p0, Lorg/eclipse/jgit/transport/PackParser;->objectDigest:Ljava/security/MessageDigest;

    invoke-virtual {v10, v5}, Ljava/security/MessageDigest;->update([B)V

    .line 997
    iget-object v10, p0, Lorg/eclipse/jgit/transport/PackParser;->tempObjectId:Lorg/eclipse/jgit/lib/MutableObjectId;

    iget-object v11, p0, Lorg/eclipse/jgit/transport/PackParser;->objectDigest:Ljava/security/MessageDigest;

    invoke-virtual {v11}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v11

    const/4 v12, 0x0

    invoke-virtual {v10, v11, v12}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromRaw([BI)V

    .line 998
    iget-object v10, p0, Lorg/eclipse/jgit/transport/PackParser;->tempObjectId:Lorg/eclipse/jgit/lib/MutableObjectId;

    move/from16 v0, p3

    invoke-direct {p0, v10, v0, v5}, Lorg/eclipse/jgit/transport/PackParser;->verifySafeObject(Lorg/eclipse/jgit/lib/AnyObjectId;I[B)V

    goto :goto_1
.end method


# virtual methods
.method protected buffer()[B
    .locals 1

    .prologue
    .line 1163
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->tempBuffer:[B

    return-object v0
.end method

.method protected abstract checkCRC(I)Z
.end method

.method public getBaseObjectIds()Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/eclipse/jgit/lib/ObjectIdSubclassMap",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation

    .prologue
    .line 302
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->baseObjectIds:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;

    if-eqz v0, :cond_0

    .line 303
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->baseObjectIds:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;

    .line 304
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;-><init>()V

    goto :goto_0
.end method

.method public getLockMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 343
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->lockMessage:Ljava/lang/String;

    return-object v0
.end method

.method public getNewObjectIds()Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/eclipse/jgit/lib/ObjectIdSubclassMap",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation

    .prologue
    .line 295
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->newObjectIds:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;

    if-eqz v0, :cond_0

    .line 296
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->newObjectIds:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;

    .line 297
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;-><init>()V

    goto :goto_0
.end method

.method public getObject(I)Lorg/eclipse/jgit/transport/PackedObjectInfo;
    .locals 1
    .parameter "nth"

    .prologue
    .line 395
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->entries:[Lorg/eclipse/jgit/transport/PackedObjectInfo;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getObjectCount()I
    .locals 1

    .prologue
    .line 380
    iget v0, p0, Lorg/eclipse/jgit/transport/PackParser;->entryCount:I

    return v0
.end method

.method public getPackSize()J
    .locals 2

    .prologue
    .line 432
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public getSortedObjectList(Ljava/util/Comparator;)Ljava/util/List;
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<",
            "Lorg/eclipse/jgit/transport/PackedObjectInfo;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/PackedObjectInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .local p1, cmp:Ljava/util/Comparator;,"Ljava/util/Comparator<Lorg/eclipse/jgit/transport/PackedObjectInfo;>;"
    const/4 v3, 0x0

    .line 414
    iget-object v1, p0, Lorg/eclipse/jgit/transport/PackParser;->entries:[Lorg/eclipse/jgit/transport/PackedObjectInfo;

    iget v2, p0, Lorg/eclipse/jgit/transport/PackParser;->entryCount:I

    invoke-static {v1, v3, v2, p1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;IILjava/util/Comparator;)V

    .line 415
    iget-object v1, p0, Lorg/eclipse/jgit/transport/PackParser;->entries:[Lorg/eclipse/jgit/transport/PackedObjectInfo;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 416
    .local v0, list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/PackedObjectInfo;>;"
    iget v1, p0, Lorg/eclipse/jgit/transport/PackParser;->entryCount:I

    iget-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->entries:[Lorg/eclipse/jgit/transport/PackedObjectInfo;

    array-length v2, v2

    if-ge v1, v2, :cond_0

    .line 417
    iget v1, p0, Lorg/eclipse/jgit/transport/PackParser;->entryCount:I

    invoke-interface {v0, v3, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    .line 418
    :cond_0
    return-object v0
.end method

.method public isAllowThin()Z
    .locals 1

    .prologue
    .line 211
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/PackParser;->allowThin:Z

    return v0
.end method

.method public isCheckEofAfterPackFooter()Z
    .locals 1

    .prologue
    .line 265
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/PackParser;->checkEofAfterPackFooter:Z

    return v0
.end method

.method public isExpectDataAfterPackFooter()Z
    .locals 1

    .prologue
    .line 280
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/PackParser;->expectDataAfterPackFooter:Z

    return v0
.end method

.method protected newInfo(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/transport/PackedObjectInfo;
    .locals 2
    .parameter "id"
    .parameter "delta"
    .parameter "deltaBase"

    .prologue
    .line 1182
    new-instance v0, Lorg/eclipse/jgit/transport/PackedObjectInfo;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/transport/PackedObjectInfo;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 1183
    .local v0, oe:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    if-eqz p2, :cond_0

    .line 1184
    iget v1, p2, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->crc:I

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->setCRC(I)V

    .line 1185
    :cond_0
    return-object v0
.end method

.method protected abstract onAppendBase(I[BLorg/eclipse/jgit/transport/PackedObjectInfo;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract onBeginOfsDelta(JJJ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract onBeginRefDelta(JLorg/eclipse/jgit/lib/AnyObjectId;J)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract onBeginWholeObject(JIJ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected onEndDelta()Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1473
    new-instance v0, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;-><init>()V

    return-object v0
.end method

.method protected abstract onEndThinPack()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract onEndWholeObject(Lorg/eclipse/jgit/transport/PackedObjectInfo;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract onInflatedObjectData(Lorg/eclipse/jgit/transport/PackedObjectInfo;I[B)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract onObjectData(Lorg/eclipse/jgit/transport/PackParser$Source;[BII)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract onObjectHeader(Lorg/eclipse/jgit/transport/PackParser$Source;[BII)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract onPackFooter([B)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract onPackHeader(J)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract onStoreStream([BII)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public final parse(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/internal/storage/file/PackLock;
    .locals 1
    .parameter "progress"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 448
    invoke-virtual {p0, p1, p1}, Lorg/eclipse/jgit/transport/PackParser;->parse(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/internal/storage/file/PackLock;

    move-result-object v0

    return-object v0
.end method

.method public parse(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/internal/storage/file/PackLock;
    .locals 11
    .parameter "receiving"
    .parameter "resolving"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 468
    if-nez p1, :cond_0

    .line 469
    sget-object p1, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    .line 470
    :cond_0
    if-nez p2, :cond_1

    .line 471
    sget-object p2, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    .line 473
    :cond_1
    if-ne p1, p2, :cond_2

    .line 474
    const/4 v2, 0x2

    invoke-interface {p1, v2}, Lorg/eclipse/jgit/lib/ProgressMonitor;->start(I)V

    .line 476
    :cond_2
    :try_start_0
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/PackParser;->readPackHeader()V

    .line 478
    iget-wide v2, p0, Lorg/eclipse/jgit/transport/PackParser;->objectCount:J

    long-to-int v2, v2

    new-array v2, v2, [Lorg/eclipse/jgit/transport/PackedObjectInfo;

    iput-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->entries:[Lorg/eclipse/jgit/transport/PackedObjectInfo;

    .line 479
    new-instance v2, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-direct {v2}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;-><init>()V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->baseById:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    .line 480
    new-instance v2, Lorg/eclipse/jgit/transport/LongMap;

    invoke-direct {v2}, Lorg/eclipse/jgit/transport/LongMap;-><init>()V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->baseByPos:Lorg/eclipse/jgit/transport/LongMap;

    .line 481
    new-instance v2, Lorg/eclipse/jgit/util/BlockList;

    invoke-direct {v2}, Lorg/eclipse/jgit/util/BlockList;-><init>()V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->deferredCheckBlobs:Lorg/eclipse/jgit/util/BlockList;

    .line 483
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->receivingObjects:Ljava/lang/String;

    iget-wide v3, p0, Lorg/eclipse/jgit/transport/PackParser;->objectCount:J

    long-to-int v3, v3

    invoke-interface {p1, v2, v3}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 486
    const/4 v1, 0x0

    .local v1, done:I
    :goto_0
    int-to-long v2, v1

    :try_start_1
    iget-wide v4, p0, Lorg/eclipse/jgit/transport/PackParser;->objectCount:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_5

    .line 487
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/PackParser;->indexOneObject()V

    .line 488
    const/4 v2, 0x1

    invoke-interface {p1, v2}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 489
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->isCancelled()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 490
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->downloadCancelled:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 495
    :catchall_0
    move-exception v2

    :try_start_2
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 530
    .end local v1           #done:I
    :catchall_1
    move-exception v2

    .line 531
    :try_start_3
    iget-object v3, p0, Lorg/eclipse/jgit/transport/PackParser;->readCurs:Lorg/eclipse/jgit/lib/ObjectReader;

    if-eqz v3, :cond_3

    .line 532
    iget-object v3, p0, Lorg/eclipse/jgit/transport/PackParser;->readCurs:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    .line 534
    :cond_3
    iput-object v10, p0, Lorg/eclipse/jgit/transport/PackParser;->readCurs:Lorg/eclipse/jgit/lib/ObjectReader;

    .line 538
    :try_start_4
    iget-object v3, p0, Lorg/eclipse/jgit/transport/PackParser;->inflater:Lorg/eclipse/jgit/transport/PackParser$InflaterStream;

    invoke-virtual {v3}, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->release()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_5

    .line 540
    iput-object v10, p0, Lorg/eclipse/jgit/transport/PackParser;->inflater:Lorg/eclipse/jgit/transport/PackParser$InflaterStream;

    throw v2

    .line 486
    .restart local v1       #done:I
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 492
    :cond_5
    :try_start_5
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/PackParser;->readPackFooter()V

    .line 493
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/PackParser;->endInput()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 495
    :try_start_6
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 498
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->deferredCheckBlobs:Lorg/eclipse/jgit/util/BlockList;

    invoke-virtual {v2}, Lorg/eclipse/jgit/util/BlockList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_6

    .line 499
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/PackParser;->doDeferredCheckBlobs()V

    .line 500
    :cond_6
    iget v2, p0, Lorg/eclipse/jgit/transport/PackParser;->deltaCount:I

    if-lez v2, :cond_a

    .line 501
    instance-of v2, p2, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;

    if-eqz v2, :cond_7

    .line 502
    move-object v0, p2

    check-cast v0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;

    move-object v2, v0

    const-wide/16 v3, 0x3e8

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v3, v4, v5}, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->setDelayStart(JLjava/util/concurrent/TimeUnit;)V

    .line 506
    :cond_7
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->resolvingDeltas:Ljava/lang/String;

    iget v3, p0, Lorg/eclipse/jgit/transport/PackParser;->deltaCount:I

    invoke-interface {p2, v2, v3}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 507
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/transport/PackParser;->resolveDeltas(Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 508
    iget v2, p0, Lorg/eclipse/jgit/transport/PackParser;->entryCount:I

    int-to-long v2, v2

    iget-wide v4, p0, Lorg/eclipse/jgit/transport/PackParser;->objectCount:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_9

    .line 509
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/PackParser;->isAllowThin()Z

    move-result v2

    if-nez v2, :cond_8

    .line 510
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->packHasUnresolvedDeltas:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-wide v6, p0, Lorg/eclipse/jgit/transport/PackParser;->objectCount:J

    iget v8, p0, Lorg/eclipse/jgit/transport/PackParser;->entryCount:I

    int-to-long v8, v8

    sub-long/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 515
    :cond_8
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/transport/PackParser;->resolveDeltasWithExternalBases(Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 517
    iget v2, p0, Lorg/eclipse/jgit/transport/PackParser;->entryCount:I

    int-to-long v2, v2

    iget-wide v4, p0, Lorg/eclipse/jgit/transport/PackParser;->objectCount:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_9

    .line 518
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->packHasUnresolvedDeltas:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-wide v6, p0, Lorg/eclipse/jgit/transport/PackParser;->objectCount:J

    iget v8, p0, Lorg/eclipse/jgit/transport/PackParser;->entryCount:I

    int-to-long v8, v8

    sub-long/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 523
    :cond_9
    invoke-interface {p2}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 526
    :cond_a
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->packDigest:Ljava/security/MessageDigest;

    .line 527
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->baseById:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    .line 528
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->baseByPos:Lorg/eclipse/jgit/transport/LongMap;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 531
    :try_start_7
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->readCurs:Lorg/eclipse/jgit/lib/ObjectReader;

    if-eqz v2, :cond_b

    .line 532
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->readCurs:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 534
    :cond_b
    iput-object v10, p0, Lorg/eclipse/jgit/transport/PackParser;->readCurs:Lorg/eclipse/jgit/lib/ObjectReader;

    .line 538
    :try_start_8
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PackParser;->inflater:Lorg/eclipse/jgit/transport/PackParser$InflaterStream;

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->release()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 540
    iput-object v10, p0, Lorg/eclipse/jgit/transport/PackParser;->inflater:Lorg/eclipse/jgit/transport/PackParser$InflaterStream;

    .line 543
    return-object v10

    .line 534
    :catchall_2
    move-exception v2

    iput-object v10, p0, Lorg/eclipse/jgit/transport/PackParser;->readCurs:Lorg/eclipse/jgit/lib/ObjectReader;

    throw v2

    .line 540
    :catchall_3
    move-exception v2

    iput-object v10, p0, Lorg/eclipse/jgit/transport/PackParser;->inflater:Lorg/eclipse/jgit/transport/PackParser$InflaterStream;

    throw v2

    .line 534
    .end local v1           #done:I
    :catchall_4
    move-exception v2

    iput-object v10, p0, Lorg/eclipse/jgit/transport/PackParser;->readCurs:Lorg/eclipse/jgit/lib/ObjectReader;

    throw v2

    .line 540
    :catchall_5
    move-exception v2

    iput-object v10, p0, Lorg/eclipse/jgit/transport/PackParser;->inflater:Lorg/eclipse/jgit/transport/PackParser$InflaterStream;

    throw v2
.end method

.method protected abstract readDatabase([BII)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected readObjectHeader(Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;)Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;
    .locals 11
    .parameter "info"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x14

    const/4 v10, 0x0

    .line 678
    const/4 v1, 0x0

    .line 679
    .local v1, hdrPtr:I
    sget-object v6, Lorg/eclipse/jgit/transport/PackParser$Source;->DATABASE:Lorg/eclipse/jgit/transport/PackParser$Source;

    invoke-direct {p0, v6}, Lorg/eclipse/jgit/transport/PackParser;->readFrom(Lorg/eclipse/jgit/transport/PackParser$Source;)I

    move-result v0

    .line 680
    .local v0, c:I
    iget-object v6, p0, Lorg/eclipse/jgit/transport/PackParser;->hdrBuf:[B

    add-int/lit8 v2, v1, 0x1

    .end local v1           #hdrPtr:I
    .local v2, hdrPtr:I
    int-to-byte v7, v0

    aput-byte v7, v6, v1

    .line 682
    shr-int/lit8 v6, v0, 0x4

    and-int/lit8 v6, v6, 0x7

    iput v6, p1, Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;->type:I

    .line 683
    and-int/lit8 v6, v0, 0xf

    int-to-long v4, v6

    .line 684
    .local v4, sz:J
    const/4 v3, 0x4

    .line 685
    .local v3, shift:I
    :goto_0
    and-int/lit16 v6, v0, 0x80

    if-eqz v6, :cond_0

    .line 686
    sget-object v6, Lorg/eclipse/jgit/transport/PackParser$Source;->DATABASE:Lorg/eclipse/jgit/transport/PackParser$Source;

    invoke-direct {p0, v6}, Lorg/eclipse/jgit/transport/PackParser;->readFrom(Lorg/eclipse/jgit/transport/PackParser$Source;)I

    move-result v0

    .line 687
    iget-object v6, p0, Lorg/eclipse/jgit/transport/PackParser;->hdrBuf:[B

    add-int/lit8 v1, v2, 0x1

    .end local v2           #hdrPtr:I
    .restart local v1       #hdrPtr:I
    int-to-byte v7, v0

    aput-byte v7, v6, v2

    .line 688
    and-int/lit8 v6, v0, 0x7f

    int-to-long v6, v6

    shl-long/2addr v6, v3

    add-long/2addr v4, v6

    .line 689
    add-int/lit8 v3, v3, 0x7

    move v2, v1

    .end local v1           #hdrPtr:I
    .restart local v2       #hdrPtr:I
    goto :goto_0

    .line 691
    :cond_0
    iput-wide v4, p1, Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;->size:J

    .line 693
    iget v6, p1, Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;->type:I

    packed-switch v6, :pswitch_data_0

    .line 719
    :pswitch_0
    new-instance v6, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->unknownObjectType:Ljava/lang/String;

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    iget v9, p1, Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;->type:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-static {v7, v8}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 698
    :pswitch_1
    sget-object v6, Lorg/eclipse/jgit/transport/PackParser$Source;->DATABASE:Lorg/eclipse/jgit/transport/PackParser$Source;

    iget-object v7, p0, Lorg/eclipse/jgit/transport/PackParser;->hdrBuf:[B

    invoke-virtual {p0, v6, v7, v10, v2}, Lorg/eclipse/jgit/transport/PackParser;->onObjectHeader(Lorg/eclipse/jgit/transport/PackParser$Source;[BII)V

    move v1, v2

    .line 723
    .end local v2           #hdrPtr:I
    .restart local v1       #hdrPtr:I
    :goto_1
    return-object p1

    .line 702
    .end local v1           #hdrPtr:I
    .restart local v2       #hdrPtr:I
    :pswitch_2
    sget-object v6, Lorg/eclipse/jgit/transport/PackParser$Source;->DATABASE:Lorg/eclipse/jgit/transport/PackParser$Source;

    invoke-direct {p0, v6}, Lorg/eclipse/jgit/transport/PackParser;->readFrom(Lorg/eclipse/jgit/transport/PackParser$Source;)I

    move-result v0

    .line 703
    iget-object v6, p0, Lorg/eclipse/jgit/transport/PackParser;->hdrBuf:[B

    add-int/lit8 v1, v2, 0x1

    .end local v2           #hdrPtr:I
    .restart local v1       #hdrPtr:I
    int-to-byte v7, v0

    aput-byte v7, v6, v2

    move v2, v1

    .line 704
    .end local v1           #hdrPtr:I
    .restart local v2       #hdrPtr:I
    :goto_2
    and-int/lit16 v6, v0, 0x80

    if-eqz v6, :cond_1

    .line 705
    sget-object v6, Lorg/eclipse/jgit/transport/PackParser$Source;->DATABASE:Lorg/eclipse/jgit/transport/PackParser$Source;

    invoke-direct {p0, v6}, Lorg/eclipse/jgit/transport/PackParser;->readFrom(Lorg/eclipse/jgit/transport/PackParser$Source;)I

    move-result v0

    .line 706
    iget-object v6, p0, Lorg/eclipse/jgit/transport/PackParser;->hdrBuf:[B

    add-int/lit8 v1, v2, 0x1

    .end local v2           #hdrPtr:I
    .restart local v1       #hdrPtr:I
    int-to-byte v7, v0

    aput-byte v7, v6, v2

    move v2, v1

    .end local v1           #hdrPtr:I
    .restart local v2       #hdrPtr:I
    goto :goto_2

    .line 708
    :cond_1
    sget-object v6, Lorg/eclipse/jgit/transport/PackParser$Source;->DATABASE:Lorg/eclipse/jgit/transport/PackParser$Source;

    iget-object v7, p0, Lorg/eclipse/jgit/transport/PackParser;->hdrBuf:[B

    invoke-virtual {p0, v6, v7, v10, v2}, Lorg/eclipse/jgit/transport/PackParser;->onObjectHeader(Lorg/eclipse/jgit/transport/PackParser$Source;[BII)V

    move v1, v2

    .line 709
    .end local v2           #hdrPtr:I
    .restart local v1       #hdrPtr:I
    goto :goto_1

    .line 712
    .end local v1           #hdrPtr:I
    .restart local v2       #hdrPtr:I
    :pswitch_3
    iget-object v6, p0, Lorg/eclipse/jgit/transport/PackParser;->buf:[B

    sget-object v7, Lorg/eclipse/jgit/transport/PackParser$Source;->DATABASE:Lorg/eclipse/jgit/transport/PackParser$Source;

    invoke-direct {p0, v7, v9}, Lorg/eclipse/jgit/transport/PackParser;->fill(Lorg/eclipse/jgit/transport/PackParser$Source;I)I

    move-result v7

    iget-object v8, p0, Lorg/eclipse/jgit/transport/PackParser;->hdrBuf:[B

    invoke-static {v6, v7, v8, v2, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 713
    add-int/lit8 v1, v2, 0x14

    .line 714
    .end local v2           #hdrPtr:I
    .restart local v1       #hdrPtr:I
    invoke-direct {p0, v9}, Lorg/eclipse/jgit/transport/PackParser;->use(I)V

    .line 715
    sget-object v6, Lorg/eclipse/jgit/transport/PackParser$Source;->DATABASE:Lorg/eclipse/jgit/transport/PackParser$Source;

    iget-object v7, p0, Lorg/eclipse/jgit/transport/PackParser;->hdrBuf:[B

    invoke-virtual {p0, v6, v7, v10, v1}, Lorg/eclipse/jgit/transport/PackParser;->onObjectHeader(Lorg/eclipse/jgit/transport/PackParser$Source;[BII)V

    goto :goto_1

    .line 693
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method protected abstract seekDatabase(Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;)Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract seekDatabase(Lorg/eclipse/jgit/transport/PackedObjectInfo;Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;)Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public setAllowThin(Z)V
    .locals 0
    .parameter "allow"

    .prologue
    .line 224
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/PackParser;->allowThin:Z

    .line 225
    return-void
.end method

.method public setCheckEofAfterPackFooter(Z)V
    .locals 0
    .parameter "b"

    .prologue
    .line 275
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/PackParser;->checkEofAfterPackFooter:Z

    .line 276
    return-void
.end method

.method public setExpectDataAfterPackFooter(Z)V
    .locals 0
    .parameter "e"

    .prologue
    .line 290
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/PackParser;->expectDataAfterPackFooter:Z

    .line 291
    return-void
.end method

.method public setLockMessage(Ljava/lang/String;)V
    .locals 0
    .parameter "msg"

    .prologue
    .line 354
    iput-object p1, p0, Lorg/eclipse/jgit/transport/PackParser;->lockMessage:Ljava/lang/String;

    .line 355
    return-void
.end method

.method public setMaxObjectSizeLimit(J)V
    .locals 0
    .parameter "limit"

    .prologue
    .line 367
    iput-wide p1, p0, Lorg/eclipse/jgit/transport/PackParser;->maxObjectSizeLimit:J

    .line 368
    return-void
.end method

.method public setNeedBaseObjectIds(Z)V
    .locals 0
    .parameter "b"

    .prologue
    .line 260
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/PackParser;->needBaseObjectIds:Z

    .line 261
    return-void
.end method

.method public setNeedNewObjectIds(Z)V
    .locals 1
    .parameter "b"

    .prologue
    .line 238
    if-eqz p1, :cond_0

    .line 239
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->newObjectIds:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;

    .line 242
    :goto_0
    return-void

    .line 241
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/PackParser;->newObjectIds:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;

    goto :goto_0
.end method

.method public setObjectChecker(Lorg/eclipse/jgit/lib/ObjectChecker;)V
    .locals 0
    .parameter "oc"

    .prologue
    .line 318
    iput-object p1, p0, Lorg/eclipse/jgit/transport/PackParser;->objCheck:Lorg/eclipse/jgit/lib/ObjectChecker;

    .line 319
    return-void
.end method

.method public setObjectChecking(Z)V
    .locals 1
    .parameter "on"

    .prologue
    .line 338
    if-eqz p1, :cond_0

    new-instance v0, Lorg/eclipse/jgit/lib/ObjectChecker;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/ObjectChecker;-><init>()V

    :goto_0
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/PackParser;->setObjectChecker(Lorg/eclipse/jgit/lib/ObjectChecker;)V

    .line 339
    return-void

    .line 338
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
