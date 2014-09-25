.class public Lorg/eclipse/jgit/dircache/DirCacheEntry;
.super Ljava/lang/Object;
.source "DirCacheEntry.java"


# static fields
.field private static final ASSUME_VALID:I = 0x80

.field private static final EXTENDED:I = 0x40

.field private static final EXTENDED_FLAGS:I = 0x60000000

.field private static final INFO_LEN:I = 0x3e

.field private static final INFO_LEN_EXTENDED:I = 0x40

.field private static final INTENT_TO_ADD:I = 0x20000000

.field private static final NAME_MASK:I = 0xfff

.field private static final P_CTIME:I = 0x0

.field private static final P_FLAGS:I = 0x3c

.field private static final P_FLAGS2:I = 0x3e

.field private static final P_MODE:I = 0x18

.field private static final P_MTIME:I = 0x8

.field private static final P_OBJECTID:I = 0x28

.field private static final P_SIZE:I = 0x24

.field private static final SKIP_WORKTREE:I = 0x40000000

.field public static final STAGE_0:I = 0x0

.field public static final STAGE_1:I = 0x1

.field public static final STAGE_2:I = 0x2

.field public static final STAGE_3:I = 0x3

.field private static final UPDATE_NEEDED:I = 0x1

.field private static final nullpad:[B


# instance fields
.field private inCoreFlags:B

.field private final info:[B

.field private final infoOffset:I

.field final path:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 76
    const/16 v0, 0x8

    new-array v0, v0, [B

    sput-object v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->nullpad:[B

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "newPath"

    .prologue
    .line 220
    invoke-static {p1}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>([B)V

    .line 221
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .parameter "newPath"
    .parameter "stage"

    .prologue
    .line 237
    invoke-static {p1}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>([BI)V

    .line 238
    return-void
.end method

.method public constructor <init>([B)V
    .locals 1
    .parameter "newPath"

    .prologue
    .line 251
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>([BI)V

    .line 252
    return-void
.end method

.method public constructor <init>([BI)V
    .locals 6
    .parameter "newPath"
    .parameter "stage"

    .prologue
    const/4 v5, 0x0

    .line 268
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 269
    invoke-static {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->isValidPath([B)Z

    move-result v1

    if-nez v1, :cond_0

    .line 270
    new-instance v1, Lorg/eclipse/jgit/dircache/InvalidPathException;

    invoke-static {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->toString([B)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/dircache/InvalidPathException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 271
    :cond_0
    if-ltz p2, :cond_1

    const/4 v1, 0x3

    if-ge v1, p2, :cond_2

    .line 272
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->invalidStageForPath:Ljava/lang/String;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    const/4 v4, 0x1

    invoke-static {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->toString([B)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 275
    :cond_2
    const/16 v1, 0x3e

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    .line 276
    iput v5, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    .line 277
    iput-object p1, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    .line 279
    and-int/lit8 v1, p2, 0x3

    shl-int/lit8 v0, v1, 0xc

    .line 280
    .local v0, flags:I
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    array-length v1, v1

    const/16 v2, 0xfff

    if-ge v1, v2, :cond_3

    .line 281
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    array-length v1, v1

    or-int/2addr v0, v1

    .line 284
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    iget v2, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    add-int/lit8 v2, v2, 0x3c

    invoke-static {v1, v2, v0}, Lorg/eclipse/jgit/util/NB;->encodeInt16([BII)V

    .line 285
    return-void

    .line 283
    :cond_3
    or-int/lit16 v0, v0, 0xfff

    goto :goto_0
.end method

.method constructor <init>([BLorg/eclipse/jgit/util/MutableInteger;Ljava/io/InputStream;Ljava/security/MessageDigest;II)V
    .locals 17
    .parameter "sharedInfo"
    .parameter "infoAt"
    .parameter "in"
    .parameter "md"
    .parameter "smudge_s"
    .parameter "smudge_ns"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 145
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 146
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    .line 147
    move-object/from16 v0, p2

    iget v12, v0, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    move-object/from16 v0, p0

    iput v12, v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    .line 149
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    move-object/from16 v0, p0

    iget v13, v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    const/16 v14, 0x3e

    move-object/from16 v0, p3

    invoke-static {v0, v12, v13, v14}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 152
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->isExtended()Z

    move-result v12

    if-eqz v12, :cond_0

    .line 153
    const/16 v7, 0x40

    .line 154
    .local v7, len:I
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    move-object/from16 v0, p0

    iget v13, v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    add-int/lit8 v13, v13, 0x3e

    const/4 v14, 0x2

    move-object/from16 v0, p3

    invoke-static {v0, v12, v13, v14}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 156
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getExtendedFlags()I

    move-result v12

    const v13, -0x60000001

    and-int/2addr v12, v13

    if-eqz v12, :cond_1

    .line 157
    new-instance v12, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v13

    iget-object v13, v13, Lorg/eclipse/jgit/internal/JGitText;->DIRCUnrecognizedExtendedFlags:Ljava/lang/String;

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getExtendedFlags()I

    move-result v16

    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 160
    .end local v7           #len:I
    :cond_0
    const/16 v7, 0x3e

    .line 162
    .restart local v7       #len:I
    :cond_1
    move-object/from16 v0, p2

    iget v12, v0, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    add-int/2addr v12, v7

    move-object/from16 v0, p2

    iput v12, v0, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    .line 163
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    move-object/from16 v0, p0

    iget v13, v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    move-object/from16 v0, p4

    invoke-virtual {v0, v12, v13, v7}, Ljava/security/MessageDigest;->update([BII)V

    .line 165
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    move-object/from16 v0, p0

    iget v13, v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    add-int/lit8 v13, v13, 0x3c

    invoke-static {v12, v13}, Lorg/eclipse/jgit/util/NB;->decodeUInt16([BI)I

    move-result v12

    and-int/lit16 v9, v12, 0xfff

    .line 166
    .local v9, pathLen:I
    const/4 v10, 0x0

    .line 167
    .local v10, skipped:I
    const/16 v12, 0xfff

    if-ge v9, v12, :cond_4

    .line 168
    new-array v12, v9, [B

    move-object/from16 v0, p0

    iput-object v12, v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    .line 169
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-static {v0, v12, v13, v9}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 170
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    const/4 v13, 0x0

    move-object/from16 v0, p4

    invoke-virtual {v0, v12, v13, v9}, Ljava/security/MessageDigest;->update([BII)V

    .line 196
    :goto_0
    add-int v3, v7, v9

    .line 197
    .local v3, actLen:I
    add-int/lit8 v12, v3, 0x8

    and-int/lit8 v6, v12, -0x8

    .line 198
    .local v6, expLen:I
    sub-int v12, v6, v3

    sub-int v8, v12, v10

    .line 199
    .local v8, padLen:I
    if-lez v8, :cond_2

    .line 200
    int-to-long v12, v8

    move-object/from16 v0, p3

    invoke-static {v0, v12, v13}, Lorg/eclipse/jgit/util/IO;->skipFully(Ljava/io/InputStream;J)V

    .line 201
    sget-object v12, Lorg/eclipse/jgit/dircache/DirCacheEntry;->nullpad:[B

    const/4 v13, 0x0

    move-object/from16 v0, p4

    invoke-virtual {v0, v12, v13, v8}, Ljava/security/MessageDigest;->update([BII)V

    .line 204
    :cond_2
    move-object/from16 v0, p0

    move/from16 v1, p5

    move/from16 v2, p6

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->mightBeRacilyClean(II)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 205
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->smudgeRacilyClean()V

    .line 207
    :cond_3
    return-void

    .line 172
    .end local v3           #actLen:I
    .end local v6           #expLen:I
    .end local v8           #padLen:I
    :cond_4
    new-instance v11, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v11}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 174
    .local v11, tmp:Ljava/io/ByteArrayOutputStream;
    const/16 v12, 0xfff

    new-array v4, v12, [B

    .line 175
    .local v4, buf:[B
    const/4 v12, 0x0

    const/16 v13, 0xfff

    move-object/from16 v0, p3

    invoke-static {v0, v4, v12, v13}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 176
    invoke-virtual {v11, v4}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 179
    :goto_1
    invoke-virtual/range {p3 .. p3}, Ljava/io/InputStream;->read()I

    move-result v5

    .line 180
    .local v5, c:I
    if-gez v5, :cond_5

    .line 181
    new-instance v12, Ljava/io/EOFException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v13

    iget-object v13, v13, Lorg/eclipse/jgit/internal/JGitText;->shortReadOfBlock:Ljava/lang/String;

    invoke-direct {v12, v13}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 182
    :cond_5
    if-nez v5, :cond_6

    .line 186
    invoke-virtual {v11}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v12

    move-object/from16 v0, p0

    iput-object v12, v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    .line 187
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    array-length v9, v12

    .line 188
    const/4 v10, 0x1

    .line 189
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    const/4 v13, 0x0

    move-object/from16 v0, p4

    invoke-virtual {v0, v12, v13, v9}, Ljava/security/MessageDigest;->update([BII)V

    .line 190
    const/4 v12, 0x0

    move-object/from16 v0, p4

    invoke-virtual {v0, v12}, Ljava/security/MessageDigest;->update(B)V

    goto :goto_0

    .line 184
    :cond_6
    invoke-virtual {v11, v5}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_1
.end method

.method private decodeTS(I)J
    .locals 7
    .parameter "pIdx"

    .prologue
    .line 705
    iget v3, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    add-int v0, v3, p1

    .line 706
    .local v0, base:I
    iget-object v3, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    invoke-static {v3, v0}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v2

    .line 707
    .local v2, sec:I
    iget-object v3, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    add-int/lit8 v4, v0, 0x4

    invoke-static {v3, v4}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v3

    const v4, 0xf4240

    div-int v1, v3, v4

    .line 708
    .local v1, ms:I
    const-wide/16 v3, 0x3e8

    int-to-long v5, v2

    mul-long/2addr v3, v5

    int-to-long v5, v1

    add-long/2addr v3, v5

    return-wide v3
.end method

.method private encodeTS(IJ)V
    .locals 6
    .parameter "pIdx"
    .parameter "when"

    .prologue
    const-wide/16 v4, 0x3e8

    .line 712
    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    add-int v0, v1, p1

    .line 713
    .local v0, base:I
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    div-long v2, p2, v4

    long-to-int v2, v2

    invoke-static {v1, v0, v2}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 714
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    add-int/lit8 v2, v0, 0x4

    rem-long v3, p2, v4

    long-to-int v3, v3

    const v4, 0xf4240

    mul-int/2addr v3, v4

    invoke-static {v1, v2, v3}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 715
    return-void
.end method

.method private getExtendedFlags()I
    .locals 2

    .prologue
    .line 718
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->isExtended()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 719
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    add-int/lit8 v1, v1, 0x3e

    invoke-static {v0, v1}, Lorg/eclipse/jgit/util/NB;->decodeUInt16([BI)I

    move-result v0

    shl-int/lit8 v0, v0, 0x10

    .line 721
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static getMaximumInfoLength(Z)I
    .locals 1
    .parameter "extended"

    .prologue
    .line 759
    if-eqz p0, :cond_0

    const/16 v0, 0x40

    :goto_0
    return v0

    :cond_0
    const/16 v0, 0x3e

    goto :goto_0
.end method

.method static isValidPath([B)Z
    .locals 7
    .parameter "path"

    .prologue
    const/4 v5, 0x0

    .line 729
    array-length v6, p0

    if-nez v6, :cond_1

    move v2, v5

    .line 755
    :cond_0
    :goto_0
    return v2

    .line 732
    :cond_1
    const/4 v2, 0x0

    .line 733
    .local v2, componentHasChars:Z
    move-object v0, p0

    .local v0, arr$:[B
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_1
    if-ge v3, v4, :cond_0

    aget-byte v1, v0, v3

    .line 734
    .local v1, c:B
    sparse-switch v1, :sswitch_data_0

    .line 752
    :cond_2
    const/4 v2, 0x1

    .line 733
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :sswitch_0
    move v2, v5

    .line 736
    goto :goto_0

    .line 739
    :sswitch_1
    if-eqz v2, :cond_3

    .line 740
    const/4 v2, 0x0

    goto :goto_2

    :cond_3
    move v2, v5

    .line 742
    goto :goto_0

    .line 748
    :sswitch_2
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v6

    invoke-virtual {v6}, Lorg/eclipse/jgit/util/SystemReader;->isWindows()Z

    move-result v6

    if-eqz v6, :cond_2

    move v2, v5

    .line 749
    goto :goto_0

    .line 734
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x2f -> :sswitch_1
        0x3a -> :sswitch_2
        0x5c -> :sswitch_2
    .end sparse-switch
.end method

.method private static toString([B)Ljava/lang/String;
    .locals 2
    .parameter "path"

    .prologue
    .line 725
    sget-object v0, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public copyMetaData(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V
    .locals 1
    .parameter "src"

    .prologue
    .line 668
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->copyMetaData(Lorg/eclipse/jgit/dircache/DirCacheEntry;Z)V

    .line 669
    return-void
.end method

.method copyMetaData(Lorg/eclipse/jgit/dircache/DirCacheEntry;Z)V
    .locals 10
    .parameter "src"
    .parameter "keepStage"

    .prologue
    .line 683
    iget-object v5, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    iget v6, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    add-int/lit8 v6, v6, 0x3c

    invoke-static {v5, v6}, Lorg/eclipse/jgit/util/NB;->decodeUInt16([BI)I

    move-result v2

    .line 684
    .local v2, origflags:I
    iget-object v5, p1, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    iget v6, p1, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    add-int/lit8 v6, v6, 0x3c

    invoke-static {v5, v6}, Lorg/eclipse/jgit/util/NB;->decodeUInt16([BI)I

    move-result v1

    .line 685
    .local v1, newflags:I
    iget-object v5, p1, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    iget v6, p1, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    iget-object v7, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    iget v8, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    const/16 v9, 0x3e

    invoke-static {v5, v6, v7, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 686
    and-int/lit16 v3, v2, 0xfff

    .line 687
    .local v3, pLen:I
    const/16 v0, 0x3000

    .line 689
    .local v0, SHIFTED_STAGE_MASK:I
    if-eqz p2, :cond_0

    .line 690
    and-int/lit16 v4, v2, 0x3000

    .line 693
    .local v4, pStageShifted:I
    :goto_0
    iget-object v5, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    iget v6, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    add-int/lit8 v6, v6, 0x3c

    or-int v7, v4, v3

    and-int/lit16 v8, v1, -0x1000

    and-int/lit16 v8, v8, -0x3001

    or-int/2addr v7, v8

    invoke-static {v5, v6, v7}, Lorg/eclipse/jgit/util/NB;->encodeInt16([BII)V

    .line 695
    return-void

    .line 692
    .end local v4           #pStageShifted:I
    :cond_0
    and-int/lit16 v4, v1, 0x3000

    .restart local v4       #pStageShifted:I
    goto :goto_0
.end method

.method public getCreationTime()J
    .locals 2

    .prologue
    .line 505
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->decodeTS(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getFileMode()Lorg/eclipse/jgit/lib/FileMode;
    .locals 1

    .prologue
    .line 475
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getRawMode()I

    move-result v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/FileMode;->fromBits(I)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v0

    return-object v0
.end method

.method public getLastModified()J
    .locals 2

    .prologue
    .line 529
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->decodeTS(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getLength()I
    .locals 2

    .prologue
    .line 560
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    add-int/lit8 v1, v1, 0x24

    invoke-static {v0, v1}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v0

    return v0
.end method

.method public getObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 2

    .prologue
    .line 593
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->idBuffer()[B

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->idOffset()I

    move-result v1

    invoke-static {v0, v1}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([BI)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public getPathString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 634
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    invoke-static {v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->toString([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRawMode()I
    .locals 2

    .prologue
    .line 466
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    add-int/lit8 v1, v1, 0x18

    invoke-static {v0, v1}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v0

    return v0
.end method

.method public getRawPath()[B
    .locals 1

    .prologue
    .line 644
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    invoke-virtual {v0}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method

.method public getStage()I
    .locals 2

    .prologue
    .line 428
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    add-int/lit8 v1, v1, 0x3c

    aget-byte v0, v0, v1

    ushr-int/lit8 v0, v0, 0x4

    and-int/lit8 v0, v0, 0x3

    return v0
.end method

.method final idBuffer()[B
    .locals 1

    .prologue
    .line 367
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    return-object v0
.end method

.method final idOffset()I
    .locals 1

    .prologue
    .line 371
    iget v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    add-int/lit8 v0, v0, 0x28

    return v0
.end method

.method public isAssumeValid()Z
    .locals 2

    .prologue
    .line 384
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    add-int/lit8 v1, v1, 0x3c

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0x80

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isExtended()Z
    .locals 2

    .prologue
    .line 701
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    add-int/lit8 v1, v1, 0x3c

    aget-byte v0, v0, v1

    and-int/lit8 v0, v0, 0x40

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isIntentToAdd()Z
    .locals 2

    .prologue
    .line 446
    invoke-direct {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getExtendedFlags()I

    move-result v0

    const/high16 v1, 0x2000

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isMerged()Z
    .locals 1

    .prologue
    .line 456
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getStage()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSkipWorkTree()Z
    .locals 2

    .prologue
    .line 437
    invoke-direct {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getExtendedFlags()I

    move-result v0

    const/high16 v1, 0x4000

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final isSmudged()Z
    .locals 3

    .prologue
    .line 362
    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    add-int/lit8 v0, v1, 0x28

    .line 363
    .local v0, base:I
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getLength()I

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lorg/eclipse/jgit/lib/Constants;->EMPTY_BLOB_ID:Lorg/eclipse/jgit/lib/ObjectId;

    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    invoke-virtual {v1, v2, v0}, Lorg/eclipse/jgit/lib/ObjectId;->compareTo([BI)I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isUpdateNeeded()Z
    .locals 1

    .prologue
    .line 405
    iget-byte v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->inCoreFlags:B

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final mightBeRacilyClean(II)Z
    .locals 5
    .parameter "smudge_s"
    .parameter "smudge_ns"

    .prologue
    const/4 v2, 0x0

    .line 326
    iget v3, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    add-int/lit8 v0, v3, 0x8

    .line 327
    .local v0, base:I
    iget-object v3, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    invoke-static {v3, v0}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v1

    .line 328
    .local v1, mtime:I
    if-ne p1, v1, :cond_0

    .line 329
    iget-object v3, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    add-int/lit8 v4, v0, 0x4

    invoke-static {v3, v4}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v3

    if-gt p2, v3, :cond_0

    const/4 v2, 0x1

    .line 330
    :cond_0
    return v2
.end method

.method public setAssumeValid(Z)V
    .locals 3
    .parameter "assume"

    .prologue
    .line 395
    if-eqz p1, :cond_0

    .line 396
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    add-int/lit8 v1, v1, 0x3c

    aget-byte v2, v0, v1

    or-int/lit16 v2, v2, 0x80

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 399
    :goto_0
    return-void

    .line 398
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    add-int/lit8 v1, v1, 0x3c

    aget-byte v2, v0, v1

    and-int/lit16 v2, v2, -0x81

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    goto :goto_0
.end method

.method public setCreationTime(J)V
    .locals 1
    .parameter "when"

    .prologue
    .line 515
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->encodeTS(IJ)V

    .line 516
    return-void
.end method

.method public setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V
    .locals 5
    .parameter "mode"

    .prologue
    .line 489
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/FileMode;->getBits()I

    move-result v0

    const v1, 0xf000

    and-int/2addr v0, v1

    sparse-switch v0, :sswitch_data_0

    .line 495
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    add-int/lit8 v1, v1, 0x18

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/FileMode;->getBits()I

    move-result v2

    invoke-static {v0, v1, v2}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 496
    return-void

    .line 492
    :sswitch_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->invalidModeForPath:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getPathString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 489
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x4000 -> :sswitch_0
    .end sparse-switch
.end method

.method public setLastModified(J)V
    .locals 1
    .parameter "when"

    .prologue
    .line 539
    const/16 v0, 0x8

    invoke-direct {p0, v0, p1, p2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->encodeTS(IJ)V

    .line 540
    return-void
.end method

.method public setLength(I)V
    .locals 2
    .parameter "sz"

    .prologue
    .line 571
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    add-int/lit8 v1, v1, 0x24

    invoke-static {v0, v1, p1}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 572
    return-void
.end method

.method public setLength(J)V
    .locals 1
    .parameter "sz"

    .prologue
    .line 581
    long-to-int v0, p1

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLength(I)V

    .line 582
    return-void
.end method

.method public setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 2
    .parameter "id"

    .prologue
    .line 604
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->idBuffer()[B

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->idOffset()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lorg/eclipse/jgit/lib/AnyObjectId;->copyRawTo([BI)V

    .line 605
    return-void
.end method

.method public setObjectIdFromRaw([BI)V
    .locals 4
    .parameter "bs"
    .parameter "p"

    .prologue
    .line 617
    const/16 v0, 0x14

    .line 618
    .local v0, n:I
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->idBuffer()[B

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->idOffset()I

    move-result v2

    const/16 v3, 0x14

    invoke-static {p1, p2, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 619
    return-void
.end method

.method public setUpdateNeeded(Z)V
    .locals 1
    .parameter "updateNeeded"

    .prologue
    .line 414
    if-eqz p1, :cond_0

    .line 415
    iget-byte v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->inCoreFlags:B

    or-int/lit8 v0, v0, 0x1

    int-to-byte v0, v0

    iput-byte v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->inCoreFlags:B

    .line 418
    :goto_0
    return-void

    .line 417
    :cond_0
    iget-byte v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->inCoreFlags:B

    and-int/lit8 v0, v0, -0x2

    int-to-byte v0, v0

    iput-byte v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->inCoreFlags:B

    goto :goto_0
.end method

.method public final smudgeRacilyClean()V
    .locals 4

    .prologue
    .line 347
    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    add-int/lit8 v0, v1, 0x24

    .line 348
    .local v0, base:I
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    add-int/lit8 v2, v0, 0x4

    const/4 v3, 0x0

    invoke-static {v1, v0, v2, v3}, Ljava/util/Arrays;->fill([BIIB)V

    .line 349
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 653
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getLength()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getLastModified()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getStage()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getPathString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method write(Ljava/io/OutputStream;)V
    .locals 7
    .parameter "os"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 288
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->isExtended()Z

    move-result v4

    if-eqz v4, :cond_1

    const/16 v2, 0x40

    .line 289
    .local v2, len:I
    :goto_0
    iget-object v4, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    array-length v3, v4

    .line 290
    .local v3, pathLen:I
    iget-object v4, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->info:[B

    iget v5, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->infoOffset:I

    invoke-virtual {p1, v4, v5, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 291
    iget-object v4, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    invoke-virtual {p1, v4, v6, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 296
    add-int v0, v2, v3

    .line 297
    .local v0, actLen:I
    add-int/lit8 v4, v0, 0x8

    and-int/lit8 v1, v4, -0x8

    .line 298
    .local v1, expLen:I
    if-eq v0, v1, :cond_0

    .line 299
    sget-object v4, Lorg/eclipse/jgit/dircache/DirCacheEntry;->nullpad:[B

    sub-int v5, v1, v0

    invoke-virtual {p1, v4, v6, v5}, Ljava/io/OutputStream;->write([BII)V

    .line 300
    :cond_0
    return-void

    .line 288
    .end local v0           #actLen:I
    .end local v1           #expLen:I
    .end local v2           #len:I
    .end local v3           #pathLen:I
    :cond_1
    const/16 v2, 0x3e

    goto :goto_0
.end method
