.class public abstract Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
.super Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
.source "WorkingTreeIterator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$2;,
        Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;,
        Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;,
        Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;,
        Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$PerDirectoryIgnoreNode;,
        Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$RootIgnoreNode;
    }
.end annotation


# static fields
.field static final BUFFER_SIZE:I = 0x800

.field private static final ENTRY_CMP:Ljava/util/Comparator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;",
            ">;"
        }
    .end annotation
.end field

.field protected static final EOF:[Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry; = null

.field private static final MAXIMUM_FILE_SIZE_TO_READ_FULLY:J = 0x10000L

.field private static final digits:[B

.field private static final hblob:[B


# instance fields
.field private canonLen:J

.field private contentId:[B

.field private contentIdFromPtr:I

.field private contentIdOffset:I

.field private entries:[Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

.field private entryCnt:I

.field private ignoreNode:Lorg/eclipse/jgit/ignore/IgnoreNode;

.field private ptr:I

.field protected repository:Lorg/eclipse/jgit/lib/Repository;

.field private final state:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 104
    const/4 v0, 0x0

    new-array v0, v0, [Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    sput-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->EOF:[Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    .line 322
    const/16 v0, 0xa

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->digits:[B

    .line 325
    const/4 v0, 0x3

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodedTypeString(I)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->hblob:[B

    .line 606
    new-instance v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ENTRY_CMP:Ljava/util/Comparator;

    return-void

    .line 322
    nop

    :array_0
    .array-data 0x1
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
    .end array-data
.end method

.method protected constructor <init>(Ljava/lang/String;Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;)V
    .locals 2
    .parameter "prefix"
    .parameter "options"

    .prologue
    .line 175
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;-><init>(Ljava/lang/String;)V

    .line 140
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->canonLen:J

    .line 176
    new-instance v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;

    invoke-direct {v0, p2}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;-><init>(Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;)V

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->state:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;

    .line 177
    return-void
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)V
    .locals 2
    .parameter "p"

    .prologue
    .line 186
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;-><init>(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    .line 140
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->canonLen:J

    .line 187
    iget-object v0, p1, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->state:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->state:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;

    .line 188
    return-void
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;)V
    .locals 2
    .parameter "options"

    .prologue
    .line 152
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;-><init>()V

    .line 140
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->canonLen:J

    .line 153
    new-instance v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;-><init>(Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;)V

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->state:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;

    .line 154
    return-void
.end method

.method private computeHash(Ljava/io/InputStream;J)[B
    .locals 10
    .parameter "in"
    .parameter "length"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1000
    iget-object v7, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->state:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;

    iget-object v1, v7, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;->contentDigest:Ljava/security/MessageDigest;

    .line 1001
    .local v1, contentDigest:Ljava/security/MessageDigest;
    iget-object v7, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->state:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;

    iget-object v2, v7, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;->contentReadBuffer:[B

    .line 1003
    .local v2, contentReadBuffer:[B
    invoke-virtual {v1}, Ljava/security/MessageDigest;->reset()V

    .line 1004
    sget-object v7, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->hblob:[B

    invoke-virtual {v1, v7}, Ljava/security/MessageDigest;->update([B)V

    .line 1005
    const/16 v7, 0x20

    invoke-virtual {v1, v7}, Ljava/security/MessageDigest;->update(B)V

    .line 1007
    move-wide v5, p2

    .line 1008
    .local v5, sz:J
    const-wide/16 v7, 0x0

    cmp-long v7, v5, v7

    if-nez v7, :cond_0

    .line 1009
    const/16 v7, 0x30

    invoke-virtual {v1, v7}, Ljava/security/MessageDigest;->update(B)V

    .line 1019
    :goto_0
    const/4 v7, 0x0

    invoke-virtual {v1, v7}, Ljava/security/MessageDigest;->update(B)V

    .line 1022
    :goto_1
    invoke-virtual {p1, v2}, Ljava/io/InputStream;->read([B)I

    move-result v4

    .line 1023
    .local v4, r:I
    if-gtz v4, :cond_2

    .line 1028
    cmp-long v7, v5, p2

    if-eqz v7, :cond_3

    .line 1029
    sget-object v7, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->zeroid:[B

    .line 1030
    :goto_2
    return-object v7

    .line 1011
    .end local v4           #r:I
    :cond_0
    array-length v0, v2

    .line 1012
    .local v0, bufn:I
    move v3, v0

    .line 1014
    .local v3, p:I
    :cond_1
    add-int/lit8 v3, v3, -0x1

    sget-object v7, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->digits:[B

    const-wide/16 v8, 0xa

    rem-long v8, v5, v8

    long-to-int v8, v8

    aget-byte v7, v7, v8

    aput-byte v7, v2, v3

    .line 1015
    const-wide/16 v7, 0xa

    div-long/2addr v5, v7

    .line 1016
    const-wide/16 v7, 0x0

    cmp-long v7, v5, v7

    if-gtz v7, :cond_1

    .line 1017
    sub-int v7, v0, v3

    invoke-virtual {v1, v2, v3, v7}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_0

    .line 1025
    .end local v0           #bufn:I
    .end local v3           #p:I
    .restart local v4       #r:I
    :cond_2
    const/4 v7, 0x0

    invoke-virtual {v1, v2, v7, v4}, Ljava/security/MessageDigest;->update([BII)V

    .line 1026
    int-to-long v7, v4

    add-long/2addr v5, v7

    .line 1027
    goto :goto_1

    .line 1030
    :cond_3
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v7

    goto :goto_2
.end method

.method private static computeLength(Ljava/io/InputStream;)J
    .locals 6
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 989
    const-wide/16 v0, 0x0

    .line 991
    .local v0, length:J
    :goto_0
    const-wide/32 v4, 0x100000

    invoke-virtual {p0, v4, v5}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v2

    .line 992
    .local v2, n:J
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-gtz v4, :cond_0

    .line 996
    return-wide v0

    .line 994
    :cond_0
    add-long/2addr v0, v2

    .line 995
    goto :goto_0
.end method

.method private contentCheck(Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)Z
    .locals 13
    .parameter "entry"
    .parameter "reader"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 903
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v10

    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 914
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryLength()J

    move-result-wide v10

    long-to-int v8, v10

    invoke-virtual {p1, v8}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLength(I)V

    move v8, v9

    .line 966
    :cond_0
    :goto_0
    return v8

    .line 918
    :cond_1
    iget v10, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->mode:I

    sget-object v11, Lorg/eclipse/jgit/lib/FileMode;->SYMLINK:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v11}, Lorg/eclipse/jgit/lib/FileMode;->getBits()I

    move-result v11

    if-ne v10, v11, :cond_2

    .line 919
    new-instance v10, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->current()Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    move-result-object v11

    invoke-static {v11}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->readContentAsNormalizedString(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v11, Ljava/io/File;

    invoke-static {p1, p2}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->readContentAsNormalizedString(Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v11}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    move v8, v9

    goto :goto_0

    .line 923
    :cond_2
    if-eqz p2, :cond_0

    .line 925
    sget-object v10, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$2;->$SwitchMap$org$eclipse$jgit$lib$CoreConfig$AutoCRLF:[I

    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getOptions()Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;

    move-result-object v11

    invoke-virtual {v11}, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->getAutoCRLF()Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    move-result-object v11

    invoke-virtual {v11}, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;->ordinal()I

    move-result v11

    aget v10, v10, v11

    packed-switch v10, :pswitch_data_0

    goto :goto_0

    .line 928
    :pswitch_0
    const/4 v2, 0x0

    .line 930
    .local v2, dcIn:Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v10

    invoke-virtual {p2, v10}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_7

    move-result-object v7

    .line 931
    .local v7, loader:Lorg/eclipse/jgit/lib/ObjectLoader;
    if-nez v7, :cond_3

    .line 956
    if-eqz v2, :cond_0

    .line 958
    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 959
    :catch_0
    move-exception v9

    goto :goto_0

    .line 936
    :cond_3
    :try_start_2
    new-instance v3, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/ObjectLoader;->openStream()Lorg/eclipse/jgit/lib/ObjectStream;

    move-result-object v10

    const/4 v11, 0x1

    const/4 v12, 0x1

    invoke-direct {v3, v10, v11, v12}, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;-><init>(Ljava/io/InputStream;ZZ)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_7

    .line 940
    .end local v2           #dcIn:Ljava/io/InputStream;
    .local v3, dcIn:Ljava/io/InputStream;
    :try_start_3
    invoke-static {v3}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->computeLength(Ljava/io/InputStream;)J
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream$IsBinaryException; {:try_start_3 .. :try_end_3} :catch_1

    move-result-wide v4

    .line 944
    .local v4, dcInLen:J
    :try_start_4
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 947
    new-instance v2, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/ObjectLoader;->openStream()Lorg/eclipse/jgit/lib/ObjectStream;

    move-result-object v10

    const/4 v11, 0x1

    invoke-direct {v2, v10, v11}, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;-><init>(Ljava/io/InputStream;Z)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 949
    .end local v3           #dcIn:Ljava/io/InputStream;
    .restart local v2       #dcIn:Ljava/io/InputStream;
    :try_start_5
    invoke-direct {p0, v2, v4, v5}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->computeHash(Ljava/io/InputStream;J)[B

    move-result-object v0

    .line 950
    .local v0, autoCrLfHash:[B
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v10, v0, v11}, Lorg/eclipse/jgit/lib/ObjectId;->compareTo([BI)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_7

    move-result v10

    if-eqz v10, :cond_5

    move v1, v8

    .line 956
    .local v1, changed:Z
    :goto_1
    if-eqz v2, :cond_4

    .line 958
    :try_start_6
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_5

    :cond_4
    :goto_2
    move v8, v1

    .line 961
    goto/16 :goto_0

    .line 941
    .end local v0           #autoCrLfHash:[B
    .end local v1           #changed:Z
    .end local v2           #dcIn:Ljava/io/InputStream;
    .end local v4           #dcInLen:J
    .restart local v3       #dcIn:Ljava/io/InputStream;
    :catch_1
    move-exception v6

    .line 944
    .local v6, e:Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream$IsBinaryException;
    :try_start_7
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    .line 956
    if-eqz v3, :cond_0

    .line 958
    :try_start_8
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_2

    goto/16 :goto_0

    .line 959
    :catch_2
    move-exception v9

    goto/16 :goto_0

    .line 944
    .end local v6           #e:Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream$IsBinaryException;
    :catchall_0
    move-exception v9

    :try_start_9
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    throw v9
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3

    .line 953
    :catch_3
    move-exception v6

    move-object v2, v3

    .line 956
    .end local v3           #dcIn:Ljava/io/InputStream;
    .end local v7           #loader:Lorg/eclipse/jgit/lib/ObjectLoader;
    .restart local v2       #dcIn:Ljava/io/InputStream;
    .local v6, e:Ljava/io/IOException;
    :goto_3
    if-eqz v2, :cond_0

    .line 958
    :try_start_a
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_4

    goto/16 :goto_0

    .line 959
    :catch_4
    move-exception v9

    goto/16 :goto_0

    .end local v6           #e:Ljava/io/IOException;
    .restart local v0       #autoCrLfHash:[B
    .restart local v4       #dcInLen:J
    .restart local v7       #loader:Lorg/eclipse/jgit/lib/ObjectLoader;
    :cond_5
    move v1, v9

    .line 950
    goto :goto_1

    .line 956
    .end local v0           #autoCrLfHash:[B
    .end local v4           #dcInLen:J
    .end local v7           #loader:Lorg/eclipse/jgit/lib/ObjectLoader;
    :catchall_1
    move-exception v8

    :goto_4
    if-eqz v2, :cond_6

    .line 958
    :try_start_b
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_6

    .line 961
    :cond_6
    :goto_5
    throw v8

    .line 959
    .restart local v0       #autoCrLfHash:[B
    .restart local v1       #changed:Z
    .restart local v4       #dcInLen:J
    .restart local v7       #loader:Lorg/eclipse/jgit/lib/ObjectLoader;
    :catch_5
    move-exception v8

    goto :goto_2

    .end local v0           #autoCrLfHash:[B
    .end local v1           #changed:Z
    .end local v4           #dcInLen:J
    .end local v7           #loader:Lorg/eclipse/jgit/lib/ObjectLoader;
    :catch_6
    move-exception v9

    goto :goto_5

    .line 956
    .end local v2           #dcIn:Ljava/io/InputStream;
    .restart local v3       #dcIn:Ljava/io/InputStream;
    .restart local v7       #loader:Lorg/eclipse/jgit/lib/ObjectLoader;
    :catchall_2
    move-exception v8

    move-object v2, v3

    .end local v3           #dcIn:Ljava/io/InputStream;
    .restart local v2       #dcIn:Ljava/io/InputStream;
    goto :goto_4

    .line 953
    .end local v7           #loader:Lorg/eclipse/jgit/lib/ObjectLoader;
    :catch_7
    move-exception v6

    goto :goto_3

    .line 925
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static filterClean(Ljava/io/InputStream;)Ljava/io/InputStream;
    .locals 2
    .parameter "in"

    .prologue
    .line 428
    new-instance v0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;-><init>(Ljava/io/InputStream;Z)V

    return-object v0
.end method

.method private static filterClean([BI)Ljava/nio/ByteBuffer;
    .locals 2
    .parameter "src"
    .parameter "n"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 419
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 421
    .local v0, in:Ljava/io/InputStream;
    :try_start_0
    invoke-static {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->filterClean(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1, p1}, Lorg/eclipse/jgit/util/IO;->readWholeStream(Ljava/io/InputStream;I)Ljava/nio/ByteBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 423
    invoke-static {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->safeClose(Ljava/io/InputStream;)V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-static {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->safeClose(Ljava/io/InputStream;)V

    throw v1
.end method

.method private getIgnoreNode()Lorg/eclipse/jgit/ignore/IgnoreNode;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 601
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ignoreNode:Lorg/eclipse/jgit/ignore/IgnoreNode;

    instance-of v0, v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$PerDirectoryIgnoreNode;

    if-eqz v0, :cond_0

    .line 602
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ignoreNode:Lorg/eclipse/jgit/ignore/IgnoreNode;

    check-cast v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$PerDirectoryIgnoreNode;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$PerDirectoryIgnoreNode;->load()Lorg/eclipse/jgit/ignore/IgnoreNode;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ignoreNode:Lorg/eclipse/jgit/ignore/IgnoreNode;

    .line 603
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ignoreNode:Lorg/eclipse/jgit/ignore/IgnoreNode;

    return-object v0
.end method

.method private idBufferBlob(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)[B
    .locals 7
    .parameter "e"

    .prologue
    .line 330
    :try_start_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->openInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 331
    .local v2, is:Ljava/io/InputStream;
    if-nez v2, :cond_0

    .line 332
    sget-object v5, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->zeroid:[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 344
    .end local v2           #is:Ljava/io/InputStream;
    :goto_0
    return-object v5

    .line 334
    .restart local v2       #is:Ljava/io/InputStream;
    :cond_0
    :try_start_1
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->state:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;

    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;->initializeDigestAndReadBuffer()V

    .line 336
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->getLength()J

    move-result-wide v3

    .line 337
    .local v3, len:J
    invoke-direct {p0, p1, v2, v3, v4}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->possiblyFilteredInputStream(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;Ljava/io/InputStream;J)Ljava/io/InputStream;

    move-result-object v1

    .line 338
    .local v1, filteredIs:Ljava/io/InputStream;
    iget-wide v5, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->canonLen:J

    invoke-direct {p0, v1, v5, v6}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->computeHash(Ljava/io/InputStream;J)[B
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v5

    .line 340
    :try_start_2
    invoke-static {v2}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->safeClose(Ljava/io/InputStream;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 342
    .end local v1           #filteredIs:Ljava/io/InputStream;
    .end local v2           #is:Ljava/io/InputStream;
    .end local v3           #len:J
    :catch_0
    move-exception v0

    .line 344
    .local v0, err:Ljava/io/IOException;
    sget-object v5, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->zeroid:[B

    goto :goto_0

    .line 340
    .end local v0           #err:Ljava/io/IOException;
    .restart local v2       #is:Ljava/io/InputStream;
    :catchall_0
    move-exception v5

    :try_start_3
    invoke-static {v2}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->safeClose(Ljava/io/InputStream;)V

    throw v5
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
.end method

.method private static isBinary(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)Z
    .locals 2
    .parameter "entry"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 409
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->openInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 411
    .local v0, in:Ljava/io/InputStream;
    :try_start_0
    invoke-static {v0}, Lorg/eclipse/jgit/diff/RawText;->isBinary(Ljava/io/InputStream;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 413
    invoke-static {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->safeClose(Ljava/io/InputStream;)V

    return v1

    :catchall_0
    move-exception v1

    invoke-static {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->safeClose(Ljava/io/InputStream;)V

    throw v1
.end method

.method private static isBinary([BI)Z
    .locals 1
    .parameter "content"
    .parameter "sz"

    .prologue
    .line 405
    invoke-static {p0, p1}, Lorg/eclipse/jgit/diff/RawText;->isBinary([BI)Z

    move-result v0

    return v0
.end method

.method static lastPathChar(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)I
    .locals 2
    .parameter "e"

    .prologue
    .line 629
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->getMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v0

    sget-object v1, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    if-ne v0, v1, :cond_0

    const/16 v0, 0x2f

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private mightNeedCleaning()Z
    .locals 2

    .prologue
    .line 393
    sget-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$2;->$SwitchMap$org$eclipse$jgit$lib$CoreConfig$AutoCRLF:[I

    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getOptions()Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->getAutoCRLF()Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 396
    const/4 v0, 0x0

    .line 400
    :goto_0
    return v0

    :pswitch_0
    const/4 v0, 0x1

    goto :goto_0

    .line 393
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private parseEntry()V
    .locals 6

    .prologue
    .line 479
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->entries:[Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    iget v3, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ptr:I

    aget-object v0, v2, v3

    .line 480
    .local v0, e:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;
    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->getMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/FileMode;->getBits()I

    move-result v2

    iput v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->mode:I

    .line 482
    iget v1, v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->encodedNameLen:I

    .line 483
    .local v1, nameLen:I
    iget v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->pathOffset:I

    add-int/2addr v2, v1

    iget v3, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->pathOffset:I

    invoke-virtual {p0, v2, v3}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ensurePathCapacity(II)V

    .line 484
    iget-object v2, v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->encodedName:[B

    const/4 v3, 0x0

    iget-object v4, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->path:[B

    iget v5, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->pathOffset:I

    invoke-static {v2, v3, v4, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 485
    iget v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->pathOffset:I

    add-int/2addr v2, v1

    iput v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->pathLen:I

    .line 486
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->canonLen:J

    .line 487
    return-void
.end method

.method private possiblyFilteredInputStream(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;Ljava/io/InputStream;J)Ljava/io/InputStream;
    .locals 6
    .parameter "e"
    .parameter "is"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 350
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->mightNeedCleaning()Z

    move-result v4

    if-nez v4, :cond_0

    .line 351
    iput-wide p3, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->canonLen:J

    .line 379
    .end local p2
    :goto_0
    return-object p2

    .line 355
    .restart local p2
    :cond_0
    const-wide/32 v4, 0x10000

    cmp-long v4, p3, v4

    if-gtz v4, :cond_2

    .line 356
    long-to-int v4, p3

    invoke-static {p2, v4}, Lorg/eclipse/jgit/util/IO;->readWholeStream(Ljava/io/InputStream;I)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 357
    .local v3, rawbuf:Ljava/nio/ByteBuffer;
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    .line 358
    .local v2, raw:[B
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    .line 359
    .local v1, n:I
    invoke-static {v2, v1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->isBinary([BI)Z

    move-result v4

    if-nez v4, :cond_1

    .line 360
    invoke-static {v2, v1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->filterClean([BI)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 361
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    .line 362
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    .line 364
    :cond_1
    int-to-long v4, v1

    iput-wide v4, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->canonLen:J

    .line 365
    new-instance p2, Ljava/io/ByteArrayInputStream;

    .end local p2
    const/4 v4, 0x0

    invoke-direct {p2, v2, v4, v1}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    goto :goto_0

    .line 368
    .end local v1           #n:I
    .end local v2           #raw:[B
    .end local v3           #rawbuf:Ljava/nio/ByteBuffer;
    .restart local p2
    :cond_2
    invoke-static {p1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->isBinary(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 369
    iput-wide p3, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->canonLen:J

    goto :goto_0

    .line 373
    :cond_3
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->openInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-static {v4}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->filterClean(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v0

    .line 375
    .local v0, lenIs:Ljava/io/InputStream;
    :try_start_0
    invoke-static {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->computeLength(Ljava/io/InputStream;)J

    move-result-wide v4

    iput-wide v4, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->canonLen:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 377
    invoke-static {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->safeClose(Ljava/io/InputStream;)V

    .line 379
    invoke-static {p2}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->filterClean(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object p2

    goto :goto_0

    .line 377
    :catchall_0
    move-exception v4

    invoke-static {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->safeClose(Ljava/io/InputStream;)V

    throw v4
.end method

.method private static readContentAsNormalizedString(Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)Ljava/lang/String;
    .locals 4
    .parameter "entry"
    .parameter "reader"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 972
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v1

    .line 973
    .local v1, open:Lorg/eclipse/jgit/lib/ObjectLoader;
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes()[B

    move-result-object v0

    .line 974
    .local v0, cachedBytes:[B
    invoke-static {}, Lorg/eclipse/jgit/util/FS;->detect()Lorg/eclipse/jgit/util/FS;

    move-result-object v2

    invoke-static {v0}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/util/FS;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static readContentAsNormalizedString(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)Ljava/lang/String;
    .locals 6
    .parameter "entry"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 978
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->getLength()J

    move-result-wide v2

    .line 979
    .local v2, length:J
    long-to-int v4, v2

    new-array v0, v4, [B

    .line 980
    .local v0, content:[B
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->openInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 981
    .local v1, is:Ljava/io/InputStream;
    const/4 v4, 0x0

    long-to-int v5, v2

    invoke-static {v1, v0, v4, v5}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 982
    invoke-static {}, Lorg/eclipse/jgit/util/FS;->detect()Lorg/eclipse/jgit/util/FS;

    move-result-object v4

    invoke-static {v0}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([B)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/util/FS;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private static safeClose(Ljava/io/InputStream;)V
    .locals 1
    .parameter "in"

    .prologue
    .line 384
    :try_start_0
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 390
    :goto_0
    return-void

    .line 385
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public back(I)V
    .locals 1
    .parameter "delta"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 474
    iget v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ptr:I

    sub-int/2addr v0, p1

    iput v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ptr:I

    .line 475
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->parseEntry()V

    .line 476
    return-void
.end method

.method public compareMetadata(Lorg/eclipse/jgit/dircache/DirCacheEntry;)Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;
    .locals 11
    .parameter "entry"

    .prologue
    .line 748
    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->isAssumeValid()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 749
    sget-object v8, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->EQUAL:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    .line 785
    :goto_0
    return-object v8

    .line 751
    :cond_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->isUpdateNeeded()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 752
    sget-object v8, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->DIFFER_BY_METADATA:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    goto :goto_0

    .line 754
    :cond_1
    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->isSmudged()Z

    move-result v8

    if-nez v8, :cond_2

    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getLength()I

    move-result v8

    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryLength()J

    move-result-wide v9

    long-to-int v9, v9

    if-eq v8, v9, :cond_2

    .line 755
    sget-object v8, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->DIFFER_BY_METADATA:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    goto :goto_0

    .line 757
    :cond_2
    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getRawMode()I

    move-result v8

    invoke-virtual {p0, v8}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->isModeDifferent(I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 758
    sget-object v8, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->DIFFER_BY_METADATA:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    goto :goto_0

    .line 765
    :cond_3
    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getLastModified()J

    move-result-wide v0

    .line 766
    .local v0, cacheLastModified:J
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryLastModified()J

    move-result-wide v4

    .line 767
    .local v4, fileLastModified:J
    const-wide/16 v8, 0x3e8

    rem-long v6, v4, v8

    .line 768
    .local v6, lastModifiedMillis:J
    const-wide/16 v8, 0x3e8

    rem-long v2, v0, v8

    .line 769
    .local v2, cacheMillis:J
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getOptions()Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;

    move-result-object v8

    invoke-virtual {v8}, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->getCheckStat()Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;

    move-result-object v8

    sget-object v9, Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;->MINIMAL:Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;

    if-ne v8, v9, :cond_5

    .line 770
    sub-long/2addr v4, v6

    .line 771
    sub-long/2addr v0, v2

    .line 779
    :cond_4
    :goto_1
    cmp-long v8, v4, v0

    if-eqz v8, :cond_7

    .line 780
    sget-object v8, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->DIFFER_BY_TIMESTAMP:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    goto :goto_0

    .line 772
    :cond_5
    const-wide/16 v8, 0x0

    cmp-long v8, v2, v8

    if-nez v8, :cond_6

    .line 773
    sub-long/2addr v4, v6

    goto :goto_1

    .line 776
    :cond_6
    const-wide/16 v8, 0x0

    cmp-long v8, v6, v8

    if-nez v8, :cond_4

    .line 777
    sub-long/2addr v0, v2

    goto :goto_1

    .line 781
    :cond_7
    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->isSmudged()Z

    move-result v8

    if-nez v8, :cond_8

    .line 783
    sget-object v8, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->EQUAL:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    goto :goto_0

    .line 785
    :cond_8
    sget-object v8, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->SMUDGED:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    goto :goto_0
.end method

.method protected current()Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;
    .locals 2

    .prologue
    .line 679
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->entries:[Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    iget v1, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ptr:I

    aget-object v0, v0, v1

    return-object v0
.end method

.method public eof()Z
    .locals 2

    .prologue
    .line 461
    iget v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ptr:I

    iget v1, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->entryCnt:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public first()Z
    .locals 1

    .prologue
    .line 456
    iget v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ptr:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getEntryContentLength()J
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v7, 0x0

    .line 505
    iget-wide v3, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->canonLen:J

    const-wide/16 v5, -0x1

    cmp-long v3, v3, v5

    if-nez v3, :cond_1

    .line 506
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryLength()J

    move-result-wide v1

    .line 507
    .local v1, rawLen:J
    cmp-long v3, v1, v7

    if-nez v3, :cond_0

    .line 508
    iput-wide v7, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->canonLen:J

    .line 509
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->current()Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->openInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 512
    .local v0, is:Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->current()Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    move-result-object v3

    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->current()Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->getLength()J

    move-result-wide v4

    invoke-direct {p0, v3, v0, v4, v5}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->possiblyFilteredInputStream(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;Ljava/io/InputStream;J)Ljava/io/InputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 515
    invoke-static {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->safeClose(Ljava/io/InputStream;)V

    .line 518
    .end local v0           #is:Ljava/io/InputStream;
    .end local v1           #rawLen:J
    :cond_1
    iget-wide v3, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->canonLen:J

    return-wide v3

    .line 515
    .restart local v0       #is:Ljava/io/InputStream;
    .restart local v1       #rawLen:J
    :catchall_0
    move-exception v3

    invoke-static {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->safeClose(Ljava/io/InputStream;)V

    throw v3
.end method

.method public getEntryLastModified()J
    .locals 2

    .prologue
    .line 528
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->current()Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->getLastModified()J

    move-result-wide v0

    return-wide v0
.end method

.method public getEntryLength()J
    .locals 2

    .prologue
    .line 495
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->current()Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->getLength()J

    move-result-wide v0

    return-wide v0
.end method

.method public getIndexFileMode(Lorg/eclipse/jgit/dircache/DirCacheIterator;)Lorg/eclipse/jgit/lib/FileMode;
    .locals 3
    .parameter "indexIter"

    .prologue
    .line 874
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v1

    .line 875
    .local v1, wtMode:Lorg/eclipse/jgit/lib/FileMode;
    if-nez p1, :cond_1

    .line 886
    .end local v1           #wtMode:Lorg/eclipse/jgit/lib/FileMode;
    :cond_0
    :goto_0
    return-object v1

    .line 877
    .restart local v1       #wtMode:Lorg/eclipse/jgit/lib/FileMode;
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getOptions()Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->isFileMode()Z

    move-result v2

    if-nez v2, :cond_0

    .line 879
    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v0

    .line 880
    .local v0, iMode:Lorg/eclipse/jgit/lib/FileMode;
    sget-object v2, Lorg/eclipse/jgit/lib/FileMode;->REGULAR_FILE:Lorg/eclipse/jgit/lib/FileMode;

    if-ne v2, v1, :cond_2

    sget-object v2, Lorg/eclipse/jgit/lib/FileMode;->EXECUTABLE_FILE:Lorg/eclipse/jgit/lib/FileMode;

    if-ne v2, v0, :cond_2

    move-object v1, v0

    .line 882
    goto :goto_0

    .line 883
    :cond_2
    sget-object v2, Lorg/eclipse/jgit/lib/FileMode;->EXECUTABLE_FILE:Lorg/eclipse/jgit/lib/FileMode;

    if-ne v2, v1, :cond_0

    sget-object v2, Lorg/eclipse/jgit/lib/FileMode;->REGULAR_FILE:Lorg/eclipse/jgit/lib/FileMode;

    if-ne v2, v0, :cond_0

    move-object v1, v0

    .line 885
    goto :goto_0
.end method

.method public getOptions()Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;
    .locals 1

    .prologue
    .line 437
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->state:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;

    iget-object v0, v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;->options:Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;

    return-object v0
.end method

.method public hasId()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 229
    iget v1, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->contentIdFromPtr:I

    iget v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ptr:I

    if-ne v1, v2, :cond_1

    .line 231
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget v1, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->mode:I

    const v2, 0xf000

    and-int/2addr v1, v2

    const v2, 0x8000

    if-eq v1, v2, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public idBuffer()[B
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 236
    iget v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->contentIdFromPtr:I

    iget v3, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ptr:I

    if-ne v2, v3, :cond_0

    .line 237
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->contentId:[B

    .line 267
    :goto_0
    return-object v2

    .line 239
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->state:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;

    iget-object v2, v2, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;->walk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    if-eqz v2, :cond_2

    .line 244
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->state:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;

    iget-object v2, v2, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;->walk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v3, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->state:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;

    iget v3, v3, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;->dirCacheTree:I

    const-class v4, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    invoke-virtual {v2, v3, v4}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    .line 246
    .local v1, i:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    if-eqz v1, :cond_3

    .line 247
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v0

    .line 248
    .local v0, ent:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    if-eqz v0, :cond_1

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->compareMetadata(Lorg/eclipse/jgit/dircache/DirCacheEntry;)Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    move-result-object v2

    sget-object v3, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->EQUAL:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    if-ne v2, v3, :cond_1

    .line 249
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->idOffset()I

    move-result v2

    iput v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->contentIdOffset:I

    .line 250
    iget v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ptr:I

    iput v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->contentIdFromPtr:I

    .line 251
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->idBuffer()[B

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->contentId:[B

    goto :goto_0

    .line 253
    :cond_1
    iput v5, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->contentIdOffset:I

    .line 258
    .end local v0           #ent:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .end local v1           #i:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    :cond_2
    :goto_1
    iget v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->mode:I

    const v3, 0xf000

    and-int/2addr v2, v3

    sparse-switch v2, :sswitch_data_0

    .line 267
    sget-object v2, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->zeroid:[B

    goto :goto_0

    .line 255
    .restart local v1       #i:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    :cond_3
    iput v5, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->contentIdOffset:I

    goto :goto_1

    .line 261
    .end local v1           #i:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    :sswitch_0
    iget v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ptr:I

    iput v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->contentIdFromPtr:I

    .line 262
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->entries:[Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    iget v3, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ptr:I

    aget-object v2, v2, v3

    invoke-direct {p0, v2}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->idBufferBlob(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)[B

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->contentId:[B

    goto :goto_0

    .line 264
    :sswitch_1
    iget v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ptr:I

    iput v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->contentIdFromPtr:I

    .line 265
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->entries:[Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    iget v3, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ptr:I

    aget-object v2, v2, v3

    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->idSubmodule(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)[B

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->contentId:[B

    goto :goto_0

    .line 258
    :sswitch_data_0
    .sparse-switch
        0x8000 -> :sswitch_0
        0xa000 -> :sswitch_0
        0xe000 -> :sswitch_1
    .end sparse-switch
.end method

.method public idOffset()I
    .locals 1

    .prologue
    .line 442
    iget v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->contentIdOffset:I

    return v0
.end method

.method protected idSubmodule(Ljava/io/File;Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)[B
    .locals 5
    .parameter "directory"
    .parameter "e"

    .prologue
    .line 299
    :try_start_0
    invoke-virtual {p2}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {p1, v4}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getSubmoduleRepository(Ljava/io/File;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Repository;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 304
    .local v3, submoduleRepo:Lorg/eclipse/jgit/lib/Repository;
    if-nez v3, :cond_0

    .line 305
    sget-object v2, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->zeroid:[B

    .line 319
    .end local v3           #submoduleRepo:Lorg/eclipse/jgit/lib/Repository;
    :goto_0
    return-object v2

    .line 301
    :catch_0
    move-exception v0

    .line 302
    .local v0, exception:Ljava/io/IOException;
    sget-object v2, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->zeroid:[B

    goto :goto_0

    .line 309
    .end local v0           #exception:Ljava/io/IOException;
    .restart local v3       #submoduleRepo:Lorg/eclipse/jgit/lib/Repository;
    :cond_0
    :try_start_1
    const-string v4, "HEAD"

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    .line 313
    .local v1, head:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/Repository;->close()V

    .line 315
    if-nez v1, :cond_1

    .line 316
    sget-object v2, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->zeroid:[B

    goto :goto_0

    .line 310
    .end local v1           #head:Lorg/eclipse/jgit/lib/ObjectId;
    :catch_1
    move-exception v0

    .line 311
    .restart local v0       #exception:Ljava/io/IOException;
    :try_start_2
    sget-object v2, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->zeroid:[B
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 313
    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/Repository;->close()V

    goto :goto_0

    .end local v0           #exception:Ljava/io/IOException;
    :catchall_0
    move-exception v4

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/Repository;->close()V

    throw v4

    .line 317
    .restart local v1       #head:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_1
    const/16 v4, 0x14

    new-array v2, v4, [B

    .line 318
    .local v2, id:[B
    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4}, Lorg/eclipse/jgit/lib/ObjectId;->copyRawTo([BI)V

    goto :goto_0
.end method

.method protected idSubmodule(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)[B
    .locals 3
    .parameter "e"

    .prologue
    .line 277
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->repository:Lorg/eclipse/jgit/lib/Repository;

    if-nez v2, :cond_0

    .line 278
    sget-object v2, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->zeroid:[B

    .line 285
    :goto_0
    return-object v2

    .line 281
    :cond_0
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->repository:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/NoWorkTreeException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 285
    .local v0, directory:Ljava/io/File;
    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->idSubmodule(Ljava/io/File;Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)[B

    move-result-object v2

    goto :goto_0

    .line 282
    .end local v0           #directory:Ljava/io/File;
    :catch_0
    move-exception v1

    .line 283
    .local v1, nwte:Lorg/eclipse/jgit/errors/NoWorkTreeException;
    sget-object v2, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->zeroid:[B

    goto :goto_0
.end method

.method protected init([Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)V
    .locals 9
    .parameter "list"

    .prologue
    const/4 v8, 0x0

    .line 644
    iput-object p1, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->entries:[Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    .line 647
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->state:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;

    iget-object v3, v5, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;->nameEncoder:Ljava/nio/charset/CharsetEncoder;

    .line 648
    .local v3, nameEncoder:Ljava/nio/charset/CharsetEncoder;
    const/4 v1, 0x0

    .local v1, i:I
    const/4 v4, 0x0

    .local v4, o:I
    :goto_0
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->entries:[Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    array-length v5, v5

    if-ge v1, v5, :cond_4

    .line 649
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->entries:[Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    aget-object v0, v5, v1

    .line 650
    .local v0, e:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;
    if-nez v0, :cond_1

    .line 648
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 652
    :cond_1
    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->getName()Ljava/lang/String;

    move-result-object v2

    .line 653
    .local v2, name:Ljava/lang/String;
    const-string v5, "."

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    const-string v5, ".."

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 655
    const-string v5, ".git"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 657
    const-string v5, ".gitignore"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 658
    new-instance v5, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$PerDirectoryIgnoreNode;

    invoke-direct {v5, v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$PerDirectoryIgnoreNode;-><init>(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)V

    iput-object v5, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ignoreNode:Lorg/eclipse/jgit/ignore/IgnoreNode;

    .line 659
    :cond_2
    if-eq v1, v4, :cond_3

    .line 660
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->entries:[Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    aput-object v0, v5, v4

    .line 661
    :cond_3
    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->encodeName(Ljava/nio/charset/CharsetEncoder;)V

    .line 662
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 664
    .end local v0           #e:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;
    .end local v2           #name:Ljava/lang/String;
    :cond_4
    iput v4, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->entryCnt:I

    .line 665
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->entries:[Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    iget v6, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->entryCnt:I

    sget-object v7, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ENTRY_CMP:Ljava/util/Comparator;

    invoke-static {v5, v8, v6, v7}, Ljava/util/Arrays;->sort([Ljava/lang/Object;IILjava/util/Comparator;)V

    .line 667
    const/4 v5, -0x1

    iput v5, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->contentIdFromPtr:I

    .line 668
    iput v8, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ptr:I

    .line 669
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->eof()Z

    move-result v5

    if-nez v5, :cond_5

    .line 670
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->parseEntry()V

    .line 671
    :cond_5
    return-void
.end method

.method protected initRootIterator(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 2
    .parameter "repo"

    .prologue
    .line 200
    iput-object p1, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->repository:Lorg/eclipse/jgit/lib/Repository;

    .line 202
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ignoreNode:Lorg/eclipse/jgit/ignore/IgnoreNode;

    instance-of v1, v1, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$PerDirectoryIgnoreNode;

    if-eqz v1, :cond_0

    .line 203
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ignoreNode:Lorg/eclipse/jgit/ignore/IgnoreNode;

    check-cast v1, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$PerDirectoryIgnoreNode;

    iget-object v0, v1, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$PerDirectoryIgnoreNode;->entry:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    .line 206
    .local v0, entry:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;
    :goto_0
    new-instance v1, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$RootIgnoreNode;

    invoke-direct {v1, v0, p1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$RootIgnoreNode;-><init>(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v1, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ignoreNode:Lorg/eclipse/jgit/ignore/IgnoreNode;

    .line 207
    return-void

    .line 205
    .end local v0           #entry:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;
    :cond_0
    const/4 v0, 0x0

    .restart local v0       #entry:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;
    goto :goto_0
.end method

.method public isEntryIgnored()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 563
    iget v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->pathLen:I

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->isEntryIgnored(I)Z

    move-result v0

    return v0
.end method

.method protected isEntryIgnored(I)Z
    .locals 7
    .parameter "pLen"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 576
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getIgnoreNode()Lorg/eclipse/jgit/ignore/IgnoreNode;

    move-result-object v2

    .line 577
    .local v2, rules:Lorg/eclipse/jgit/ignore/IgnoreNode;
    if-eqz v2, :cond_1

    .line 582
    iget v1, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->pathOffset:I

    .line 583
    .local v1, pOff:I
    if-lez v1, :cond_0

    .line 584
    add-int/lit8 v1, v1, -0x1

    .line 585
    :cond_0
    iget-object v4, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->path:[B

    invoke-static {v4, v1, p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->pathOf([BII)Ljava/lang/String;

    move-result-object v0

    .line 586
    .local v0, p:Ljava/lang/String;
    sget-object v4, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$2;->$SwitchMap$org$eclipse$jgit$ignore$IgnoreNode$MatchResult:[I

    sget-object v5, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    iget v6, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->mode:I

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v5

    invoke-virtual {v2, v0, v5}, Lorg/eclipse/jgit/ignore/IgnoreNode;->isIgnored(Ljava/lang/String;Z)Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    move-result-object v5

    invoke-virtual {v5}, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    .line 595
    .end local v0           #p:Ljava/lang/String;
    .end local v1           #pOff:I
    :cond_1
    iget-object v4, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    instance-of v4, v4, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    if-eqz v4, :cond_2

    .line 596
    iget-object v3, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    check-cast v3, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    invoke-virtual {v3, p1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->isEntryIgnored(I)Z

    move-result v3

    .line 597
    :cond_2
    :goto_0
    :pswitch_0
    return v3

    .line 588
    .restart local v0       #p:Ljava/lang/String;
    .restart local v1       #pOff:I
    :pswitch_1
    const/4 v3, 0x1

    goto :goto_0

    .line 586
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public isModeDifferent(I)Z
    .locals 4
    .parameter "rawMode"

    .prologue
    const/4 v1, 0x0

    .line 720
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryRawMode()I

    move-result v2

    xor-int v0, v2, p1

    .line 722
    .local v0, modeDiff:I
    if-nez v0, :cond_1

    .line 735
    :cond_0
    :goto_0
    return v1

    .line 726
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getOptions()Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->getSymLinks()Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

    move-result-object v2

    sget-object v3, Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;->FALSE:Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

    if-ne v2, v3, :cond_2

    .line 727
    sget-object v2, Lorg/eclipse/jgit/lib/FileMode;->SYMLINK:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 733
    :cond_2
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->state:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;

    iget-object v2, v2, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;->options:Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;

    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->isFileMode()Z

    move-result v2

    if-nez v2, :cond_3

    .line 734
    sget-object v2, Lorg/eclipse/jgit/lib/FileMode;->EXECUTABLE_FILE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/FileMode;->getBits()I

    move-result v2

    xor-int/lit8 v2, v2, -0x1

    and-int/2addr v0, v2

    .line 735
    :cond_3
    if-eqz v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public isModified(Lorg/eclipse/jgit/dircache/DirCacheEntry;Z)Z
    .locals 3
    .parameter "entry"
    .parameter "forceContentCheck"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 807
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->repository:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v1

    invoke-virtual {p0, p1, p2, v1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->isModified(Lorg/eclipse/jgit/dircache/DirCacheEntry;ZLorg/eclipse/jgit/lib/ObjectReader;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 809
    :catch_0
    move-exception v0

    .line 810
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public isModified(Lorg/eclipse/jgit/dircache/DirCacheEntry;ZLorg/eclipse/jgit/lib/ObjectReader;)Z
    .locals 6
    .parameter "entry"
    .parameter "forceContentCheck"
    .parameter "reader"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 835
    if-nez p1, :cond_2

    .line 836
    sget-object v3, Lorg/eclipse/jgit/lib/FileMode;->MISSING:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 856
    :cond_0
    :goto_0
    return v1

    :cond_1
    move v1, v2

    .line 836
    goto :goto_0

    .line 837
    :cond_2
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->compareMetadata(Lorg/eclipse/jgit/dircache/DirCacheEntry;)Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    move-result-object v0

    .line 838
    .local v0, diff:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;
    sget-object v3, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$2;->$SwitchMap$org$eclipse$jgit$treewalk$WorkingTreeIterator$MetadataDiff:[I

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 858
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->unexpectedCompareResult:Ljava/lang/String;

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->name()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v1, v2

    invoke-static {v4, v1}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 840
    :pswitch_0
    if-eqz p2, :cond_0

    .line 843
    invoke-direct {p0, p1, p3}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->contentCheck(Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)Z

    move-result v1

    goto :goto_0

    .line 850
    :pswitch_1
    invoke-direct {p0, p1, p3}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->contentCheck(Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)Z

    move-result v1

    goto :goto_0

    :pswitch_2
    move v1, v2

    .line 852
    goto :goto_0

    .line 854
    :pswitch_3
    iget v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->mode:I

    sget-object v3, Lorg/eclipse/jgit/lib/FileMode;->SYMLINK:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/FileMode;->getBits()I

    move-result v3

    if-ne v2, v3, :cond_0

    .line 855
    invoke-direct {p0, p1, p3}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->contentCheck(Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)Z

    move-result v1

    goto :goto_0

    .line 838
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public next(I)V
    .locals 1
    .parameter "delta"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 466
    iget v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ptr:I

    add-int/2addr v0, p1

    iput v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ptr:I

    .line 467
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->eof()Z

    move-result v0

    if-nez v0, :cond_0

    .line 468
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->parseEntry()V

    .line 470
    :cond_0
    return-void
.end method

.method public openEntryStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 548
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->current()Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->openInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 549
    .local v0, rawis:Ljava/io/InputStream;
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->mightNeedCleaning()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 550
    invoke-static {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->filterClean(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v0

    .line 552
    .end local v0           #rawis:Ljava/io/InputStream;
    :cond_0
    return-object v0
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 447
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->first()Z

    move-result v0

    if-nez v0, :cond_0

    .line 448
    const/4 v0, 0x0

    iput v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->ptr:I

    .line 449
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->eof()Z

    move-result v0

    if-nez v0, :cond_0

    .line 450
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->parseEntry()V

    .line 452
    :cond_0
    return-void
.end method

.method public setDirCacheIterator(Lorg/eclipse/jgit/treewalk/TreeWalk;I)V
    .locals 1
    .parameter "walk"
    .parameter "treeId"

    .prologue
    .line 223
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->state:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;

    iput-object p1, v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;->walk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    .line 224
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->state:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;

    iput p2, v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$IteratorState;->dirCacheTree:I

    .line 225
    return-void
.end method
