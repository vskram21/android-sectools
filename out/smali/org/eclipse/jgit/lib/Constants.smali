.class public final Lorg/eclipse/jgit/lib/Constants;
.super Ljava/lang/Object;
.source "Constants.java"


# static fields
.field public static final CHARACTER_ENCODING:Ljava/lang/String; = "UTF-8"

.field public static final CHARSET:Ljava/nio/charset/Charset; = null

.field public static final CHERRY_PICK_HEAD:Ljava/lang/String; = "CHERRY_PICK_HEAD"

.field public static final CONFIG:Ljava/lang/String; = "config"

.field public static final DEFAULT_REMOTE_NAME:Ljava/lang/String; = "origin"

.field public static final DOT_GIT:Ljava/lang/String; = ".git"

.field public static final DOT_GIT_EXT:Ljava/lang/String; = ".git"

.field public static final DOT_GIT_IGNORE:Ljava/lang/String; = ".gitignore"

.field public static final DOT_GIT_MODULES:Ljava/lang/String; = ".gitmodules"

.field public static final EMPTY_BLOB_ID:Lorg/eclipse/jgit/lib/ObjectId; = null

.field private static final ENCODED_TYPE_BLOB:[B = null

.field private static final ENCODED_TYPE_COMMIT:[B = null

.field private static final ENCODED_TYPE_TAG:[B = null

.field private static final ENCODED_TYPE_TREE:[B = null

.field public static final FETCH_HEAD:Ljava/lang/String; = "FETCH_HEAD"

.field public static final GITIGNORE_FILENAME:Ljava/lang/String; = ".gitignore"

.field public static final GIT_ALTERNATE_OBJECT_DIRECTORIES_KEY:Ljava/lang/String; = "GIT_ALTERNATE_OBJECT_DIRECTORIES"

.field public static final GIT_AUTHOR_EMAIL_KEY:Ljava/lang/String; = "GIT_AUTHOR_EMAIL"

.field public static final GIT_AUTHOR_NAME_KEY:Ljava/lang/String; = "GIT_AUTHOR_NAME"

.field public static final GIT_CEILING_DIRECTORIES_KEY:Ljava/lang/String; = "GIT_CEILING_DIRECTORIES"

.field public static final GIT_COMMITTER_EMAIL_KEY:Ljava/lang/String; = "GIT_COMMITTER_EMAIL"

.field public static final GIT_COMMITTER_NAME_KEY:Ljava/lang/String; = "GIT_COMMITTER_NAME"

.field public static final GIT_CONFIG_NOSYSTEM_KEY:Ljava/lang/String; = "GIT_CONFIG_NOSYSTEM"

.field public static final GIT_DIR_KEY:Ljava/lang/String; = "GIT_DIR"

.field public static final GIT_INDEX_FILE_KEY:Ljava/lang/String; = "GIT_INDEX_FILE"

.field public static final GIT_OBJECT_DIRECTORY_KEY:Ljava/lang/String; = "GIT_OBJECT_DIRECTORY"

.field public static final GIT_WORK_TREE_KEY:Ljava/lang/String; = "GIT_WORK_TREE"

.field private static final HASH_FUNCTION:Ljava/lang/String; = "SHA-1"

.field public static final HEAD:Ljava/lang/String; = "HEAD"

.field public static final INFO_EXCLUDE:Ljava/lang/String; = "info/exclude"

.field public static final INFO_REFS:Ljava/lang/String; = "info/refs"

.field public static final LOGS:Ljava/lang/String; = "logs"

.field public static final MASTER:Ljava/lang/String; = "master"

.field public static final MERGE_HEAD:Ljava/lang/String; = "MERGE_HEAD"

.field public static final MERGE_MSG:Ljava/lang/String; = "MERGE_MSG"

.field public static final OBJECT_ID_LENGTH:I = 0x14

.field public static final OBJECT_ID_STRING_LENGTH:I = 0x28

.field public static final OBJ_BAD:I = -0x1

.field public static final OBJ_BLOB:I = 0x3

.field public static final OBJ_COMMIT:I = 0x1

.field public static final OBJ_EXT:I = 0x0

.field public static final OBJ_OFS_DELTA:I = 0x6

.field public static final OBJ_REF_DELTA:I = 0x7

.field public static final OBJ_TAG:I = 0x4

.field public static final OBJ_TREE:I = 0x2

.field public static final OBJ_TYPE_5:I = 0x5

.field public static final ORIG_HEAD:Ljava/lang/String; = "ORIG_HEAD"

.field public static final OS_USER_NAME_KEY:Ljava/lang/String; = "user.name"

.field public static final PACKED_REFS:Ljava/lang/String; = "packed-refs"

.field public static final PACK_SIGNATURE:[B = null

.field public static final REVERT_HEAD:Ljava/lang/String; = "REVERT_HEAD"

.field public static final R_HEADS:Ljava/lang/String; = "refs/heads/"

.field public static final R_NOTES:Ljava/lang/String; = "refs/notes/"

.field public static final R_NOTES_COMMITS:Ljava/lang/String; = "refs/notes/commits"

.field public static final R_REFS:Ljava/lang/String; = "refs/"

.field public static final R_REMOTES:Ljava/lang/String; = "refs/remotes/"

.field public static final R_STASH:Ljava/lang/String; = "refs/stash"

.field public static final R_TAGS:Ljava/lang/String; = "refs/tags/"

.field public static final SHALLOW:Ljava/lang/String; = "shallow"

.field public static final SIGNED_OFF_BY_TAG:Ljava/lang/String; = "Signed-off-by: "

.field public static final SQUASH_MSG:Ljava/lang/String; = "SQUASH_MSG"

.field public static final STASH:Ljava/lang/String; = "stash"

.field public static final TYPE_BLOB:Ljava/lang/String; = "blob"

.field public static final TYPE_COMMIT:Ljava/lang/String; = "commit"

.field public static final TYPE_TAG:Ljava/lang/String; = "tag"

.field public static final TYPE_TREE:Ljava/lang/String; = "tree"

.field public static final UNKNOWN_USER_DEFAULT:Ljava/lang/String; = "unknown-user"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 120
    const-string v0, "commit"

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/lib/Constants;->ENCODED_TYPE_COMMIT:[B

    .line 122
    const-string v0, "blob"

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/lib/Constants;->ENCODED_TYPE_BLOB:[B

    .line 124
    const-string v0, "tree"

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/lib/Constants;->ENCODED_TYPE_TREE:[B

    .line 126
    const-string v0, "tag"

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/lib/Constants;->ENCODED_TYPE_TAG:[B

    .line 224
    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/eclipse/jgit/lib/Constants;->PACK_SIGNATURE:[B

    .line 560
    const/16 v0, 0x14

    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v1

    invoke-virtual {v1}, Ljava/security/MessageDigest;->getDigestLength()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 561
    new-instance v0, Ljava/lang/LinkageError;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->incorrectOBJECT_ID_LENGTH:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/LinkageError;-><init>(Ljava/lang/String;)V

    throw v0

    .line 562
    :cond_0
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    .line 587
    const-string v0, "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391"

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/lib/Constants;->EMPTY_BLOB_ID:Lorg/eclipse/jgit/lib/ObjectId;

    return-void

    .line 224
    nop

    :array_0
    .array-data 0x1
        0x50t
        0x41t
        0x43t
        0x4bt
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 590
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 592
    return-void
.end method

.method public static decodeTypeString(Lorg/eclipse/jgit/lib/AnyObjectId;[BBLorg/eclipse/jgit/util/MutableInteger;)I
    .locals 6
    .parameter "id"
    .parameter "typeString"
    .parameter "endMark"
    .parameter "offset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x6f

    const/16 v4, 0x6d

    const/16 v3, 0x65

    .line 450
    :try_start_0
    iget v1, p3, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    .line 451
    .local v1, position:I
    aget-byte v2, p1, v1

    sparse-switch v2, :sswitch_data_0

    .line 494
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectInvalidType:Ljava/lang/String;

    invoke-direct {v2, p0, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 496
    .end local v1           #position:I
    :catch_0
    move-exception v0

    .line 497
    .local v0, bad:Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectInvalidType:Ljava/lang/String;

    invoke-direct {v2, p0, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    throw v2

    .line 453
    .end local v0           #bad:Ljava/lang/ArrayIndexOutOfBoundsException;
    .restart local v1       #position:I
    :sswitch_0
    add-int/lit8 v2, v1, 0x1

    :try_start_1
    aget-byte v2, p1, v2

    const/16 v3, 0x6c

    if-ne v2, v3, :cond_0

    add-int/lit8 v2, v1, 0x2

    aget-byte v2, p1, v2

    if-ne v2, v5, :cond_0

    add-int/lit8 v2, v1, 0x3

    aget-byte v2, p1, v2

    const/16 v3, 0x62

    if-ne v2, v3, :cond_0

    add-int/lit8 v2, v1, 0x4

    aget-byte v2, p1, v2

    if-eq v2, p2, :cond_1

    .line 457
    :cond_0
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectInvalidType:Ljava/lang/String;

    invoke-direct {v2, p0, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    throw v2

    .line 458
    :cond_1
    add-int/lit8 v2, v1, 0x5

    iput v2, p3, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    .line 459
    const/4 v2, 0x3

    .line 487
    :goto_0
    return v2

    .line 462
    :sswitch_1
    add-int/lit8 v2, v1, 0x1

    aget-byte v2, p1, v2

    if-ne v2, v5, :cond_2

    add-int/lit8 v2, v1, 0x2

    aget-byte v2, p1, v2

    if-ne v2, v4, :cond_2

    add-int/lit8 v2, v1, 0x3

    aget-byte v2, p1, v2

    if-ne v2, v4, :cond_2

    add-int/lit8 v2, v1, 0x4

    aget-byte v2, p1, v2

    const/16 v3, 0x69

    if-ne v2, v3, :cond_2

    add-int/lit8 v2, v1, 0x5

    aget-byte v2, p1, v2

    const/16 v3, 0x74

    if-ne v2, v3, :cond_2

    add-int/lit8 v2, v1, 0x6

    aget-byte v2, p1, v2

    if-eq v2, p2, :cond_3

    .line 468
    :cond_2
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectInvalidType:Ljava/lang/String;

    invoke-direct {v2, p0, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    throw v2

    .line 469
    :cond_3
    add-int/lit8 v2, v1, 0x7

    iput v2, p3, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    .line 470
    const/4 v2, 0x1

    goto :goto_0

    .line 473
    :sswitch_2
    add-int/lit8 v2, v1, 0x1

    aget-byte v2, p1, v2

    sparse-switch v2, :sswitch_data_1

    .line 490
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectInvalidType:Ljava/lang/String;

    invoke-direct {v2, p0, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    throw v2

    .line 475
    :sswitch_3
    add-int/lit8 v2, v1, 0x2

    aget-byte v2, p1, v2

    const/16 v3, 0x67

    if-ne v2, v3, :cond_4

    add-int/lit8 v2, v1, 0x3

    aget-byte v2, p1, v2

    if-eq v2, p2, :cond_5

    .line 477
    :cond_4
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectInvalidType:Ljava/lang/String;

    invoke-direct {v2, p0, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    throw v2

    .line 478
    :cond_5
    add-int/lit8 v2, v1, 0x4

    iput v2, p3, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    .line 479
    const/4 v2, 0x4

    goto :goto_0

    .line 482
    :sswitch_4
    add-int/lit8 v2, v1, 0x2

    aget-byte v2, p1, v2

    if-ne v2, v3, :cond_6

    add-int/lit8 v2, v1, 0x3

    aget-byte v2, p1, v2

    if-ne v2, v3, :cond_6

    add-int/lit8 v2, v1, 0x4

    aget-byte v2, p1, v2

    if-eq v2, p2, :cond_7

    .line 485
    :cond_6
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectInvalidType:Ljava/lang/String;

    invoke-direct {v2, p0, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    throw v2

    .line 486
    :cond_7
    add-int/lit8 v2, v1, 0x5

    iput v2, p3, Lorg/eclipse/jgit/util/MutableInteger;->value:I
    :try_end_1
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0

    .line 487
    const/4 v2, 0x2

    goto/16 :goto_0

    .line 451
    :sswitch_data_0
    .sparse-switch
        0x62 -> :sswitch_0
        0x63 -> :sswitch_1
        0x74 -> :sswitch_2
    .end sparse-switch

    .line 473
    :sswitch_data_1
    .sparse-switch
        0x61 -> :sswitch_3
        0x72 -> :sswitch_4
    .end sparse-switch
.end method

.method public static encode(Ljava/lang/String;)[B
    .locals 5
    .parameter "str"

    .prologue
    .line 546
    sget-object v4, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {v4, p0}, Ljava/nio/charset/Charset;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 547
    .local v2, bb:Ljava/nio/ByteBuffer;
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v3

    .line 548
    .local v3, len:I
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->hasArray()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v4

    if-nez v4, :cond_0

    .line 549
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    .line 550
    .local v0, arr:[B
    array-length v4, v0

    if-ne v4, v3, :cond_0

    move-object v1, v0

    .line 556
    .end local v0           #arr:[B
    .local v1, arr:[B
    :goto_0
    return-object v1

    .line 554
    .end local v1           #arr:[B
    :cond_0
    new-array v0, v3, [B

    .line 555
    .restart local v0       #arr:[B
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    move-object v1, v0

    .line 556
    .end local v0           #arr:[B
    .restart local v1       #arr:[B
    goto :goto_0
.end method

.method public static encodeASCII(J)[B
    .locals 1
    .parameter "s"

    .prologue
    .line 510
    invoke-static {p0, p1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public static encodeASCII(Ljava/lang/String;)[B
    .locals 7
    .parameter "s"

    .prologue
    .line 526
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    new-array v2, v3, [B

    .line 527
    .local v2, r:[B
    array-length v3, v2

    add-int/lit8 v1, v3, -0x1

    .local v1, k:I
    :goto_0
    if-ltz v1, :cond_1

    .line 528
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 529
    .local v0, c:C
    const/16 v3, 0x7f

    if-le v0, v3, :cond_0

    .line 530
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->notASCIIString:Ljava/lang/String;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p0, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 531
    :cond_0
    int-to-byte v3, v0

    aput-byte v3, v2, v1

    .line 527
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 533
    .end local v0           #c:C
    :cond_1
    return-object v2
.end method

.method public static encodedTypeString(I)[B
    .locals 5
    .parameter "typeCode"

    .prologue
    .line 411
    packed-switch p0, :pswitch_data_0

    .line 421
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->badObjectType:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 413
    :pswitch_0
    sget-object v0, Lorg/eclipse/jgit/lib/Constants;->ENCODED_TYPE_COMMIT:[B

    .line 419
    :goto_0
    return-object v0

    .line 415
    :pswitch_1
    sget-object v0, Lorg/eclipse/jgit/lib/Constants;->ENCODED_TYPE_TREE:[B

    goto :goto_0

    .line 417
    :pswitch_2
    sget-object v0, Lorg/eclipse/jgit/lib/Constants;->ENCODED_TYPE_BLOB:[B

    goto :goto_0

    .line 419
    :pswitch_3
    sget-object v0, Lorg/eclipse/jgit/lib/Constants;->ENCODED_TYPE_TAG:[B

    goto :goto_0

    .line 411
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public static newMessageDigest()Ljava/security/MessageDigest;
    .locals 6

    .prologue
    .line 372
    :try_start_0
    const-string v1, "SHA-1"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 373
    :catch_0
    move-exception v0

    .line 374
    .local v0, nsae:Ljava/security/NoSuchAlgorithmException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->requiredHashFunctionNotAvailable:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "SHA-1"

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static typeString(I)Ljava/lang/String;
    .locals 5
    .parameter "typeCode"

    .prologue
    .line 386
    packed-switch p0, :pswitch_data_0

    .line 396
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->badObjectType:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 388
    :pswitch_0
    const-string v0, "commit"

    .line 394
    :goto_0
    return-object v0

    .line 390
    :pswitch_1
    const-string v0, "tree"

    goto :goto_0

    .line 392
    :pswitch_2
    const-string v0, "blob"

    goto :goto_0

    .line 394
    :pswitch_3
    const-string v0, "tag"

    goto :goto_0

    .line 386
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
